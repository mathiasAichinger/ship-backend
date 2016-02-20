class Action < ActiveRecord::Base
  belongs_to :lane
  belongs_to :action_template
end
