require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource "Users" do

  user = FactoryGirl.create(:user)

  post "/api/v1/users" do
    parameter :email, "The users email address", scope: :user
    parameter :name, "The users password", scope: :user
    user_post = {}
    user_post[:email] = user.email
    user_post[:name] = user.name
    example "Creating a user" do
      do_request(user: user_post)
    end
  end
end
