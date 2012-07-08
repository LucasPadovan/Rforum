class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.string :title, :limit => 50
      t.integer :board_id
      t.integer :user_id
      t.text :cuerpo
      t.date :fechaultcom
      t.integer :puntaje

      t.timestamps
    end

    add_index :conversations, :board_id
    add_index :conversations, :user_id
  end
end
