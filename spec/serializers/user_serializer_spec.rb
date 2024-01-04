require 'rails_helper'

RSpec.describe UserSerializer, type: :serializer do
  subject { described_class.new(user) }

  let(:user) { FactoryBot.create(:user) }

  it { is_expected.to have_type(:user) }

  it { is_expected.to serialize_attribute(:id) }
  it { is_expected.to serialize_attribute(:email) }
  it { is_expected.to serialize_attribute(:created_at) }
  it { is_expected.to serialize_attribute(:created_date) }
end
