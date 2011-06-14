class CreateClueSolutions < ActiveRecord::Migration
  def change
    create_table :clues_solutions, :id => false do |t|
      t.integer :clue_id, :null => false
      t.integer :solution_id, :null => false

      t.timestamps
    end
    add_index :clues_solutions, :clue_id
    add_index :clues_solutions, :solution_id
    add_index :clues_solutions, [:clue_id,:solution_id], :unique => true
  end
end
