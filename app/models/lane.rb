class Lane < ActiveRecord::Base
  belongs_to :build
  has_many :actions
end
