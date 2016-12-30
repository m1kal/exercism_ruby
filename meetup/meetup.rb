require 'date'

class Meetup
  WEEKDAYS = [:sunday, :monday, :tuesday, :wednesday,
              :thursday, :friday, :saturday].freeze

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, selector)
    Date.new(@year, @month, send(selector, WEEKDAYS.index(weekday)))
  end

  def first(weekday_num)
    (weekday_num - first_day) % 7 + 1
  end

  def second(weekday_num)
    first(weekday_num) + 7
  end

  def third(weekday_num)
    first(weekday_num) + 14
  end

  def fourth(weekday_num)
    first(weekday_num) + 21
  end

  def teenth(weekday_num)
    first(weekday_num) < 6 ? third(weekday_num) : second(weekday_num)
  end

  def last(weekday_num)
    last_day.mday - (last_day.wday - weekday_num) % 7
  end

  def first_day
    Date.new(@year, @month).wday
  end

  def last_day
    Date.new(@year, @month, -1)
  end

  private :first, :second, :third, :fourth, :teenth, :last,
          :first_day, :last_day
end
