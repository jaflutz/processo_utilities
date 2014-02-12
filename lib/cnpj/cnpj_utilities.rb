module ProcessoUtilities
  class CnpjUtilities

    def self.remove_formatacao(cnpj)
      cnpj.gsub(/[-\. \/\D]/, '')
    end

    def self.insere_formatacao(cnpj)
      cnpj = remove_formatacao(cnpj)
      tamanho_valido?(cnpj)
      cnpj.insert(12, '-').insert(8, '/').insert(5, '.').insert(2, '.')      
    end

    def self.cnpj_valido?(cnpj)
      cnpj = remove_formatacao(cnpj)
      tamanho_valido?(cnpj)
      
      return true if cnpj[12..13] == calcula_digito_verificador(cnpj)

      false
    end

    def self.calcula_digito_verificador(cnpj)
      primeiro_digito = calcula_digito_verificador_individual(cnpj[0..11], 5)
      segundo_digito = calcula_digito_verificador_individual(cnpj[0..11] + primeiro_digito.to_s, 6)
      primeiro_digito.to_s + segundo_digito.to_s
    end

    private

    def self.tamanho_valido?(cnpj)
      raise "Tamanho do cnpj inválido" unless cnpj.length == 14
    end

    def self.calcula_digito_verificador_individual(cnpj, max)
      soma_total = 0

      (2..9).each do |index|
        soma_total = soma_total + (cnpj[max + 8 - index].to_i * index)
      end

      (2..max).each do |index|
        soma_total = soma_total + (cnpj[max - index].to_i * index)
      end

      divisao_inteira = soma_total / 11;
      resto = soma_total % 11;

      if resto < 2
        digito_calculado = 0
      else
        digito_calculado = 11 - resto
      end

      digito_calculado
    end    


  end
end