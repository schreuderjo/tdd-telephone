class Pizza
  attr_reader :name, :description, :time_baked
  attr_accessor :toppings

  def initialize(name,description)
    @name = name
    @description = description
    @time_baked = 0
    @toppings = []
  end

  def required_bake_time
    if @toppings.length == 0
      15
    else
      23
    end
  end

  def bake(time)
    @time_baked += time
    @toppings.each do |topping|
      topping.bake(time)
    end
  end

  def baked?
    @time_baked >= self.required_bake_time
  end

  def finished_toppings
    finished_toppings = []
    @toppings.each do |topping|
      if topping.baked?
        finished_toppings << topping
      end
    end
    return finished_toppings
  end

  def unfinished_toppings
    unfinished_toppings = []
    @toppings.each do |topping|
      unless topping.baked?
        unfinished_toppings << topping
      end
    end
    return unfinished_toppings
  end

end

class Topping
  attr_reader :name, :required_bake_time, :time_baked

  def initialize(name,required_bake_time)
    @name = name
    @required_bake_time = required_bake_time
    @time_baked = 0
  end

  def bake(time)
    @time_baked += time
  end

  def baked?
    @time_baked >= @required_bake_time
  end

end
