class CommandLineInterface

  def greet
    puts "Welcome to Bartender, the command line solution that will help you make the best mixed drink on the block!"
  end

  def decide_drinkname_or_liquor_name
    puts "Type D for a list of drinknames or L for a list of liqour's"
    user_input = STDIN.gets.chomp
    if user_input == "D".downcase
      print "\t"
    end
  end


  #create a method that asks the user to decide weither they want to pick an ingredient and view all of the drinks that include it. or if they want to pick a drink and see all the ingredients that are included in it.

  #If they pick a drink return all the ingredients and the instructions.

  #if they pick an ingredient then return a list of drinks that include that ingredient and then have them choose from that list+> and then display the indtruction and ingredeints for that choice.
end
