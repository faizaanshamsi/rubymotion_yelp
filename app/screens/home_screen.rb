class HomeScreen < PM::TableScreen
  title "Yelp Search"
  searchable placeholder: "Filter Results"

  def table_data
    [{
      cells: Array(@results)
    }]
  end

  def on_load
    @results = []

    category = NSUserDefaults['category']
    location = NSUserDefaults['location']

    create_data(category, location)
  end

  def open_link(args)
    args[:cell][:url].nsurl.open
  end

  def create_data(category, location)
    BW::HTTP.get("http://api.yelp.com/business_review_search?ywsid=Smbd1bKAld_JSiOJ_naB0A&term=#{category}&location=#{location}") do |response|
      result_data = BW::JSON.parse(response.body)
      result_data["businesses"].map do |business|
        @results << { title: business["name"], url: business["mobile_url"], action: :open_link }
      end
      update_table_data
    end
  end
end
