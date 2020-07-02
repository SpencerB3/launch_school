# Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

MONTHS = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

def friday_13th(year)
  count = 0
  MONTHS.each do |month|
    time = Time.local(year, month, 13)
    count += 1 if time.friday?
  end
  count
end

friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2
