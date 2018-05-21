class Tender < User
  has_many :schedules
  has_many :regulars
  has_many :customers, through: :regulars, foreign_key: "user_id", class_name: "User"
  has_many :venues, through: :schedules 
end
