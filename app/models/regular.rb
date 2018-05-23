class Regular < ApplicationRecord
  belongs_to :tender, foreign_key: "tender_id", class_name: "User"
  belongs_to :customer, foreign_key: "customer_id", class_name: "User"
end
