class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :regulars
  has_many :tenders, through: :regulars
  has_one :location, as: :locatable
  has_many :images, as: :imageable
end
