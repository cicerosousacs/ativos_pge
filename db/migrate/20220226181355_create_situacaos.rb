class CreateSituacaos < ActiveRecord::Migration[5.2]
  def change
    create_table :situacaos do |t|
      t.references :condicao, foreign_key: true
      t.string :descricao

      t.timestamps
    end
  end
end
