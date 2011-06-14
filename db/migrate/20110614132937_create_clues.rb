class CreateClues < ActiveRecord::Migration
  def change
    create_table :clues do |t|
      t.integer :question_id, :null => false
      t.integer :point_cost, :null => false
      t.string :name, :null => false
      t.text :text

      t.timestamps
    end
    add_index :clues, :question_id
  end
end
