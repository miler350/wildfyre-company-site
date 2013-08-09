class Project < ActiveRecord::Base
  has_many :relationships
  has_many :users, through: :relationships
  has_many :comments, as: :commentable
end
