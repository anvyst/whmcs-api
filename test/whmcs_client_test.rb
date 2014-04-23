require 'test_helper'

class WhmcsClientTest < Minitest::Test

  def test__crud_operations_on_client
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
      added_note = WHMCS::Client.add_client_note(:clientid => saved['clientid'], :notes => "TestNote")
      updated_client = WHMCS::Client.update_client(:clientid => saved['clientid'], :firstname => 'Test13')
      

      closed_client = WHMCS::Client.close_client(:clientid => saved['clientid'])
      # finally done testing with the client
      deleted = WHMCS::Client.delete_client(:clientid => saved['clientid'])
    end

    assert_equal('success', updated_client['result'])
    assert_equal('success', closed_client['result'])
    assert_equal('success', added_note['result'])
    assert_equal('success', saved['result'])
    assert_not_equal('', saved['clientid'])
    assert_equal('success', deleted['result'])
  end
end
