# Contains the system tests for the application. 

require "application_system_test_case"

class ApplicationWideTest < ApplicationSystemTestCase
  setup do
    sign_in users(:visitor)
  end

  test "Check that a user can sign up, sign in and update" do
    sign_out users(:visitor)

    # User sign up test
    visit root_url
    click_on "Sign Up"
    
    fill_in "user_name",	with: "Tester"
    fill_in "user_username",	with: "tester"
    fill_in "user_email",	with: "tester@example.org"
    fill_in "user_password",	with: "userpassword"
    fill_in "user_password_confirmation",	with: "userpassword"
    click_on "Confirm Sign Up"

    assert_text "Welcome! You have signed up successfully."
    assert_selector "p", text: "Tester | @tester"

    click_on "Logout"

    # User sign in test
    click_on "Sign In"

    fill_in "user_email",	with: "tester@example.org"
    fill_in "user_password",	with: "userpassword"
    click_on "Log In"

    assert_text "Signed in successfully."

    # User update test
    click_on "Tester", match: :first

    fill_in "user_password",	with: "updatedpassword"
    fill_in "user_password_confirmation",	with: "updated password"
    fill_in "user_current_password",	with: "userpassword"
    click_on "Update"
  end

  test "Users can send a message" do
    visit root_url
    click_on "Messages"
    fill_in "message_input",	with: "Test"
    find('#message_input').native.send_keys(:return)
    assert_selector "span", text: "Test"
  end

  # test "Check that a user can make a purchase" do
  #   category = categories(:category)
  #   product = products(:product)

  #   visit category_products_url(category)
  #   click_on product
  # end
end
