class DropUploadableFieldsFromUploads < ActiveRecord::Migration
  def change
    remove_column :uploads, :uploadable_type
    remove_column :uploads, :uploadable_id
  end
end
