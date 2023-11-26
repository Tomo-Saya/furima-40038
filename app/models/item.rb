class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  has_one :order
  # has_many :comments

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day

  with_options presence: true do
    validates :name
    validates :image
    validates :description
    validates :category_id
    validates :condition_id
    validates :cost_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :price, presence: true,
                      numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
  end

  with_options numericality: { other_than: 1, message: 'must be other than ---' } do
    validates :category_id
    validates :condition_id
    validates :cost_id
    validates :prefecture_id
    validates :shipping_day_id
  end

  def valid_price_format
    return if price.to_s.match?(/\A\d+\z/)

    errors.add(:price, 'should contain only half-width digits')
  end
end
