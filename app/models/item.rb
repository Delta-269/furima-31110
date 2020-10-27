class Item < ApplicationRecord

  belongs_to :user
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
    validates :price
    validates :image
  end
end
