require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource "Users" do
  user1 = User.create(name: "Girgis", email: "g.ghattas@defacto.nl")
  user2 = User.create(name: "Marthyn", email: "tralala@email.com")
  Device.create(user_id: user1.id, token: "hashjd")
  Device.create(user_id: user2.id, token: "hashjd")
  category = Category.create(name: "iOS")
  Question.create(user_id: user1.id, category_id: category.id, question: "Is this a question?", answer: "Yes it is", user_answer_id: user2.id)



  get "/api/v1/users/#{user2.id}/answers" do
    example "Listing questions" do
      do_request

      status.should == 200
    end
  end
end
