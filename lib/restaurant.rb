class Restaurant
  attr_reader :opening_time, :name, :dishes, :closing_time

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
end
