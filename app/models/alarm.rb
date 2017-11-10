# == Schema Information
#
# Table name: alarms
#
#  id         :integer          not null, primary key
#  name       :string
#  enabled    :boolean
#  time       :time
#  days       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Alarm < ApplicationRecord
  WEEKDAYS = { 0 => :sunday, 1 => :monday, 2 => :tuesday, 3 => :wednesday,
               4 => :thursday, 5 => :friday, 6 => :saturday }.freeze

  validates :name, presence: true
  validates :time, presence: true
  serialize :days, Array

  validate :days_are_acceptable_format

  after_initialize :set_default_values

  ## Returns true if the time to alarm is now
  def should_alarm?
    now = Time.now
    days.include?(WEEKDAYS[now.wday]) && now.localtime.min == time.localtime.min && now.localtime.hour == time.localtime.hour && enabled
  end

  def has_day?(day)
    return false unless day.is_a?(Symbol) && WEEKDAYS.values.include?(day)
    days.include?(day)
  end

  ## Add a day to the collection
  def add_day(day)
    errors.add(:days, "#{day} must be a weekday symbol!") unless day.is_a?(Symbol) && WEEKDAYS.values.include?(day)
    days.add(day)
  end

  ## Remove a day from the collection
  def remove_day(day)
    errors.add(:days, "#{day} must be a weekday symbol!") unless day.is_a?(Symbol) && WEEKDAYS.values.include?(day)
    days.delete(day)
  end

  ## Returns array of weekdays
  def self.weekdays
    WEEKDAYS.values
  end

  private

  def set_default_values
    self.enabled ||= false
    self.days ||= []
  end

  def days_are_acceptable_format
    days.each do |day|
      errors.add(:days, "#{day} must be a weekday symbol!") unless day.is_a?(Symbol) && WEEKDAYS.values.include?(day)
    end
  end
end
