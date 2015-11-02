module Universe
  class SurvivabilityRules
    def initialize(cell, generations)
      @cell = cell
      @generation = generations.current_generation
    end

    def will_live?
      if @cell.is_alive?
        neigbours = @cell.neighbours
        count = 0
        neigbours.each do |cell|
          if @generation.include?(cell)
            count += 1
          end
        end
       if count < 2
            false
          else
            true
          end
        end
      end
  end
end