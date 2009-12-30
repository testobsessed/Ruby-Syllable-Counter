# Written by Elisabeth Hendrickson, Quality Tree Software, Inc.
# Copyright (c) 2009 Quality Tree Software, Inc.
#
# This work is licensed under the 
# Creative Commons Attribution 3.0 United States License.
#
# To view a copy of this license, visit 
#      http://creativecommons.org/licenses/by/3.0/us/

require 'rubygems'
require 'spec'
require 'syllablecount'

describe "Syllable counter" do
    one_syllable_word_examples = [
      "at",
      "bat",
      "each",
      "tea",
      "bail",
      "bart",
      "quick",
      "slow",
      "quote",
      "quest",
      "the", 
      "dressed",
      "ed",
      "loved",
      "arched"
    ]

  one_syllable_word_examples.each { |word|
    it "knows that '#{word}' has one syllable" do
      word.syllable_count.should equal(1)
    end
  }
  
  two_syllable_word_examples = [
    "slowly",
    "able",
    "lightning",
    "pluot",
    "little",
    "ably",
    "bureau",
    "received",
    "alight"
  ]
  
  two_syllable_word_examples.each { |word|
    it "knows that '#{word}' has two syllables" do
      word.syllable_count.should equal(2)
    end
  }
  
  three_syllable_word_examples = [
    "syllable",
    "aspiring",
    "plaintively",
    "question",
    "beautiful"
  ]
  
  three_syllable_word_examples.each { |word|
    it "knows that '#{word}' has three syllables" do
      word.syllable_count.should equal(3)
    end
  }
  
  it "can count a line from a haiku" do
    "dripping drops of rain".syllable_count.should equal(5)
  end
end
