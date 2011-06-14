class CreateClueSolutions < ActiveRecord::Migration
  def change
    create_table :clue_solutions, :primary_key => false do |t|
      t.integer :clue_id, :null => false
      t.integer :solution_id, :null => false

      t.timestamps
    end
    add_index :clue_solutions, :clue_id
    add_index :clue_solutions, :solution_id
    add_index :clue_solutions, [:clue_id,:solution_id]
  end
end
