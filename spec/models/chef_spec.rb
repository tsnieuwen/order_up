require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "instance_methods" do
    it '#chef_ingredients' do
      @chef1 = Chef.create(name: 'Tommy', id: 1)
      @dish1 = Dish.create(name: 'Pizza', description: 'You might hate yourself after, but damn if it is not delicious', chef_id: 1)
      @dish2 = Dish.create(name: 'Salad', description: 'You will not hate yourself after, but it is not as delicious as pizza. Just get pizza', chef_id: 1)
      @ingredient1 = Ingredient.create(name: 'Sauce', calories: 50)
      @ingredient2 = Ingredient.create(name: 'Dough', calories: 200)
      @ingredient3 = Ingredient.create(name: 'Cheese', calories: 100)
      @ingredient4 = Ingredient.create(name: 'Pepperoni', calories: 150)
      @ingredient5 = Ingredient.create(name: 'Lettuce', calories: 20)
      @ingredient6 = Ingredient.create(name: 'Carrots', calories: 50)
      @ingredient7 = Ingredient.create(name: 'Cucumber', calories: 50)
      @ingredient8 = Ingredient.create(name: 'Dressing', calories: 120)
      DishIngredient.create(dish: @dish1, ingredient: @ingredient1)
      DishIngredient.create(dish: @dish1, ingredient: @ingredient2)
      DishIngredient.create(dish: @dish1, ingredient: @ingredient3)
      DishIngredient.create(dish: @dish1, ingredient: @ingredient4)
      DishIngredient.create(dish: @dish2, ingredient: @ingredient5)
      DishIngredient.create(dish: @dish2, ingredient: @ingredient6)
      DishIngredient.create(dish: @dish2, ingredient: @ingredient7)
      DishIngredient.create(dish: @dish2, ingredient: @ingredient8)

      expect(@chef1.chef_ingredients).to eq([@ingredient1.name, @ingredient2.name, @ingredient3.name, @ingredient4.name, @ingredient5.name, @ingredient6.name, @ingredient7.name, @ingredient8.name])
    end 
  end
end
