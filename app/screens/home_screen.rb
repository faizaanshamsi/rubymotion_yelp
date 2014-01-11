class HomeScreen < PM::TableScreen
  title "Yelp Search"
  searchable placeholder: "Search"

  def table_data
    [{
      cells: Array(@results)
    }]
  end

  def on_load
    @results = []

    BW::HTTP.get("http://api.yelp.com/business_review_search?ywsid=Smbd1bKAld_JSiOJ_naB0A&term=seafood&location=Boston") do |response|
      result_data = BW::JSON.parse(response.body)
      result_data["businesses"].map do |business|
        @results << { title: business["name"], action: :open_link }
        update_table_data
      end
    end
  end

  def open_link(args)
    p args[:cell][:title]
    #put redirect to yelp link here
  end
end
