class Stop <ActiveRecord::Base
  belongs_to :line
  belongs_to :station
  validates :line_id, presence: true
  validates :station_id, presence: true
end
