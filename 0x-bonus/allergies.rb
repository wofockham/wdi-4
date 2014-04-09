class Allergies
  attr_reader :bitfield

  ALLERGENS = {
    :eggs => (1),
    :peanuts => (2),
    :shellfish => (4),
    :strawberries => (8),
    :tomatoes => (16),
    :chocolate => (32),
    :pollen => (64),
    :cats => (128)
  }

  def initialize(bitfield)
    @bitfield = bitfield
  end

  def allergic_to?(allergen)
    code = ALLERGENS[allergen.to_sym]
    (@bitfield & code) > 0 ? true : false
  end

  def list
    ALLERGENS.map do |allergen, code|
      allergen if allergic_to?(allergen)
    end.compact
  end
end

allergies = Allergies.new(34)
puts allergies.allergic_to?('chocolate')
# => true
puts allergies.allergic_to?('cats')
# => false
puts allergies.list
# => ['peanuts', 'chocolate']

