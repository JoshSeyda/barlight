class Event < ApplicationRecord
  self.skip_time_zone_conversion_for_attributes = [:start, :end]
  belongs_to :server_schedule, class_name: 'Schedule', foreign_key: 'schedule_id'
  has_one :user, through: :server_schedule
  belongs_to :venue
  delegate :location, to: :venue
  # has_one :location, through: :venue ## <-- better than above?

  # validates :title, presence: true
  attr_accessor :date_range

  def start
    t = read_attribute(:start)
    t ? Time.local(t.year, t.month, t.day, t.hour, t.min, t.sec) : nil
  end

  def start=(time)
    write_attribute(:start, time ? time + time.utc_offset : nil)
  end

  def end
    t = read_attribute(:end)
    t ? Time.local(t.year, t.month, t.day, t.hour, t.min, t.sec) : nil
  end

  def end=(time)
    write_attribute(:end, time ? time + time.utc_offset : nil)
  end

  def all_day_event?
    self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  end

  def in_progress?
    (self.start..self.end).include?(Time.now.localtime)
  end

end