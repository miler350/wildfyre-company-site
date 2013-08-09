class AddMoreFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :title, :string
    add_column :users, :company, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :country, :string
    add_column :users, :cell_phone, :string
    add_column :users, :work_phone, :string
    add_column :users, :website, :string
  end
end
