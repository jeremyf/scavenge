class Score
  attr_reader :current, :possible, :clues_purchased
  def initialize(collection)
    @collection = collection
    @current = 0
    @possible = 0
    @clues_purchased = 0
    @collection.each do |solution|
      @current += solution.points_awarded
      @possible += solution.possible_points_still_available
      @clues_purchased += solution.points_spent_on_clues
    end
  end

  def <=>(other)
    self.current <=> other.current
  end
end