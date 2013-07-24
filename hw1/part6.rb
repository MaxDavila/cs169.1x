class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1.000 }
  
  def method_missing(method_id, set = false)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency) && set == false
      self * @@currencies[singular_currency]
    elsif @@currencies.has_key?(singular_currency) && set == true
      self / @@currencies[singular_currency]
    else
      super
    end
  end
  
  def in(other_currency)
    method_missing(other_currency, set = true)
  end
  
end

class String
  def palindrome?
    clean = self.downcase.gsub(/\W+/, "")
    clean == clean.reverse
  end
end

module Enumerable
  def palindrome? 
    p self.class != Hash ? self.to_a.reverse == self.to_a : false
  end 
end

[2,3,3].palindrome? 
 {"hello"=>"world"}.palindrome?

 p 10.dollars.in :rupees
 p 10.rupees.in :dollars