# class Alergies
class Allergies

  TRESHHOLD = 256

  ALLERGENS = {
    1 => 'eggs',
    2 => 'peanuts',
    4 => 'shellfish',
    8 => 'strawberries',
    16 => 'tomatoes',
    32 => 'chocolate',
    64 => 'pollen',
    128 => 'cats',
  }

  def initialize(score)
    @score = score
  end

  def allergic_to?(allergen)
    score_allergens.include?(allergen)
  end

  def score_allergens
    allergen_keys.map { |key| ALLERGENS[key] }
  end

  private

  def total_score
    @score -= TRESHHOLD while @score >= TRESHHOLD
    @score
  end

  def keys
    ALLERGENS.keys.select { |item| item <= total_score }.sort.reverse!
  end

  def allergen_keys
    tmp = score
    keys.select { |elem| tmp >= elem && tmp -= elem }
  end
end