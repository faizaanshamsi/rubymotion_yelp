# class Yelp
#   YWSID = "Smbd1bKAld_JSiOJ_naB0A"
#   URL = "http://api.yelp.com/business_review_search?ywsid=Smbd1bKAld_JSiOJ_naB0A&term=seafood&location=Boston"

#   def now(&event)
#     AFMotion::JSON.get(URL) do |result|
#       if result.success?
#         event.call result.object
#       else
#         event.call nil
#       end
#     end
#   end
# end
