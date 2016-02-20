class ActionTemplateSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :icon_url
  belongs_to :parent, :class_name => "ActionTemplate"
  has_one :child, :class_name => "ActionTemplate", foreign_key: "parent_id"
end
