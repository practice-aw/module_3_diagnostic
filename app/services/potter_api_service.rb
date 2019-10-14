class PotterApiService

  def initialize(house)
    @house = house
  end

  # refactor this
  def get_character_data
    # params[:house] = house
    json_response = conn.get("characters/?house=#{@house}")
    parsed_data = JSON.parse(json_response.body, symbolize_names: true)
  end

  # def conn
  #   Faraday.new(url: 'https://www.potterapi.com/v1/') do |f|
  #     f.adapter Faraday.default_adapter
  #     f.params[:key] = ENV['POTTER_API_KEY']
  #   end
  # end

  def conn
    Faraday.new(
      url: 'https://www.potterapi.com/v1/',
      params: {'key' => ENV['POTTER_API_KEY']}
    )
  end
end
