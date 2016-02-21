class Build < ActiveRecord::Base
  belongs_to :app
  has_one :lane, dependent: :destroy

  after_initialize :initialize_values
  def initialize_values(attributes = {}, options = {})
    self.progress ||= 0.0
    self.status ||= "pending"
  end
end
