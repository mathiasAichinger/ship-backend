class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :name
      t.string :description
      t.float :progress
      t.string :status
      t.string :logs
      t.datetime :startDate
      t.datetime :endDate

      t.timestamps null: false
    end
  end
end
