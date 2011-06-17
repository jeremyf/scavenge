class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.integer :question_id, :null => false
      t.integer :team_id, :null => false
      t.string :state, :null => false

      t.timestamps
    end
    add_index :solutions, :question_id
    add_index :solutions, :team_id
    add_index :solutions, :state
    add_index :solutions, [:question_id, :team_id], :unique => true
  end
end