class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  validates :nickname,        presence: true
  # validates :email,           presence: true, uniqueness: true
  # validates :password,        presence: true
  # VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  # validates :password, format: { with: VALID_PASSWORD_REGEX, message:" is invalid. Include both letters and numbers" }
  # validates :last_name,       presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'is invalid. Input full-width characters' }
  # validates :first_name,      presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'is invalid. Input full-width characters' }
  # validates :last_name_kana,  presence: true, format: { with: /\A\p{Katakana}+\z/, message: 'is invalid. Input full-width katakana characters' }
  # validates :first_name_kana, presence: true, format: { with: /\A\p{Katakana}+\z/, message: 'is invalid. Input full-width katakana characters' }
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: " is invalid. Include both letters and numbers"
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' } do
    validates :first_name
    validates :last_name
    validates :last_name_kana
    validates :first_name_kana
  end
    validates :birthday,        presence: true
  
  has_many :items
  has_many :comments
  has_many :orders
 
end
