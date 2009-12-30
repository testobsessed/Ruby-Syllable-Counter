# Written by Elisabeth Hendrickson, Quality Tree Software, Inc.
# Copyright (c) 2009 Quality Tree Software, Inc.
#
# This work is licensed under the 
# Creative Commons Attribution 3.0 United States License.
#
# To view a copy of this license, visit 
#      http://creativecommons.org/licenses/by/3.0/us/
	
class String
  def syllable_count
    consonants = "bcdfghjklmnpqrstvwxz"
    vowels = "aeiouy"
    processed = self.downcase
    suffix_bonus = 0
    #puts "*** 0 #{processed}"
    if processed.match(/ly$/)
      suffix_bonus = 1
      processed.gsub!(/ly$/, "")
    end
    if processed.match(/[a-z]ed$/)
      # Not counting "ed" as an extra symbol. 
      # So 'blessed' is assumed to be said as 'blest'
      suffix_bonus = 0 
      processed.gsub!(/ed$/, "")
    end
    #puts "*** 1 #{processed}"
    processed.gsub!(/eau|ai|au|ay|ea|ei|oa|oi|ui|oy/, "@") #vowel combos
    #puts "*** 2 #{processed}"
    processed.gsub!(/qu|ng|ch|rt|[#{consonants}h]/, "=") #consonant combos
    #puts "*** 3 #{processed}"
    processed.gsub!(/[#{vowels}@][#{consonants}=]e$/, "@|") # remove silent e
    #puts "*** 4 #{processed}"
    processed.gsub!(/[#{vowels}]/, "@") #all remaining vowels will be counted
    #puts "*** 5 #{processed}"
    return processed.count("@") + suffix_bonus
  end
  
end