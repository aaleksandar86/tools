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
end