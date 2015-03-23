class AddBusinessIdToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :business_id, :integer
  end
end
