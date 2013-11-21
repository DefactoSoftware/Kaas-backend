require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource "Users" do
  user1 = User.create(name: "Girgis", email: "g.ghattas@defacto.nl")
  user2 = User.create(name: "Marthyn", email: "Marthyn@live.nl")
  Device.create(user_id: user1.id, token: "hashjd")
  Device.create(user_id: user2.id, token: "hashjd")
  let(:category) { Category.create(name: "iOS") }
  let(:question) { Question.create(user_id: user1.id, category: category, question: "Is this a question?") }



  get "/api/v1/users/#{user2.id}/answerables" do
    example "Listing answerables" do
      Request.create(user: user2, question: question)
      do_request

      status.should == 200
    end
  end
end
