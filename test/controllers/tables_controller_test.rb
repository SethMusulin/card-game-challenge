class TablesControllerTest < ActionDispatch::IntegrationTest

  test "home should return success" do
    get '/home'
    assert_response :success
  end
end