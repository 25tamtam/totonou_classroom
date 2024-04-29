class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts
  
  validates :username, presence: true

  def admin?
    is_admin
  end
  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
end
