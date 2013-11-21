require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource "Devices" do

  post "/api/v1/devices" do
    user = User.create(name:"John Doe", email: "John@doe.nl")
    parameter :user_id, "The users id", scope: :device
    parameter :token, "The device id", scope: :device
    device = {}
    device[:user_id] = user.id
    device[:token] = "duyuy38h"
    example "Adding a device to user" do
      do_request(device: device)
    end
  end
end
