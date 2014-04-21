require 'test_helper'

class WhmcsClientTest < Test::Unit::TestCase

  def test__add_client_delete_client
    test_data = {
      :firstname  => 'Test',
      :lastname   => 'Testson',
      :email      => 'test@localhost.com',
      :address1   => 'Test str',
      :city       => 'Test City',
      :state      => 'N/A',
      :postcode   => '12345',
      :country    => 'CY',
      :phonenumber => '1122334455',
      :password2  => 'test_pass_123'
    }

    saved = WHMCS::Client.add_client(test_data)
   
    if( saved['clientid'] )
      deleted = WHMCS::Client.delete_client(:clientid => saved['clientid'])
    end

    assert_equal('success', saved['result'])
    assert_not_equal('', saved['clientid'])
    assert_equal('success', deleted['result'])
  end
end
