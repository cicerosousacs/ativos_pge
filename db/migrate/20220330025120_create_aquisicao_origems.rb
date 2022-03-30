class CreateAquisicaoOrigems < ActiveRecord::Migration[5.2]
  def change
    create_table :aquisicao_origems do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
