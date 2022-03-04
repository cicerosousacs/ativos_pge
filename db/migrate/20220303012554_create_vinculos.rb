class CreateVinculos < ActiveRecord::Migration[5.2]
  def change
    create_table :vinculos do |t|
      t.references :usuario, foreign_key: true
      t.references :area, foreign_key: true
      t.references :subarea, foreign_key: true
      t.string :observacao

      t.timestamps
    end
  end
end
