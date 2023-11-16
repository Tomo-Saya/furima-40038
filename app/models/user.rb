class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :nickname,        presence: true
  validates :email,           presence: true, uniqueness: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, presence: true, format: { with: PASSWORD_REGEX, message: " is invalid. Include both letters and numbers" }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' } do
    validates :last_name,      presence: true
    validates :first_name,       presence: true
    validates :last_name_kana,  presence: true
    validates :first_name_kana, presence: true
  end
    validates :birthday,        presence: true
  
  has_many :items
  has_many :comments
  has_many :orders
 
end
