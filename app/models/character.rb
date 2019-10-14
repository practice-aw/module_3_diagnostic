class Character
  attr_reader :name, :role, :house, :patronus

  def initialize(character_hash)
    @name = character_hash[:name]
    @role = character_hash[:role].presence || "none"
    @house = character_hash[:house]
    @patronus = character_hash[:patronus].presence || "unknown"
  end
end
