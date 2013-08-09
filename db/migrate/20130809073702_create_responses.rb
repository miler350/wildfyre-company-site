class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :user, index: true
      t.references :comment, index: true
      t.string :content

      t.timestamps
    end
  end
end
