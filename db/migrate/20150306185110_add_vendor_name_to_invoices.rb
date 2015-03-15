class AddVendorNameToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :vendor_name, :string
  end
end
