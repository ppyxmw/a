require 'test_helper'

class MealplanControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get mealplan_all_url
    assert_response :success
  end

end
