class CreateUploadables < ActiveRecord::Migration
  def change
    create_table :uploadables do |t|

      t.timestamps
    end
  end
end
