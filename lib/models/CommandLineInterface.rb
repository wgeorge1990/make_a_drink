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
      elsif input == "ingredient"
        ingredient_names
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

  def run
    greet
    welcome
    gets_user_input
  end
end



  # def drink_names_index
  #   drink_names.each_with_index { |item, index| index: => item}
  # end

  #create a method that asks the user to decide weither they want to pick an ingredient and view all of the drinks that include it. or if they want to pick a drink and see all the ingredients that are included in it.

  #If they pick a drink return all the ingredients and the instructions.

  #if they pick an ingredient then return a list of drinks that include that ingredient and then have them choose from that list+> and then display the indtruction and ingredeints for that choice.
