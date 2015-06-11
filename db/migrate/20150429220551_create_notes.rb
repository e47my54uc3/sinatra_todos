class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :front
      t.text :back_info
      t.timestamps
    end
  end
end
