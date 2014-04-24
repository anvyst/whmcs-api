require 'test_helper'

class WhmcsClientTest < Minitest::Test
  def test__crud_operations_on_client
    test_data = {
      :firstname  => 'Test',
      :lastname   => 'Testson',
      :email      => 'test@localhost1.com',
      :address1   => 'Test str',
      :city       => 'Test City',
      :state      => 'N/A',
      :postcode   => '12345',
      :country    => 'CY',
      :phonenumber => '1122334455',
      :password2  => 'test_pass_123'
    }

    results = WHMCS::Client.get_clients()
    assert_kind_of(Hash, results) 
  end
end
