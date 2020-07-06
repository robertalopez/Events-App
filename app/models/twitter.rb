# class Twitter
#   include HTTParty
#   include Twitter
#
#   # --url
#   # 'https://api.twitter.com/1.1/search/tweets.json?
#   # q=from%3Atwitterdev
#   # &
#   # result_type=mixed
#   # &
#   # count=2'
#   # --header
#   # 'authorization: OAuth oauth_consumer_key="consumer-key-for-app",
#   # oauth_nonce="generated-nonce",
#   # oauth_signature="generated-signature",
#   # oauth_signature_method="HMAC-SHA1",
#   # oauth_timestamp="generated-timestamp",
#   # oauth_token="access-token-for-authed-user",
#   # oauth_version="1.0"'
#
#   client = Twitter::REST::Client.new do |config|
#         config.consumer_key = "API key goes here"
#         config.consumer_secret = "API secret key goes here"
#         config.access_token = "Access token goes here"
#         config.access_token_secret = "Access token secret goes here"
#   end
#   KEY_URL = "&key=#{ENV['GEOCODE_KEY']}"
#   BASE_URL = "https://api.twitter.com/1.1/search/tweets.json?"
#
#   def initialize(input)
#    @loc_query = "address=#{input.gsub(' ','+')}"
#   end
#
#   def query
#    request = HTTParty.get(BASE_URL+@loc_query+KEY_URL).to_json
#    response_hash = JSON.parse(request)
#   end
#   def generate_request(url, key = nil)
#       key == nil ? HTTParty.get(url) :
#       HTTParty.get(url, :headers => {"X-Api-Key" => "#{key}"})
#   end
#
#   def coords
#    hash = self.query["results"][0]["geometry"]["location"]
#    {lat: hash["lat"], long: hash['lng']}
#   end
#
# end
