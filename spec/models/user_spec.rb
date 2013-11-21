
require 'spec_helper'

describe User do
  describe "Associations" do
    it { should have_many :questions }
    it { should have_many :user_categories }
    it { should have_many :requests }
    it { should have_many :points }
  end
end
