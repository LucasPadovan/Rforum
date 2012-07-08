class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.string :apellido
      t.string :avatar
      t.date :fechanac
      t.string :firma
      t.string :numtel
      t.string :nombre
      t.string :pagweb
      t.string :pais
      t.string :provincia
      t.integer :puntuacion
      t.string :rango

      t.timestamps
    end
  end
end
