class HomeScreen < PM::TableScreen
  title "Yelp Search"
  searchable placeholder: "Filter Results"

  def table_data
    [{
      cells: Array(@results)
    }]
  end

  def on_load
    @results ||= [{
      title: "Loading...",
    }]
  end

  def on_appear
    search_yelp
  end

  def open_link(args)
    args[:cell][:url].nsurl.open
  end

  def search_yelp
    YelpAPI.search(NSUserDefaults['category'], NSUserDefaults['location']) do |result_data, error|
      if error.nil?
        @results = result_data["businesses"].map do |business|
          {
            title: business["name"],
            url: business["mobile_url"],
            action: :open_link
          }
        end
        update_table_data

      else
        NSLog "Error retrieving data from the #{App.name} server."
      end
    end

  end
end
