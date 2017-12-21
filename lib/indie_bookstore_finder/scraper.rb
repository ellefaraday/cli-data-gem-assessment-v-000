class IndieBookstoreFinder::Scraper

  def get_index_page
    Nokogiri::HTML(open("https://www.newpages.com/independent-bookstores"))
  end

  def scrape_index_page
    self.get_index_page.css("div.np-span6.centered-list a").each do |state|
      name = state.text.gsub(" Bookstores", "")
      url = "https://www.newpages.com" + state.attribute("href").value
      new_state = IndieBookstoreFinder::State.new(name, url)
    end
  end

  def get_state_page(state)
    Nokogiri::HTML(open("#{state.url}"))
  end

  def scrape_state_page(state)
    @new_city = nil
    self.get_state_page(state).css("div.catItemBody").each do |bookstore|
      bookstore.css("ul li").each do |item|
        if item.css("span:first-child").text == "City Title" && (@new_city == nil || @new_city.name != item.css("span:last-child").text)
          @new_city = IndieBookstoreFinder::City.new
          @new_city.name = item.css("span:last-child").text
          state.cities << @new_city
          IndieBookstoreFinder::City.all << @new_city
        elsif item.css("span:first-child").text == "Title Link"
          @new_store = IndieBookstoreFinder::Store.new
          @new_store.name = item.css("span:last-child a").text
          @new_store.website = item.css("span:last-child a").attribute("href").value
          @new_store.city = @new_city
          @new_city.stores << @new_store
        elsif item.css("span:first-child").text == "Address 1"
          @new_store.address = item.css("span:last-child").text
        elsif item.css("span:first-child").text == "Phone"
          @new_store.phone = item.css("span:last-child").text
        elsif item.css("span:first-child").text == "Type"
          @new_store.type = item.css("span:last-child").text
        elsif item.css("span:first-child").text == "Specialty"
          @new_store.specialty = item.css("span:last-child").text
        elsif item.css("span:first-child").text == "Sidelines"
          @new_store.sidelines = item.css("span:last-child").text
        elsif item.css("span:first-child").text == "Events"
          @new_store.events = item.css("span:last-child").text
        elsif item.css("span:first-child").text == "Facebook"
          @new_store.facebook = item.css("span:last-child a").attribute("href").value
        elsif item.css("span:first-child").text == "Twitter"
          @new_store.twitter = item.css("span:last-child a").attribute("href").value
        end
      end
      @new_store.description = bookstore.css("catItemIntroText").text
    end
  end
end
