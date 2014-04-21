module WHMCS
  # WHMCS::Ticket is the class for managing support tickets
  class Ticket < Base

    # Open a new ticket
    #
    # Parameters:
    #
    # * <tt>:clientid</tt> - the ID of the client the ticket belongs to
    # * <tt>:deptid</tt> - the ID of the ticket department
    # * <tt>:subject</tt>
    # * <tt>:message</tt>
		#
		# Optional attributes:
    # * <tt>:priority</tt> - can be "Low", "Medium" or "High" (Default = Low)
		# * <tt>:contactid</tt> - the ID of the contact that you wish to associate the ticket with
    # * <tt>:name</tt> - only required if not a registered client (clientid must be sent as 0)
    # * <tt>:email</tt> - only required if not a registered client
    # * <tt>:serviceid</tt> - the ID if the ticket relates to a specific product
    # * <tt>:customfields</tt> - a base 64 serialized array of field IDs => values
		# * <tt>:domainid</tt> - the ID if the ticket relates to a specific domain
		# * <tt>:noemail</tt> - true/false - set to stop the Ticket Opened mail being sent to the user
    #
    # See:
    #
		# http://docs.whmcs.com/API:Open_Ticket
    def self.open_ticket(params = {})
      params.merge!(:action => 'openticket')
      send_request(params)
    end

    # Reply to ticket
    #
    # Parameters:
    #
    # * <tt>:ticketid</tt> - the ID of the ticket to add the reply to
    # * <tt>:message</tt>
		#
		# Optional attributes:
    # * <tt>:clientid</tt> - if adding reply as a client
		# * <tt>:contactid</tt> - to be used along with clientid. contactid should be a contact within the client
    # * <tt>:name</tt> - only required if not a registered client (clientid must be sent as 0)
    # * <tt>:email</tt> - only required if not a registered client
    # * <tt>:adminusername</tt> - if adding reply as an admin, name to show
    # * <tt>:status</tt> - specify if you want to set the status to On Hold or In Progress after reply
    # * <tt>:customfields</tt> - base64_encoded serialized array of custom fields associated with the ticket.
		#
    # See:
    #
		# http://docs.whmcs.com/API:Reply_Ticket
    def self.reply_ticket(params = {})
      params.merge!(:action => 'addticketreply')
      send_request(params)
    end

    # Get tickets
    #
    # Parameters:
    #
    # * <tt>:limitstart</tt> - Optional start at which result (default 0)
    # * <tt>:limitnum</tt> - Optional limit at how many results (default 25)
    # * <tt>:clientid</tt> - Optional search for a particular client's tickets
		# * <tt>:email</tt> - filter for tickets only from a specific email address
    # * <tt>:deptid</tt> - Optional search in a particular department
    # * <tt>:status</tt> - filter for a particular status - in addition to any individual status options, this can also take the values "Awaiting Reply", "All
		# Active Tickets" or "My Flagged Tickets" to return those preset status groups
    # * <tt>:subject</tt> - Optional search for a word in the subject
		# * <tt>:ignore_dept_assignments</tt> - Pass this to ignore the departments the admin user belongs to. Otherwise just the tickets for the departments the API
		# user belongs to are returned
    #
    # See:
    #
		# http://docs.whmcs.com/API:Get_Tickets
    def self.get_tickets(params = {})
      params.merge!(:action => 'gettickets')
      send_request(params)
    end

    # Get a ticket
    #
    # Parameters:
    #
    # * <tt>:ticketid</tt> - Ticket id to retrieve
		# * <tt>:ticketnum</tt> - Ticket Num to retrieve (client ticket number)
    #
    # See:
    #
		# http://docs.whmcs.com/API:Get_Ticket
    def self.get_ticket(params = {})
      params.merge!(:action => 'getticket')
      send_request(params)
    end


		# Get Ticket Notes
		#
		# Parameters:
		# * <tt>:ticketid</tt> - Ticket ID to obtain the notes for
		#
		#
		# See:
		#
		# http://docs.whmcs.com/API:Get_Ticket_Notes
		def self.get_ticket_notes(params = {})
			params.merge!(:action => 'getticketnotes')
			send_request(params)
		end

    # Update an existing ticket
    #
    # Parameters:
    #
    # * <tt>:ticketid</tt> - Ticket ID to be updated
		#
		# Optional attributes:
		# * <tt>:deptid</tt> - update the assigned department
    # * <tt>:subject</tt>
    # * <tt>:priority</tt> - Low, Medium or High
    # * <tt>:status</tt> - Open, Answered, Closed, etc...
		# * <tt>:userid</tt> - change the user that the ticket is assigned to
		# * <tt>:email</tt> - change the email address that opened the ticket (only when userid is not used)
		# * <tt>:cc</tt> - add CC emails to the ticket
		# * <tt>:flag</tt> - flag to an adminid
    #
    # See:
    #
		# http://docs.whmcs.com/API:Update_Ticket
    def self.update_ticket(params = {})
      params.merge!(:action => 'updateticket')
      send_request(params)
    end

    # Add a note to an existing ticket
    #
    # Parameters:
    #
    # * <tt>:ticketid</tt> - Ticket ID the note is to be added
		# * <tt>:ticketnum</tt> - The Ticket number of the note. Please note that you can only use either ticketnum or ticketid and not both.
    # * <tt>:message</tt> - The not to add
    #
    # See:
    #
		# http://docs.whmcs.com/API:Add_Ticket_Note
    def self.add_ticket_note(params = {})
      params.merge!(:action => 'addticketnote')
      send_request(params)
    end

    # Delete an existing ticket
    #
    # Parameters:
    #
    # * <tt>:ticketid</tt> - Ticket ID to be deleted
    #
    # See:
    #
		# http://docs.whmcs.com/API:Delete_Ticket
    def self.delete_ticket(params = {})
      params.merge!(:action => 'deleteticket')
      send_request(params)
    end

		# Delete Ticket Note
		#
		# Parameters:
		# * <tt>:noteid</tt> - Note ID to be removed [See: Get Ticket Notes](http://docs.whmcs.com/API:Get_Ticket_Notes)
		#
		# See:
		#
		# http://docs.whmcs.com/API:Delete_Ticket_Note
		def self.delete_ticket_note(params = {})
			params.merge!(:action => 'deleteticketnote')
			send_request(params)
		end

    # Get support departments
    # This command is used to retrieve an XML list of Support Departments and counts of tickets Open and Awaiting reply.
		#
		# Optional attributes:
		# * <tt>:ignore_dept_assignments</tt> - send as true to ignore the departments that the API user is assigned to
		#
    # See:
    #
		# http://docs.whmcs.com/API:Get_Support_Departments
    def self.get_support_departments
      send_request(:action => 'getsupportdepartments')
    end

    # Get support statuses
    #
    # Optional attributes:
    #
    # * <tt>:deptid</tt> - Optional - Send a Department ID to limit results
    #
    # See:
    #
		# http://docs.whmcs.com/API:Get_Support_Statuses
    def self.get_support_statuses(params = {})
      params.merge!(:action => 'getsupportstatuses')
      send_request(params)
    end

    # Get ticket predefined categories
    #
    # See:
    #
		# http://docs.whmcs.com/API:Get_Ticket_Predefined_Cats
    def self.get_ticket_predefined_cats
			params.merge!(:action => 'getticketpredefinedcats')
			send_request(params)
		end

    # Get ticket predefined replies
    #
    # Optional attributes:
    #
    # * <tt>:catid</tt> - Optional Select category to browse
    #
    # See:
    #
		# http://docs.whmcs.com/API:Get_Ticket_Predefined_Replies
    def self.get_ticket_predefined_replies(params = {})
      params.merge!(:action => 'getsupportstatuses')
      send_request(params)
    end
  end
end
