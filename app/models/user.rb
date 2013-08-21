class User < ActiveRecord::Base
  has_many :contacts
  has_many :relationships
  has_many :projects, through: :relationships
  has_many :comments
  validates :name, presence: true
  mount_uploader :avatar, AvatarUploader
 
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
