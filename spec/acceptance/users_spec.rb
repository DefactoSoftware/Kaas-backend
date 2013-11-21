require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource "Users" do
  let(:user) { FactoryGirl.create(:user) }
  let(:id) { user.id }

  post "/api/v1/users" do
    parameter :email, "The users email address", scope: :user
    parameter :name, "The users password", scope: :user

    let(:user_params) { { user: { email: user.email, name: user.name } } }
    example "Creating a user" do
      do_request(user: user_params)
    end
  end

  get "/api/v1/users/:id" do
    example_request "Getting a user" do
      expect(response_status).to eq(200)
    end
  end
end
