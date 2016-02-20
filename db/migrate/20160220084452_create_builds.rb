class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.string :name
      t.string :status
      t.float  :progress
      t.datetime :startDate
      t.datetime :endDate

      t.timestamps null: false
    end
  end
end
