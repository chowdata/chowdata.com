class AddInboundEmailToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :inbound_email, :string
  end
end
