class AddParentAndChildToActionTemplate < ActiveRecord::Migration
  def change
    add_reference :action_templates, :parent, index: true
  end
end
