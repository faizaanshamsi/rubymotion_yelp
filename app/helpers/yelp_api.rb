class YelpAPI
  API_URL = "http://api.yelp.com/business_review_search"

  def self.search(category, location, &block)

    payload = {
      ywsid: "Smbd1bKAld_JSiOJ_naB0A",
      term: category,
      location: location
    }

    BW::HTTP.get(API_URL, {payload: payload}) do |response|
      json = nil
      error = nil

      if response.ok?
        json = BW::JSON.parse(response.body.to_s)
      else
        error = {error: "Error with the Yelp API"}
      end
      block.call json, error
    end

  end

end
