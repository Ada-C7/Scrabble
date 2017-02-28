module Scrabble
  class Scoring

  SCORES = {1 => %w(A E I O U L N R S T), 2 => %w( D G), 3 => %w(B C M P), 4 => %w(F H V W Y), 5 => ["K"], 8=> %w(J X) , 10 => %w(Q Z)}

  def self.score(string.upcase)
    turn_value = "not right"
    string = string.split('')
    num = string.length
    SCORES.each do |point, val|
        if val.include?(string[num])
          turn_value = "AGH"
        end
        num - 1
      end
    return turn_value
  end

  # def self.score(string)
  #   # turn_value = 0
  #   storage_variable = 0
  #   string = string.split()
  #   SCORES.each do |point, val|
  #     string.find do |letter|
  #         val.include?(letter)
  #       end
  #       puts
  #       turn_value += point
  #
  #     end
  #   return turn_value
  # end

  # def self.score(string)
  #     total_points = []
  #     # value_array = []
  #
  #     string.each_char do |letter|
  #       SCORES.select do |k,v|
  #     if  v.include?(letter)
  #       total_points << k
  #     end
  #     end
  #     return total_points
  #   end
  #
  #   end
  end
end

puts Scrabble::Scoring.score("apple")
