require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
   test "visiting the index" do
     visit user_session
  
     assert_selector "h2", text: "Log in"
   end
end
