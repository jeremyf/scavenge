class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :points_available, :null => false
      t.text :answer
      t.string :name, :null => false

      t.timestamps
    end
    add_index :questions, :name, :unique => true
  end
end
