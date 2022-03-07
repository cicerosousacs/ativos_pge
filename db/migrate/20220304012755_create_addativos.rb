class CreateAddativos < ActiveRecord::Migration[5.2]
  def change
    create_table :addativos do |t|
      t.references :vinculo, foreign_key: true
      t.references :ativo, foreign_key: true
      t.references :condicao, foreign_key: true
      t.string :descricao

      t.timestamps
    end
  end
end
