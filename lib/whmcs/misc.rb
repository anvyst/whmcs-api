module WHMCS
  # The WHMCS::Misc class contains miscelaneous WHMCS API functions
  class Misc < Base

    # Get activity log
    #
    # Optional attributes:
    #
    # * <tt>:limitstart</tt> - Which User ID to start at (default = 0)
    # * <tt>:limitnum</tt> - Limit by number (default = 25)
    #
    # See:
    #
		# http://docs.whmcs.com/API:Get_Activity_Log
    def self.get_activity_log(params = {})
      params.merge!(:action => 'getactivitylog')
      send_request(params)
    end

    # Get administrator details
    #
    # See:
    #
		# http://docs.whmcs.com/API:Get_Admin_Details
    def self.get_admin_details
      send_request(:action => 'getadmindetails')
    end

    # Update administrator notes
    #
    # Parameters:
    #
    # * <tt>:notes</tt> - notes to enter
    #
    # See:
    #
		# http://docs.whmcs.com/API:Update_Admin_Notes
    def self.update_admin_notes(params = {})
      params.merge!(:action => 'updateadminnotes')
      send_request(params)
    end

		# Up To-Do Item
		#
		# Parameter:
		# * <tt>:itemid</tt> - ID of the ToDo in WHMCS to update
		# * <tt>:adminid</tt> - Admin ID to update the To Do item to
		#
		# Optional attributes:
		# * <tt>:date</tt> - open date of the To Do YYYYMMDD
		# * <tt>:title</tt> - Title of the to do
		# * <tt>:description</tt> - Text of the To Do
		# * <tt>:status</tt> - Status - New, Pending, In Progress, Completed, Postponed
		# * <tt>:duedate</tt> - due date of the To Do YYYYMMDD
		#
		# See:
		#
		# http://docs.whmcs.com/API:Update_To-Do_Item
		def self.update_todo_item(params = {})
			params.merge!(:action => 'updatetodoitem')
			send_request(params)
		end

    # Get allowed currencies
    #
    # See:
    #
		# http://docs.whmcs.com/API:Get_Currencies
    def self.get_currencies
			params.merge!(:action => 'getcurrencies')
      send_request(params)
    end

    # Get promotions
    #
    # Note: WHMCS has this listed under Misc as well as invoices. It's
    # aliased here for consistancy with their API docs
    #
    # Parameters:
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

    # Get email templates
    #
    # Optional attributes:
    #
    # * <tt>:type</tt> - optional - from product,domain,support,general,invoice,affiliate
    # * <tt>:language</tt> - optional - only required for additional languages
    #
    # See:
    #
		# http://docs.whmcs.com/API:Get_Email_Templates
    def self.get_email_templates(params = {})
      params.merge!(:action => 'getemailtemplates')
      send_request(params)
    end

    # Get todo items
    #
    # Optional attributes:
    # * <tt>:status</tt> - optional - from New,Pending,In Progress,Completed,Postponed
		# * <tt>:limitstart</tt> - where to start the output. Used for pagination. (default = 0)
		# * <tt>:limitnum</tt> - limit the number of records returned (default = 25)
    #
    # See:
    #
		# http://docs.whmcs.com/API:Get_To-Do_Items
    def self.get_todo_items(params = {})
      params.merge!(:action => 'gettodoitems')
      send_request(params)
    end

    # Get configured todo item statuses
    #
    # See:
    #
		# http://docs.whmcs.com/API:Get_To-Do_Items_Statuses
    def self.get_todo_item_statuses
      send_request(:action => 'gettodoitemstatuses')
    end

    # Get staff online
    #
    # See:
    #
		# http://docs.whmcs.com/API:Get_Staff_Online
    def self.get_staff_online
      send_request(:action => 'getstaffonline')
    end

    # Get stats
    #
    # See:
    #
		# http://docs.whmcs.com/API:Get_Stats
    def self.get_stats
      send_request(:action => 'getstats')
    end

    # Encrypt a password with the WHMCS algorithm
    #
    # Parameters:
    #
    # * <tt>:password2</tt> - should contain the string you want encrypting
    #
    # See:
    #
		# http://docs.whmcs.com/API:Encrypt_Password
    def self.encrypt_password(params = {})
      params.merge!(:action => 'encryptpassword')
      send_request(params)
    end

    # Decrypt a string with the WHMCS algorithm
		#
		# This command is used to decrypt a string using the WHMCS encryption algorithm. 
		# This cannot be used to decrypt the clients password when using the MD5 Client passwords.
    #
    # Parameters:
    #
    # * <tt>:password2</tt> - should contain the string you want decrypting
    #
    # See:
    #
		# http://docs.whmcs.com/API:Decrypt_Password
    def self.decrypt_password(params = {})
      params.merge!(:action => 'decryptpassword')
      send_request(params)
    end

		# Add Product
		#
		# Parameters:
		# * <tt>:type</tt> one of hostingaccount, reselleraccount, server or other
		# * <tt>:gid</tt> - the product group ID to add it to
		# * <tt>:name</tt> - the product name
		# * <tt>:paytype</tt> - free, onetime or recurring
		#
		# Optional attributes:
		# * <tt>:description</tt> - the product description
		# * <tt>:hidden</tt> - set true to hide
		# * <tt>:showdomainoptions</tt> - set true to show
		# * <tt>:welcomeemail</tt> - the email template ID for a welcome email
		# * <tt>:qty</tt> - set quantity to enable stock control 
		# * <tt>:proratadate</tt>
		# * <tt>:proratachargenextmonth</tt> 
		# * <tt>:autosetup</tt> - on, payment, order or blank for none
		# * <tt>:module</tt> - module name
		# * <tt>:servergroupid</tt> - server group ID
		# * <tt>:subdomain</tt> - subdomain to offer with product
		# * <tt>:tax</tt> - set true to apply tax
		# * <tt>:order</tt> - display sort order to override default
		# * <tt>:configoption1</tt>
		# * <tt>:configoption2</tt>
		# * <tt>:pricing</tt>
		#
		# See:
		#
		# http://docs.whmcs.com/API:Add_Product
		def self.add_product(params = {})
			params.merge!(:action => 'addproduct')
			send_request(params)
		end

		# Log Activity
		#
		# Parameters:
		# * <tt>:description</tt> - Text to add to the log
		# Optional attributes:
		# * <tt>:userid</tt> - UserID to assign the log to in order to appear in Client Log
		#
		# See:
		#
		# http://docs.whmcs.com/API:Log_Activity
		def self.log_activity(params = {})
			params.merge!(:action => 'logactivity')
			send_request(params)
		end

		# Add Banned IP
		#
		# Parameters: 
		# * <tt>:ip</tt> - IP address to ban
		# Optional attributes:
		# * <tt>:reason</tt> - reason for ban
		# * <tt>:days</tt> - number of days to ban for. If not submitted defaults to 7 (not required)
		# * <tt>:expires</tt> - in YYYY-MM-DD HH:II:SS format eg: 2011-06-06 01:12:34 (optional in place of "days")
		#
		# See:
		#
		# http://docs.whmcs.com/API:Add_Banned_IP
		def self.add_banned_ip(params = {})
			params.merge!(:action => 'addbannedip')
			send_request(params)
		end

		# Send Admin Email
		# This command is used to send an email to Admin users
		#
		# Parameters:
		# * <tt>:messagename</tt> - Name of the Admin email template to send 
		# * <tt>:mergefields</tt> - array of merge fields to populate the template being sent
		# * <tt>:type</tt> - Who to send the email to. One of system, account or support. Default: system
		#
		# Optional attributes:
		# * <tt>:customsubject</tt> - Subject for a custommessage being sent
		# * <tt>:custommessage</tt> - Send a custom email to admin users, this will override 'messagename'
		# * <tt>:deptid</tt> - If type = support, the users of a department to send email to
		#
		# See:
		#
		# http://docs.whmcs.com/API:Send_Admin_Email
		def self.send_admin_email(params = {})
			params.merge!(:action => 'sendadminemail')
			send_request(params)
		end
  end
end
