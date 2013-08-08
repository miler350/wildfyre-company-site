class User < ActiveRecord::Base
  has_many :contacts
  has_many :relationships
  has_many :projects, through: :relationships
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
