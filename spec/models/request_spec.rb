
require 'spec_helper'

describe Request do
  describe "Associations" do
    it { should belong_to :user }
    it { should belong_to :question }
  end

end
