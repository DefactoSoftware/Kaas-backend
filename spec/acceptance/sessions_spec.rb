require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource "Sessions" do

  post "/api/v1/users" do
    user = User.create(email: "Marthyn@live.nl")
    parameter :email, "The users email address", scope: :user
    user_post = { email: user.email }
    example "Logging in" do
      do_request(user: user_post)
    end
  end
end
