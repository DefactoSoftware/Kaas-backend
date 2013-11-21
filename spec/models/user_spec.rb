
require 'spec_helper'

describe User do
  describe "Associations" do
    it { should have_many :questions }
    it { should have_many :user_categories }
    it { should have_many :requests }
    it { should have_many :points }
  end

  describe "counting points" do
    it "should be correct when points given" do
      user = FactoryGirl.create(:user)
      2.times { user.points.create(amount: 10) }
      expect(user.total_points).to eq(20)
    end

    it "should be 0 when no points given" do
      user = FactoryGirl.create(:user)
      expect(user.total_points).to eq(0)
    end
  end
end
