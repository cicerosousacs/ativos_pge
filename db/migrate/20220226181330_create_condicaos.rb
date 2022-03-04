class CreateCondicaos < ActiveRecord::Migration[5.2]
  def change
    create_table :condicaos do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
