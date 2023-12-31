class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers' }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' } do
    validates :last_name,       presence: true
    validates :first_name,      presence: true
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters' } do
    validates :last_name_kana,  presence: true
    validates :first_name_kana, presence: true
  end
  validates :birthday, presence: true

  has_many :items
  has_many :orders
  # has_many :comments
end
