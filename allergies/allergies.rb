class Allergies
  ALLERGENS = %w(eggs peanuts shellfish strawberries
                 tomatoes chocolate pollen cats).freeze

  def initialize(number)
    @allergies = number.to_s(2).reverse
  end

  def allergic_to?(allergen)
    @allergies[ALLERGENS.index(allergen)] == '1'
  end

  def list
    @allergies.each_char.with_index.collect do |char, idx|
      ALLERGENS[idx] if char == '1'
    end.compact
  end
end
