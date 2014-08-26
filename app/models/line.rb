class Line <ActiveRecord::Base
  has_many :stops
  has_many :stations, through: :stops
  validates :name, presence: true


  def station_data
    names=[]
    self.stations.each {|station| names << station.name}
    nodes = names.map { |name| {id: name, caption: name} }
    edges = []
    names.map.with_index {|name, i| edges << {source: name, target: names[i+1]} if !names[i+1].nil? }
    alchemy_data = {nodes: nodes, edges: edges}
    alchemy_data.to_json
  end

end
