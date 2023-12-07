object Form_Pedidos: TForm_Pedidos
  Left = 442
  Top = 236
  Width = 1199
  Height = 628
  Caption = 'Desafio Delphi'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHeadPrin: TPanel
    Left = 0
    Top = 0
    Width = 1183
    Height = 589
    Align = alClient
    Color = clSkyBlue
    TabOrder = 0
    object lblTitupoPrincipal: TLabel
      Left = 1
      Top = 1
      Width = 1181
      Height = 29
      Align = alTop
      Alignment = taCenter
      Caption = 'Pedidos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGPedidos: TDBGrid
      Left = 1
      Top = 30
      Width = 1181
      Height = 323
      Align = alClient
      DataSource = dm_Padrao.dSourcePedido
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGPedidosCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CD_PEDIDO'
          Title.Caption = 'Nro. Pedido'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_CLIENTE'
          Title.Caption = 'Cliente'
          Width = 282
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_CIDADE'
          Title.Caption = 'Cidade'
          Width = 284
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_ENDERECO'
          Title.Caption = 'Endereco'
          Width = 276
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_UF'
          Title.Caption = 'Uf'
          Width = 149
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_VALOR'
          Title.Caption = 'Valor'
          Width = 189
          Visible = True
        end>
    end
    object pnlFooterPrin: TPanel
      Left = 1
      Top = 410
      Width = 1181
      Height = 178
      Align = alBottom
      Color = clSkyBlue
      TabOrder = 1
      object gbxPagamento: TGroupBox
        Left = 1
        Top = 1
        Width = 1179
        Height = 176
        Align = alClient
        Caption = 'Impress'#227'o de Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          1179
          176)
        object btnSimularVenda: TButton
          Left = 972
          Top = 127
          Width = 182
          Height = 26
          Anchors = [akTop, akRight]
          Caption = 'Simular Venda em Memo'
          TabOrder = 0
          OnClick = btnSimularVendaClick
        end
        object GroupBox2: TGroupBox
          Left = 970
          Top = 20
          Width = 185
          Height = 105
          Anchors = [akTop, akRight]
          Caption = 'Condi'#231#227'o Personalizada'
          TabOrder = 1
          object lblCondPerson: TLabel
            Left = 55
            Top = 49
            Width = 16
            Height = 20
            Caption = '%'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbCondPag: TDBEdit
            Left = 80
            Top = 48
            Width = 97
            Height = 24
            DataField = 'VL_ACRESDESC'
            DataSource = dm_Padrao.dSourcePedido
            Enabled = False
            MaxLength = 4
            TabOrder = 0
            OnChange = dbCondPagChange
          end
        end
        object rdgCondPagamento: TRadioGroup
          Left = 24
          Top = 20
          Width = 937
          Height = 133
          Caption = 'Condi'#231#227'o de Pagamento'
          Columns = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Items.Strings = (
            'A Vista Sem Desconto'
            'A Vista com Desconto de 5%'
            'A Vista com Desconto de 10%'
            'A Vista com Desconto de (Informar %)'
            'Acrescimo de 10%'
            'Acrescimo de 12%'
            'Acrescimo de (Informar %)')
          ParentFont = False
          TabOrder = 2
          OnClick = rdgCondPagamentoClick
        end
      end
    end
    object pnlCenterPrin: TPanel
      Left = 1
      Top = 353
      Width = 1181
      Height = 57
      Align = alBottom
      Color = clSkyBlue
      TabOrder = 2
      DesignSize = (
        1181
        57)
      object btnNovoPrin: TBitBtn
        Left = 344
        Top = 8
        Width = 161
        Height = 33
        Caption = '&Novo - F8'
        TabOrder = 0
        OnClick = btnNovoPrinClick
        Kind = bkYes
      end
      object btnEditarPrin: TBitBtn
        Left = 520
        Top = 8
        Width = 161
        Height = 33
        Anchors = [akTop]
        Caption = '&Editar - F7'
        TabOrder = 1
        OnClick = btnEditarPrinClick
        Kind = bkRetry
      end
      object btnExcluirPrin: TBitBtn
        Left = 696
        Top = 8
        Width = 161
        Height = 33
        Anchors = [akTop, akRight]
        Caption = 'Excluir - F6'
        TabOrder = 2
        OnClick = btnExcluirPrinClick
        Kind = bkAbort
      end
    end
  end
  object gXmlPedido: TXMLDocument
    Left = 1136
    DOMVendorDesc = 'MSXML'
  end
  object ActionList: TActionList
    Left = 1136
    Top = 32
    object AC_F8: TAction
      Caption = 'AC_F8'
      ShortCut = 119
      OnExecute = AC_F8Execute
    end
    object AC_F7: TAction
      Caption = 'AC_F7'
      ShortCut = 118
      OnExecute = AC_F7Execute
    end
    object AC_F6: TAction
      Caption = 'AC_F6'
      ShortCut = 117
      OnExecute = AC_F6Execute
    end
  end
end
