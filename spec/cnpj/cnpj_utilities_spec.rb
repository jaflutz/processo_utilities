require 'spec_helper'
require 'cnpj/cnpj_utilities'

describe ProcessoUtilities::CnpjUtilities do
  
  it "remove a formatação do cnpj" do
    expect(ProcessoUtilities::CnpjUtilities.remove_formatacao("36.463.891/0001-60")).to eql("36463891000160")
    expect(ProcessoUtilities::CnpjUtilities.remove_formatacao("36.463.8a91/0001-60")).to eql("36463891000160")
  end

  it "adiciona a formatação do cnpj" do
    expect { ProcessoUtilities::CnpjUtilities.insere_formatacao(nil)}.to raise_error
    expect { ProcessoUtilities::CnpjUtilities.insere_formatacao("364638910a0160")}.to raise_error
    expect { ProcessoUtilities::CnpjUtilities.insere_formatacao("3646389100016")}.to raise_error
    expect(ProcessoUtilities::CnpjUtilities.insere_formatacao("36463891000160")).to eql("36.463.891/0001-60")        
  end

  it "valida o cnpj" do
    expect(ProcessoUtilities::CnpjUtilities.cnpj_valido?("36.463.891/0001-60")).to be_true
    expect(ProcessoUtilities::CnpjUtilities.cnpj_valido?("36.463.892/0001-60")).to be_false
  end

  

end