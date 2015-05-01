 # require 'pry'
 require 'spec_helper'
require_relative '../lib/caesar_cipher.rb'

describe "CaesarCipher encode" do

  it 'returns an encoded string' do
    expect(CaesarCipher.new("I'm a tiger",9500).caesar_encode).to eq("S'w k dsqob")
  end

  it 'returns an encoded character' do
    expect(CaesarCipher.new('a',3).caesar_encode).to eq('d')
    expect(CaesarCipher.new('p', 3).caesar_encode).to eq('s')
    expect(CaesarCipher.new('z', 3).caesar_encode).to eq('c')
  end

  it "returns the same value if the number is divisible by 26" do
    expect(CaesarCipher.new('a', 26).caesar_encode).to eq('a')
    expect(CaesarCipher.new('a', 52).caesar_encode).to eq('a')
  end

  it "preserves uppercase" do
    expect(CaesarCipher.new('P', 3).caesar_encode).to eq('S')
    expect(CaesarCipher.new('Z', 3).caesar_encode).to eq('C')
  end

  it "does not convert spaces" do
    expect(CaesarCipher.new('P   P', 3).caesar_encode).to eq('S   S')
  end

  it "does not convert punctuation" do
    expect(CaesarCipher.new('*&^.', 3).caesar_encode).to eq('*&^.')
  end

  it "converts sentences" do
    expect(CaesarCipher.new("I'm a tiger", 5).caesar_encode).to eq("N'r f ynljw")
  end

end


  describe "decodes a string" do

    it 'returns a decoded string' do
      value1 = CaesarCipher.new("I'm a tiger",9500).caesar_encode
      expect(CaesarCipher.new(value1,9500).caesar_decode).to eq("I'm a tiger")
      # binding.pry
    end

    it 'returns a decoded character' do
      value2 = CaesarCipher.new('d',3).caesar_encode
      expect(CaesarCipher.new(value2,3).caesar_decode).to eq('d')
      value3 = CaesarCipher.new('s', 3).caesar_encode
      expect(CaesarCipher.new(value3, 3).caesar_decode).to eq('s')
      value4 = CaesarCipher.new('c', 3).caesar_encode
      expect(CaesarCipher.new(value4, 3).caesar_decode).to eq('c')
    end

    it "returns the same value if the number is divisible by 26" do
      value5 = CaesarCipher.new('a', 26).caesar_encode
      expect(CaesarCipher.new(value5, 26).caesar_decode).to eq('a')
      value6 = CaesarCipher.new('a', 52).caesar_encode
      expect(CaesarCipher.new(value6, 52).caesar_decode).to eq('a')
    end

    it "preserves uppercase" do
      value7 = CaesarCipher.new('S', 3).caesar_encode
      expect(CaesarCipher.new(value7, 3).caesar_decode).to eq('S')
      value8 = CaesarCipher.new('C', 3).caesar_encode
      expect(CaesarCipher.new(value8, 3).caesar_decode).to eq('C')
    end

    it "does not convert spaces" do
      value9 = CaesarCipher.new('S   S', 3).caesar_encode
      expect(CaesarCipher.new(value9, 3).caesar_decode).to eq('S   S')
    end

    it "does not convert punctuation" do
      value10 = CaesarCipher.new('*&^.', 3).caesar_encode
      expect(CaesarCipher.new(value10, 3).caesar_decode).to eq('*&^.')
    end

    it "converts sentences" do
      value11 = CaesarCipher.new("I'm a tiger", 5).caesar_encode
      expect(CaesarCipher.new(value11, 5).caesar_decode).to eq("I'm a tiger")
    end

  end

