class Event < ApplicationRecord
  alias_attribute :server_schedule, :schedule
  has_one :user, through: :server_schedule
  belongs_to :venue
  delegate :location, to: :venue
  # has_one :location, through: :venue ## <-- better than above?

  validates :title, presence: true
  attr_accessor :date_range

  def all_day_event?
    self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  end

  def in_progress?
    (self.start..self.end).include?(Time.now)
  end
  
end