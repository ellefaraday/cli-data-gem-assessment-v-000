class IndieBookstoreFinder::Scraper

  def get_index_page
    Nokogiri::HTML(open("https://www.newpages.com/independent-bookstores"))
  end

  def scrape_index_page
    self.get_index_page.css("div.np-span6.centered-list a").each do |state|
      new_state = State.new
      new_state.name = state.css.text.gsub(" Bookstores", "")
      new_state.url = state.css.attribute("href").value
      States.all << new_state
    end
    States.all
  end

  def get_state_page(state)
    Nokogiri::HTML(open("#{state.url}"))
  end

  def scraper_state_page(state)
    self.get_state_page(state).css("ul li:first:child span.catItemsExtraFieldsValue").each do |city|
      new_city = City.new
      new_city.name = city.css.text
      state.cities << new_city
    end
    self.get_state_page(state).css("ul li span.catItemsExtraFieldsValue").each do |item|
      if item 

  end



end
