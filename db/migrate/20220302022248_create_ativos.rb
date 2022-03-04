class CreateAtivos < ActiveRecord::Migration[5.2]
  def change
    create_table :ativos do |t|
      t.references :tipo, foreign_key: true
      t.references :marca, foreign_key: true
      t.string :modelo
      t.string :serial
      t.string :tombo
      t.text :especificacao
      t.date :data_aquisicao
      t.boolean :garantia

      t.timestamps
    end
  end
end
