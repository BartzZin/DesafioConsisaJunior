unit Unit_Pedidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, Grids, DBGrids, Unit_DmDados, Mask,
  DBCtrls, xmldom, XMLIntf, msxmldom, XMLDoc, OleServer, Access2000;

type
  TForm_Pedidos = class(TForm)
    pnlHeadPrin: TPanel;
    DBGPedidos: TDBGrid;
    lblTitupoPrincipal: TLabel;
    pnlFooterPrin: TPanel;
    pnlCenterPrin: TPanel;
    GroupBox2: TGroupBox;
    lblCondPerson: TLabel;
    btnSimularVenda: TButton;
    btnNovoPrin: TBitBtn;
    btnEditarPrin: TBitBtn;
    btnExcluirPrin: TBitBtn;
    gbxPagamento: TGroupBox;
    rdgCondPagamento: TRadioGroup;
    dbCondPag: TDBEdit;
    gXmlPedido: TXMLDocument;
    procedure btnNovoPrinClick(Sender: TObject);
    procedure btnSimularVendaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEditarPrinClick(Sender: TObject);
    procedure btnExcluirPrinClick(Sender: TObject);
    procedure rdgCondPagamentoClick(Sender: TObject);
    procedure dbCondPagKeyPress(Sender: TObject; var Key: Char);
    procedure dbCondPagChange(Sender: TObject);
    procedure DBGPedidosCellClick(Column: TColumn);
  private
    { Private declarations }
     //novoPedido : Integer;
    function novoPedido: Integer;
    function ativaCampoCalc(status: Boolean; valor : Real ; tipo : String): Boolean;
    function geraXmlPedido: Boolean;

  public
    { Public declarations }
    dm_Dados : Tdm_Padrao;
    lvLinhadbGrid : Integer;
  end;

var
  Form_Pedidos: TForm_Pedidos;
  calculaAcresDesc: Boolean;

implementation

uses
     Unit_NewPedido, Unit_TelaVenda, DB;

{$R *.dfm}
//******************************************************************************
procedure TForm_Pedidos.btnNovoPrinClick(Sender: TObject);
var
form_NewPedido : TForm_NewPedidos;
lvNovoPedido : Integer;
begin
if dm_Dados.dSetPedido.State <> dsEdit then
begin
     form_NewPedido := TForm_NewPedidos.Create(Self);
     try
          lvNovoPedido := novoPedido();
          dm_Dados.dSetPedido.Append;
          dm_Dados.dSetPedidoCD_PEDIDO.AsInteger := lvNovoPedido;
          form_NewPedido.ShowModal;
     finally
          rdgCondPagamento.ItemIndex := -1;
          form_NewPedido.Free;
     end;
end else
begin
     MessageBox(Handle, 'Condição de pagamento selecionada, simule a venda para lançar um novo pedido!', 'Fechamento de Venda', MB_OK);
end;
end;

//******************************************************************************
procedure TForm_Pedidos.btnSimularVendaClick(Sender: TObject);
var
form_Venda : TForm_Venda;
begin
if dm_Dados.dSetPedido.State = dsEdit then
begin
     dm_Dados.dSetPedido.Post;
     geraXmlPedido;
     form_Venda := TForm_Venda.Create(Self);
     try
          form_Venda.geraVendaMemo;
          form_Venda.ShowModal;
     finally
          rdgCondPagamento.ItemIndex := -1;
          form_Venda.Free;
     end;
end else
begin
 MessageBox(Handle, 'Verifique se existe pedido selecionado no grid, ou se foi selecionada uma condição de Acréscimo/Desconto', 'Geração de Pedido', MB_OK);
end;
end;

//******************************************************************************
procedure TForm_Pedidos.FormCreate(Sender: TObject);
begin

dm_Dados := Tdm_Padrao.Create(Self);

//Cria Tabela Pedidos
dm_Dados.dSetPedido.Close;
dm_Dados.dSetPedido.CreateDataSet;
dm_Dados.dSetPedido.Open;
DBGPedidos.DataSource := dm_Dados.dSourcePedido;

//Cria Tabela Item
dm_Dados.dSetItemPedido.Close;
dm_Dados.dSetItemPedido.CreateDataSet;
dm_Dados.dSetItemPedido.Open;

calculaAcresDesc := False;
end;

//******************************************************************************
function TForm_Pedidos.novoPedido: Integer;
begin
dm_Dados.dSetPedido.Last;
result := dm_Dados.dSetPedidoCD_PEDIDO.AsInteger + 1;
end;

//******************************************************************************
procedure TForm_Pedidos.btnEditarPrinClick(Sender: TObject);
var
form_NewPedido : TForm_NewPedidos;
begin
if not dm_Dados.dSetPedido.IsEmpty then
begin
     form_NewPedido := TForm_NewPedidos.Create(Self);
     try
          dm_Dados.dSetPedido.Edit;
          form_NewPedido.ShowModal;
     finally
          form_NewPedido.Free;
     end;
end;
end;

//******************************************************************************
procedure TForm_Pedidos.btnExcluirPrinClick(Sender: TObject);
begin
if not dm_Dados.dSetPedido.IsEmpty then
begin
     dm_Dados.dSetItemPedido.Close;
     dm_Dados.dSetItemPedido.Open;

     //Limpa Itens do pedido.
     dm_Dados.dSetItemPedido.SaveToFile('C:\ItensPedidosDeletados.xml');
     dm_Dados.dSetItemPedido.First;
     while not dm_Dados.dSetItemPedido.Eof do
     begin
          dm_Dados.dSetItemPedido.Delete;
     end;

     //Limpa Pedido
     dm_Dados.dSetPedido.Delete;
     MessageBox(Handle, 'Pedido Deletado com sucesso!', 'Pedidos', MB_OK);
