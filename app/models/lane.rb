class Lane < ActiveRecord::Base
  belongs_to :build
  belongs_to :lane_template
  has_many :actions
end
