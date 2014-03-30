module WHMCS
  # WHMCS::Invoice is the class for managing invoices
  class Invoice < Base

    # Get invoices
    #
    # Optional attributes:
    #
    # * <tt>:userid</tt> - the client ID to retrieve invoices for
    # * <tt>:status</tt> - the status to filter for, Paid, Unpaid, Cancelled, etc...
    # * <tt>:limitstart</tt> - the offset number to start at when returning matches (optional, default 0)
    # * <tt>:limitnum</tt> - the number of records to return (optional, default 25)
    #
    # See:
    #
		# http://docs.whmcs.com/API:Get_Invoices
    def self.get_invoices(params = {})
      params.merge!(:action => 'getinvoices')
      send_request(params)
    end

    # Get an invoice
    #
    # Parameters:
    #
    # * <tt>:invoiceid</tt> - should be the invoice id you wish to retrieve
    #
    # See:
    #
		# http://docs.whmcs.com/API:Get_Invoice
    def self.get_invoice(params = {})
      params.merge!(:action => 'getinvoice')
      send_request(params)
    end

    # Create a new invoice
    #
    # Parameters:
    #
    # * <tt>:userid</tt> - should contain the user id of the client you wish to create the invoice for
    # * <tt>:date</tt> - the date the invoice is created in the format YYYYMMDD
    # * <tt>:duedate</tt> - the date the invoice is due in the format YYYYMMDD
    # * <tt>:paymentmethod</tt> - the payment method for the invoice eg. banktransfer
    # * <tt>:itemdescription1</tt> - item 1 description
    # * <tt>:itemtaxed1</tt> - set to true if item 1 should be taxed
    # * <tt>:itemamount1</tt> - item 1 amount
    #
    # * <tt>:taxrate</tt> - the rate of tax that should be charged
		# * <tt>:taxrate2</tt> - the 2nd rate of tax that should be charged
		# * <tt>:autoapplycredit</tt> - pass as true to auto apply any available credit from the clients credit balance
    # * <tt>:itemamount2</tt> - item 2 amount
    # * <tt>:itemtaxed2</tt> - set to true if item 2 should be taxed
    # * <tt>:notes</tt> - any additional notes the invoice should display to the customer
    # * <tt>:sendinvoice</tt> - set to true to send the "Invoice Created" email to the customer
    # * <tt>:itemdescription2</tt> - item 2 description
    #
    # etc...
    #
    # See:
    #
		# http://docs.whmcs.com/API:Create_Invoice
    def self.create_invoice(params = {})
      params.merge!(:action => 'createinvoice')
      send_request(params)
    end

    # Update an existing invoice
    #
    # Parameters:
    #
    # * <tt>:invoiceid</tt> - The ID of the invoice to update
    # 
		# Optional attributes:
		# * <tt>:itemdescription</tt> - Array of existing line item descriptions to update. Line ID from database needed
    # * <tt>:itemamount</tt> - Array of existing line item amounts to update
    # * <tt>:itemtaxed</tt> - Array of existing line items taxed or not
    # * <tt>:newitemdescription</tt> - Array of new line item descriptipons to add
    # * <tt>:newitemamount</tt> - Array of new line item amounts
    # * <tt>:newitemtaxed</tt> - Array of new line items taxed or not
    # * <tt>:date</tt> - date of invoice format yyyymmdd
    # * <tt>:duedate</tt> - duedate of invoice format yyyymmdd
    # * <tt>:datepaid</tt> - date invoice was paid format yyyymmdd
    # * <tt>:status</tt> - status of invoice. Unpaid, Paid, Cancelled, Collection, Refunded
    # * <tt>:paymentmethod</tt> - payment method of invoice eg paypal, banktransfer
		# * <tt>:notes</tt> - invoice notes
		# * <tt>:deletelineids</tt> - an array of line IDs for the current invoice to remove (tblinvoiceitems.id)
    #
    # Other than invoiceid, no other fields are required
    #
    # See:
    #
		# http://docs.whmcs.com/API:Update_Invoice
    def self.update_invoice(params = {})
      params.merge!(:action => 'updateinvoice')
      send_request(params)
    end

    # Add an invoice payment
    #
    # Parameters:
    #
    # * <tt>:invoiceid</tt> - should contact the ID number of the invoice to add the payment to
    # * <tt>:transid</tt> - should contain the transaction number for the payment
    # * <tt>:gateway</tt> - should contain the gateway used in system name format, eg. paypal, authorize, etc...
		#
    # Optional attributes:
		# * <tt>:amount</tt> - should contact the amount paid, can be left blank to take full amount of invoice
    # * <tt>:fees</tt> - optional, if set defines how much fees were involved in the transaction
    # * <tt>:noemail</tt> - set to true to not send an email if the payment marks the invoice paid
    # * <tt>:date</tt> - optional, if set defines the date the payment was made
    #
    # See:
    #
		# http://docs.whmcs.com/API:Add_Invoice_Payment
    def self.add_invoice_payment(params = {})
      params.merge!(:action => 'addinvoicepayment')
      send_request(params)
    end

    # Attempt to capture payment for an invoice
    #
    # Parameters:
    #
    # * <tt>:invoiceid</tt> - the ID of the invoice the capture is to be attempted for
		#
		# Optional attributes:
    # * <tt>:cvv</tt> - optionally can be used to pass the cards verification value in the payment request
    #
    # See:
    #
		# http://docs.whmcs.com/API:Capture_Payment
    def self.capture_payment(params = {})
      params.merge!(:action => 'capturepayment')
      send_request(params)
    end

    # Add a new billable item
    #
    # Parameters:
    #
    # * <tt>:clientid</tt>
    # * <tt>:description</tt>
		# * <tt>:hours</tt>
		# * <tt>:amount</tt>
    # * <tt>:invoiceaction</tt> - noinvoice, nextcron, nextinvoice, duedate, recur
		#
		# Optional attributes:
    # * <tt>:duedate</tt> - date the invoice should be due
    # * <tt>:recur</tt> - frequency to recur - 1,2,3,etc...
    # * <tt>:recurcycle</tt> - Days, Weeks, Months or Years
    # * <tt>:recurfor</tt> - number of times to repeat
    #
    # See:
    #
		# http://docs.whmcs.com/API:Add_Billable_Item
    def self.add_billable_item(params = {})
      params.merge!(:action => 'addbillableitem')
      send_request(params)
    end

    # Add a credit to client's account
    #
    # Parameters:
    #
    # * <tt>:clientid</tt> - the ID of the client the credit is to be added to
    # * <tt>:description</tt> - reason for credit being added (stored in admin credit log)
    # * <tt>:amount</tt> - the amount to be added
    #
    # See:
    #
		# http://docs.whmcs.com/API:Add_Credit
    def self.add_credit(params = {})
      params.merge!(:action => 'addcredit')
      send_request(params)
    end

    # Add transaction
    #
    # Parameters:
    # * <tt>:amountin</tt> - amount to add to the account
    # * <tt>:amountout</tt> - if an outgoing enter this
    # * <tt>:paymentmethod</tt> - gateway used in WHMCS
    # * <tt>:date</tt> - date of transaction (same format as your WHMCS eg DD/MM/YYYY)
    # 
		# * <tt>:userid</tt> - Optional Add Transaction to a user
    # * <tt>:invoiceid</tt> - Optional Add transaction to a particular invoice
    # * <tt>:description</tt> - Description of the transaction
    # * <tt>:fees</tt> - transaction fee you were charged
    # * <tt>:transid</tt> - Transaction ID you wish to assign
    # * <tt>:credit</tt> - set to true to add the transaction as credit to the client
    # See:
    #
		# http://docs.whmcs.com/API:Add_Transaction
    def self.add_transaction(params = {})
      params.merge!(:action => 'addtransaction')
      send_request(params)
    end

		# Update Transaction
		#
		# Parameters:
		# * <tt>:transactionid</tt> - The Transaction ID to update. tblaccounts.id
		#
		# Optional attributes:
		# * <tt>:userid</tt> - Add Transaction to a user
		# * <tt>:currency</tt> - Currency ID for a transaction
		# * <tt>:gateway</tt> - Gateway to assign transaction to
		# * <tt>:date</tt> - date of transaction YYYYMMDD
		# * <tt>:description</tt> - Description of the transaction
		# * <tt>:amountin</tt> - amount to add to the account
		# * <tt>:fees</tt> - transaction fee you were charged
		# * <tt>:amountout</tt> - if an outgoing enter this
		# * <tt>:rate</tt> - exchange rate based on master currency. Set to 1 if on default currency
		# * <tt>:transid</tt> - Transaction ID you wish to assign
		# * <tt>:invoiceid</tt> - Add transaction to a particular invoice
		# * <tt>:refundid</tt> - Add a refund ID if this is a refund transaction
		#
		# See:
		#
		# http://docs.whmcs.com/API:Update_Transaction
		def self.update_transaction(params = {})
			params.merge!(:action => 'updatetransaction')
			send_request(params)
		end

    # Get configured payment methods
    #
    # See:
    #
		# http://docs.whmcs.com/API:Get_Payment_Methods
    def self.get_payment_methods(params = {})
      params.merge!(:action => 'getpaymentmethods')
			send_request(params)
		end

		# Apply Credit
		#
		# Parameters:
		# * <tt>:invoiceid</tt> - the ID to apply the credit to
		# * <tt>:amount</tt> - the amount of credit to apply (must be less than or equal to clients available credit balance)
		#
		# See: 
		#
		# http://docs.whmcs.com/API:Apply_Credit
		def self.apply_credit(params = {})
			params.merge!(:action => 'applycredit')
			send_request(params)
		end

		

  end
end