end;
end;

//******************************************************************************
procedure TForm_Pedidos.rdgCondPagamentoClick(Sender: TObject);
begin
case rdgCondPagamento.ItemIndex of
     0: ativaCampoCalc(False, 0, 'D');
     1: ativaCampoCalc(False, 5, 'D');
     2: ativaCampoCalc(False, 10, 'D');
     3: ativaCampoCalc(True, 0, 'D');
     4: ativaCampoCalc(False, 10, 'A');
     5: ativaCampoCalc(False, 12, 'A');
     6: ativaCampoCalc(True, 0, 'A');
end;
if dbCondPag.Enabled then
begin
     dbCondPag.SetFocus;
end;
end;

//******************************************************************************
function TForm_Pedidos.ativaCampoCalc(status: Boolean ; valor : Real ; tipo : String): Boolean;
begin
if not dm_Dados.dSetPedido.IsEmpty then
begin
     dm_Dados.dSetPedido.Edit;
     dbCondPag.Text := FloatToStr(valor);
     dm_Dados.dSetPedidoST_ACRESDESC.AsString := tipo;
     dbCondPag.Enabled := status;
     Result := status;
end;
end;

//******************************************************************************
function TForm_Pedidos.geraXmlPedido: Boolean;
var
XMLDoc: TXMLDocument;
RootNode, ItemNode: IXMLNode;
diretorioAtual: string;
vlAcresDesc : Real;
begin
// Cria um novo documento XML
XMLDoc := TXMLDocument.Create(nil);
XMLDoc.Active := True;


// Adiciona um nó Raiz
RootNode := XMLDoc.AddChild('Venda');

// Adiciona o nó de pedido
ItemNode := RootNode.AddChild('Pedido');

// Adiciona os campos como elementos filhos
ItemNode.AddChild('ID_Pedido').Text := dm_Dados.dSetPedidoCD_PEDIDO.AsString;
ItemNode.AddChild('Cliente').Text := dm_Dados.dSetPedidoNM_CLIENTE.AsString;
ItemNode.AddChild('Endereco').Text := dm_Dados.dSetPedidoDS_ENDERECO.AsString;
ItemNode.AddChild('Cidade').Text := dm_Dados.dSetPedidoDS_CIDADE.AsString;
ItemNode.AddChild('UF').Text := dm_Dados.dSetPedidoDS_UF.AsString;
ItemNode.AddChild('TotalBruto').Text := dm_Dados.dSetPedidoVL_VALOR.AsString;

vlAcresDesc := (dm_Dados.dSetPedidoVL_ACRESDESC.AsFloat / 100) * dm_Dados.dSetPedidoVL_VALOR.AsFloat;

if dm_Dados.dSetPedidoST_ACRESDESC.AsString = 'D' then
begin
     ItemNode.AddChild('Desconto').Text := dm_Dados.dSetPedidoVL_ACRESDESC.AsString;
     ItemNode.AddChild('TotalLiquido').Text := FloatToStr(dm_Dados.dSetPedidoVL_VALOR.AsFloat - vlAcresDesc);
end
else
begin
     ItemNode.AddChild('Acrescimo').Text := dm_Dados.dSetPedidoVL_ACRESDESC.AsString;
     ItemNode.AddChild('TotalLiquido').Text := FloatToStr(dm_Dados.dSetPedidoVL_VALOR.AsFloat + vlAcresDesc);
end;

// GeraItens do pedido
dm_Dados.dSetItemPedido.First;
while not dm_Dados.dSetItemPedido.Eof do
begin
     // Adicionar um nó de item
     ItemNode := RootNode.AddChild('PedidoItem');
     // Adicionar os campos como elementos filhos
     ItemNode.AddChild('IDItem').Text := dm_Dados.dSetItemPedidoCD_ITEMPEDIDO.AsString;
     ItemNode.AddChild('Produto').Text := dm_Dados.dSetItemPedidoDS_PRODUTO.AsString;
     ItemNode.AddChild('Quantidade').Text := dm_Dados.dSetItemPedidoNR_QUANTIDADE.AsString;
     ItemNode.AddChild('ValorUnitario').Text := dm_Dados.dSetItemPedidoVL_VALORUNITARIO.AsString;
     ItemNode.AddChild('ValorTotal').Text := dm_Dados.dSetItemPedidoVL_VALORTOTAL.AsString;
     dm_Dados.dSetItemPedido.Next;
end;

// Salva o XML no diretorio do executavel
diretorioAtual := GetCurrentDir;
XMLDoc.SaveToFile(diretorioAtual + '\venda' + dm_Dados.dSetPedidoCD_PEDIDO.AsString + '.xml');

dm_Dados.dSetPedido.SaveToFile(diretorioAtual + '\Pedidos.xml');
dm_Dados.dSetItemPedido.SaveToFile(diretorioAtual + '\ItensPedidos.xml');
end;

//******************************************************************************
procedure TForm_Pedidos.dbCondPagKeyPress(Sender: TObject; var Key: Char);
begin
end;

//******************************************************************************
procedure TForm_Pedidos.dbCondPagChange(Sender: TObject);
begin
//Pequena gambiarra pra remover o E do campo.
dbCondPag.Text := StringReplace(dbCondPag.Text, 'E', '', [rfIgnoreCase]);
end;

//******************************************************************************
procedure TForm_Pedidos.DBGPedidosCellClick(Column: TColumn);
begin
lvLinhadbGrid := dm_Dados.dSetPedidoCD_PEDIDO.AsInteger;
end;

end.
