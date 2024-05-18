class Post < ApplicationRecord
  has_many :post_comments, dependent: :destroy
  belongs_to :user

  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader

  validates :title, presence: { message: '症状のある箇所をご記入ください。' }
  validates :age, presence: { message: 'ご年齢をご選択ください。' }
  validates :detail, presence: { message: '症状やお体の気になるところをご記入ください。' }
end
