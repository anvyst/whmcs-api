require_relative 'test_helper'

class WhmcsBaseTest < Test::Unit::TestCase
	
	should "return correct password from encrypt decrypt" do
		
		result		= WHMCS::Misc.encrypt_password( :password2 => 'test' )
		puts result
		decrypted = WHMCS::Misc.decrypt_password( :password2 => result )
		puts decrypted
		assert_equal(decrypted, 'test')
	end

end
