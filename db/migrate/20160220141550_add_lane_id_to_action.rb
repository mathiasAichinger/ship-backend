class AddLaneIdToAction < ActiveRecord::Migration
  def change
    add_reference :actions, :lane, index: true
  end
end
