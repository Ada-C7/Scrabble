module Scrabble

     class Letter

          attr_reader :name

          SCORING_CHART = { %w(A E I O U L N R S T) => 1, %w(D G) =>  2, %w(B C M P) =>  3, %w(F H  V W Y) =>  4, %w(K) =>  5, %w(J X) => 8, %w(Q z) => 10 }

          def initialize(name)
               @name = name
               @point = assign_points
          end


          def assign_points



          end
     end

end
