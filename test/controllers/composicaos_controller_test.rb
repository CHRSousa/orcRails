require 'test_helper'

class ComposicaosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get composicaos_new_url
    assert_response :success
  end

end
