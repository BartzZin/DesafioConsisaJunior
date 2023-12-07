object Form_NewPedidos: TForm_NewPedidos
  Left = 425
  Top = 342
  Width = 1184
  Height = 615
  Caption = 'Desafio Delphi'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHeaderSec: TPanel
    Left = 0
    Top = 0
    Width = 1168
    Height = 129
    Align = alTop
    Color = clSkyBlue
    TabOrder = 0
    object lblTitleSec: TLabel
      Left = 1
      Top = 1
      Width = 1166
      Height = 29
      Align = alTop
      Alignment = taCenter
      Caption = 'Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSecPedido: TLabel
      Left = 87
      Top = 40
      Width = 72
      Height = 16
      Caption = 'Nro. Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblSecNomeCli: TLabel
      Left = 59
      Top = 65
      Width = 100
      Height = 16
      Caption = 'Nome do Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblSecEnd: TLabel
      Left = 100
      Top = 90
      Width = 59
      Height = 16
      Caption = 'Endere'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblSecCidade: TLabel
      Left = 656
      Top = 90
      Width = 44
      Height = 16
      Caption = 'Cidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblSecUf: TLabel
      Left = 994
      Top = 90
      Width = 18
      Height = 16
      Caption = 'UF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object dbeSecPedido: TDBEdit
      Left = 164
      Top = 39
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CD_PEDIDO'
      DataSource = dm_Padrao.dSourcePedido
      ReadOnly = True
      TabOrder = 0
    end
    object dbeSecNomeCli: TDBEdit
      Left = 164
      Top = 64
      Width = 973
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NM_CLIENTE'
      DataSource = dm_Padrao.dSourcePedido
      MaxLength = 50
      TabOrder = 1
    end
    object dbeSecEnd: TDBEdit
      Left = 164
      Top = 89
      Width = 469
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DS_ENDERECO'
      DataSource = dm_Padrao.dSourcePedido
      MaxLength = 50
      TabOrder = 2
    end
    object dbeSecCidade: TDBEdit
      Left = 704
      Top = 89
      Width = 265
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DS_CIDADE'
      DataSource = dm_Padrao.dSourcePedido
      MaxLength = 50
      TabOrder = 3
    end
    object dbeSecUf: TDBEdit
      Left = 1016
      Top = 89
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DS_UF'
      DataSource = dm_Padrao.dSourcePedido
      MaxLength = 2
      TabOrder = 4
    end
  end
  object pnlFooterSec: TPanel
    Left = 0
    Top = 399
    Width = 1168
    Height = 177
    Align = alBottom
    Color = clSkyBlue
    TabOrder = 1
    object lblLancItem: TLabel
      Left = 1
      Top = 1
      Width = 1166
      Height = 29
      Align = alTop
      Alignment = taCenter
      Caption = 'Lan'#231'amento de Item'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSecProduto: TLabel
      Left = 120
      Top = 49
      Width = 47
      Height = 16
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblSecQuantidade: TLabel
      Left = 617
      Top = 49
      Width = 70
      Height = 16
      Caption = 'Quantidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblSexValorUni: TLabel
      Left = 864
      Top = 49
      Width = 81
      Height = 16
      Caption = 'Valor Unit'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object dbNavItemPed: TDBNavigator
      Left = 400
      Top = 80
      Width = 360
      Height = 33
      DataSource = dm_Padrao.dSourceItem
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
      TabOrder = 0
    end
    object btnSecCancelar: TBitBtn
      Left = 696
      Top = 128
      Width = 219
      Height = 41
      Caption = 'Cancelar Pedido'
      TabOrder = 1
      OnClick = btnSecCancelarClick
      Kind = bkAbort
    end
    object dbeItemProd: TDBEdit
      Left = 176
      Top = 48
      Width = 401
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DS_PRODUTO'
      DataSource = dm_Padrao.dSourceItem
      MaxLength = 50
      TabOrder = 2
    end
    object dbeItemQuant: TDBEdit
      Left = 696
      Top = 48
      Width = 129
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NR_QUANTIDADE'
      DataSource = dm_Padrao.dSourceItem
      MaxLength = 9
      TabOrder = 3
      OnChange = dbeItemQuantChange
    end
    object dbeItemValor: TDBEdit
      Left = 952
      Top = 48
      Width = 145
      Height = 21
      CharCase = ecUpperCase
      DataField = 'VL_VALORUNITARIO'
      DataSource = dm_Padrao.dSourceItem
      MaxLength = 9
      TabOrder = 4
      OnChange = dbeItemValorChange
    end
    object pnlLineFooter: TPanel
      Left = 152
      Top = 121
      Width = 900
      Height = 3
      Color = clBackground
      TabOrder = 5
    end
    object btnSecGravar: TButton
      Left = 936
      Top = 128
      Width = 219
      Height = 41
      Caption = 'Gravar Pedido'
      TabOrder = 6
      OnClick = btnGrClick
    end
  end
  object pnlBodySec: TPanel
    Left = 0
    Top = 129
    Width = 1168
    Height = 270
    Align = alClient
    Color = clActiveCaption
    TabOrder = 2
    object lblBodyTitle: TLabel
      Left = 1
      Top = 1
      Width = 1166
      Height = 29
      Align = alTop
      Alignment = taCenter
      Caption = 'Itens'
      Color = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lblSecTotal: TLabel
      Left = 1
      Top = 240
      Width = 1166
      Height = 29
      Align = alBottom
      Alignment = taRightJustify
      Caption = 'Valor total: '
      Color = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object dbgPedidos: TDBGrid
      Left = 1
      Top = 30
      Width = 1166
      Height = 210
      Align = alClient
      DataSource = dm_Padrao.dSourceItem
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CD_ITEMPEDIDO'
          Title.Caption = 'Codigo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_PRODUTO'
          Title.Caption = 'Produto'
          Width = 526
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_QUANTIDADE'
          Title.Caption = 'Quantidade'
          Width = 168
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_VALORUNITARIO'
          Title.Caption = 'Valor Unit.'
          Width = 184
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_VALORTOTAL'
          Title.Caption = 'Valor Total'
          Width = 191
          Visible = True
        end>
    end
  end
end
