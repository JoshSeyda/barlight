class Regular < ApplicationRecord
  belongs_to :tender
  belongs_to :customer, foreign_key: "user_id", class_name: "User"
end
