class FormObject
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post, :area_id, :city, :address, :building, :phone, :record_id, :token

  with_options presence: true do
    validates :post, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone, format: { with: /\A\d{11}\z/ }
    validates :token
  end

  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Residence.create(post: post, area_id: area_id, city: city, address: address, building: building, phone: phone, record_id: record.id)
  end
end
