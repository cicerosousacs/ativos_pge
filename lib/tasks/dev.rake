namespace :dev do

  DEFAULT_PASSWORD = '@tivos_2022'
  DEFAULT_FILE_PATH = File.join(Rails.root, 'lib', 'tmp')
  
    desc "Configura o ambiente de desenvolvimento"
    task setup: :environment do
      if Rails.env.development?
      show_spinner("Apagando BD...") { %x(rails db:drop:_unsafe) }
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
      show_spinner("Admin padrão...") { %x(rails dev:add_default_admin) }
      show_spinner("Ajuste 1 de 3...") { %x(rails dev:add_tipo) }
      show_spinner("Ajuste 2 de 3...") { %x(rails dev:add_marca) }
      show_spinner("Ajuste 3 de 3...") { %x(rails dev:add_condicao) }
    else
      puts "Você não esta em ambiente de desenvolvimento!"
    end
  end
    
    desc "Adiciona o administrador padrão"
    task add_default_admin: :environment do
      Admin.create!(
        nome: 'Admin',
        email: 'admin@ativos.pge',
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
      )
    end
    
    desc "Adicionando Tipos"
    task add_tipo: :environment do
      file_name = 'types.txt'
      file_path = File.join(DEFAULT_FILE_PATH, file_name)
  
      File.open(file_path, 'r').each do |line|
      Tipo.create!(descricao: line.strip)
      end
    end

    desc "Adicionando Marcas"
    task add_marca: :environment do
      file_name = 'marcas.txt'
      file_path = File.join(DEFAULT_FILE_PATH, file_name)
  
      File.open(file_path, 'r').each do |line|
      Marca.create!(nome: line.strip)
      end
    end
  
    desc "Adicionando Condicoes"
    task add_condicao: :environment do
      file_name = 'condicao.txt'
      file_path = File.join(DEFAULT_FILE_PATH, file_name)
  
      File.open(file_path, 'r').each do |line|
      Condicao.create!(descricao: line.strip)
      end
    end

    private
     
    def show_spinner(msg_start, msg_end = "Sucesso!")
      spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
      spinner.auto_spin
      yield
      spinner.success("(#{msg_end})") 
    end
  
  end  