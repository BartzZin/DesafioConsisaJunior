unit Unit_TelaVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, xmldom, XMLIntf, msxmldom, XMLDoc, StrUtils,
  Buttons;

type
  TForm_Venda = class(TForm)
    pnlVendaFooter: TPanel;
    memoTelaVenda: TMemo;
    XMLDocument1: TXMLDocument;
    bitbtnSair: TBitBtn;
    procedure btnVendaVoltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function strPadChL(const S: String; C: String; Len: Integer): String;
    function strPadChR(const S: String; C: String; Len: Integer): String;
    { Private declarations }
  public
    { Public declarations }
    procedure geraVendaMemo;
  end;

var
  Form_Venda: TForm_Venda;

implementation

uses
     Unit_Pedidos, Unit_DmDados, DB;

{$R *.dfm}
function TForm_Venda.strPadChR(const S: String; C: String; Len: Integer): String;
begin
Result := S;
if C = '' then
    C := ' ';
while Length(Result) < Len do
    Result := Result + C;
Result := Copy(Result,1,Len);
end;

//*****************************************************************************
function TForm_Venda.strPadChL(const S: String; C: String; Len: Integer): String;
begin
  Result := S;
if C = '' then
    C := ' ';
while Length(Result)<Len do
    Result := C + Result;
Result := Copy(Result,1,Len);
end;

//******************************************************************************
procedure TForm_Venda.btnVendaVoltarClick(Sender: TObject);
begin
 Form_Venda.close;
end;

//******************************************************************************
procedure TForm_Venda.FormCreate(Sender: TObject);
begin

end;

//******************************************************************************
procedure TForm_Venda.FormShow(Sender: TObject);
begin
//geraVendaMemo;
end;

//******************************************************************************
procedure TForm_Venda.geraVendaMemo;
var
lvAcresDescon, lvTotalLiquido, lvTotalAD, lvTotalGeral : Real;
begin
Form_Pedidos.dm_Dados.dSetPedido.Locate('CD_PEDIDO', Form_Pedidos.lvLinhadbGrid, []);
//Tem que fechar e abrir a tabela de itens para filtrar somente os itens do pedido -- Verificar beforeOpen dSetItem
Form_Pedidos.dm_Dados.dSetItemPedido.Close;
Form_Pedidos.dm_Dados.dSetItemPedido.Open;

//Ajusta a procentagem para decimal
lvAcresDescon := (Form_Pedidos.dm_Dados.dSetPedidoVL_ACRESDESC.AsFloat / 100);


//Gera memo
memoTelaVenda.Lines.Add(StringOfChar('-', 150));
memoTelaVenda.Lines.Add(strPadChR('Venda:', '', 12)   + Form_Pedidos.dm_Dados.dSetPedidoCD_PEDIDO.AsString);
memoTelaVenda.Lines.Add(strPadChR('Cliente:', '', 12) + Form_Pedidos.dm_Dados.dSetPedidoNM_CLIENTE.AsString);
memoTelaVenda.Lines.Add(strPadChR('Endereço:', '', 12) + Form_Pedidos.dm_Dados.dSetPedidoDS_ENDERECO.AsString);
memoTelaVenda.Lines.Add(strPadChR('Cidade/UF:', '', 12) + Form_Pedidos.dm_Dados.dSetPedidoDS_CIDADE.AsString +
                                         '/' + Form_Pedidos.dm_Dados.dSetPedidoDS_UF.AsString);
memoTelaVenda.Lines.Add(StringOfChar('-', 150));


memoTelaVenda.Lines.Add(strPadChL('Produto', '', 7) +
                        strPadChL('Quantidade', '', 73) +
                        strPadChL('Unitario', '', 20) +
                        strPadChL('Acréscimo/Desconto', '', 30) +
                        strPadChL('Total', '', 20)
                         );

memoTelaVenda.Lines.Add(StringOfChar('-', 150));

Form_Pedidos.dm_Dados.dSetItemPedido.First;
while not Form_Pedidos.dm_Dados.dSetItemPedido.Eof do
begin
     if Form_Pedidos.dm_Dados.dSetPedidoST_ACRESDESC.AsString = 'A' then
     begin
          lvTotalAD := lvAcresDescon * Form_Pedidos.dm_Dados.dSetItemPedidoVL_VALORTOTAL.AsFloat;
          lvTotalLiquido := Form_Pedidos.dm_Dados.dSetItemPedidoVL_VALORTOTAL.AsFloat + lvTotalAD ;
     end
     else
     begin
          lvTotalAD := lvAcresDescon * Form_Pedidos.dm_Dados.dSetItemPedidoVL_VALORTOTAL.AsFloat;
          lvTotalLiquido := Form_Pedidos.dm_Dados.dSetItemPedidoVL_VALORTOTAL.AsFloat - lvTotalAD ;
     end;

     memoTelaVenda.Lines.Add(strPadChR(Form_Pedidos.dm_Dados.dSetItemPedidoDS_PRODUTO.AsString, '', 60) +
                             strPadChL(formatfloat('#0.00', Form_Pedidos.dm_Dados.dSetItemPedidoNR_QUANTIDADE.AsFloat), '', 20) +
                             strPadChL(formatfloat('#0.00', Form_Pedidos.dm_Dados.dSetItemPedidoVL_VALORUNITARIO.AsFloat), '', 20) +
                             strPadChL(Form_Pedidos.dm_Dados.dSetPedidoST_ACRESDESC.AsString + ' ' +
                                       formatfloat('#0.00', Form_Pedidos.dm_Dados.dSetPedidoVL_ACRESDESC.AsFloat) + '%', '', 30) +
                             strPadChL(formatfloat('#0.00', lvTotalLiquido), '', 20)
                              );
     lvTotalGeral := lvTotalGeral + lvTotalLiquido;
     Form_Pedidos.dm_Dados.dSetItemPedido.Next;
end;
memoTelaVenda.Lines.Add(StringOfChar('-', 150));
memoTelaVenda.Lines.Add(strPadChL('Total Liquido: R$' + formatfloat('#0.00', lvTotalGeral), '',150));
memoTelaVenda.Lines.Add(StringOfChar('-', 150));
end;
end.
