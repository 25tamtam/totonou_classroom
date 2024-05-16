class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts
  
  validates :username, presence: { message: 'ユーザーネームをご記入ください。' }
  validates :email, presence: { message: 'メールアドレスをご記入ください。' }
  validates :password, presence: { message: 'パスワードをご記入ください。' }
  validates :password_confirmation, presence: { message: 'パスワードをご記入ください' }

  def admin?
    is_admin
  end
end
