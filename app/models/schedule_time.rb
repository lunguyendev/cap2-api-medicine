class ScheduleTime < ApplicationRecord
  include ScheduleTimeService
  belongs_to :doctor, foreign_key: :doctor_uid, primary_key: :uid
  validate :validate_time

  def validate_time
    schedule_times = self.class.schedule_time_of_date(self.doctor, self.date)

    available_times = available_times_in_day
    schedule_times.each do |schedule_time|
      available_times = delete_available_times(schedule_time.start_time, schedule_time.end_time, available_times)
    end

    time = [self.start_time, self.end_time]
    is_exist = available_times.include? time
    if self.start_time < 7 or
       self.end_time > 23 or
       self.start_time > self.end_time or
       !is_exist
      self.errors.add :start_time, "or end_time invalid"
    end
  end

  def self.schedule_time_of_date(doctor, date)
    doctor.schedule_times.where(date: date).order("start_time ASC")
  end

end
