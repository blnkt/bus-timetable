require 'rails_helper'

describe Station do
  it {should have_many :lines}
  it {should have_many :stops}
end
