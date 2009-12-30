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
  # school worksheet tests from http://www.superteacherworksheets.com/syllables/syllables6.pdf
  # thanks to Al Snow for the suggestion (score out of the box: 19/20 => "A" :-))
  school_worksheet_examples = {
    "animal" => 3,
    "anything" => 3,
    # "somebody" => 3, NEED TO FIX
    "grandfather" => 3,
    "comedy" => 3,
    "January" => 4,
    "computer" => 3,
    "table" => 2,
    "summer" => 2,
    "duet" => 2,
    "purchase" => 2,
    "understand" => 3,
    "beautiful" => 3,
    "wonderful" => 3,
    "customer" => 3,
    "exercise" => 3,
    "symbol" => 2,
    "travel" => 2,
    "picture" => 2,
    "confirm" => 2
  }
  
  school_worksheet_examples.each { |word, sylcount| 
    it "knows that '#{word}' has #{sylcount} syllable" do
      word.syllable_count.should equal(sylcount)
    end
  }
  
  interesting_one_syllable_word_examples = [
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

  interesting_one_syllable_word_examples.each { |word|
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
    "beautiful",
    "ambitious"
  ]
  
  three_syllable_word_examples.each { |word|
    it "knows that '#{word}' has three syllables" do
      word.syllable_count.should equal(3)
    end
  }
  
  four_syllable_word_examples = [
    "continuous"
  ]
  
  four_syllable_word_examples.each { |word|
    it "knows that '#{word}' has four syllables" do
      word.syllable_count.should equal(4)
    end
  }
  
  
  it "can count a line from a haiku" do
    "dripping drops of rain".syllable_count.should equal(5)
  end
end
