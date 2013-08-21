class AddReferencesToUploads < ActiveRecord::Migration
  def change
    add_reference :uploads, :user, index: true
    add_reference :uploads, :project, index: true
  end
end
