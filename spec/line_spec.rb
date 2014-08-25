require 'rails_helper'

describe Line do
  it {should have_many :stations}
  it {should have_many :stops}
  it {should validate_presence_of :name}
end
