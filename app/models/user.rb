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

  has_many :venues, through: :schedules 
  has_many :schedules

  # regular_tenders "names" the Regular join table for accessing through the tender association
  has_many :regular_tenders, foreign_key: :tender_id, class_name: "Regular" 
  # source: :customer matches with the belong_to :customer identification in the Regular model 
  has_many :tenders, through: :regular_tenders, source: :customer

  # regular_customers "names" the Regular join table for accessing through the customer association
  has_many :regular_customers, foreign_key: :customer_id, class_name: "Regular"    
  # source: :customer matches with the belong_to :customer identification in the Regular model   
  has_many :customers, through: :regular_customers, source: :tender
 

  def assign_default_role
    self.add_role(:customer)
  end
end
