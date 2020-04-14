module Tools

  # class Odd_Numbers
  class Odd_Numbers

    def initialize(input_array)
      @input_array = input_array
    end

    def first_odd_number
      return @input_array.join.to_i if @input_array.size <= 1

      all_odd_numbers.first
    end

    def all_odd_numbers
      return @input_array.join.to_i if @input_array.size <= 1

      @input_array.group_by { |elem| elem }.select{ |_, j| j.size.odd? }.keys
    end
  end
end