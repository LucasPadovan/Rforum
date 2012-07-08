class CreateMensajepersonals < ActiveRecord::Migration
  def change
    create_table :mensajepersonals do |t|
      t.integer :remitente_id
      t.integer :destinatario_id
      t.string :titulo
      t.text :cuerpo

      t.timestamps
    end
  end
end

#probablemente remitente y destinatarios deben llamarse user_id y usar un alias para llamarlos
