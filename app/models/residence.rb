class Residence < ApplicationRecord

  belongs_to_active_hash :area
  belongs_to :record

  with_options presence: true do
    validates :post
    validates :area_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone
  end
end
