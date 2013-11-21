require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource "Categories" do
  before :each do
    3.times do
      FactoryGirl.create(:category)
    end
  end

  get "/api/v1/categories" do
    example "Listing categories" do
      do_request

      status.should == 200
    end
  end
end
