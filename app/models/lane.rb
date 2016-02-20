class Lane < ActiveRecord::Base
  belongs_to :build
  belongs_to :lane_template
  has_many :actions, dependent: :destroy

  after_initialize :initialize_values
  def initialize_values(attributes = {}, options = {})
    self.progress = 0.0
    self.status = "pending"
  end
end
