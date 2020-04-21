require 'tools/pokemon_damage'

RSpec.describe Tools::PokemonDamage do
  it 'should return correct value for entered fire, water' do
    pokemon = Tools::PokemonDamage.new('fire', 'water', 100, 100)
    expect(pokemon.calculate_damage).to eq 25
  end

  it 'should return correct value for entered grass, fire' do
    pokemon = Tools::PokemonDamage.new('grass', 'fire', 35, 5)
    expect(pokemon.calculate_damage).to eq 175
  end

  it 'should return correct value for entered electric, fire' do
    pokemon = Tools::PokemonDamage.new('electric', 'fire', 100, 100)
    expect(pokemon.calculate_damage).to eq 50
  end
end