module ProcessoUtilities
  class CpfUtilities

    def self.remove_formatacao(cpf)
      cpf.gsub(/[-\. \D]/, '')
    end

    def self.insere_formatacao(cpf)
      cpf = remove_formatacao(cpf)
      tamanho_valido?(cpf)  
      cpf.insert(9, '-').insert(6, '.').insert(3, '.')
    end

    def self.cpf_valido?(cpf)
      cpf = remove_formatacao(cpf)
      tamanho_valido?(cpf)
      
      return true if cpf[9..10] == calcula_digito_verificador(cpf)

      false
    end

    def self.calcula_digito_verificador(cpf)
      primeiro_digito = calcula_digito_verificador_individual(cpf[0..8], 10)
      segundo_digito = calcula_digito_verificador_individual(cpf[0..8] + primeiro_digito.to_s, 11)
      primeiro_digito.to_s + segundo_digito.to_s
    end

    private

    def self.tamanho_valido?(cpf)
      raise "Tamanho do cpf inválido" unless cpf.length == 11
    end

    def self.calcula_digito_verificador_individual(cpf, max)
      soma_total = 0

      (2..max).each do |index|
        soma_total = soma_total + (cpf[max - index].to_i * index)
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