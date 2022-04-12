require 'csv'

namespace :csv do
  desc "Importa o arquivo dados.csv"
  task import: :environment do
    show_spinner("Importando Ativos...") do
      CSV.foreach('tmp/tecladoLONOVO.csv', col_sep: ',').with_index do |linha, indice|
        unless (indice == 1)
          Ativo.find_or_create_by!(
            tipo_id: "7", 
            tombo: linha[1], 
            serial: linha[2], 
            modelo: linha[3], 
            marca_id: "3",
            aquisicao_id: "1")
        end
      end
    end
  end
end
