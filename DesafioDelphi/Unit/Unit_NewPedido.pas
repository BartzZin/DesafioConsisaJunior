unit Unit_NewPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls, DB;

type
  TForm_NewPedidos = class(TForm)
    pnlHeaderSec: TPanel;
    pnlFooterSec: TPanel;
    pnlBodySec: TPanel;
    lblTitleSec: TLabel;
    lblBodyTitle: TLabel;
    dbgPedidos: TDBGrid;
    lblSecTotal: TLabel;
    lblLancItem: TLabel;
    dbNavItemPed: TDBNavigator;
    btnSecCancelar: TBitBtn;
    dbeItemProd: TDBEdit;
    lblSecProduto: TLabel;
    lblSecQuantidade: TLabel;
    dbeItemQuant: TDBEdit;
    lblSexValorUni: TLabel;
    dbeItemValor: TDBEdit;
    lblSecPedido: TLabel;
    lblSecNomeCli: TLabel;
    lblSecEnd: TLabel;
    dbeSecPedido: TDBEdit;
    dbeSecNomeCli: TDBEdit;
    dbeSecEnd: TDBEdit;
    lblSecCidade: TLabel;
    dbeSecCidade: TDBEdit;
    lblSecUf: TLabel;
    dbeSecUf: TDBEdit;
    pnlLineFooter: TPanel;
    btnSecGravar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnSecCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGrClick(Sender: TObject);
    procedure dbeItemQuantChange(Sender: TObject);
    procedure dbeItemValorChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function validaPedido: Boolean;


  end;

var
  Form_NewPedidos: TForm_NewPedidos;

implementation

uses
  Unit_Pedidos, Unit_DmDados;

{$R *.dfm}

procedure TForm_NewPedidos.FormCreate(Sender: TObject);
begin
//Vincula Pedidos
dbeSecPedido.DataSource := Form_Pedidos.dm_Dados.dSourcePedido;
dbeSecNomeCli.DataSource := Form_Pedidos.dm_Dados.dSourcePedido;
dbeSecEnd.DataSource := Form_Pedidos.dm_Dados.dSourcePedido;
dbeSecCidade.DataSource := Form_Pedidos.dm_Dados.dSourcePedido;
dbeSecUf.DataSource := Form_Pedidos.dm_Dados.dSourcePedido;

//Vincula Grid de Itens
dbgPedidos.DataSource := Form_Pedidos.dm_Dados.dSourceItem;
end;

//******************************************************************************
procedure TForm_NewPedidos.btnSecCancelarClick(Sender: TObject);
begin
if validaPedido then
begin
     MessageBox(Handle, 'Verifique se todos os campos obrigat�rios foram preenchidos corretamente!', 'Pedido de Venda', MB_OK);
end
else
begin
     Form_Pedidos.dm_Dados.dSetPedido.Cancel;
end;
end;

//******************************************************************************
procedure TForm_NewPedidos.FormShow(Sender: TObject);
begin
Form_Pedidos.dm_Dados.dSetItemPedido.Close;
Form_Pedidos.dm_Dados.dSetItemPedido.Open;

lblSecTotal.Caption := 'Valor Total: ' + Form_Pedidos.dm_Dados.dSetPedidoVL_VALOR.AsString;
end;

//******************************************************************************
procedure TForm_NewPedidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Form_Pedidos.dm_Dados.contadorItem := 1;
end;

//******************************************************************************
procedure TForm_NewPedidos.btnGrClick(Sender: TObject);
begin
if validaPedido then
begin
     MessageBox(Handle, 'Verifique se todos os campos obrigat�rios foram preenchidos corretamente!', 'Pedido de Venda', MB_OK);
end
else
begin
     if Form_Pedidos.dm_Dados.dSetItemPedido.State <> dsInsert then
     begin
          try

               if Form_Pedidos.dm_Dados.dSetPedido.State = dsEdit then
               begin
                    Form_Pedidos.dm_Dados.atualizaSaldoVenda;
                    Form_Pedidos.dm_Dados.dSetPedido.Post;
               end;
          except
          MessageDlg('Falha ao gravar pedido!', mtWarning, [mbOK], 0);
          end;

          Close;
     end
     else
     begin
          MessageBox(Handle, 'Grave o lan�amento os itens para finalizar o pedido!', 'Desafio Delphi', MB_OK);
     end;
end;
end;

//******************************************************************************
function TForm_NewPedidos.validaPedido: Boolean;
var
itensValidacao : array[0..2] of String;
Contador: Integer;
lvValidacao: Boolean;
begin
lvValidacao := False;
Form_Pedidos.dm_Dados.dSetItemPedido.First;

while not Form_Pedidos.dm_Dados.dSetItemPedido.Eof do
begin

     itensValidacao[0] := Trim(Form_Pedidos.dm_Dados.dSetItemPedidoDS_PRODUTO.AsString);
     itensValidacao[1] := Trim(Form_Pedidos.dm_Dados.dSetItemPedidoNR_QUANTIDADE.AsString);
     itensValidacao[2] := Trim(Form_Pedidos.dm_Dados.dSetItemPedidoVL_VALORUNITARIO.AsString);

     for Contador := 0 to 2 do
     begin
       if itensValidacao[Contador] = '' then
       begin
          //Aqui ele retorna true se um dos campos estiver vazio, Apresenta mensagem se True se n�o deixa prosseguir.
         lvValidacao := True;
       end;
     end;

     Form_Pedidos.dm_Dados.dSetItemPedido.Next;
end;

Result := lvValidacao;
end;

//******************************************************************************
procedure TForm_NewPedidos.dbeItemQuantChange(Sender: TObject);
begin
//Pequena gambiarra pra remover o E do campo numerico.
dbeItemQuant.Text := StringReplace(dbeItemQuant.Text, 'E', '', [rfIgnoreCase]);
end;

//******************************************************************************
procedure TForm_NewPedidos.dbeItemValorChange(Sender: TObject);
begin
//Pequena gambiarra pra remover o E do campo numerico.
dbeItemValor.Text := StringReplace(dbeItemValor.Text, 'E', '', [rfIgnoreCase]);
end;

//******************************************************************************
end.
