require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "should get vacancies" do
    get :vacancies
    assert_response :success
  end

end
