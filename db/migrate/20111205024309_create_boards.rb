class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :title, :limit => 50
      t.string :categoria
      t.string :descripcion
      t.integer :padre

      t.timestamps
    end
  end
end
