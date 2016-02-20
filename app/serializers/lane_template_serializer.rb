class LaneTemplateSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_many :action_templates
end
