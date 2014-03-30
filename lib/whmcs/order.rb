module WHMCS
  # WHMCS::Order is the class for managing orders
  class Order < Base

    # Create a new order
    #
    # Parameters:
    #
    # * <tt>:clientid</tt> - client id for order
    # * <tt>:pid</tt> - product id
    # * <tt>:domain</tt> - domain name
    # * <tt>:billingcycle</tt> - onetime, monthly, quarterly, semiannually, etc..
    # * <tt>:domaintype</tt> - set for domain registration - register or transfer
    # * <tt>:regperiod</tt> - 1,2,3,etc...
    # * <tt>:eppcode</tt> - if transfer
    # * <tt>:nameserver1</tt> - first nameserver (req for domain reg only)
    # * <tt>:paymentmethod</tt> - paypal, authorize, etc...
		#
		# Optional attributes:
    # * <tt>:customfields</tt> - a base64 encoded serialized array of custom field values
    # * <tt>:configoptions</tt> - a base64 encoded serialized array of configurable product options
		# * <tt>:priceoverride</tt> - allows you to pass in a custom price override for the product
    # * <tt>:promocode</tt> - pass coupon code to apply to the order (optional)
		# * <tt>:promooverride</tt> - pass this to override the products a coupon applies to (like through the admin area)
    # * <tt>:affid</tt> - affiliate ID if you want to assign the order to an affiliate (optional)
    # * <tt>:noinvoice</tt> - set true to not generate an invoice for this order
		# * <tt>:noinvoiceemail</tt> - set true to generate but not send the invoice notification email
    # * <tt>:noemail</tt> - set true to surpress the order confirmation email
    # * <tt>:clientip</tt> - can be used to pass the customers IP (optional)
    # * <tt>:addons</tt> - comma seperated list of addon ids
		#
		# For VPS/Dedicated Server Orders only:
		# * <tt>:hostname</tt> - The hostname of the server. This will be added to domain automatically
		# * <tt>:ns1prefix</tt> - the prefix to be used for the NS1 nameserver
		# * <tt>:ns2prefix</tt> - the prefix to be used for the NS2 nameserver
		# * <tt>:rootpw</tt> - The root password for the server
		#
		# For Domain registration only:
		# * <tt>:contactid</tt> - the ID of a contact to use for the domain registrant details
    # * <tt>:dnsmanagement</tt> - true to enable
		# * <tt>:domainfields</tt> - a base64 encoded serialized array of the TLD specific field values
    # * <tt>:emailforwarding</tt> - true to enable
    # * <tt>:idprotection</tt> - true to enable
    # * <tt>:nameserver2</tt> - second nameserver
    # * <tt>:nameserver3</tt> - third nameserver
    # * <tt>:nameserver4</tt> - fourth nameserver
    #
		# For domain renewals:
		#  * <tt>:domainrenewals</tt> - This is a name -> value array of domain -> regperiod
		#
    # See:
    #
		# http://docs.whmcs.com/API:Add_Order
    def self.add_order(params = {})
      params.merge!(:action => 'addorder')
      send_request(params)
    end

    # Get orders
    #
    # Optional attributes:
    # * <tt>:id</tt> - to get a specific order ID only
		# * <tt>:userid</tt> - to get all orders for a specific client ID
		# * <tt>:status</tt> - to get all orders in a specific status: Pending, Active, Fraud, Cancelled
    # * <tt>:limitstart</tt> - The record number to start at (default = 0)
    # * <tt>:limitnum</tt> - The number of order records to return (default = 25)
    #
    # See:
    #
    # http://wiki.whmcs.com/API:Get_Orders
    def self.get_orders(params = {})
      params.merge!(:action => 'getorders')
      send_request(params)
    end

    # Get products
    #
    # Parameters:
    #
    # * <tt>:pid</tt> - can be used to just retrieve the details of a specific product ID
    # * <tt>:gid</tt> - can be passed to just retrieve products in a specific group
    # * <tt>:module</tt> - can be passed to just retrieve products assigned to a specific module
    #
    # See:
    #
		# http://docs.whmcs.com/API:Get_Products
    def self.get_products(params = {})
      params.merge!(:action => 'getproducts')
      send_request(params)
    end

    # Get promotions
    #
    # Optional attributes:
    #
    # * <tt>:code</tt> - the specific promotion code to return information for (optional)
    #
    # See:
    #
		# http://docs.whmcs.com/API:Get_Promotions
    def self.get_promotions(params = {})
      params.merge!(:action => 'getpromotions')
      send_request(params)
    end

    # Get order statuses
    #
    # See:
    #
		# http://docs.whmcs.com/API:Get_Order_Statuses
    def self.get_order_statuses
      params.merge!(:action => 'getorderstatuses')
      send_request(params)
    end

    # Accept an order
    #
    # Parameters:
    #
    # * <tt>:orderid</tt> - the Order ID
		#
		# Optional attributes:
		# * <tt>:serverid</tt> - the Server ID to provision any hosting products in the order to, overrides default
		# * <tt>:serviceusername</tt> - the Username to assign for provisioning, overrides default
		# * <tt>:servicepassword</tt> - the Password to assign for products being provisioned, overrides auto generation
		# * <tt>:registrar</tt> - the domain registrar module to assign any domains to
		# * <tt>:autosetup</tt> - true/false - determines whether product provisioning is performed
		# * <tt>:sendregistrar</tt> - true/false determines whether domain automation is performed
		# * <tt>:sendemail</tt> - true/false - sets if welcome emails for products and registration confirmation emails for domains should be sent
    #
    # See:
    #
    # http://docs.whmcs.com/API:Accept_Order
		def self.accept_order(params = {})
      params.merge!(:action => 'acceptorder')
      send_request(params)
    end

    # Place an order in pending
    #
    # Parameters:
    #
    # * <tt>:orderid</tt> - the Order ID
    #
    # See:
    #
		# http://docs.whmcs.com/API:Pending_Order
    def self.pending_order(params = {})
      params.merge!(:action => 'pendingorder')
      send_request(params)
    end

    # Cancel an order
    #
    # Parameters:
    #
    # * <tt>:orderid</tt> - the Order ID
    #
    # See:
    #
    # http://docs.whmcs.com/API:Cancel_Order
		def self.cancel_order(params = {})
      params.merge!(:action => 'cancelorder')
      send_request(params)
    end

    # Mark an order as fraud
    #
    # Parameters:
    #
    # * <tt>:orderid</tt> - the Order ID
    #
    # See:
    #
		# http://docs.whmcs.com/API:Fraud_Order
    def self.fraud_order(params = {})
      params.merge!(:action => 'fraudorder')
      send_request(params)
    end

    # Delete an order
    #
    # Parameters:
    #
    # * <tt>:orderid</tt> - the Order ID
    #
    # See:
    #
    # http://docs.whmcs.com/API:Delete_Order
		def self.delete_order(params = {})
      params.merge!(:action => 'deleteorder')
      send_request(params)
    end
  end
end
