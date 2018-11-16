class CommandLineInterface

  def greet
    puts""
    puts""
    puts "WELCOME TO BARTENDER!".center(115)
    puts ""
  end

  def what_i_am
    "The command line solution that will help you make the best mixed drink on the block!"
  end

  def welcome
    puts ""
    puts "You have two options:"
    puts ""
    puts "1. You can pick a drink you would like to make"
    puts ""
    puts "OR"
    puts ""
    puts "2. You can pick an ingredient to help you find the drink you would like to make"
    puts""
    puts"PLEASE"
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
        drink_input
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
    Drink.where(name: d_input).each do |drink|
      puts "Here are your instructions to make a your drink."
      puts drink.name
      puts ""
      puts drink.instructions
    end
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
      drink_input
    end
    go_back_home
  end

  def go_back_home
    puts "TO RESTART PRESS YOUR X KEY:"
    input = gets.chomp
    if input.downcase == "x"
      gets_user_input
    else
    end
    puts "GO HOMMMEEE YA SCOUNDRELL!"
  end

  def run
    greet
    what_i_am
    welcome
    gets_user_input
  end

end
