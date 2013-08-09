class FixCommentModel < ActiveRecord::Migration
  def change
    add_column :comments, :content, :text
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
    add_reference :comments, :user, index: true
  end
end
