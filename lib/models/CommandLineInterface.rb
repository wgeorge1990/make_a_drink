class CommandLineInterface

  def greet
    puts "Welcome to Bartender, the command line solution that will help you make the best mixed drink on the block!"
  end

  def welcome
    puts "You have two options. You can pick a drink you would like to make or you can pick an ingredient to help you find the drink you would like to make"
  end

  def gets_user_input
    puts "Type the word drink or ingredient to get started:"
    input = STDIN.gets.chomp
    input.downcase == "drink" || input.downcase == "ingredient"
      if input == "drink"
        drink_names
        drink_input
      elsif input == "ingredient"
        ingredient_names
        ingredient_input
      else
        invalid_response
      end
    end

  def ingredient_names
    Ingredient.all.each do |i|
      puts i.name
    end
  end

  def drink_names
    Drink.all.each do |d|
      puts d.name
    end
  end

  def invalid_response
    puts "please make sure you spelled drink or ingredient properly"
  end

  def drink_input
    puts "Please type the name of a drink:"
    d_input = STDIN.gets.chomp
    d_input = d_input.capitalize!
    puts ""
    object = Drink.where(name: d_input)
    puts "Here are your instructions to make a #{object[0].name}."
    puts ""
    puts object[0].instructions
    puts ""
    go_back_home
    puts "ENJOY! And thanks for using Bartender"

  end

  def ingredient_input
    puts "Please type the name of an ingredient and I will show you the drinks I have that match."
    ing_sel = STDIN.gets.chomp
    puts ""
    # if ingredients = Ingredient.where(name: ing_sel)
    # binding.pry
    Ingredient.where(name: ing_sel).each do |ing|
      #FIXME: make this an iteration
      ing.drinks.each do |drink|
        puts drink.name
      end
    end
    go_back_home
  end

  def go_back_home
    puts "TO RESTART PRESS YOUR X KEY:"
    input = gets.chomp
    if input.downcase == "x"
      gets_user_input
    else
      puts "GO HOMMMEEE YA SCOUNDRELL!"
    end
  end

  def run
    greet
    welcome
    gets_user_input
  end

end
