class Station < ActiveRecord::Base
  has_many :stops
  has_many :lines, through: :stops
  validates :name, presence: true



  def self.datamaker
    names=[]
    Station.all.each {|station| names << station.name}
    permutated_names = names.permutation(2).to_a
    nodes = names.map { |name| {id: name} }
    edges = permutated_names.map {|name1, name2| {source: name1, target: name2}}
    alchemy_data = {nodes: nodes, edges: edges}
    alchemy_data.to_json
  end

end
