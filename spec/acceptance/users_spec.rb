require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource "Users" do

  post "/api/v1/users" do
    parameter :email, "The users email address", scope: :user
    parameter :name, "The users password", scope: :user
    user = {}
    user[:email] = "Marthyn@live.nl"
    user[:name] = "Marthyn Olthof"
    example "Creating a user" do
      do_request(user: user)
    end
  end
end
