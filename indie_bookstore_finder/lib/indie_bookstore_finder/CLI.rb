class IndieBookstoreFinder::CLI

  def call
    @scraper = IndieBookstoreFinder::Scraper.new
    @states = @scraper.scrape_index_page
    puts "Welcome to Indie Bookstore Finder".cyan
    puts "-----------------------"
    puts "Shopping independent improves out communities!".magenta
    puts "Hit return to get started finding an independent bookseller near you.".magenta
    input = gets
    state_page(@states)
  end

  def state_page(states)
    print_states(states)
    state_page_instructions(states)
  end

  def print_states(states)
    states.each_with_index do |state, index|
      puts "#{index + 1}. #{state.name}".blue
    end
  end

  def state_page_instructions(states)
    puts "----------------------------------"
    puts "Please select your state by entering the number from the list and pressing return.".red
    puts "To exit enter 'exit'".red
    state_number = gets.strip
    if state_number == "exit"
      exit_program
    elsif state_number.to_i != 0 && states[state_number.to_i - 1] != nil
      @selected_state = states[state_number.to_i - 1]
      if @selected_state.cities == []
        @scraper.scrape_state_page(@selected_state)
      end
      cities_page(@selected_state.cities)
    else
      input_error_message
      state_page_instructions(states)
    end
  end

  def cities_page(cities)
    puts "We found independent bookstores in these cities in #{@selected_state.name}".cyan
    print_cities(cities)
    cities_page_instructions(cities)
  end

  def cities_page_instructions(cities)
    puts "----------------------------------"
    puts "Please select a city by entering its number from the list and pressing return.".red
    puts "To return to the list of states enter 'states'".red
    puts "To exit enter 'exit'".red
    city_number = gets.strip
    if city_number == "exit"
      exit_program
    elsif city_number == "states"
      state_page(@states)
    elsif city_number.to_i != 0 && cities[city_number.to_i - 1] != nil
      @selected_city = cities[city_number.to_i - 1]
      store_list_page(@selected_city.stores)
    else
      input_error_message
      cities_page_instructions(cities)
    end
  end

  def print_cities(cities)
    cities.each_with_index do |city, index|
      puts "#{index + 1}. #{city.name}".blue
    end
  end

  def store_list_page(stores)
    puts "Here are the indie bookstores in #{@selected_city.name}, #{@selected_state.name}!".cyan
    print_stores(stores)
    store_list_page_instructions(stores)
  end

  def store_list_page_instructions(stores)
    puts "----------------------------------"
    puts "To see more information about a store by entering its number from the list and pressing return.".red
    puts "To return to the list of cities in #{@selected_state.name} enter 'cities'".red
    puts "To return to the list of states enter 'states'".red
    puts "To exit enter 'exit'".red
    store_number = gets.strip
    if store_number == "exit"
      exit_program
    elsif store_number == "cities"
      cities_page(@selected_state.cities)
    elsif store_number == "states"
      state_page(@states)
    elsif store_number.to_i != 0 && stores[store_number.to_i - 1] != nil
      @selected_store = stores[store_number.to_i - 1]
      store_page(@selected_store)
    else
      input_error_message
      store_list_page_instructions(stores)
    end
  end

  def print_stores(stores)
    stores.each_with_index do |store, index|
      puts "#{index + 1}. #{store.name}".magenta
      puts "#{store.address}"
      puts ""
    end
  end

  def store_page(store)
    print_store_details(store)
    store_page_instructions(store)
  end

  def print_store_details(store)
    puts "#{store.name}".underline.magenta
    puts "#{store.address}"
    if store.phone != nil
      puts "Phone: #{store.phone}"
      puts ""
    end
    if store.type != nil
      puts "Type: #{store.type}".light_white
    end
    if store.specialty != nil
      puts "Specialty: #{store.specialty}".light_white
    end
    if store.sidelines != nil
      puts "Sidelines: #{store.sidelines}".light_white
    end
    if store.events != nil
      puts "Events: #{store.events}".light_white
    end
    if store.website != nil
      puts "Website: #{store.website}".light_white
    end
    if store.facebook != nil
      puts "Facebook: #{store.facebook}".light_white
    end
    if store.twitter != nil
      puts "Twitter: #{store.twitter}".light_white
    end
    if store.description != nil && store.description != ""
      puts "Description: #{store.description}".light_white
    end
  end

  def store_page_instructions(store)
    puts "----------------------------------"
    puts "To return to the list of stores in #{@selected_city.name} enter 'stores'".red
    puts "To return to the list of cities in #{@selected_state.name} enter 'cities'".red
    puts "To return to the list of states enter 'states'".red
    puts "To exit enter 'exit'".red
    input = gets.strip
    if input == "exit"
      exit_program
    elsif input == "cities"
      cities_page(@selected_state.cities)
    elsif input == "states"
      state_page(@states)
    elsif input == "stores"
      store_list_page(@selected_city.stores)
    else
      input_error_message
      store_page(store)
    end
  end

  def exit_program
    puts "Thank you for shopping independent! Happy Reading!".cyan
  end

  def input_error_message
    puts "Sorry I don't recognize that input.".red
  end

end
