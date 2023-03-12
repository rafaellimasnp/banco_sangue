unit uRelDoacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFormRelatorio, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, uFuncoesFS, uFuncoes,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, udmDados,
  FireDAC.DApt, frxClass, frxDBSet, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfRelDoacoes = class(TfBaseFormRelatorio)
    edData1: TDateTimePicker;
    edData2: TDateTimePicker;
    lbPeriodo: TLabel;
  private
    { Private declarations }
    procedure Imprimir(); override;
  public
    { Public declarations }
  end;

var
  fRelDoacoes: TfRelDoacoes;

implementation

{$R *.dfm}
{ TfRelDoacoes }

procedure TfRelDoacoes.Imprimir;
var
  TextoSQL: string;
begin
  inherited;
  with dmDados do
  begin
    TextoSQL := ' SELECT                  ' + sLineBreak +
      '                p.PES_TIPOSANG,    ' + sLineBreak +
      '	               SUM(d.DOA_QTDE) as QTDE     ' + sLineBreak +
      '	          FROM BS_DOACAO d     ' + sLineBreak +
      '      LEFT JOIN BS_PESSOA p ON p.PES_ID = d.PES_ID     ' + sLineBreak +
      '          WHERE CONVERT(DATE, d.DOA_DATA) between ''' +
      ConvData(edData1.Date) + '''  and ''' + ConvData(edData2.Date) + '''' +
      '      GROUP BY p.PES_TIPOSANG      ORDER BY QTDE desc     ' + sLineBreak;

    sqlRelDoacoes.Close;
    sqlRelDoacoes.SQL.Clear;
    sqlRelDoacoes.SQL.Add(TextoSQL);
    sqlRelDoacoes.Open();

  end;
  fFuncoesFS.AbreFr3('RelDoacoes.fr3');
  fFuncoesFS.ShowFr3;
end;

end.
