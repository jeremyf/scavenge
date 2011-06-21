class AddProposedSolutionToSolution < ActiveRecord::Migration
  def change
    add_column :solutions, :proposed_solution, :string
  end
end
