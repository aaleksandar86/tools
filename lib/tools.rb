require 'tools/version'

module Tools
  # class Luhn
  class Luhn
    def initialize(str)
      @str = str.strip
    end

    def valid?
      return false if @str.length <= 1
      return false if /\D/.match?(@str)

      (checksum % 10).zero?
    end

    def reverse_every_second
      @str.scan(/\d/).reverse.each_slice(2)
    end

    def checksum
      reverse_every_second.sum { |i, j = 0| i.to_i + (j.to_i * 2).digits.sum }
    end
  end

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
end
