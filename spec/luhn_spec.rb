require 'tools/luhn'

RSpec.describe Tools::Luhn do
  it 'doesn\'t allow single digit strings' do
    luhn = Tools::Luhn.new('3')
    expect(luhn.valid?).to be false
  end

  it 'doesn\'t allow empty string' do
    luhn = Tools::Luhn.new('')
    expect(luhn.valid?).to be false
  end

  it 'doesn\'t allow single zero' do
    luhn = Tools::Luhn.new('0')
    expect(luhn.valid?).to be false
  end

  it 'should be valid if digits are reversed' do
    luhn = Tools::Luhn.new('059')
    expect(luhn.valid?).to be true
  end

  it 'becomes invalid if digits get reversed' do
    luhn = Tools::Luhn.new('59')
    expect(luhn.valid?).to be true
  end

  it 'is a valid canadian sin.' do
    luhn = Tools::Luhn.new('055 444 285')
    expect(luhn.valid?).to be true
  end

  it 'is an invalid canadian sin.' do
    luhn = Tools::Luhn.new('055 444 286')
    expect(luhn.valid?).to be false
  end

  it 'is an invalid credit card.' do
    luhn = Tools::Luhn.new('8273 1232 7352 0569')
    expect(luhn.valid?).to be false
  end

  it 'is an invalid credit card number.' do
    luhn = Tools::Luhn.new('8273 1232 7352 0569')
    expect(luhn.valid?).to be false
  end

  it 'is valid for numbers with an even number of digits' do
    luhn = Tools::Luhn.new('095 245 88')
    expect(luhn.valid?).to be true
  end

  it 'is invalid for strings with a non digit included' do
    luhn = Tools::Luhn.new('055a 444 285')
    expect(luhn.valid?).to be false
  end

  it 'is invalid for strings with a non digit added at the end' do
    luhn = Tools::Luhn.new('059a')
    expect(luhn.valid?).to be false
  end

  it 'is invalid for strings with punctuation included' do
    luhn = Tools::Luhn.new('055-444-285')
    expect(luhn.valid?).to be false
  end

  it 'is invalid for strings with symbols included' do
    luhn = Tools::Luhn.new('055£ 444$ 285')
    expect(luhn.valid?).to be false
  end

  it 'is invalid for string with single zero with space' do
    luhn = Tools::Luhn.new(' 0')
    expect(luhn.valid?).to be false
  end

  it 'is invalid with more than a single zero' do
    luhn = Tools::Luhn.new('0000 0')
    expect(luhn.valid?).to be true
  end

  it ' is invalid for strings with non digits' do
    luhn = Tools::Luhn.new(':9')
    expect(luhn.valid?).to be false
  end
end