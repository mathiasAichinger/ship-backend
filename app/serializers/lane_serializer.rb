class LaneSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :progress, :startDate, :endDate, :logs, :status
end
