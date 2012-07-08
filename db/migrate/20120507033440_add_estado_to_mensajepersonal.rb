class AddEstadoToMensajepersonal < ActiveRecord::Migration
  def change
    add_column :mensajepersonals, :estado, :integer
  end
end
