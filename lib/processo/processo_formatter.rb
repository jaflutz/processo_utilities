module ProcessoUtilities
  class ProcessoFormatter
    def self.remove_formatacao(processo)
      processo.gsub(/[-\. ]/, '')
    end

    def self.insere_formatacao(processo)
      raise "Tamanho do processo inválido" unless processo.length == 20
      processo.insert(16, '.').insert(14, '.').insert(13, '.').insert(9, '.').insert(7, '-')
    end

  end
end