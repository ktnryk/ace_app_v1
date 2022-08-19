require 'test_helper'

class MobilecameraTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:michael)
    @mobilecamera = @user.mobilecameras.build( cam_name: "Xperia1-2 No1" )
  end

  test "should be valid" do
    assert @mobilecamera.valid?
  end

  test "user id should be present" do
    @mobilecamera.user_id = nil
    assert_not @mobilecamera.valid?
  end

  test "cam_name should be present " do
    @mobilecamera.cam_name = "  "
    assert_not @mobilecamera.valid?
  end
  
  test "cam_name should be less than 50 characters" do
    @mobilecamera.cam_name = "a" * 51
    assert_not @mobilecamera.valid?
  end

  test "cam_name order should be most recent first" do
    assert_equal mobilecameras(:most_recent), Mobilecamera.first
  end

end
