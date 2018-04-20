require 'rails_helper'

RSpec.describe Recipe, type: :model do
  # association tests
  it { is_expected.to belong_to :user }
  # validation tests
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :servings }
  it { is_expected.to validate_presence_of :description }

end
