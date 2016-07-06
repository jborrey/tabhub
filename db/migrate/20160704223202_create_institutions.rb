class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :university
      t.string :location
      t.integer :president_id
      t.string :website
      t.string :twitter_handle
      t.string :facebook_page
      t.string :youtube_channel
      t.date :founded_at

      t.timestamps null: false
    end
  end
end
