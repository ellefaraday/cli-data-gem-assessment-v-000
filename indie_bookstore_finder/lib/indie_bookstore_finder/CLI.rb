class IndieBookstoreFinder::CLI
  def call
    scraper = Scraper.new
    puts "Welcome to Indie Bookstore Finder"
    puts ""
    puts "Find an independent bookseller near you!"
    state_page
  end

  def state_page
    print_states
    state_page_instructions
  end

  def state_page_instructions
    puts "Please select your state by entering the number from the list and pressing return."
    puts "To exit enter exit"
    state_number = gets.strip.to_i
    if state_number == "exit"
      exit_program
    elsif #states includes state_number
      cities_page(state_number)
    else
      input_error_message
      state_page
    end
  end

  def cities_page(state_number)
    puts "We found independent bookstores in these cities in #{state_number}"
    print_cities
    cities_page_instructions
  end

  def cities_page_instructions
    puts "Please select a city by entering its number from the list and pressing return."
    puts "To return to the list of states enter 'states'"
    puts "To exit enter exit"
    city = gets.strip.to_i
    if city = "exit"
      exit_program
    elsif #cities includes city
      store_list_page(city)
    else
      input_error_message
      cities_page_instructions
    end
  end



    store_list_page
  end

  def print_cities
  end

  def print_states
  end

  def store_list_page
    puts "Here are the indie bookstores in City, State!"
    print_stores
    puts "See more information about a store by entering its number from the list and pressing return."
    puts "To return to the list of cities in State enter 'cities'"
    puts "To return to the list of states enter 'states'"
    puts "To exit enter exit"
    gets.strip.to_i
    store_page
  end

  def store_page
  end


  def print_stores
  end

  def exit_program
    puts "Thank you for shopping independent! Happy Reading!"
  end

  def input_error_message
  end

end
