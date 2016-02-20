class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :key
      t.string :name
      t.string :description
      t.string :icon_url

      t.timestamps null: false
    end
  end
end
