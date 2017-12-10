class IndieBookstoreFinder::CLI
  def call
    scraper = Scraper.new
    puts "Welcome to Indie Bookstore Finder"
    puts ""
    puts "Find an independent bookseller near you!"
    print_states
    state_page
  end

  def state_page
    puts "Please select your state by entering the number from the list and pressing return."
    puts "To exit enter exit"
    input = gets.strip.to_i
    if input == "exit"
      puts "Thank you for shopping independent! Happy Reading!"
    elsif input ==
      cities_page
    else
      puts "Sorry, I don't recognize that input."
      state_page
    end
  end

  def cities_page
    puts "We found independent bookstores in these cities in State"
    print_cities
    puts "Please select a city by entering its number from the list and pressing return."
    puts "To return to the list of states enter 'states'"
    puts "To exit enter exit"
    gets.strip.to_i
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


end
