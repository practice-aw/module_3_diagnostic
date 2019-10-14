class PotterApiService

  def initialize(house)
    @house = house
  end

    # Is one of these two ways to get the json_response preffered, or is there another
    # way that I should be doing this?
  def get_character_data
    json_response = conn.get("characters", {house: @house, orderOfThePhoenix: true})
    # json_response = conn.get("characters/?house=#{@house}&orderOfThePhoenix=true")
    # conn.get do |req|
    #   req.url = "characters"
    #   req.params["house"] = @house
    #   req.params["orderOfThePhoenix"] = true
    # end
    parsed_data = JSON.parse(json_response.body, symbolize_names: true)
  end

private

  def conn
    Faraday.new(
      url: 'https://www.potterapi.com/v1/',
      params: {'key' => ENV['POTTER_API_KEY']}
    )
  end
end
