class IndieBookstoreFinder::CLI

  def call
    @scraper = Scraper.new
    @states = @scraper.scrape_index_page
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
    elsif state_number.to_i != 0 && states[state_number.to_i - 1] != nil
      @selected_state = states[state_number.to_i - 1]
      @scraper.scrape_state_page(@selected_state)
      cities_page(@selected_state.cities)
    else
      input_error_message
      state_page_instructions(states)
    end
  end

  def cities_page(cities)
    puts "We found independent bookstores in these cities in #{@selected_state.name}"
    print_cities(cities)
    cities_page_instructions(cities)
  end

  def cities_page_instructions(cities)
    puts "Please select a city by entering its number from the list and pressing return."
    puts "To return to the list of states enter 'states'"
    puts "To exit enter exit"
    city_number = gets.strip
    if city_number == "exit"
      exit_program
    elsif city_number == "states"
      state_page(@states)
    elsif city_number.to_i != 0 && cities[city_number.to_i - 1] != nil
      store_list_page(@selected_city.stores)
    else
      input_error_message
      cities_page_instructions(cities)
    end
  end

  def print_cities(cities)
    cities.each_with_index(1) do |city, index|
      puts "#{index}. #{city.name}"
    end
  end

  def store_list_page(stores)
    puts "Here are the indie bookstores in #{@selected_city.name}, #{@selected_state.name}!"
    print_stores(stores)
    store_list_page_instructions(stores)
  end

  def store_list_page_instructions(stores)
    puts "See more information about a store by entering its number from the list and pressing return."
    puts "To return to the list of cities in #{@selected_state.name} enter 'cities'"
    puts "To return to the list of states enter 'states'"
    puts "To exit enter exit"
    store_number = gets.strip
    if store_number == "exit"
      exit_program
    elsif store_number == "cities"
      cities_page(@selected_state.cities)
    elsif store_number == "states"
      state_page(@states)
    elsif store_number.to_i != 0 && stores[store.to_i - 1] != nil
      @selected_store = stores[store.to_i - 1]
      store_page(@selected_store)
    else
      input_error_message
      store_list_page_instructions(stores)
    end
  end

  def print_stores(stores)
    stores.each_with_index(1) do |store, index|
      puts "#{index}. #{store.name}"
      puts "#{store.address}"
      puts ""
    end
  end

  def store_page(store)
    print_store_details(store)
    store_page_instructions(store)
  end

  def print_store_details(store)
    puts "#{store.name}"
    puts "#{store.address}"
    if store.phone != nil
      puts "Phone: #{store.phone}"
    end
    if store.type != nil
      puts "Type: #{store.type}"
    end
    if store.specialty != nil
      puts "Specialty: #{store.specialty}"
    end
    if store.sidelines != nil
      puts "Sidelines: #{store.sidelines}"
    end
    if store.events != nil
      puts "Events: #{store.events}"
    end
    if store.website != nil
      puts "Website: #{store.website}"
    end
    if store.facebook != nil
      puts "Facebook: #{store.facebook}"
    end
    if store.twitter != nil
      puts "Twitter: #{store.twitter}"
    end
    if store.description != nil
      puts "Description: #{store.description}"
    end
  end

  def store_page_instructions(store)
    puts "To return to the list of stores in #{@selected_city.name} enter 'stores'"
    puts "To return to the list of cities in #{@selected_state.name} enter 'cities'"
    puts "To return to the list of states enter 'states'"
    puts "To exit enter exit"
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
    puts "Thank you for shopping independent! Happy Reading!"
  end

  def input_error_message
    puts "Sorry I don't recognize that input."
  end

end
