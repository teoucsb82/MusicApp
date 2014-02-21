class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title,          :null => false
      t.integer :album_id,      :null => false
      t.text :lyrics
      t.boolean :bonus_track,   :null => false, :default => false
      t.integer :track_number,  :null => false

      t.timestamps
    end
    add_index :tracks, :album_id
  end
end
