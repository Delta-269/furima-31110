class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name, presence: true
  validates :name_zen_family, presence: true
  validates :name_zen_first, presence: true
  validates :name_han_family, presence: true
  validates :name_han_first, presence: true
  validates :birthday, presence: true
end
