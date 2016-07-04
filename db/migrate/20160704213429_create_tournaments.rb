class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.string :location
      t.text :description
      t.string :debate_format
      t.string :tournament_type
      t.integer :number_of_rounds
      t.integer :owner_id
      t.integer :institution_id

      t.timestamps null: false
    end
  end
end
