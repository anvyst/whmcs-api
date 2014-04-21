require_relative 'test_helper'

class WHMCSBaseTest < Test::Unit::TestCase
  # in certain occasions encrypt call returns hash that includes '='
  def test__passwordEncryption
    result = WHMCS::Misc.encrypt_password(:password2 => 'test')
    
    decrypted = WHMCS::Misc.decrypt_password(:password2 => result['password'])

    assert_equal(decrypted['password'], 'test')
  end

end
