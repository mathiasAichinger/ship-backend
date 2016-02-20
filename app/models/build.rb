class Build < ActiveRecord::Base
  belongs_to :app
  has_one :lane, dependent: :destroy
end
