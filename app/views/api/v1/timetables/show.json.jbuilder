json.key_format! camelize: :lower
json.timetable do
  json.partial! 'timetable', timetable: @timetable
end
