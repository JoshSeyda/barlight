class Regular < ApplicationRecord
  belongs_to :tender, foreign_key: "tender_id", class_name: "User"
  belongs_to :customer, foreign_key: "customer_id", class_name: "User"
  validate :only_follow_tenders

  def only_follow_tenders
    user = User.find(self.tender_id)
    puts user 
    puts user.has_role?(:tender)
    if !user.has_role?(:tender)
      errors.add(:followers, "cannot follow users who aren't service industry workers!")
    end 
  end 

end
