class FormObject

  include ActiveModel::Model
  attr_accessor :user, :item, :post, :area_id, :city, :address, :building, :phone, :records

  with_options presence: true do
    validates :post
    validates :area_id
    validates :city
    validates :address
    validates :building
    validates :phone
  end

  def save
    record = Record.create(user_id: user.id, item_id: item.id)
    residence = Residence.create(post: post, area_id: area_id, city: city, address: address, building: building, phone: phone, record_id: record.id)
  end
end