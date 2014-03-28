class Anct

  def self.fiscal_year(time=Time.now)
    if time.month > 4 then time.year
    elsif time.month < 4 then time.year - 1
    elsif time.day == 1 then time.year - 1
    else time.year
    end
  end

  def self.term(time=Time.now)
    Settings.timetable.term[time.month < 4 || 9 < time.month ? 1 : 0]
  end
end
