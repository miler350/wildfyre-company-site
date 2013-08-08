class Project < ActiveRecord::Base
  has_many :relationships
  has_many :users, through: :relationships
  
  def self.abbreviate
    split = self.split(" ")
    split.each do |word|
      collection = []
      collection << word[0].capitalize 
      collection.join
    end
  end
end
