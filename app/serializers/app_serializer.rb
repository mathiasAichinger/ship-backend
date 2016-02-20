class AppSerializer < ActiveModel::Serializer
  attributes :id, :name, :key, :description, :icon_url
  has_many :lane_templates
  has_many :builds
end
