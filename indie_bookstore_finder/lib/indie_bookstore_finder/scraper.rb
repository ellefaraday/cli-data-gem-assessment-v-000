class IndieBookstoreFinder::Scraper

  def get_index_page
    Nokogiri::HTML(open("https://www.newpages.com/independent-bookstores"))
  end

  def get_states
    self.get_index_page.css("div.np-span6.centered-list a").each do |state|
      new_state = State.new
      new_state.name = state.css.text.gsub(" Bookstores", "")
      new_state.url = state.css.attribute("href")
      States.all << new_state
    end
    States.all
  end

  def get_state_page(state)
    Nokogiri::HTML(open("#{state.url}"))
  end

  def get_cities(state)
    self.get_state_page(state).css("span.catItemsExtraFieldsValue").each do |city|
      new_city = City.new
      new_city.name = city.css.text
      state.cities << new_city

    end
    state.cities
  end

  def get_stores

  end

  def get_store_details

  end

end
