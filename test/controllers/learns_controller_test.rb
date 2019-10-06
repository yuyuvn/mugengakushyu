require 'test_helper'

class LearnsControllerTest < ActionController::TestCase
  test "should get word" do
    get :word
    assert_response :success
  end

end
