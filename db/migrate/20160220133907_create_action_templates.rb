class CreateActionTemplates < ActiveRecord::Migration
  def change
    create_table :action_templates do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
