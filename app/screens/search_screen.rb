class SearchScreen < PM::FormotionScreen
  title "Search Yelp"

  def on_load
    set_nav_bar_button :right, title: "Results", action: :go_to_results
  end

  def table_data
    {
      sections: [{
        title: 'Search Yelp',
        rows: [
        {
          title: "What?",
          key: :category,
          type: :string,
          placeholder: 'Seafood',
          auto_correction: :no,
          auto_capitalization: :none,
          input_accessory: :done
        },
        {
          title: "Where",
          key: :location,
          type: :string,
          placeholder: 'Boston',
          auto_correction: :no,
          auto_capitalization: :none,
          input_accessory: :done
        },
        {
          title: 'Search',
          type: :submit
        }]
      }]
    }
  end

  def go_to_results
    open HomeScreen.new(navbar: true)
  end

end
