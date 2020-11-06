class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :record
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :day
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :area_id
    validates :day_id
    validates :price, format: { with: /\A[0-9]+\z/ },
                      numericality: { greater_than_or_equal_to: 300,
                                      less_than_or_equal_to: 9_999_999 }
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :area_id
    validates :day_id
  end
end
