require 'csv'

namespace :csv do
  desc "Importa o arquivo dados.csv"
  task import: :environment do
    show_spinner("Importando Ativos...") do
      CSV.foreach('tmp/estabilizadorNHS.csv', col_sep: ',').with_index do |linha, indice|
        unless (indice == 0)
          Ativo.find_or_create_by!(
            tipo_id: "10", 
            tombo: linha[1], 
            serial: linha[2], 
            modelo: linha[3], 
            marca_id: "10",
            aquisicao_id: "1")
        end
      end
    end
  end
end
