class AddProfileIdToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :profile_id, :integer
  end
end
