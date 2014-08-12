require 'rails_helper'

RSpec.describe Order, type: :model do
  it { is_expected.to belong_to(:offer) }

  it { is_expected.to validate_presence_of(:offer) }
  it { is_expected.to validate_presence_of(:street) }
  it { is_expected.to validate_presence_of(:zip) }
  it { is_expected.to validate_presence_of(:city) }
  it { is_expected.to validate_presence_of(:lastname) }

  context 'when it is without email' do
    before { subject.email = false }

    it { is_expected.to validate_presence_of(:telephone) }
  end

  context 'when it is with email' do
    before { subject.email = true }

    it { is_expected.not_to validate_presence_of(:telephone) }
  end
end
