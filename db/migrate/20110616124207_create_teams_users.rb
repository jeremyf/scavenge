class CreateTeamsUsers < ActiveRecord::Migration
  def change
    create_table :team_members_teams, :id => false do |t|
      t.integer :team_id, :null => false
      t.integer :team_member_id, :null => false

      t.timestamps
    end
    add_index :team_members_teams, :team_id
    add_index :team_members_teams, :team_member_id
    add_index :team_members_teams, [:team_id,:team_member_id], :unique => true
  end
end
