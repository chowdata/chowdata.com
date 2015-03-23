class AddBusinessIdToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :business_id, :integer
  end
end
