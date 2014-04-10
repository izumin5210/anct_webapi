json.cache! timetable, expires_in: 1.day do
  json.(timetable, :id, :lecture_id, :year, :term, :wday, :period)
  json.title timetable.lecture.title
  json.location do
    json.(timetable.location, :id, :name)
  end if timetable.location.present?
end
