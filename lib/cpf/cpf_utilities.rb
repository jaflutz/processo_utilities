module ProcessoUtilities
  class CpfUtilities

    def self.remove_formatacao(cpf)
      cpf.gsub(/[-\. ]/, '')
    end

    def self.insere_formatacao(cpf)
      raise "Tamanho do cpf inválido" unless cpf.length == 11
      cpf.insert(9, '-').insert(6, '.').insert(3, '.')
    end
    
  end
end