program CaimanNFCe;

uses
  Forms,
  Windows,
  MidasLib,
  UPadraoPafEcf in 'UPadraoPafEcf.pas' {FrmPadraoPafECf},
  UDM in 'UDM.pas' {DM: TDataModule},
  USenha in 'USenha.pas' {FrmSenha},
  ULMFRed in 'ULMFRed.pas' {FrmLMFRed},
  ULMFData in 'ULMFData.pas' {FrmLMFData},
  UAberturaCaixa in 'UAberturaCaixa.pas' {FrmAberturaCaixa},
  UFechamento in 'UFechamento.pas' {FrmFechamento},
  UEntradaValores in 'UEntradaValores.pas' {FrmEntradaValores},
  UVendasCaixa in 'UVendasCaixa.pas' {FrmVendasCaixa},
  UConsProd in 'UConsProd.pas' {FrmConsProd},
  UCancelaItem in 'UCancelaItem.pas' {FrmCancelaItem},
  UFechaVenda in 'UFechaVenda.pas' {FrmFechaVenda},
  UDadosCliente in 'UDadosCliente.pas' {FrmDadosCliente},
  UConsCli in 'UConsCli.pas' {FrmConsCli},
  UAlteraParcela in 'UAlteraParcela.pas' {FrmAlteraParcela},
  ULancCheques in 'ULancCheques.pas' {FrmLancCheques},
  UConsBanco in 'UConsBanco.pas' {FrmConsBanco},
  UDadosClienteECF in 'UDadosClienteECF.pas' {FrmDadosClienteECF},
  USenhaExcVenda in 'USenhaExcVenda.pas' {FrmSenhaExcVenda},
  UConsProdCodBarra in 'UConsProdCodBarra.pas' {FrmConsProdCodBarra},
  UsenhaLiberarVenda in 'UsenhaLiberarVenda.pas' {FrmSenhaLiberaVenda},
  UDadosAdm in 'UDadosAdm.pas' {FrmDadosAdm},
  UConsAdmCartaoCredito in 'UConsAdmCartaoCredito.pas' {FrmConsAdmCartaoCredito},
  UProdutoNaoCadastrado in 'UProdutoNaoCadastrado.pas' {FrmProdutoNaoCadastrado},
  UConsVendasCaixa in 'UConsVendasCaixa.pas' {FrmConsVendasCaixa},
  UConsCheque in 'UConsCheque.pas' {FrmConsCheque},
  UDadosCheque in 'UDadosCheque.pas' {FrmDadosCheque},
  UDadosCadCliente in 'UDadosCadCliente.pas' {FrmDadosCadCliente},
  UAlterarSenha in 'UAlterarSenha.pas' {FrmAlterarSenha},
  UHorarioVerao in 'UHorarioVerao.pas' {FrmHorarioVerao},
  UAliquota in 'UAliquota.pas' {FrmAliquota},
  UTotalProdutos in 'UTotalProdutos.pas' {FrmTotalProdutos},
  UMenuFiscal in 'UMenuFiscal.pas' {FrmMenuFiscal},
  ULMF in 'ULMF.pas' {FrmLMF},
  UPafEcfTabelaProduto in 'UPafEcfTabelaProduto.pas' {FrmPafEcfTabelaProduto},
  URegistrosPafEcf in 'URegistrosPafEcf.pas' {frmRegistrosDoPafEcf},
  Ubibli1 in 'Units\Ubibli1.pas',
  UECF in 'Units\UECF.pas',
  UConsNovo in 'Units\UConsNovo.pas' {FrmConsNovo},
  UCadNovo in 'Units\UCadNovo.pas' {FrmCadastroNovo},
  UDaruma in 'Units\UDaruma.pas',
  UBematech in 'Units\UBematech.pas',
  USelEmp in 'USelEmp.pas' {FrmSelEmp},
  UPreVenda in 'UPreVenda.pas' {FrmPreVenda},
  USitCli in 'USitCli.pas' {FrmSitCli},
  UConsVend in 'UConsVend.pas' {FrmConsVend},
  UConsTipoVenda in 'UConsTipoVenda.pas' {FrmConsTipoVenda},
  UFechaPreVenda in 'UFechaPreVenda.pas' {FrmFechaPreVenda},
  UMesas in 'UMesas.pas' {FrmMesas},
  UConsMesasAbertas in 'UConsMesasAbertas.pas' {FrmConsMesasAbertas},
  UTransfMesa in 'UTransfMesa.pas' {FrmTransfMesa},
  UConsPreVenda in 'UConsPreVenda.pas' {FrmConsPreVenda},
  UDavOrcamento in 'UDavOrcamento.pas' {FrmDavOrcamento},
  URelDavOrcamento in 'URelDavOrcamento.pas' {FrmRelDavOrcamento},
  UFechaVendaPED in 'UFechaVendaPED.pas' {FrmFechaVendaPED},
  UConsVendasPED in 'UConsVendasPED.pas' {FrmConsVendasPED},
  UFormasPagamento in 'UFormasPagamento.pas' {FrmFormasPagamento},
  UEspelhoMFD in 'UEspelhoMFD.pas' {FrmEspelhoMFD},
  UBemaMFD in 'Units\UBemaMFD.pas',
  UConsOrcamento in 'UConsOrcamento.pas' {FrmConsOrcamento},
  UDavEmitidos in 'UDavEmitidos.pas' {FrmDavEmitidos},
  UDavOrdemServico in 'UDavOrdemServico.pas' {FrmDAVOrdemServico},
  UConsMarcas in 'UConsMarcas.pas' {FrmConsMarcas},
  UConsModelos in 'UConsModelos.pas' {FrmConsModelos},
  UConsOrdemServico in 'UConsOrdemServico.pas' {FrmConsOrdemServico},
  UProgramaRelGerencial in 'UProgramaRelGerencial.pas' {FrmProgramaRelGerencial},
  UMovimentoPorECF in 'UMovimentoPorECF.pas' {FrmMovimentoPorECF},
  UVendasPeriodo in 'UVendasPeriodo.pas' {FrmVendasPeriodo},
  Sintegra in 'Units\Sintegra.pas',
  UMeiosPagamento in 'UMeiosPagamento.pas' {FrmMeiosPagamento},
  UCancelaCupomFiscal in 'UCancelaCupomFiscal.pas' {FrmCancelaCupomFiscal},
  UVendasPED in 'UVendasPED.pas' {FrmVendasPED},
  USelVend in 'USelVend.pas' {frmSelVend},
  UAtalhos in 'UAtalhos.pas' {frmAtalhos},
  UElgin in 'UElgin.pas',
  UTEFDiscado in 'UTEFDiscado.pas' {frmTEFDiscado},
  Unit5 in 'Unit5.pas' {Form5},
  Unit4 in 'Unit4.pas' {Form4},
  UCarrega in 'UCarrega.pas' {frmCarrega},
  UTroco in 'UTroco.pas' {frmTroco},
  UFBalanca in 'UFBalanca.pas' {frmBalanca},
  UDialog in 'UDialog.pas' {frmDialog},
  uMenTEF in 'uMenTEF.pas' {frmMenTef},
  UAtualizaEstoque in 'UAtualizaEstoque.pas' {frmAtualizaEstoque},
  UMenuBalcao in 'UMenuBalcao.pas' {frmMenuBalcao},
  Func in 'Func.pas',
  UPopUp in 'UPopUp.pas' {Popup},
  UImportaVenda in 'UImportaVenda.pas' {frmImportaVenda},
  URelUsuario in 'URelUsuario.pas' {frmRelUsuario},
  URegistrosdoPaf in 'URegistrosdoPaf.pas' {dmRegistrosdoPaf: TDataModule},
  UStatusGerando in 'UStatusGerando.pas' {frmStatusGerando},
  UImei in 'UImei.pas' {frmIMEI},
  UNotaFiscalComcomitante in 'UNotaFiscalComcomitante.pas' {frmNotaFiscalComcomitante},
  UAdiantamentoMesas in 'UAdiantamentoMesas.pas' {frmAdiantamentosMesa},
  UDivide in 'UDivide.pas' {frmDivide},
  UGrupoTeclas in 'UGrupoTeclas.pas' {frmGrupoTeclas},
  UQuantidadePreco in 'UQuantidadePreco.pas' {frmQuantidadePreco},
  UConfereCaixa in 'UConfereCaixa.pas' {frmConfereCaixa},
  UVendeItens in 'UVendeItens.pas' {frmSelecionaItens},
  UGerenciadorNFCe in 'UGerenciadorNFCe.pas' {frmGerenciador},
  UStatus in 'UStatus.pas' {frmStatus};

{$R *.res}


begin
//   ReportMemoryLeaksOnShutdown := True;
  if ParamStr(1) <> '' then
     begin
       PUsuario := ParamStr(1);
       Application.MainFormOnTaskbar := False;
     end;
  if ParamStr(2) <> '' then
     PSenha := ParamStr(2);
  if ParamStr( 3 ) <> '' then
     PArquivoVenda := ParamStr( 3);

  Application.Initialize;
  Application.Title := 'Caiman NFCe';
  Application.CreateForm(TFrmPadraoPafECf, FrmPadraoPafECf);
  Application.CreateForm(TfrmMenuBalcao, frmMenuBalcao);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TdmRegistrosdoPaf, dmRegistrosdoPaf);
  Application.CreateForm(TFrmDadosCliente, FrmDadosCliente);
  Application.CreateForm(TFrmConsNovo, FrmConsNovo);
  Application.CreateForm(TFrmCadastroNovo, FrmCadastroNovo);
  Application.CreateForm(TFrmSelEmp, FrmSelEmp);
  Application.CreateForm(TfrmStatusGerando, frmStatusGerando);
  Application.CreateForm(TfrmStatus, frmStatus);
  Application.Run;
end.



