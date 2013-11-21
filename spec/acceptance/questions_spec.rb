require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource "Users" do




  get "/api/v1/users/1/questions" do
    let(:user1) { FactoryGirl.create(:user) }
    let(:user2) { FactoryGirl.create(:user) }
    let(:device1) { FactoryGirl.create(:device, user: user1) }
    let(:device2) { FactoryGirl.create(:device, user: user2) }
    let(:category) { FactoryGirl.create(:category) }
    let(:question) { FactoryGirl.create(:question, user: user1, category: category) }
    example "Listing questions" do
      user1.reload
      do_request
      status.should == 200
    end
  end
end
