class StringCalculator

    def self.calculate(input_string)
      # checking empty string
      return 0 if input_string.strip.empty?
  
      # Checking delimiter in input
      if input_string.start_with?("//")
        delimiters = input_string[2..-1].scan(/\[(.*?)\]/).flatten
        input_string = input_string[2 + delimiters.join.length + 2..-1]
        delimiters.each do |delimiter|
          input_string = input_string.gsub(delimiter, ",")
        end
      end
    
      numbers = input_string.split(/[\n,]/).map(&:to_i)
  
      # checking string in input for negative numbers is present or not
      negative_numbers = numbers.select { |num| num < 0 }
      if negative_numbers.any?
        raise "Negatives not allowed: #{negative_numbers.join(', ')}"
      end
  
      # return sum of the input string 
      numbers.sum
    end

  end
  