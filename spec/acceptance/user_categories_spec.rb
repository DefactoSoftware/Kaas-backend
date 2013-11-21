require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource "User Categories" do

  post "/api/v1/user_categories" do
    user = User.create(name:"John Doe", email: "John@doe.nl")
    parameter :user_id, "The users id", scope: :user_category
    parameter :name, "The name of the category", scope: :user_category
    user_category = {}
    user_category[:user_id] = user.id
    user_category[:name] = "Kantklossen"
    example "Adding a category to user" do
      do_request(user_category: user_category)
    end
  end
end
