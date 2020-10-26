class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name, presence: true

  with_options presence: true, format: { with: /\A[ぁ-ん一-龥]+\z/ } do
    validates :name_zen_family, presence: true
    validates :name_zen_first, presence: true 
  end

  with_options presence: true, format: { with: /\A[ァ-ン]+\z/ } do
    validates :name_han_family, presence: true
    validates :name_han_first, presence: true
  end

  validates :birthday, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

end
