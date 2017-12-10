class IndieBookstoreFinder::CLI
  def call
    scraper = Scraper.new
    puts "Welcome to Indie Bookstore Finder"
    puts ""
    puts "Find an independent bookseller near you!"
    puts "Please select your state by entering the number from the list and pressing return."
    print_states
    puts "To exit enter exit"
    gets.chomp
    cities_page
  end

  def cities_page
    puts "We found independent bookstores in these cities in State"
    print_cities
    puts "Please select a city by entering its number from the list and pressing return."
    puts "To return to the list of states enter 'states'"
    puts "To exit enter exit"
    gets.chomp
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
  end

  def print_stores
  end


end
