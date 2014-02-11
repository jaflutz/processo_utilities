require 'spec_helper'
require 'cpf/cpf_utilities'

describe ProcessoUtilities::CpfUtilities do
  
  it "remove a formatação do cpf" do
    expect(ProcessoUtilities::CpfUtilities.remove_formatacao("801.318.786-11")).to eql("80131878611")
  end

  it "adiciona a formatação do cpf" do
    expect { ProcessoUtilities::CpfUtilities.insere_formatacao(nil)}.to raise_error
    expect { ProcessoUtilities::CpfUtilities.insere_formatacao("8013187861")}.to raise_error
    expect(ProcessoUtilities::CpfUtilities.insere_formatacao("80131878611")).to eql("801.318.786-11")
  end

  it "valida o cpf"

  
end