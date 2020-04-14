require 'tools/odd_numbers'

RSpec.describe Tools::Odd_Numbers do
  it 'should return the only if the array consists of one element' do
    odd_numbers = Tools::Odd_Numbers.new([10])
    expect(odd_numbers.all_odd_numbers).to eq 10
  end

  it 'should find the first odd number in the input array' do
    odd_numbers = Tools::Odd_Numbers.new([1, 1, 2, -2, 5, 2, 4, 4, -1, -2, 5, 5])
    expect(odd_numbers.first_odd_number).to eq 5
  end

  it 'returns the same array if the array has unique elements' do
    number = Tools::Odd_Numbers.new([5, 6, 7, 1, 2, 3])
    expect(number.all_odd_numbers).to eq [5, 6, 7, 1, 2, 3]
  end

  it 'return all of the integers which appears an odd number of times' do
    number = Tools::Odd_Numbers.new([1, 1, 2, -2, 5, 2, 4, 4, -1, -2, 5, 5])
    expect(number.all_odd_numbers).to eq [5, -1]
  end
end
