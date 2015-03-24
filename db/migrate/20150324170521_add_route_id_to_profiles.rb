class AddRouteIdToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :route_id, :string
  end
end
