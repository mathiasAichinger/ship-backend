class AddAppIdToBuild < ActiveRecord::Migration
  def change
    add_reference :builds, :app, index: true
  end
end
