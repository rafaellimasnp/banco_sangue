unit uFuncoesFS;

interface

uses
  Winapi.Windows, Winapi.Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms,
  Dialogs, fs_ipascal, fs_iinterpreter, frxClass, frxDesgn, StdCtrls, StrUtils,
  frxExportImage, frxExportXLS, frxExportXML, frxDMPExport, frxRich,
  frxExportPDF, frxExportRTF, frxVariables, frxBarcode, frxExportODF,
  frxExportText,
  frxExportCSV, frxExportMail, frxPrinter, frxExportBaseDialog;

type
  TNotifyEventLabProducao = procedure(Sender: TObject) of object;

  TParametroExportarPDF = record
    NomeArquivo: String;
    DiretorioPdf: string;
    EhSalvarPdf: boolean;
    AbrirAposExportar: boolean;
  end;

  TfFuncoesFS = class(TForm)
    FastRep3: TfrxReport;
    frxDesigner1: TfrxDesigner;
    procedure FormCreate(Sender: TObject);
    procedure FastRep3AfterPrintReport(Sender: TObject);
    procedure FastRep3BeginDoc(Sender: TObject);
    procedure FastRep3Preview(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FListaParametrosUsados: TStringList;
    FDirPasta: string;
    FBeforeShowFr3: TNotifyEvent;
    FLabProducaoAfterPrintFr3: TNotifyEventLabProducao;
    procedure SetDirPasta(const Value: string);
    function GetDirPastaPersonalizado: string;
    function GetTotalPaginas(): Integer;
  public
    { Public declarations }
    bImprimiuRelatorio: boolean;
    property TotalPaginas: Integer read GetTotalPaginas;
    property DirPasta: string read FDirPasta write SetDirPasta;
    property DirPastaPersonalizado: string read GetDirPastaPersonalizado;
    property BeforeShowFr3: TNotifyEvent read FBeforeShowFr3
      write FBeforeShowFr3;
    property LabProducaoAfterPrintFr3: TNotifyEventLabProducao
      read FLabProducaoAfterPrintFr3 write FLabProducaoAfterPrintFr3;
    function AbreFr3(const AArquivo: string): boolean;
    procedure LoadFr3(const AArquivo: string);
    procedure MudaVarFr3(const AVariavel, AConteudo: string);
    procedure DesignFr3();
    procedure ShowFr3(const AImprimirDireto: boolean = False;
      const AImpressoraDireto: string = ''); overload;
    procedure ShowFr3(const AImprimirDireto: boolean;
      const AImpressoraDireto: string;
      AParametroExportarPDF: TParametroExportarPDF); overload;
    function GetParametrosUsadosNoRelatorio(): string;
    function GetCaminhoFr3(const AArquivo: String): String;
  end;

var
  fFuncoesFS: TfFuncoesFS;

implementation

{$R *.dfm}
{ TfFuncoesFS }

function TfFuncoesFS.AbreFr3(const AArquivo: string): boolean;
begin
  Result := False;
  try
    Self.LoadFr3(AArquivo);
    Result := True;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TfFuncoesFS.FormCreate(Sender: TObject);
begin
  FBeforeShowFr3 := nil;
  FLabProducaoAfterPrintFr3 := nil;
  FListaParametrosUsados := TStringList.Create();
  Self.SetDirPasta(ExtractFilePath(ParamStr(0)) + 'Relatorios\');
  FastRep3.Report.Clear();
end;

procedure TfFuncoesFS.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FListaParametrosUsados);
end;

function TfFuncoesFS.GetCaminhoFr3(const AArquivo: String): String;
begin
  Result := Self.DirPastaPersonalizado + AArquivo;
  if not FileExists(Result) then
    Result := Self.DirPasta + AArquivo;
  if not FileExists(Result) then
    Result := EmptyStr;
end;

function TfFuncoesFS.GetDirPastaPersonalizado: string;
begin
  Result := Self.DirPasta + 'Personalizado\';
end;

function TfFuncoesFS.GetParametrosUsadosNoRelatorio: string;
begin
  Result := FListaParametrosUsados.Text;
end;

function TfFuncoesFS.GetTotalPaginas(): Integer;
begin
  Result := FastRep3.PreviewPages.Count;
end;

procedure TfFuncoesFS.LoadFr3(const AArquivo: string);
var
  CaminhoArquivo: string;
begin
  FListaParametrosUsados.Clear();

  CaminhoArquivo := Self.GetCaminhoFr3(AArquivo);
  if Length(CaminhoArquivo) = 0 then
    raise Exception.Create('O relatório ' + Self.DirPasta + AArquivo +
      ' não foi encontrado.');

  FastRep3.Clear;
  FastRep3.LoadFromFile(CaminhoArquivo);
end;

procedure TfFuncoesFS.DesignFr3;
begin
  FastRep3.DesignReport(True, False);
end;

procedure TfFuncoesFS.FastRep3AfterPrintReport(Sender: TObject);
begin
  bImprimiuRelatorio := True;

  if Assigned(FLabProducaoAfterPrintFr3) then
    FLabProducaoAfterPrintFr3(Self);
end;

procedure TfFuncoesFS.FastRep3BeginDoc(Sender: TObject);
begin
  bImprimiuRelatorio := False;
end;

procedure TfFuncoesFS.FastRep3Preview(Sender: TObject);
begin
  FastRep3.PreviewForm.BorderIcons := [biSystemMenu, biMaximize];
end;

procedure TfFuncoesFS.SetDirPasta(const Value: string);
var
  LDir: String;
begin
  LDir := IncludeTrailingPathDelimiter(Value);
  ForceDirectories(LDir);
  if DirectoryExists(LDir) then
  begin
    FDirPasta := LDir;
    ForceDirectories(Self.DirPastaPersonalizado);
  end;
end;

procedure TfFuncoesFS.ShowFr3(const AImprimirDireto: boolean;
  const AImpressoraDireto: string;
  AParametroExportarPDF: TParametroExportarPDF);
begin

  if Assigned(FBeforeShowFr3) then
    FBeforeShowFr3(Self);

  FastRep3.OldStyleProgress := True;
  FastRep3.ShowProgress := True;
  FastRep3.PrintOptions.ShowDialog := Length(AImpressoraDireto) = 0;

  FastRep3.PrepareReport();

  if Length(AImpressoraDireto) > 0 then
    FastRep3.PrintOptions.Printer := AImpressoraDireto
  else
    frxPrinters.PrinterIndex := -1;
  case AImprimirDireto of
    True:
      begin
        FastRep3.PrintOptions.ShowDialog := False;
        FastRep3.Print();
      end;
    False:
      begin
        FastRep3.PrintOptions.ShowDialog := True;
        FastRep3.ShowReport();
      end;
  end;
  FastRep3.Clear;

end;

procedure TfFuncoesFS.ShowFr3(const AImprimirDireto: boolean;
  const AImpressoraDireto: string);
begin
  Self.ShowFr3(AImprimirDireto, AImpressoraDireto,
    Default (TParametroExportarPDF));
end;

procedure TfFuncoesFS.MudaVarFr3(const AVariavel, AConteudo: string);
begin
  FastRep3.Variables[AVariavel] := QuotedStr(AConteudo);
  FListaParametrosUsados.Add(AVariavel + ' := ' + AConteudo);
end;

end.
