class DropUploadable < ActiveRecord::Migration
  def change
    drop_table :uploadables
    add_column :uploads, :uploadable_id, :integer
    add_column :uploads, :uploadable_type, :string
  end
end
