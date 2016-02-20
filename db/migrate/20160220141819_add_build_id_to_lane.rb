class AddBuildIdToLane < ActiveRecord::Migration
  def change
    add_reference :lanes, :build, index: true
  end
end
