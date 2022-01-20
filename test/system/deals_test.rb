require "application_system_test_case"

class DealsTest < ApplicationSystemTestCase
  test "viewing the home page" do
    visit '/home'
    assert_selector "button", text: "Deal"
    assert_selector "span", text: "Player 1"
    assert_selector "span", text: "Player 2"
  end
  test "clicking the deal button deals a hand" do
    visit '/home'
    assert_selector "div[data-test='hands_wrapper']", { :count => 0}
    click_on "Deal"
    assert_selector "div[data-test='hands_wrapper']", { :count => 1}
  end
  test "history of the deals is shown" do
    visit '/home'
    deal_count = Deal.count
    # Subtract one for the top heading row
    table_rows = (page.all('table tr').size) -1
    assert_equal deal_count, table_rows
  end
end