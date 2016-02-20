class Action < ActiveRecord::Base
  belongs_to :lane
  belongs_to :action_template

  after_initialize :initialize_values
  def initialize_values(attributes = {}, options = {})
    self.progress = 0.0
    self.status = "pending"
  end
end
