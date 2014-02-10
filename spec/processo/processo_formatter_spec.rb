require 'spec_helper'
require 'processo/processo_formatter'


describe ProcessoUtilities::ProcessoFormatter do 
  it "remove a formatação do processo" do
    expect(ProcessoUtilities::ProcessoFormatter.remove_formatacao("080 00.123-50.76-43")).to eql("08000123507643")
  end

  it "insere a formatação do processo" do
    expect(ProcessoUtilities::ProcessoFormatter.insere_formatacao("00088903820135040000")).to eql("0008890-38.2013.5.04.0000")
  end
  
end