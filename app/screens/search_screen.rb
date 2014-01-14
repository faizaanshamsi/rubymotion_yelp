class SearchScreen < PM::FormotionScreen
  title "Search Yelp"

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
          title: "Where?",
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

  def on_submit(_form)
    data = _form.render

    NSUserDefaults['category'] = data[:category]
    NSUserDefaults['location'] = data[:location]

    open HomeScreen.new
  end
end
