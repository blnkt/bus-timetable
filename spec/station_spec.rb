require 'rails_helper'

describe Station do
  it {should have_many :lines}
  it {should have_many :stops}
  it {should validate_presence_of :name}

  describe '.datamaker' do
    it 'create nodes and edges from objects' do
      Station.create(name: 'Hollywood')
      Station.create(name: 'Burbank')
      expect(JSON.generate(Station.datamaker)).to eq({
        "nodes": [
          {
            "id": 'Hollywood'
          },
          {
            "id": 'Burbank'
          }
        ],
        "edges": [
          {
            "source": 'Hollywood',
            "target": 'Burbank'
          },
          {
            "source": 'Burbank',
            "target": 'Hollywood',
          }
        ]
      })
    end
  end
end

