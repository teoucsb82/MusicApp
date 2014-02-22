class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :description, :null => false

      t.timestamps
    end
  end
end
