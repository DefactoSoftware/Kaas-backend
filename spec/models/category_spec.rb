
require 'spec_helper'

describe Device do
  describe "Associations" do
    it { should belong_to :user }
  end

end
