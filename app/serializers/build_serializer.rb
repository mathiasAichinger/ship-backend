class BuildSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :progress, :startDate, :endDate
  has_one :lane
end
