class CreateAquisicaos < ActiveRecord::Migration[5.2]
  def change
    create_table :aquisicaos do |t|
      t.string :item
      t.string :quantidade
      t.decimal :valor
      t.string :gestor
      t.date :data_aquisicao
      t.references :aquisicao_modalidade, foreign_key: true
      t.string :numero_contrato
      t.references :aquisicao_origem, foreign_key: true
      t.string :empresa_contratada
      t.string :parte_interressada

      t.timestamps
    end
  end
end
