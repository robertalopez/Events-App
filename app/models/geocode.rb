class Geocode
  include HTTParty
  # https://maps.googleapis.com/maps/api/geocode/json?
  # address=1600+Amphitheatre+Parkway,+Mountain+View,+CA
  # &key=YOUR_API_KEY

  KEY_URL = "&key=#{ENV['GEOCODE_KEY']}"
  BASE_URL = "https://maps.googleapis.com/maps/api/geocode/json?"

  def initialize(input)
    @loc_query = "address=#{input.gsub(' ','+')}"
  end

  def query
    request = HTTParty.get(BASE_URL+@loc_query+KEY_URL).to_json
    response_hash = JSON.parse(request)
  end

  def coords
    hash = self.query["results"][0]["geometry"]["location"]
    {lat: hash["lat"], long: hash['lng']}
  end

  # us_lat = {min: 24.396308, max: 49.384358}
  # us_long = {min: -124.848974, max: -66.885444}
  def scale_to_grid(xmax = 1000, ymax = 1000)
    us_lat = {min: 24.396308, max: 49.384358}
    us_long = {min: -124.848974, max: -66.885444}

    lat_zero_factor = 0 - us_lat[:min]
    y_scale_factor = ymax / (us_lat[:max] + lat_zero_factor)

    y = self.coords[:lat] + lat_zero_factor
    y_scaled = ymax - (y * y_scale_factor) #needs to flip for webpage orientation (higher y is lower on page)

    long_zero_factor = 0 - us_long[:min]
    x_scale_factor = xmax / (us_long[:max] + long_zero_factor)

    x = self.coords[:long] + long_zero_factor
    x_scaled = x * x_scale_factor

    {x: x_scaled, y: y_scaled}
  end

end
