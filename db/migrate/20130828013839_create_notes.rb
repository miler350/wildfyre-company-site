class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.belongs_to :user
      t.belongs_to :project
      t.timestamps
    end
  end
end
