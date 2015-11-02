require 'spec_helper'

module Universe
  describe SurvivabilityRules do
    context 'Alive cell' do
      it 'will die if less than 2 live neighbours' do
        cell = Cell.new(0, 1, 'ALIVE')
        generations = Generations.new([[0, -1],[0, 0],[0, 1]])
        expect(SurvivabilityRules.new(cell,generations).will_live?).to eq(false)
      end
    end
  end
end