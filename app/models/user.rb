class User < ApplicationRecord
  rolify
  before_create :assign_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :location, as: :locatable
  has_many :images, as: :imageable

  has_many :user_roles
  has_many :roles, through: :user_roles

  has_many :regulars
  has_many :tenders, through: :regulars, class_name: "User"
  has_many :customers, through: :regulars, class_name: "User"
  has_many :venues, through: :schedules 
  has_many :schedules

  def assign_default_role
    self.add_role(:customer)
  end
end
