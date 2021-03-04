require 'test_helper'

class ChartsControllerTest < ActionDispatch::IntegrationTest
  test "should get completed_tasks" do
    get charts_completed_tasks_url
    assert_response :success
  end

end
