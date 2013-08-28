class Project < ActiveRecord::Base
  has_many :relationships
  has_many :users, through: :relationships
  has_many :comments, as: :commentable
  has_many :uploads
  has_many :notes
  validates :project_name, presence: true
  validates :project_description, presence: true
  validates :project_budget, presence: true, numericality: true, length: { maximum: 6 }
end
