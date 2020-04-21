module Tools
  #class ChocolateDilema
  class ChocolateDilema
    def initialize(first_input, second_input)
      @first_input = first_input
      @second_input = second_input
    end

    def fairness?
      chocolate_area(@first_input) == chocolate_area(@second_input)
    end

    private

    def chocolate_area(area)
      area.map { |x, y| x * y }.sum
    end
  end
end