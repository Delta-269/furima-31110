class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
    validates :name_zen_family
    validates :name_zen_first
  end

  with_options presence: true do
    validates :nick_name
    validates :birthday
    validates :name_han_family, format: { with: /\A[ァ-ン]+\z/ }
    validates :name_han_first, format: { with: /\A[ァ-ン]+\z/ }
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
end
