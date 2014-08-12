require 'rails_helper'

RSpec.describe Offer, type: :model do
  it { is_expected.to have_many(:orders) }

  it { is_expected.to validate_presence_of(:name) }
end
