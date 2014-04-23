require_relative 'test_helper'

class WHMCSTest < Minitest::Test
  # in certain occasions encrypt call returns hash that includes '='
  def test__parse_response__parsedCorrectlyHashesWithEqSign
    expected = "result=succes;password=12lkjdfosifusdlfsdfmlasdof==;"
    parsed = WHMCS::Base.parse_response(expected)
    assert_equal('12lkjdfosifusdlfsdfmlasdof==', parsed['password'])
  end

  def test__send_request__returningHash
    resulted = WHMCS::Base.send_request(:action => 'do_me_a_favor')
    assert resulted.is_a?(Hash)
    assert_equal('Command Not Found', resulted['message'])
  end
end
