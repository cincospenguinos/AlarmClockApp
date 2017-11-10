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

require 'test_helper'

class AlarmTest < ActiveSupport::TestCase
  test 'Alarm validations work as expected' do
    a1 = alarms(:one)
    a2 = alarms(:two)

    assert a1.valid?
    assert !a2.valid?
  end

  test 'should_alarm?() returns true when expected and false otherwise' do
    alarm = Alarm.create(name: 'Test', time: Time.now, days:%i(sunday monday tuesday wednesday thursday friday saturday), enabled: true)

    assert alarm.valid?
    assert alarm.should_alarm?
  end
end
