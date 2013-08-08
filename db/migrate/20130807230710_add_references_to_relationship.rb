class AddReferencesToRelationship < ActiveRecord::Migration
  def change
    add_reference :relationships, :user, index: true
    add_reference :relationships, :project, index: true
  end
end
