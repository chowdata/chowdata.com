class AddMandrillIdToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :mandrill_id, :string
  end
end
