module WHMCS
  # WHMCS::Module is the class for working with hosting account modules
  class Module < Base

    # Run the module create command
    #
    # Parameters:
    #
    # * <tt>:accountid</tt> - the unique id number of the account in the tblhosting table
    #
    # See:
    #
		# http://docs.whmcs.com/API:Module_Create
    def self.module_create(params = {})
      params.merge!(:action => 'modulecreate')
      send_request(params)
    end

    # Run the module suspend command
    #
    # Parameters:
    #
    # * <tt>:accountid</tt> - the unique id number of the account in the tblhosting table
		#
		# Optional attributes:
    # * <tt>:suspendreason</tt> - an explanation of why the suspension has been made shown to clients & staff
    #
    # See:
    #
		# http://docs.whmcs.com/API:Module_Suspend
    def self.module_suspend(params = {})
      params.merge!(:action => 'modulesuspend')
      send_request(params)
    end

    # Run the module unsuspend command
    #
    # Parameters:
    #
    # * <tt>:accountid</tt> - the unique id number of the account in the tblhosting table
    #
    # See:
    #
		# http://docs.whmcs.com/API:Module_Unsuspend
    def self.module_unsuspend(params = {})
      params.merge!(:action => 'moduleunsuspend')
      send_request(params)
    end

    # Run the module terminate command
    #
    # Parameters:
    #
    # * <tt>:accountid</tt> - the unique id number of the account in the tblhosting table
    #
    # See:
    #
		# http://docs.whmcs.com/API:Module_Terminate
    def self.module_terminate(params = {})
      params.merge!(:action => 'moduleterminate')
      send_request(params)
    end

		# Module Change Package
		#
		# This command is used to run the change package module command
		#
		# Parameters:
		#
		# *<tt>:serviceid</tt> - ID of the service in WHMCS to run the module command
		#
		# See:
		#
		# http://docs.whmcs.com/API:Module_Change_Package
		def self.module_change_package(params = {})
			params.merge!(:action => 'modulechangepackage')
			send_request(params)
		end

		# Module Change Password
		#
		# This command is used to issue the change password command to the module for a service.
		#
		# Params:
		# * <tt>:serviceid</tt> - the unique id of the service to perform the action on (aka tblhosting.id)
		#
		# Optional attributes:
		#
		# * <tt>:servicepassword</tt> - Specify to update the password on the service before calling
		#
		# See:
		#
		# http://docs.whmcs.com/API:Module_Change_Password
		def self.module_change_password(params = {})
			params.merge!(:action => 'modulechangepw')
			send_request(params)
		end
  end
end
