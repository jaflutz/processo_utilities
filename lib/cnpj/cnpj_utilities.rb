module ProcessoUtilities
  class CnpjUtilities

    def self.remove_formatacao(cnpj)
      cnpj.gsub(/[-\. \/]/, '')
    end

    def self.insere_formatacao(cnpj)
      raise "Tamanho do cnpj inválido" unless cnpj.length == 14
      cnpj.insert(12, '-').insert(8, '/').insert(5, '.').insert(2, '.')      
    end
  end
end