INSERT INTO pos.listas_catalogos (cve_lista_catalogo,cve_empresa,catalogo,valores_catalogo,fecha_alta,estatus_registro) VALUES
	 (1,1,'tipo_cliente1','[{"id":"FÍSICA","value":"FÍSICA"},{"id":"MORAL","value":"MORAL"}]','2022-03-08 16:30:23','NVI'),
	 (2,1,'estatus_registro','[{"id":"VIG","value":"VIGENTE"},{"id":"NVG","value":"NO VIGENTE"}]','2022-03-08 16:31:28','VIG'),
	 (3,1,'estatus_corte_caja','[{"id":"ABIERTO","value":"ABIERTO"},{"id":"CERRADO","value":"CERRADO"}]','2022-03-08 16:32:20','VIG'),
	 (4,1,'tipo_entrada','[{"id":"COMPRA","value":"COMPRA"},{"id":"TRASPASO","value":"TRASPASO"},{"id":"NOTACREDITO","value":"NOTA CREDITO"}]','2022-03-08 16:33:24','VIG'),
	 (5,1,'estatus_entrada','[{"id":"CAPTURA","value":"CAPTURA"},{"id":"APLICADA","value":"APLICADA"},{"id":"CANCELADA","value":"CANCELADA"}]','2022-03-08 16:35:50','VIG'),
	 (6,1,'unidad_medida','[{"id":"METRO","value": "METRO"},{"id":"LITRO","value":"LITRO"},{"id": "PIEZA","value": "PIEZA"}]','2022-03-08 16:36:47','VIG'),
	 (11,1,'tipo_menu','{"MENÚ":"MENÚ","SUBMENÚ":"SUBMENÚ","OPCION":"OPCION"}','2022-03-08 16:40:09','VIG'),
	 (12,1,'medio_movimiento','{"EFECTIVO":"EFECTIVO","CHEQUES":"CHEQUES","VALES":"VALES","NOTACREDITO":"NOTACREDITO"}','2022-03-08 16:44:19','VIG'),
	 (13,1,'tipo_movimiento','{"ENTRADA":"ENTRADA","SALIDA":"SALIDA"}','2022-03-08 16:45:13','VIG'),
	 (14,1,'estatus_traspaso','{"CAPTURADO":"CAPTURADO","ENVIADO":"ENVIADO","RECIBIDO":"RECIBIDO","CANCELADO":"CANCELADO"}','2022-03-08 16:46:49','VIG');
INSERT INTO pos.listas_catalogos (cve_lista_catalogo,cve_empresa,catalogo,valores_catalogo,fecha_alta,estatus_registro) VALUES
	 (15,1,'tipo_venta','[{"id":"NORMAL","value":"NORMAL"},{"id":"SERVICIO","value":"SERVICIO"},{"id":"GARANTÍA","value":"GARANTÍA"}]','2022-03-08 16:48:14','VIG'),
	 (17,1,'tipo_comprobante','[{"id":"TICKET","value":"TICKET"},{"id":"FACTURA","value":"FACTURA"}]','2022-03-08 16:49:04','VIG'),
	 (18,1,'estatus_venta','{"ENCAPTURA":"ENCAPTURA","PORPAGAR":"PORPAGAR","PAGADA":"PAGADA","ENTREGADA":"ENTREGADA","FACTURAR":"FACTURAR","CERRADA":"CERRADA","CANCELADA":"CANCELADA"}','2022-03-08 18:36:10','VIG'),
	 (19,1,'estatus_venta_detalle','{"CAPTURADO":"CAPTURADO","CANCELADO":"CANCELADO","DEVUELTO":"DEVUELTO"}','2022-03-08 18:41:27','VIG'),
	 (20,1,'medio_pago','{"EFECTIVO":"EFECTIVO","TARJETA":"TARJETA","VALE":"VALE","CHEQUE":"CHEQUE","TRANSFERENCIA":"TRANSFERENCIA"}','2022-03-08 18:44:49','VIG'),
	 (21,1,'ventas_config','{"tipo_venta":"NORMAL","documento":"TICKET","imprimir":1,"cliente":{"cve_cliente":1,"cve_empresa":1,"cliente":"VENTAS EN MOSTRADOR","descuento_autorizado":0}}','2022-03-24 08:46:23','VIG'),
	 (22,1,'tipo_persona','[{"id":"F","value":"FÍSICA"},{"id":"M","value":"MORAL"}]','2022-03-24 08:51:57','VIG');