module WHMCS
  # WHMCS::Client is the class for managing clients
  class Client < Base

	# Create a new client
	#
	# Parameters:
	# * <tt>:firstname</tt>
	# * <tt>:lastname</tt>
	# * <tt>:email</tt>
	# * <tt>:address1</tt>
	# * <tt>:city</tt>
	# * <tt>:state</tt>
	# * <tt>:postcode</tt>
	# * <tt>:country</tt> - two letter ISO country code
	# * <tt>:phonenumber</tt>
	# * <tt>:password2</tt> - password for new user account
	#
	# Optional attributes:
	# * <tt>:companyname</tt>
	# * <tt>:address2</tt>
	# * <tt>:currency</tt> - the ID of the currency to set the user to
	# * <tt>:clientip</tt> - pass the client IP address
	# * <tt>:language</tt> - the language to assign to the client
	# * <tt>:groupid</tt>  - used to assign the client to a client group
	# * <tt>:securityqid</tt> - the ID of the security question for the user
	# * <tt>:securityqans</tt> - the answer to the client security question
	# * <tt>:notes</tt>
	# * <tt>:cctype</tt> - Visa, Mastercard, etc...
	# * <tt>:cardnum</tt>
	# * <tt>:expdate</tt>
	# * <tt>:startdate</tt>
	# * <tt>:issuenumber</tt>
	# * <tt>:customfields</tt> - a base64 encoded serialized array of custom field values
	# * <tt>:noemail</tt> - pass as true to surpress the client signup welcome email sending
	# * <tt>:skipvalidation</tt> - set true to not validate or check required fields
	#
	# *Note*: All client required fields can be optional if "skipvalidation" is passed
	# See:
	# http://docs.whmcs.com/API:Add_Client
	def self.add_client(params = {})
		params.merge!(:action => 'addclient')
		send_request(params)
	end

	# Add Client Note
	# This command is used to add the Client Note to a specific Client
	#
	# Parameters:
	# * <tt>:userid</tt> - UserID for the note
	# * <tt>:notes</tt> - The note to add
	#
	# See:
	# http://docs.whmcs.com/API:Add_Client_Note
	def self.add_client_note(params = {})
		params.merge!(:action => 'addclientnote')
		send_request(params)
	end

	# Close a client account
	#
	# Parameters:
	# * <tt>:clientid</tt>
	#
	# See:
	#
	# http://docs.whmcs.com/API:Close_Client
	def self.close_client(params = {})
		params.merge!(:action => 'closeclient')
		send_request(params)
	end

	# Update a client's info
	# Parameters:
	# * <tt>:clientid</tt> - Client you wish to update
	#
	# Optional attributes:
	# * <tt>:firstname</tt>
	# * <tt>:lastname</tt>
	# * <tt>:companyname</tt>
	# * <tt>:email</tt>
	# * <tt>:address1</tt>
	# * <tt>:address2</tt>
	# * <tt>:city</tt>
	# * <tt>:state</tt>
	# * <tt>:postcode</tt>
	# * <tt>:country</tt> - two letter ISO country code
	# * <tt>:phonenumber</tt>
	# * <tt>:password2</tt>
	# * <tt>:credit</tt> - credit balance
	# * <tt>:taxexempt</tt> - true to enable
	# * <tt>:notes</tt>
	# * <tt>:cardtype</tt> - visa, mastercard, etc...
	# * <tt>:cardnum</tt> - cc number
	# * <tt>:expdate</tt> - cc expiry date
	# * <tt>:startdate</tt> - cc start date
	# * <tt>:issuenumber</tt> - cc issue number
	# * <tt>:language</tt> - default language
	# * <tt>:status</tt> - active or inactive
	# * <tt>:latefeeoveride</tt> - true/false
	# * <tt>:overideduenotices</tt> - true/false
	# * <tt>:separateinvoices</tt> - true/false
	# * <tt>:disableautocc</tt> - true/false
	#
	# See:
	#
	# http://docs.whmcs.com/API:Update_Client
	def self.update_client(params = {})
		params.merge!(:action => 'updateclient')
		send_request(params)
	end

	# Update Client Addon
	#
	# Parameters:
	#
	# * <tt>:id</tt> - ID of addon to update tblhostingaddons.id
	#
	# Optional attributes:
	#
	# * <tt>:addonid</tt> - Update the defined addon id - tbladdons.id
	# * <tt>:name</tt> - Custom name to define for the addon
	# * <tt>:setupfee</tt> - Setup fee cost. No symbol,i.e xx.xx
	# * <tt>:recurring</tt> - Setup fee cost. No symbol,i.e xx.xx
	# * <tt>:billingcycle</tt> - One of Free Account, One Time, Monthly, Quarterly, Semi-Annually, Annually, Biennially or Triennially
	# * <tt>:nextduedate</tt> - Update the next due date yyyymmdd
	# * <tt>:nextinvoicedate</tt> - Update the next invoice date yyyymmdd
	# * <tt>:notes</tt> - add custom notes to the addon
	# * <tt>:status</tt> - Pending, Active, Suspended, Cancelled, Terminated, Fraud
	#
	# See:
	# http://docs.whmcs.com/API:Update_Client_Addon
	def self.update_client_addon(params = {})
		params.merge!(:action => 'updateclientaddon')
		send_request(params)
	end

	# Update Client Domain
	#
	# Parameters:
	# * <tt>:domainid</tt> - ID of domain to update tbldomains.id
	# * <tt>:domain</tt> - instead of domainid
	#
	# Optional attributes:
	# * <tt>:type</tt> - Register or Transfer
	# * <tt>:autorecalc</tt> - automatically recalculate the recurring price. Will override recurringamount
	# * <tt>:regdate</tt> - Update the reg date yyyymmdd
	# * <tt>:domain</tt> - Update the domain name
	# * <tt>:firstpaymentamount</tt> - Set the first payment amount. No symbol, i.e xx.xx
	# * <tt>:recurringamount</tt> - Setup fee cost. No symbol, i.e xx.xx
	# * <tt>:registrar</tt> - Update the registrar assigned to the domain
	# * <tt>:billingcycle</tt> - One of Free Account, One Time, Monthly, Quarterly, Semi-Annually, Annually, Biennially or Triennially
	# * <tt>:status</tt> - One of Active, Pending, Pending Transfer, Expired, Cancelled, Fraud
	# * <tt>:nextduedate</tt> - Update the next due date yyyymmdd
	# * <tt>:nextinvoicedate</tt> - Update the next invoice date yyyymmdd
	# * <tt>:expirydate</tt> - Update the expiry date yyyymmdd
	# * <tt>:regperiod</tt> - Update the reg period for the domain. 1-10
	# * <tt>:paymentmethod</tt> - set the payment method
	# * <tt>:subscriptionid</tt> - allocate a subscription ID
	# * <tt>:dnsmanagement</tt> - enable/disable DNS Management
	# * <tt>:emailforwarding</tt> - enable/disable Email Forwarding
	# * <tt>:idprotection</tt> - enable/disable ID Protection status
	# * <tt>:donotrenew</tt> - enable/disable Do Not Renew
	# * <tt>:updatens</tt> - Set to true to update Nameservers
	# * <tt>:nsX</tt>	- X should be 1-5, nameservers to send. Minimum 1&2 required
	# * <tt>:notes</tt> -  add custom notes to the addon
	#
	# See: 
	# http://docs.whmcs.com/API:Update_Client_Domain
	def self.update_client_domain(params = {})
		params.merge!(:action => 'updateclientdomain')
		send_request(params)
	end


	# Delete a client
	#
	# Parameters:
	#
	# * <tt>:clientid</tt> - ID Number of the client to delete
	#
	# See:
	#
	# http://docs.whmcs.com/API:Delete_Client
	def self.delete_client(params = {})
		params.merge!(:action => 'deleteclient')
		send_request(params)
	end

	# Get multiple clients
	#
	# Parameters:
	#
	# * <tt>:limitstart</tt> - Record to start at (default = 0)
	# * <tt>:limitnum</tt> - Number of records to return (default = 25)
  #
	# Optional attributes:
  # * <tt>:search</tt> - Can be passed to filter for clients with a name/email matching the term entered
	#
  # See:
	#
	# http://docs.whmcs.com/API:Get_Clients
	def self.get_clients(params = {})
		params.merge!(:action => 'getclients')
		send_request(params)
	end

	# Get Client Credits
	#
	# Parameters:
	# * <tt>:clientid</tt>
	#
	# See:
	# http://docs.whmcs.com/API:Get_Credits
	def self.get_credits(params = {})
		params.merge!(:action => 'getcredits')
		send_request(params)
	end

	# Get Clients Addons
	#
	# Parameters:
	# * <tt>:clientid</tt> - The Client ID you wish to obtain the results for
	# * <tt>:addonid</tt> - The specific addonid you wish to find
	# * <tt>:serviceid</tt> - The specific, or comma separated list of, service(s)
	#
	# See:
	# http://docs.whmcs.com/API:Get_Clients_Addons
	def get_clients_addons(params = {})
		params.merge!(:action => 'getclientsaddons')
		send_request(params)
	end

	# Get a client's info
	#
	# Parameters:
	#
	# * <tt>:clientid</tt> - the id number of the client
	# * <tt>:email</tt> - the email address of the client
	#
	# Optional attributes:
	# * <tt>:stats</tt> - true - If the responsetype of your API call is not XML, 
	# stats are not returned unless this variable is passed
	#
	# See:
	# http://docs.whmcs.com/API:Get_Clients_Details
	def self.get_clients_details(params = {})
		params.merge!(:action => 'getclientsdetails')
		send_request(params)
	end

	# Get a hash of a client's password
	#
	# Parameters:
	# * <tt>:userid</tt> - should contain the user id of the client you wish to get the password for
	#
	# Optional attributes:
	# * <tt>:email</tt> - send email address instead of userid
	#
	# See:
	#
	# http://docs.whmcs.com/API:Get_Clients_Password
	def self.get_clients_password(params = {})
		params.merge!(:action => 'getclientpassword')
		send_request(params)
	end

	# Add a client contact
	#
	# Parameters:
	#
	# * <tt>:clientid</tt> - the client ID to add the contact to
	#
	# Optional attributes:
	# * <tt>:firstname</tt>
	# * <tt>:lastname</tt>
	# * <tt>:companyname</tt>
	# * <tt>:email</tt>
	# * <tt>:address1</tt>
	# * <tt>:address2</tt>
	# * <tt>:city</tt>
	# * <tt>:state</tt>
	# * <tt>:postcode</tt>
	# * <tt>:country</tt> - two letter ISO country code
	# * <tt>:phonenumber</tt>
	# * <tt>:password2</tt> - if creating a sub-account
	# * <tt>:permissions</tt> - can specify sub-account permissions eg manageproducts,managedomains
	# * <tt>:generalemails</tt> - set true to receive general email types
	# * <tt>:productemails</tt> - set true to receive product related emails
	# * <tt>:domainemails</tt> - set true to receive domain related emails
	# * <tt>:invoiceemails</tt> - set true to receive billing related emails
	# * <tt>:supportemails</tt> - set true to receive support ticket related emails
	#
	# See:
	#
	# http://docs.whmcs.com/API:Add_Contact
	def self.add_contact(params = {})
		params.merge!(:action => 'addcontact')
		send_request(params)
	end

	# Add Cancel Request
	# This command is used to Add Cancellation Request for a specific product
	#
	# Parameters:
	# * <tt>:serviceid</tt> - Service ID to be cancelled
	# * <tt>:type</tt> - 'Immediate' OR 'End of Billing Period'
	#
	# Optional attributes:
	# * <tt>:reason</tt> - Reason for cancel
	#
	# See: 
	# http://docs.whmcs.com/API:Add_Cancel_Request
	def self.add_cancel_request(params = {})
		params.merge!(:action => 'addcancelrequest')
		send_request(params)
	end

	# Get client's contacts
	#
	# Optional attributes:
	#
	# * <tt>:limitstart</tt> - Record to start at (default = 0)
	# * <tt>:limitnum</tt> - Number of records to return (default = 25)
	# * <tt>:userid</tt>
	# * <tt>:firstname</tt>
	# * <tt>:lastname</tt>
	# * <tt>:companyname</tt>
	# * <tt>:email</tt>
	# * <tt>:address1</tt>
	# * <tt>:address2</tt>
	# * <tt>:city</tt>
	# * <tt>:state</tt>
	# * <tt>:postcode</tt>
	# * <tt>:country</tt>
	# * <tt>:phonenumber</tt>
	# * <tt>:subaccount</tt> - true/false
	#
	# See:
	#
	# http://docs.whmcs.com/API:Get_Contacts
	def self.get_contacts(params = {})
		params.merge!(:action => 'getcontacts')
		send_request(params)
	end

	# Update a client's contact
	#
	# Parameters:
	#
	# * <tt>:contactid</tt> - The ID of the contact to delete
	# 
	# Optional attributes:
	# * <tt>:generalemails</tt> - set to true to receive general emails
	# * <tt>:productemails</tt> - set to true to receive product emails
	# * <tt>:domainemails</tt> - set to true to receive domain emails
	# * <tt>:invoiceemails</tt> - set to true to receive invoice emails
	# * <tt>:supportemails</tt> - set to true to receive support emails
	# * <tt>:firstname</tt> - change the firstname
	# * <tt>:lastname</tt> - change the lastname
	# * <tt>:companyname</tt> - change the companyname
	# * <tt>:email</tt> - change the email address
	# * <tt>:address1</tt> - change address1
	# * <tt>:address2</tt> - change address2
	# * <tt>:city</tt> - change city
	# * <tt>:state</tt> - change state
	# * <tt>:postcode</tt> - change postcode
	# * <tt>:country</tt> - change country
	# * <tt>:phonenumber</tt> - change phonenumber
	# * <tt>:subaccount</tt> - enable subaccount
	# * <tt>:password2</tt> - change the password
	# * <tt>:permissions</tt> - set permissions eg manageproducts,managedomains
	#
	# Only send fields you wish to update
	#
	# See:
	#
	# http://docs.whmcs.com/API:Update_Contact
	def self.update_contact(params = {})
		params.merge!(:action => 'updatecontact')
		send_request(params)
	end

	# Upgrade Product
	#
	# This command allows you to calculate the cost for an upgrade or downgrade of a product/service, and create an order for it.
	#
	# Parameters:
	# * <tt>:clientid</tt> - the client ID to be upgraded
	# * <tt>:serviceid</tt> - the service ID to be upgraded
	# * <tt>:type</tt> - either "product" or "configoptions"
	# * <tt>:newproductid</tt> - if upgrade type = product, the new product ID to upgrade to
	# * <tt>:newproductbillingcycle</tt> - monthly, quarterly, etc...
	# * <tt>:configoptions[x]</tt> - if upgrade type = configoptions, an array of config options
	# * <tt>:paymentmethod</tt> - the payment method for the order (paypal, authorize, etc...)
	#
	# Optional attributes:
	# * <tt>:promocode</tt> - associate a promotion code with the upgrade
	# * <tt>:calconly</tt> - set true to validate upgrade and get price, false to actually create order
	# * <tt>:ordernotes</tt> - any admin notes to add to the order
	# See:
	#
	# http://docs.whmcs.com/API:Upgrade_Product
	def self.upgrade_product(params = {})
		params.merge!(:action => 'upgradeproduct')
		send_request(params)
	end


	# Delete a client's contact
	#
	# Parameters:
	#
	# * <tt>:contactid</tt> - The ID of the contact to delete
	#
	# See:
	#
	# http://docs.whmcs.com/API:Delete_Contact
	def self.delete_contact(params = {})
		params.merge!(:action => 'deletecontact')
		send_request(params)
	end

	# Get client's products
	#
	# Optional attributes:
	#
	# * <tt>:clientid</tt> - the ID of the client to retrieve products for
	# * <tt>:serviceid</tt> - the ID of the service to retrieve details for
	# * <tt>:domain</tt> - the domain of the service to retrieve details for
	# * <tt>:pid</tt> - the product ID of the services to retrieve products for
	# * <tt>:username2</tt> - the service username to retrieve details for
	# * <tt>:limitstart</tt> - where to start the records. Used for pagination
	# * <tt>:limitnum</tt> - the number of records to retrieve. Default = 999999
	#
	# See:
	#
	# http://docs.whmcs.com/API:Get_Clients_Products
	def self.get_clients_products(params = {})
		params.merge!(:action => 'getclientsproducts')
		send_request(params)
	end

	# Get Clients Domains
	#
	# * <tt>:clientid</tt> - the ID of the client to retrieve products for
	#
	# Optional attributes:
	# * <tt>:domainid</tt> - the ID of the domain to retrieve details for
	# * <tt>:domain</tt> - the domain of the service to retrieve details for
	# * <tt>:limitstart</tt> - where to start the records. Used for pagination
	# * <tt>:limitnum</tt> - the number of records to retrieve. Default = 25
	# * <tt>:getnameservers</tt> - retrieve nameservers in the response
	#
	# See:
	#
	# http://docs.whmcs.com/API:Get_Clients_Domains
	def self.get_clients_domains(params = {})
		params.merge!(:action => 'getclientsdomains')
		send_request(params)
	end

	# Update client's product
	#
	# Parameters:
	#
	# * <tt>:serviceid</tt> - the ID of the service to be updated
	#
	# Optional attributes:
	# * <tt>:pid</tt>
	# * <tt>:serverid</tt>
	# * <tt>:regdate</tt> - Format: YYYY-MM-DD
	# * <tt>:nextduedate</tt> - Format: YYYY-MM-DD
	# * <tt>:domain</tt>
	# * <tt>:firstpaymentamount</tt>
	# * <tt>:recurringamount</tt>
	# * <tt>:billingcycle</tt>
	# * <tt>:paymentmethod</tt>
	# * <tt>:status</tt>
	# * <tt>:serviceusername</tt>
	# * <tt>:servicepassword</tt>
	# * <tt>:subscriptionid</tt>
	# * <tt>:promoid</tt>
	# * <tt>:overideautosuspend</tt> - on/off
	# * <tt>:overidesuspenduntil</tt> - Format: YYYY-MM-DD
	# * <tt>:ns1</tt>
	# * <tt>:ns2</tt>
	# * <tt>:dedicatedip</tt>
	# * <tt>:assignedips</tt>
	# * <tt>:notes</tt>
	# * <tt>:autorecalc</tt> - pass true to auto set price based on product ID or billing cycle change
	# * <tt>:customfields</tt> - a base64 encoded serialized array of custom field values
	# * <tt>:configoptions</tt> - a base64 encoded serialized array of configurable options values
	#
	# See:
	#
	# http://docs.whmcs.com/API:Update_Client_Product
	def self.update_client_product(params = {})
		params.merge!(:action => 'updateclientproduct')
		send_request(params)
	end

	# Validate client login info
	#
	# Parameters:
	#
	# * <tt>:email</tt> - the email address of the user trying to login
	# * <tt>:password2</tt> - the password they supply for authentication
	#
	# See:
	#
	# http://docs.whmcs.com/API:Validate_Login
	def self.validate_login(params = {})
		params.merge!(:action => 'validatelogin')
		send_request(params)
	end

	# Send email to client
	#
	# Parameters:
	#
	# * <tt>:messagename</tt> - unique name of the email template to send from WHMCS
	# * <tt>:id</tt> - related ID number to send message for 
	# (for a general email type a client ID, for a product email type the products Service ID, etc...)
	#
	# Optional attributes:
	# * <tt>:customtype</tt> - The type of email: general, product, domain or invoice
	# * <tt>:customsubject</tt> - Subject for the custom email being sent
	# * <tt>:custommessage</tt> - Content to send as an email, this will override 'messagename' if set
	# * <tt>:customvars</tt> - serialized base64 encoded array of custom variables
	#
	# See:
	#
	# http://docs.whmcs.com/API:Send_Email
	def self.send_email(params = {})
		params.merge!(:action => 'sendemail')
		send_request(params)
	end

	# Get Emails
	# This command is used to get a list of the client emails in XML format
	#
	# Parameters:
	# * <tt>:clientid</tt> - ID of the client to obtain the credit list for
	#
	# Optional attributes:
	# * <tt>:date</tt> - date to obtain emails for. Can be YYYYMMDD, YYYYMM, MMDD, DD or MM
	# * <tt>:subject</tt> - to obtain email with a specific subject
	# * <tt>:limitstart</tt> - for pagination, specify an ID to start at (default = 0)
	# * <tt>:limitnum</tt> - to restrict the number of results returned (default = 25)
	def self.get_emails(params = {})
		params.merge!(:action => 'getemails')
		send_request(params)
	end


	# Get Transactions
	# This command is used to obtain an XML list of transactions from your WHMCS
	#
	# Optional attributes:
	# * <tt>:clientid</tt> - User ID to obtain details for
	# * <tt>:invoiceid</tt> - Obtain transactions for a specific invoice
	# * <tt>:transid</tt> - Obtain details for a specific transaction ID
	#
	# See:
	# http://docs.whmcs.com/API:Get_Transactions
	def self.get_transactions(params = {})
		params.merge!(:action => 'gettransactions')
		send_request(params)
	end


	# Get Quotes
	#
	# Parameters:
	# * <tt>:userid</tt>
	#
	# Optional attributes:
	# * <tt>:quoteid</tt> - specific quote to obtain
	# * <tt>:userid</tt> - obtain quotes for a specific user
	# * <tt>:datecreated</tt> - Format YYYYMMDD
	# * <tt>:astmodified</tt> - Format YYYYMMDD
	# * <tt>:validuntil</tt> - Format YYYYMMDD
	# * <tt>:stage</tt>	- Specific stage to retrieve quotes for
	# * <tt>:subject</tt> - to obtain quotes with a specific subject
	# * <tt>:limitstart</tt> - for pagination, specify an ID to start at
	# * <tt>:limitnum</tt> - to restrict the number of results returned
	#
	# See:
	#
	# http://docs.whmcs.com/API:Get_Quotes
	def self.get_quotes(params = {})
		params.merge!(:action => 'getquotes')
		send_request(params)
	end

	# Get Client Groups
	#
	# This command is used to get a list of the client groups in XML format
	#
	# See:
	#
	# http://docs.whmcs.com/API:Get_Client_Groups
	def self.get_client_groups
		send_request(:action => 'getclientgroups')
	end

  end
end
