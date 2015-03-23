class AddLocationIdToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :location_id, :integer
  end
end
