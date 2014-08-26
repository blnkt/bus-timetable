class Station < ActiveRecord::Base
  has_many :stops
  has_many :lines, through: :stops
  validates :name, presence: true

  def self.datamaker
    station_names=[]
    Station.all.each {|station| station_names << station.name}
    nodes = station_names.map { |name| {id: name, caption: name} }

    edges = []
    line_stations = []
    Line.all.each do |line|
      line.stations.each do |station|
        line_stations << station.name
        line_stations.map.with_index {|name, i| edges << {source: name, target: line_stations[i+1]} if !line_stations[i+1].nil? }
      end
    end
    alchemy_data = {nodes: nodes, edges: edges}
    alchemy_data.to_json
  end

end
