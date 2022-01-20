require "test_helper"

class DealsControllerTest < ActionDispatch::IntegrationTest
  test "deal should return success" do
    get '/api/deal', xhr: true
    assert_response :success
  end

  test "deals should return success" do
    get '/api/deals', xhr: true
    assert_response :success
  end

  test '/deal returns a deal' do
    get '/api/deal', xhr: true
    assert_equal JSON.parse(@response.body)["data"]["type"], "deal"
  end

  test '/deals returns all deals' do
    get '/api/deals', xhr: true
    assert_equal JSON.parse(@response.body)["data"].length, Deal.count
  end
end