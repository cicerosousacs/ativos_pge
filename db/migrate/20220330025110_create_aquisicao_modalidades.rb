class CreateAquisicaoModalidades < ActiveRecord::Migration[5.2]
  def change
    create_table :aquisicao_modalidades do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
