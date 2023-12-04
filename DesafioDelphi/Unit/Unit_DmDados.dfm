object dm_Padrao: Tdm_Padrao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 461
  Top = 303
  Height = 500
  Width = 574
  object dSetPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterPost = dSetPedidoAfterPost
    Left = 40
    Top = 32
    object dSetPedidoCD_PEDIDO: TIntegerField
      DisplayWidth = 23
      FieldName = 'CD_PEDIDO'
    end
    object dSetPedidoNM_CLIENTE: TStringField
      DisplayWidth = 62
      FieldName = 'NM_CLIENTE'
      Size = 100
    end
    object dSetPedidoDS_ENDERECO: TStringField
      DisplayWidth = 50
      FieldName = 'DS_ENDERECO'
      Size = 100
    end
    object dSetPedidoDS_CIDADE: TStringField
      DisplayWidth = 41
      FieldName = 'DS_CIDADE'
      Size = 100
    end
    object dSetPedidoDS_UF: TStringField
      DisplayWidth = 8
      FieldName = 'DS_UF'
      Size = 100
    end
    object dSetPedidoVL_VALOR: TFloatField
      DisplayWidth = 12
      FieldName = 'VL_VALOR'
      DisplayFormat = '###,##0.00'
      currency = True
    end
    object dSetPedidoVL_ACRESDESC: TFloatField
      FieldName = 'VL_ACRESDESC'
      DisplayFormat = '###,##0.00'
    end
    object dSetPedidoST_ACRESDESC: TStringField
      FieldName = 'ST_ACRESDESC'
      Size = 1
    end
  end
  object dSourcePedido: TDataSource
    DataSet = dSetPedido
    Left = 40
    Top = 80
  end
  object dSetItemPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = dSetItemPedidoAfterOpen
    BeforePost = dSetItemPedidoBeforePost
    AfterPost = dSetItemPedidoAfterPost
    Left = 128
    Top = 32
    object dSetItemPedidoCD_PEDIDO: TIntegerField
      FieldName = 'CD_PEDIDO'
    end
    object dSetItemPedidoCD_ITEMPEDIDO: TIntegerField
      FieldName = 'CD_ITEMPEDIDO'
    end
    object dSetItemPedidoDS_PRODUTO: TStringField
      FieldName = 'DS_PRODUTO'
      Size = 100
    end
    object dSetItemPedidoNR_QUANTIDADE: TFloatField
      FieldName = 'NR_QUANTIDADE'
    end
    object dSetItemPedidoVL_VALORUNITARIO: TFloatField
      FieldName = 'VL_VALORUNITARIO'
      DisplayFormat = '###,##0.00'
      currency = True
    end
    object dSetItemPedidoVL_VALORTOTAL: TFloatField
      FieldName = 'VL_VALORTOTAL'
      DisplayFormat = '###,##0.00'
      currency = True
    end
  end
  object dSourceItem: TDataSource
    DataSet = dSetItemPedido
    Left = 128
    Top = 80
  end
end
