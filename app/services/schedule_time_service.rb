module ScheduleTimeService
  def find_booking(param)
    date = param[:date]
    start_time = param[:start_time].to_i
    end_time = param[:end_time].to_i

    doctor_uids = find_doctor_uids_booking(date, start_time, end_time)
    return Doctor.find_doctors(doctor_uids)
  end

  def save_schedule_time(doctor, param)
    date = param[:date]
    start_time = param[:start_time].to_i
    end_time = param[:end_time].to_i

    available_times = handle_available_times(start_time, end_time)

    ActiveRecord::Base.transaction do
      doctor.schedule_times.create!({
        date: date,
        start_time: start_time,
        end_time: end_time
      })
      if doctor.available_times.where(date: date).first
        available_time = doctor.available_times.where(date: date).first
        available_time.update_attributes!(available_times: (available_times+available_time.available_times).uniq)
      else
        doctor.available_times.create!({
          date: date,
          available_times: available_times,
        })
      end
    end
  end

  def destroy_schedule_time(doctor, schedule_time)
    available_times = handle_available_times(schedule_time.start_time, schedule_time.end_time)
    available_time = doctor.available_times.where(date: schedule_time.date).first
    ActiveRecord::Base.transaction do
      schedule_time.destroy!
      available_time.update_attributes!(available_times: (convert_available_times(available_time.available_times)-available_times).uniq)
    end
  end

  def convert_available_times(available_times)
    available_times_convert = []
    for vailable_time in available_times
      available_times_convert << vailable_time.reject(&:empty?).map(&:to_i)
    end
    return available_times_convert
  end

  def handle_available_times(start_time, end_time)
    available_times = []
    for i in (start_time...end_time)
      _start = i + 1
      for j in (_start..end_time)
        available_times << [i, j]
      end
    end

    return available_times
  end

  def available_times_in_day
    available_times = []
    for i in (7...23)
      _start = i + 1
      for j in (_start..23)
        available_times << [i, j]
      end
    end
    return available_times
  end

  def delete_available_times(start_time, end_time, available_times)
    busy_time = []
    for available_time in available_times
      if available_time[0] < end_time and available_time[1] > start_time
        busy_time << available_time
      end
    end
    return available_times - busy_time
  end

  def find_doctor_uids_booking(date, start_time, end_time)
    available_times = AvailableTime.where(date: date)
    doctor_uids = []
    available_times.each do |available_time|
      if convert_available_times(available_time.available_times).include? [start_time, end_time]
        doctor_uids << available_time.doctor_uid
      end
    end

    return doctor_uids
  end

  def booking_doctor(patient, param)
    date = param[:date]
    start_time = param[:start_time].to_i
    end_time = param[:end_time].to_i
    doctor_uid = param[:doctor_uid]
    param["link_meeting"] = "https://meet.google.com/tms-vqvq-kht"

    available_time = AvailableTime.where(doctor_uid:doctor_uid, date: date).first
    available_times = delete_available_times(start_time,end_time,convert_available_times(available_time.available_times))
    ActiveRecord::Base.transaction do
      patient.booking_times.create!(param)
      available_time.update_attributes!(available_times: available_times)
    end
  end
end
