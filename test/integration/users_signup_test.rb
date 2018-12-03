require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      #@user = User.new(name: "", email: "user@invalid", password: "foo", password_confirmation: "bar")
      #post users_path, params: @user
      post signup_path, params: { user: {name: "", email: "user@invalid", password: "foo", password_confirmation: "bar"}}

#      assert "#{:user.errors.messages.email}", 'abc'
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert'
    assert_select 'form[action="/signup"]'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: {user: {name: "Example", email:"user@example.com", password:"foobar", password_confirmation:"foobar"}}
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
  end

  
end
