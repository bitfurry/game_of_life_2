module Universe
  class Cell
    ALIVE = 'ALIVE'
    DEAD = 'DEAD'
    def initialize(x, y, state,generation)
      @x = x
      @y = y
      @state = state
      @generation = generation
    end

    def position
      [@x,@y]
    end

    def neighbours
      neighbours = []
      live_cells = @generation.current_generation
      range = [-1, 0, 1]
      range.each do |x|
        range.each do |y|
          cell = Cell.new(@x + x, @y + y, ALIVE, @generation)
          if !(x == y && x == 0)
            if live_cells.include? cell
              neighbours << cell
            else
              cell = Cell.new(@x + x, @y + y, DEAD, @generation)
              cell << cell
            end
          end
        end
      end
      neighbours
    end

    def is_alive?
      if @state == 'ALIVE'
        true
      else
        false
      end
    end

    def is_dead?
      if @state == 'DEAD'
        true
      else
        false
      end
    end
  end
end