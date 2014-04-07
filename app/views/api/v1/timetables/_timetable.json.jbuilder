json.(timetable, :id, :lecture_id, :year, :term, :wday, :period)
json.location do
  json.(timetable.location, :id, :name)
end if timetable.location.present?
