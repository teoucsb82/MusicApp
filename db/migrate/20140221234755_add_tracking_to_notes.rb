class AddTrackingToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :user_id, :integer
    add_column :notes, :track_id, :integer
  end
end
