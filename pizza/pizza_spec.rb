require_relative 'pizza'
require 'pry'
# require 'rspec'

describe 'Pizza' do
  before :each do
  @pizza = Pizza.new("My pizza", "supreme")
  @pizza.toppings = [Topping.new("mushroom", 2),
                              Topping.new("sausage", 2),
                              Topping.new("onions", 3),
                              Topping.new("olives", 1)]
  end

  context "#initialize" do
    it 'should create a Pizza object' do
      expect(@pizza).to be_an_instance_of Pizza
    end

    it 'should take a string for name' do
      expect(@pizza.name).to be_kind_of(String)
    end

    it 'has a name attribute of My pizza' do
      expect(@pizza.name).to eq("My pizza")
    end

    it 'should take a string for description' do
      expect(@pizza.description).to be_kind_of(String)
    end

    it 'has a description attribute of supreme' do
      expect(@pizza.description).to eq("supreme")
    end

    it 'requires two parameters' do
      expect {Pizza.new("Pizza One")}.to raise_error(ArgumentError)
    end

    it 'defaults time_baked to zero' do
      expect(@pizza.time_baked).to eq(0)
    end
  end

  context '#required_bake_time' do
    it 'should take no arguments' do
      expect {@pizza.required_bake_time(10)}.to raise_error(ArgumentError)
    end

    it 'returns the total bake time of a plain pizza' do
      plain_pizza = Pizza.new("Gale's Crappy Pizza", "plain")
      expect(plain_pizza.required_bake_time).to eq(15)
    end

    it 'returns the total bake time of a pizza with toppings' do
      expect(@pizza.required_bake_time).to eq(23)
    end
  end

  context '#bake(time)' do
    it 'takes one argument' do
      expect{@pizza.bake}.to raise_error(ArgumentError)
    end

    it "increments the pizza's time_baked by the argument time" do
      @pizza.bake(1)
      expect(@pizza.time_baked).to eq(1)
    end

    it 'increments the time_baked of all its toppings' do
      @pizza.bake(2)
      expect(@pizza.toppings.first.time_baked).to eq(2)
    end
  end

  context '#baked?' do
    it 'should return true when time_baked is greater than or equal to required_bake_time' do
      @pizza.bake(23)
      expect(@pizza.baked?).to be(true)
    end

    it 'should return false when time_baked is less than required_bake_time' do
      @pizza.bake(22)
      expect(@pizza.baked?).to be(false)
    end
  end

  context '#finished_toppings' do
    it 'should return an array' do
      @pizza.bake(1)
      expect(@pizza.finished_toppings).to be_kind_of(Array)
    end

    it 'should return an array of finished toppings' do
      @pizza.bake(1)
      finished_topping_arr = @pizza.finished_toppings
      expect(finished_topping_arr.first.name).to eq("olives")
    end
  end

  context '#unfinished_toppings' do
    it 'should return an array' do
      @pizza.bake(2)
      expect(@pizza.unfinished_toppings).to be_kind_of(Array)
    end

    it 'should return an array of unfinished toppings' do
      @pizza.bake(2)
      unfinished_topping_arr = @pizza.unfinished_toppings
      expect(unfinished_topping_arr.first.name).to eq("onions")
    end
  end

end

describe 'Topping' do
  let(:topping) {Topping.new("mushroom", 2)}

  context "#initialize" do

    it 'should create a Topping object' do
      expect(topping).to be_an_instance_of Topping
    end

    it 'should take a string for name' do
      expect(topping.name).to be_kind_of(String)
    end

    it 'has a name attribute of mushroom' do
      expect(topping.name).to eq("mushroom")
    end

    it 'should take an integer for required_bake_time' do
      expect(topping.required_bake_time).to be_kind_of(Integer)
    end

    it 'has a required_bake_time of 2 minutes' do
      expect(topping.required_bake_time).to eq(2)
    end

    it 'requires two parameters' do
      expect {Topping.new("mushroom")}.to raise_error(ArgumentError)
    end

    it 'defaults time_baked to zero' do
      expect(topping.time_baked).to eq(0)
    end
  end

  context '#bake(time)' do
    it 'takes one argument' do
      expect{topping.bake}.to raise_error(ArgumentError)
    end

    it 'increments time_baked by the argument time' do
      topping.bake(1)
      expect(topping.time_baked).to eq(1)
    end
  end

  context '#baked?' do
    it 'should return true when time_baked is greater than or equal to required_bake_time' do
      topping.bake(2)
      expect(topping.baked?).to be(true)
    end

    it 'should return false when time_baked is less than required_bake_time' do
      topping.bake(1)
      expect(topping.baked?).to be(false)
    end
  end
end



