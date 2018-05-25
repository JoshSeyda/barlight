class User < ApplicationRecord
  rolify
  before_create :assign_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :location, as: :locatable
  accepts_nested_attributes_for :location, allow_destroy: true
  has_many :images, as: :imageable

  has_one :schedule
  delegate :venues, to: :schedule
  delegate :shifts, to: :schedule

  # regular_tenders "names" the Regular join table for accessing through the tender association
  has_many :regular_tenders, foreign_key: :tender_id, class_name: "Regular" 
  # source: :customer matches with the belong_to :customer identification in the Regular model 
  has_many :customers, through: :regular_tenders, source: :customer

  # regular_customers "names" the Regular join table for accessing through the customer association
  has_many :regular_customers, foreign_key: :customer_id, class_name: "Regular"    
  # source: :customer matches with the belong_to :customer identification in the Regular model   
  has_many :tenders, through: :regular_customers, source: :tender
 
  

  def assign_default_role
    self.add_role(:customer)
  end

  def get_locations
    markers = self.tenders.map {|t| t.venues }
    return markers.flatten if markers
  end 

# Write something like this to make sure customers can only follow someone with a role other than customer?
  # def customers=(customers)
  #   if self.has_role?(:tender)
  #     customers.each do |customer|
  #       self.customers.push(customer)
  #     end
  #   else
  #     errors.add(:customer, "cannot follow non-industry workers")
  #   end 
  # end 

end
