class IndieBookstoreFinder::CLI
  attr_accessor :states, :cities, :stores

  def initialize
    @states = []
    @cities = []
    @stores = []
  end

  def call
    @scraper = Scraper.new
    @states = @scraper.get_states
    puts "Welcome to Indie Bookstore Finder"
    puts ""
    puts "Find an independent bookseller near you!"
    state_page(@states)
  end

  def state_page(states)
    print_states(states)
    state_page_instructions(states)
  end

  def print_states(states)
    states.each_with_index(1) do |state, index|
      puts "#{index}. #{state.name}"
    end
  end

  def state_page_instructions(states)
    puts "Please select your state by entering the number from the list and pressing return."
    puts "To exit enter exit"
    state_number = gets.strip
    if state_number == "exit"
      exit_program
    elsif states[state_number.to_i - 1] != nil #this may give an error, what will this do if input is a string
      cities_page(states[state_number.to_i - 1].cities)
    else
      input_error_message
      state_page
    end
  end

  def cities_page(cities)
    puts "We found independent bookstores in these cities in #{state_number}"
    print_cities(cities)
    cities_page_instructions(cities)
  end

  def cities_page_instructions(cities)
    puts "Please select a city by entering its number from the list and pressing return."
    puts "To return to the list of states enter 'states'"
    puts "To exit enter exit"
    city_number = gets.strip
    if city_number = "exit"
      exit_program
    elsif cities[city_number.to_i - 1] != nil #this may give an error, what will this do if input is a string
      store_list_page(cities[city_number.to_i - 1].stores)
    else
      input_error_message
      cities_page_instructions
    end
  end

  def print_cities(state)
  end

  def store_list_page(city)
    puts "Here are the indie bookstores in #{City}, #{State}!"
    print_stores(city)
  end

  def store_list_page_instructions
    puts "See more information about a store by entering its number from the list and pressing return."
    puts "To return to the list of cities in State enter 'cities'"
    puts "To return to the list of states enter 'states'"
    puts "To exit enter exit"
    store = gets.strip.to_i
    if store == "exit"
      exit_program
    elsif store == "cities"
      cities_page(state)
    elsif store == "states"
      state_page
    elsif #stores includes store
      store_page
    else
      input_error_message
      store_list_page_instructions
    end
  end

  def store_page
    puts #store details
    puts "To return to the list of stores in #{city} enter 'stores'"
    puts "To return to the list of cities in #{state} enter 'cities'"
    puts "To return to the list of states enter 'states'"
    puts "To exit enter exit"
    input = gets.strip.to_i
    if input == "exit"
      exit_program
    elsif input == "cities"
      cities_page(state)
    elsif input == "states"
      state_page
    elsif input == "stores"
      store_list_page(city)
    else
      input_error_message
      store_page
    end
  end


  def print_stores
  end

  def exit_program
    puts "Thank you for shopping independent! Happy Reading!"
  end

  def input_error_message
    puts "Sorry I don't recognize that input."
  end

end
