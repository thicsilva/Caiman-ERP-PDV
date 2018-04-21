unit frmConsultaCPFCNPJ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ACBrConsultaCPF, ACBrBase, ACBrSocket, ACBrConsultaCNPJ, ExtCtrls,
  StdCtrls, Mask, Buttons, Jpeg, pngimage;

type
  TTipoConsultaReceita = ( consCPF, consCNPJ );
  TfmConsultaReceita = class(TForm)
    ConsultaCNPJ: TACBrConsultaCNPJ;
    ConsultaCPF: TACBrConsultaCPF;
    Panel1: TPanel;
    Label1: TLabel;
    Label14: TLabel;
    ButBuscar: TBitBtn;
    EditCaptcha: TEdit;
    EditCNPJ: TMaskEdit;
    Panel3: TPanel;
    Image1: TImage;
    LabAtualizarCaptcha: TLabel;
    ckRemoverEspacosDuplos: TCheckBox;
    Timer1: TTimer;
    lblStatus: TLabel;
    procedure FormShow(Sender: TObject);
    procedure ButBuscarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure LabAtualizarCaptchaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    TipoConsulta: TTipoConsultaReceita;
    CPFCNPJ: STRING;

    // RETORNOS
    Tipo, Razao, Fantasia, Endereco, Numero, Complemento,
    Bairro, Cidade, UF, CEP, Situacao: string;
    Abertura: TDate;
  end;

var
  fmConsultaReceita: TfmConsultaReceita;

implementation

uses UDialog, UTarefasSP;

{$R *.dfm}

procedure TfmConsultaReceita.ButBuscarClick(Sender: TObject);
begin
  AligatorTSPSemAviso.NovaTarefa(
  procedure( Value: TAligatorTSP )
     begin
        try
          if EditCaptcha.Text <> '' then
          begin
             TThread.Synchronize( nil,
              procedure
                 begin
                    lblStatus.Caption := 'Consultando...';
                 end
                 );
            if TipoConsulta = consCNPJ then
               begin
                    if ConsultaCNPJ.Consulta(
                      EditCNPJ.Text,
                      EditCaptcha.Text,
                      ckRemoverEspacosDuplos.Checked
                    ) then
                        begin
                          Tipo        := ConsultaCNPJ.EmpresaTipo;
                          Razao := ConsultaCNPJ.RazaoSocial;
                          Abertura    := ConsultaCNPJ.Abertura ;
                          Fantasia    := ConsultaCNPJ.Fantasia;
                          Endereco    := ConsultaCNPJ.Endereco;
                          Numero      := ConsultaCNPJ.Numero;
                          Complemento := ConsultaCNPJ.Complemento;
                          Bairro     := ConsultaCNPJ.Bairro;
                          Cidade      := ConsultaCNPJ.Cidade;
                          UF          := ConsultaCNPJ.UF;
                          CEP         := ConsultaCNPJ.CEP;
                          Situacao    := ConsultaCNPJ.Situacao;
                          ModalResult :=  mrOk;
                        end
                    else
                      begin
                         TThread.Synchronize( nil,
                          procedure
                             begin
                                lblStatus.Caption := 'Erro na Consulta...';
                             end
                             );
                      end;
               end
             else
               begin
{                    if ConsultaCPF.Consulta(EditCNPJ.Text, EditCaptcha.Text) then
                    begin
                      Razao      := ConsultaCPF.Nome;
                      Situacao         := ConsultaCPF.Situacao;
        //              Abertura           :=  ConsultaCPF.Emissao;
                      ModalResult :=  mrOk;
                    end
                    else
                      begin
                         TThread.Synchronize( nil,
                          procedure
                             begin
                                lblStatus.Caption := 'Consultando...';
                             end
                             );
                      end;                       }
               end;
          end
          else
          begin
             TThread.Synchronize( nil,
              procedure
                 begin
                    lblStatus.Caption := 'É necessário Digitar o Captcha!';
                    EditCaptcha.SetFocus;
                 end
                 );
          end;
        except
             TThread.Synchronize( nil,
              procedure
                 begin
                    lblStatus.Caption := 'Erro na Consulta...';
                 end
                 );
        end;
     end
     , '', '');
end;

procedure TfmConsultaReceita.FormShow(Sender: TObject);
begin
   case TipoConsulta of
     consCNPJ: EditCNPJ.EditMask := '00.000.000/0000-00;1;_';
     consCPF: EditCNPJ.EditMask := '000.000.000-00;1;_';
   end;
   EditCNPJ.Text := CPFCNPJ;
end;

procedure TfmConsultaReceita.LabAtualizarCaptchaClick(Sender: TObject);
var
  Stream: TMemoryStream;
  Png: TPngImage;
begin
  AligatorTSPSemAviso.NovaTarefa(
  procedure( Value: TAligatorTSP )
  begin
      TThread.Synchronize( nil,
      procedure
         begin
            lblStatus.Caption := 'Carregando Captcha...';
         end
         );
      Stream:= TMemoryStream.Create;
      Png := TPngImage.Create;
      try
        if TipoConsulta = consCNPJ then
           begin
              ConsultaCNPJ.Captcha(Stream);
           end
        else
           begin
              ConsultaCPF.Captcha( Stream );
           end;
        Png.LoadFromStream(Stream);
        TThread.Synchronize( nil,
        procedure
           begin
              Image1.Picture.Assign(Png);
              EditCaptcha.Clear;
              EditCaptcha.SetFocus;
           end
           );
      finally
        Stream.Free;
        FreeAndNil( Png );
        TThread.Synchronize( nil,
        procedure
           begin
              lblStatus.Caption := 'Captcha Pronto...';
           end
           );
      end;
  end
  , '', '');
end;


procedure TfmConsultaReceita.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:= False;
  LabAtualizarCaptchaClick(LabAtualizarCaptcha);
  EditCNPJ.SetFocus;

end;

end.
