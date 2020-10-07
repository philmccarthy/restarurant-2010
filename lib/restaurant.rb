class Restaurant
  attr_reader :opening_time,
              :name,
              :dishes

  attr_accessor :closing_time

  def initialize(opening_time, name)
    @opening_time = opening_time
    @closing_time = ''
    @name = name
    @dishes = []
  end

  def closing_time(hours)
    @closing_time = @opening_time.to_i
    @closing_time += hours
    @closing_time.to_s + ':00'
  end

  def adjust_closing_time(hours)
    @closing_time = @opening_time.to_i + hours
    @closing_time = @closing_time.to_s + ':00'
  end

  def add_dish(dish)
    @dishes << dish
  end

  def open_for_lunch?
    return false if @opening_time.to_i > 12
    true
  end

  def menu_dish_names
    menu_dish_names = @dishes.map do |dish|
                        dish.upcase
                      end
  end

  def announce_closing_time(time)
    adjust_closing_time(time)
    trad_time = convert_time(@closing_time)
    "#{name} will be closing at #{trad_time}"
  end

  def convert_time(hour)
    hour = hour.to_i
    am_or_pm = if hour >= 12
                 'PM'
               else
                 'AM'
               end
    hour = if hour == 13..23
            hour - 12
          elsif hour == 0 || 12
            12
          else
            hour
          end
    "#{hour}:00#{am_or_pm}"
  end
end
