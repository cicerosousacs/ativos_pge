module ApplicationHelper

  def formatar_valor_monetario(valor, simbolo = true)
    if simbolo
      number_to_currency(valor, :unit => "R$", :separator => ",", :delimiter => ".", :format => "%u %n")
    else
      number_to_currency(valor, :unit => "", :separator => ",", :delimiter => ".", :format => "%u %n")
    end
  end
  
end
