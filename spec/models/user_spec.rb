
require 'spec_helper'

describe User do
  describe "Associations" do
    it { should have_many :questions }
    it { should have_many :user_categories }
    it { should have_many :requests }
    it { should have_many :points }
  end

  it "should correctly count the total points" do
    user = FactoryGirl.create(:user)
    2.times { user.points.create(amount: 10) }
    expect(user.total_points).to eq(20)
  end
end
