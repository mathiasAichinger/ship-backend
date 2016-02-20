class ActionSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :progress, :status, :logs, :startDate, :endDate
end
