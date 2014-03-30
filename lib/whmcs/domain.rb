module WHMCS
	# WHMCS:Domain class for domains management	
	class Domain < Base
		
		# Register Domain
		# This command is used to send a Register command to the registrar
		#
		# Parameters:
		# * <tt>:domainid</tt> - Domain ID from WHMCS
		# * <tt>:domain</tt> - The domain name (send domain id *or* domain)
		#
		# See: 
		#
		# http://docs.whmcs.com/API:Register_Domain
		def self.register(params = {})
			params.merge!(:action => 'domainregister')
			send_request(params)
		end

		# Release Domain
		# This command is used to send a Release command to the registrar
		#
		# Parameters:
		# * <tt>:domainid</tt> - Domain ID from WHMCS
		# * <tt>:domain</tt> - The domain name (send domain id *or* domain)
		# * <tt>:newtag</tt> - The new tag for the domain [Tag List](http://www.nominet.org.uk/registrars/becomeregistrar/taglist/)
		#
		# See: 
		#
		# http://docs.whmcs.com/API:Release_Domain
		def self.release(params = {})
			params.merge!(:action => 'domainrelease')
			send_request(params)
		end


		# Renew Domain
		# This command is used to send a Renew command to the registrar
		#
		# Parameters:
		# * <tt>:domainid</tt> - Domain ID from WHMCS
		# * <tt>:domain</tt> - The domain name (send domain id *or* domain)
		#
		# See: 
		#
		# http://docs.whmcs.com/API:Renew_Domain
		def self.renew(params = {})
			params.merge!(:action => 'domainrenew')
			send_request(params)
		end

		# Transfer Domain
		# This command is used to send a Transfer command to the registrar
		#
		# Parameters:
		# * <tt>:domainid</tt> - Domain ID from WHMCS
		# * <tt>:domain</tt> - The domain name (send domain id *or* domain)
		#
		# Optional attributes:
		#
		# * <tt>:eppcode</tt> - The EPP code for the transfer
		#
		# See: 
		#
		# http://docs.whmcs.com/API:Transfer_Domain
		def self.transfer(params = {})
			params.merge!(:action => 'domaintransfer')
			send_request(params)
		end


		# Get Domain WHOIS
		# This command is used to obtain the WHOIS of a domain from the registrar
		#
		# Parameters:
		# * <tt>:domainid</tt> - ID of the domain in WHMCS
		#
		# See:
		#
		# http://docs.whmcs.com/API:Get_Domain_WHOIS
		def self.get_domain_whois(params = {})
			params.merge!(:action => 'domaingetwhoisinfo')
			send_request(params)
		end

		# Domain Locking Status
		# This command is used to obtain the lock state of a domain
		#
		# Parameters:
		# * <tt>:domainid</tt> - ID of the domain in your WHMCS
		#
		# See:
		#
		# http://docs.whmcs.com/API:Domain_Locking_Status
		def self.get_lockstatus(params = {})
			params.merge!(:action => 'domaingetlockingstatus')
			send_request(params)
		end

		# Domain EPP
		# This command is used to obtain the EPP Code of a domain
		#
		# Parameters:
		# * <tt>:domainid</tt> - ID of the domain in WHMCS
		#
		# See:
		#
		# http://docs.whmcs.com/API:Domain_EPP
		def self.request_epp(params = {})
			params.merge!(:action => 'domainrequestepp')
			send_request(params)
		end


		# Domain WHOIS
		# This command is used to perform a whois lookup on a specified domain.
		#
		# Parameters:
		# * <tt>:domain</tt> - the domain to check
		#
		# See:
		#
		# http://docs.whmcs.com/API:Domain_WHOIS
		def self.whois(params = {})
			params.merge!(:action => 'domainwhois')
			send_request(params)
		end


		# Toggle ID Protect
		# This command is used to toggle the ID Protection status of a domain assigned to certain registrars. For example all LogicBoxes modules.
		#
		# Parameters:
		# * <tt>:domainid</tt> - ID of the domain in WHMCS
		# * <tt>:dprotect</tt> - true/false
		#
		# See:
		#
		# http://docs.whmcs.com/API:Toggle_ID_Protect
		def self.toggle_idprotect(params = {})
			params.merge!(:action => 'domaintoggleidprotect')
			send_request(params)
		end

		# Domain Nameservers
		#
		# This command is used to obtain the nameservers of a domain
		#
		# Parameters:
		# * <tt>:domainid</tt> - ID of the domain in WHMCS
		#
		# See:
		#
		# http://docs.whmcs.com/API:Domain_Nameservers
		def self.get_nameservers(params = {})
			params.merge!(:action => 'domaingetnameservers')
			send_request(params)
		end

		# Domain Update Nameservers
		# This command is used to update the nameservers of a domain
		#
		# Parameters:
		# * <tt>:domainid</tt> - ID of the domain in WHMCS
		# * <tt>:domain</tt> - domainname to update (use domainid OR domain)
		# * <tt>:ns1</tt> - nameserver1
		# * <tt>:ns2</tt> - nameserver2
		#
		# Optional attributes:
		# * <tt>:ns3</tt> - nameserver3
		# * <tt>:ns4</tt> - nameserver4
		# * <tt>:ns5</tt> - nameserver5
		#
		# See:
		#
		# http://docs.whmcs.com/API:Domain_Update_Nameservers
		def self.update_nameservers(params = {})
			params.merge!(:action => 'domainupdatenameservers')
			send_request(params)
		end

		# Domain Update Lock
		# This command is used to update the lock state of a domain
		#
		# Parameters:
		# * <tt>:domainid</tt> - ID of the domain in WHMCS
		#
		# Optional attributes:
		# * <tt>:lockstatus</tt> - set to 1 to lock the domain
		#
		# See:
		#
		# http://docs.whmcs.com/API:Domain_Update_Lock
		def self.update_lockstatus(params = {})
			params.merge!(:action => 'domainupdatelockingstatus')
			send_request(params)
		end

		# Domain Update WHOIS
		# This command is used to update the contact information on a domain
		# 
		# Parameters:
		# * <tt>:domainid</tt> - ID of the domain in WHMCS
		# * <tt>:xml</tt> - xml of the details to update [Get WHOIS](http://docs.whmcs.com/API:Get_Domain_WHOIS)
		#
		# See:
		#
		# http://docs.whmcs.com/API:Domain_Update_WHOIS
		def self.update_domain_whois(params = {})
			params.merge!(:action => 'domainupdatewhoisinfo')
			send_request(params)
		end
	end
end
