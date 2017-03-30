require 'test_helper'

class JobsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get jobs_create_url
    assert_response :success
  end

end
