require 'spec_helper'

describe User do
  it do
    should validate_presence_of(:email)
  end

  it do
    should validate_uniqueness_of(:email)
  end
end
