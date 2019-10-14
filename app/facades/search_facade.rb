class SearchFacade

  def initialize(house)
    @house = house
  end

  def search_characters
    character_data = get_character_data
    characters = create_characters(character_data)
  end

  def get_character_data
    potter_api_service.get_character_data
  end

  def create_characters(character_data)
    character_data.map do |character_hash|
      Character.new(character_hash)
    end
  end

  def potter_api_service
    PotterApiService.new(@house)
  end
end
