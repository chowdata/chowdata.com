class AddLocationIdToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :location_id, :integer
  end
end
