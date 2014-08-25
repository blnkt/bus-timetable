require 'rails_helper'

describe Station do
  it {should have_many :lines}
  it {should have_many :stops}
  it {should validate_presence_of :name}
end
