
require 'spec_helper'

describe Question do
  describe "Associations" do
    it { should belong_to :user }
    it { should belong_to :category }
  end
end
