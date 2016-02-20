class CreateLanes < ActiveRecord::Migration
  def change
    create_table :lanes do |t|
      t.string :name
      t.string :description
      t.float :progress
      t.datetime :startDate
      t.datetime :endDate
      t.string :logs
      t.string :status

      t.timestamps null: false
    end
  end
end
