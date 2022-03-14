-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: pos
-- ------------------------------------------------------
-- Server version	5.5.5-10.7.3-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cajas`
--

DROP TABLE IF EXISTS `cajas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cajas` (
  `cve_caja` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de cajas',
  `cve_sucursal` int(11) NOT NULL COMMENT 'Identificador del catálogo de sucursales',
  `caja` varchar(100) DEFAULT NULL COMMENT 'Descripción de la caja',
  `codigo_caja` varchar(50) DEFAULT NULL COMMENT 'Código que identifica a la caja en la sucursal',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_caja`) USING BTREE,
  KEY `fk_sucursal_caja` (`cve_sucursal`) USING BTREE,
  CONSTRAINT `fk_sucursal_caja` FOREIGN KEY (`cve_sucursal`) REFERENCES `sucursales` (`cve_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Catálogo de cajas registradoras de cobro';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cajas`
--

LOCK TABLES `cajas` WRITE;
/*!40000 ALTER TABLE `cajas` DISABLE KEYS */;
INSERT INTO `cajas` VALUES (1,1,'CAJA1','S1C1','2022-03-08 21:30:25','VIG'),(2,2,'CAJA1','S2C1','2022-03-08 21:30:50','VIG');
/*!40000 ALTER TABLE `cajas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `cve_categoria` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de categorias',
  `cve_empresa` int(11) DEFAULT NULL COMMENT 'Identificador del catálogo de empresas',
  `categoria` varchar(200) NOT NULL COMMENT 'Descripción de la categoria',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_categoria`) USING BTREE,
  KEY `fk_empresas_categorias` (`cve_empresa`) USING BTREE,
  CONSTRAINT `fk_empresas_categorias` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Catálogo de categorías de productos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,1,'BATERIAS','2022-03-08 21:32:40','VIG'),(2,1,'FRENOS','2022-03-08 21:32:47','VIG'),(3,1,'PLASTICOS','2022-03-08 21:33:34','VIG'),(4,1,'BUJIAS','2022-03-08 21:34:31','VIG'),(5,1,'BALATAS Y ZAPATAS','2022-03-08 21:36:48','VIG'),(6,1,'ACCESORIOS','2022-03-08 21:37:48','VIG'),(7,1,'REFACCIONES','2022-03-08 21:38:35','VIG'),(8,1,'TANQUES','2022-03-08 21:39:22','VIG'),(9,1,'AMORTIGUADORES','2022-03-08 21:40:43','VIG'),(10,1,'ESCAPES','2022-03-08 21:41:50','VIG'),(11,1,'FAROS','2022-03-08 21:42:31','VIG');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `cve_cliente` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de clientes',
  `cve_empresa` int(11) NOT NULL COMMENT 'Identificador del catálogo de empresas',
  `cliente` varchar(500) NOT NULL COMMENT 'Nombre o razón social del cliente',
  `tipo_cliente` varchar(10) NOT NULL DEFAULT 'F' COMMENT 'Tipo de cliente: M = Moral o F= Física',
  `rfc_cliente` varchar(50) DEFAULT NULL COMMENT 'RFC del cliente',
  `direccion_cliente` varchar(100) DEFAULT NULL COMMENT 'Dirección fiscal del cliente',
  `correo_cliente` varchar(100) DEFAULT NULL COMMENT 'Correo electrónico del cliente',
  `celular_cliente` varchar(100) DEFAULT NULL COMMENT 'Número de celular del cliente',
  `descuento_autorizado` int(11) DEFAULT NULL COMMENT 'Porcentaje de descuento autorizado',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_cliente`) USING BTREE,
  KEY `fk_empresa_cliente` (`cve_empresa`) USING BTREE,
  CONSTRAINT `fk_empresa_cliente` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Catálogo de clientes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,1,'VENTAS EN MOSTRADOR','F','XXXX1212121XX','','',NULL,NULL,'2022-03-08 21:44:56','VIG'),(2,1,'ROMAN DE LA CRUZ MARTINEZ PEÑA','F','CUMR070701HG3','AV. LAS GARZAS # 35, COL. CENTRO, VILLAHERMOSA, TABASCO. CP. 86210','ROMANDLCMP@GMAIL.COM','9988556644',10,'2022-03-08 22:03:41','VIG'),(3,1,'SELENE DEL CARMEN LOPEZ OSORIO','F','LOOS050505LL3','AV. GARDENAS NUM. 23, COL. PORFIRIO DIAZ, CENTLA TABASCO. CP. 85210','SELENELO@HOTMAIL.COM','9934125566',0,'2022-03-08 22:05:10','VIG'),(4,2,'CLIENTE QUE NO SE DEBE VER EN LA EMPRESA UNO','M','CIN040404WS1','CARRETERA VILLAHERMOSA A FRONTERA KM. 11.5, FRENTE A LA GRAVERA, VILLAHERMOSA, TABASCO. C.P. 86254','CLIENTENO@GMAIL.COM','9935886655',5,'2022-03-08 22:08:37','VIG');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cortes_cajas`
--

DROP TABLE IF EXISTS `cortes_cajas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cortes_cajas` (
  `cve_corte_caja` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del corte de caja',
  `codigo_corte_caja` varchar(255) DEFAULT NULL COMMENT 'Código que identifica al corte de caja',
  `cve_caja` int(11) NOT NULL COMMENT 'Identificador del catálogo de caja',
  `fecha_inicio` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Fecha y hora de inicio del corte de caja',
  `fecha_cierre` timestamp NULL DEFAULT NULL COMMENT 'Fecha y hora de cierre del corte de caja',
  `monto_inicial` decimal(11,2) DEFAULT NULL COMMENT 'Monto inicial de efectivo',
  `estatus_corte_caja` varchar(50) DEFAULT NULL COMMENT 'Estatus del corte de caja: ABIERTO, CERRADO',
  `usuario_alta` varchar(50) DEFAULT NULL COMMENT 'Clave de usuario que da de alta el registro',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_corte_caja`) USING BTREE,
  KEY `fk_caja_cortes_cajas` (`cve_caja`) USING BTREE,
  CONSTRAINT `fk_caja_cortes_cajas` FOREIGN KEY (`cve_caja`) REFERENCES `cajas` (`cve_caja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Almacena los cortes de caja';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cortes_cajas`
--

LOCK TABLES `cortes_cajas` WRITE;
/*!40000 ALTER TABLE `cortes_cajas` DISABLE KEYS */;
/*!40000 ALTER TABLE `cortes_cajas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresas` (
  `cve_empresa` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de empresas',
  `empresa` varchar(200) NOT NULL COMMENT 'Nombre o razón social de la empresa',
  `rfc` varchar(50) DEFAULT NULL COMMENT 'RFC de la empresa',
  `url` varchar(200) DEFAULT NULL COMMENT 'URL o dirección de la página web',
  `logotipo` varchar(200) DEFAULT NULL COMMENT 'URL del logotipo de la empresa',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_empresa`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Catálogo de empresas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (1,'REFACCIONES ITALIKA S.A DE C.V.','REFI121212A22','italika.com.mx',NULL,'2022-03-08 20:44:52','VIG'),(2,'EMPRESA DOS PARA VALIDAR LA DIFERENCIA DE INFORMACION','EED120606GG5','miempresa.com',NULL,'2022-03-08 21:57:43','VIG');
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entradas`
--

DROP TABLE IF EXISTS `entradas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entradas` (
  `cve_entrada` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro de entrada de material',
  `cve_sucursal` int(11) NOT NULL COMMENT 'Identificador del catálogo de sucursales',
  `cve_proveedor` int(11) DEFAULT NULL COMMENT 'Identificador del catálogo de proveedores',
  `cve_traspaso_sucursal` int(11) DEFAULT NULL COMMENT 'Identificador del registro de traspasos de material',
  `fecha_entrada` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Fecha de entrada del material',
  `tipo_entrada` varchar(50) DEFAULT NULL COMMENT 'Tipo de entrada: COMPRA,TRASPASO,NOTA CREDITO',
  `comprobante_entrada` varchar(50) DEFAULT NULL COMMENT 'Comprobante del documento que da origen a la entrada',
  `estatus_entrada` varchar(50) NOT NULL DEFAULT 'CAPTURA' COMMENT 'Indica el estatus de la entrada: CAPTURA, APLICADA, CANCELADA',
  `usuario_alta` varchar(50) DEFAULT NULL COMMENT 'Clave de usuario que da de alta el registro',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_entrada`) USING BTREE,
  KEY `fk_sucursal_entrada` (`cve_sucursal`) USING BTREE,
  KEY `fk_proveedor_entrada` (`cve_proveedor`) USING BTREE,
  CONSTRAINT `fk_proveedor_entrada` FOREIGN KEY (`cve_proveedor`) REFERENCES `proveedores` (`cve_proveedor`),
  CONSTRAINT `fk_sucursal_entrada` FOREIGN KEY (`cve_sucursal`) REFERENCES `sucursales` (`cve_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Almacena las entradas de material';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entradas`
--

LOCK TABLES `entradas` WRITE;
/*!40000 ALTER TABLE `entradas` DISABLE KEYS */;
/*!40000 ALTER TABLE `entradas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entradas_productos`
--

DROP TABLE IF EXISTS `entradas_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entradas_productos` (
  `cve_entrada_producto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del detalle de entrada de material',
  `cve_entrada` int(11) NOT NULL COMMENT 'Identificador del registro de entrada de material',
  `cve_producto` int(11) NOT NULL COMMENT 'Identificador del catálogo de productos',
  `fecha_entrada` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `cantidad_entrada` int(11) DEFAULT NULL COMMENT 'Cantidad de material que entra',
  `precio_entrada` decimal(11,2) DEFAULT NULL COMMENT 'Precio de compra del material',
  `unidad_medida` varchar(50) DEFAULT NULL COMMENT 'Unidad de medida del material: PIEZA, LITRO, METRO',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_entrada_producto`) USING BTREE,
  KEY `fk_producto_entrada` (`cve_producto`) USING BTREE,
  KEY `fk_entrada_entrada_producto` (`cve_entrada`) USING BTREE,
  CONSTRAINT `fk_entrada_entrada_producto` FOREIGN KEY (`cve_entrada`) REFERENCES `entradas` (`cve_entrada`),
  CONSTRAINT `fk_producto_entrada` FOREIGN KEY (`cve_producto`) REFERENCES `productos` (`cve_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Almacena el detalle de las entradas de material';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entradas_productos`
--

LOCK TABLES `entradas_productos` WRITE;
/*!40000 ALTER TABLE `entradas_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `entradas_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impuestos`
--

DROP TABLE IF EXISTS `impuestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `impuestos` (
  `cve_impuesto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de impuestos',
  `cve_empresa` int(11) DEFAULT NULL COMMENT 'Clave del catálogo de empresas',
  `impuesto` varchar(100) NOT NULL COMMENT 'Descripcion, código o nombre del impuesto',
  `tasa` decimal(11,2) NOT NULL COMMENT 'Tasa aplica del impuesto',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_impuesto`) USING BTREE,
  KEY `fk_empresa_impuestos` (`cve_empresa`) USING BTREE,
  CONSTRAINT `fk_empresa_impuestos` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Catálogos de impuestos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impuestos`
--

LOCK TABLES `impuestos` WRITE;
/*!40000 ALTER TABLE `impuestos` DISABLE KEYS */;
INSERT INTO `impuestos` VALUES (1,1,'IVA',0.16,'2022-03-08 21:45:19','VIG');
/*!40000 ALTER TABLE `impuestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listas_catalogos`
--

DROP TABLE IF EXISTS `listas_catalogos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listas_catalogos` (
  `cve_lista_catalogo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la lista de catálogos',
  `cve_empresa` int(11) NOT NULL COMMENT 'Identificador del catálogo de empresas',
  `catalogo` varchar(100) NOT NULL COMMENT 'Nombre o descripción del catálogo',
  `valores_catalogo` varchar(2000) NOT NULL COMMENT 'Valores de los catálogos',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_lista_catalogo`) USING BTREE,
  KEY `fk_empresa_catalogos` (`cve_empresa`) USING BTREE,
  CONSTRAINT `fk_empresa_catalogo` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Contiene los valores de las listas de catálogos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listas_catalogos`
--

LOCK TABLES `listas_catalogos` WRITE;
/*!40000 ALTER TABLE `listas_catalogos` DISABLE KEYS */;
INSERT INTO `listas_catalogos` VALUES (1,1,'tipo_cliente','{\"FÍSICA\":\"FÍSICA\",\"MORAL\":\"MORAL\"}','2022-03-08 22:30:23','VIG'),(2,1,'estatus_registro','{\"VIG\":\"VIGENTE\",\"NVG\":\"NO VIGENTE\"}','2022-03-08 22:31:28','VIG'),(3,1,'estatus_corte_caja','{\"ABIERTO\":\"ABIERTO\",\"CERRADO\":\"CERRADO\"}','2022-03-08 22:32:20','VIG'),(4,1,'tipo_entrada','{\"COMPRA\":\"COMPRA\",\"TRASPASO\":\"TRASPASO\", \"NOTACREDITO\":\"NOTACREDITO\"}','2022-03-08 22:33:24','VIG'),(5,1,'estatus_entrada','{\"CAPTURA\":\"CAPTURA\",\"APLICADA\":\"APLICADA\",\"CANCELADA\":\"CANCELADA\"}','2022-03-08 22:35:50','VIG'),(6,1,'unidad_medida','{\"PIEZA\":\"PIEZA\", \"LITRO\":\"LITRO\", \"METRO\":\"METRO\"}','2022-03-08 22:36:47','VIG'),(11,1,'tipo_menu','{\"MENÚ\":\"MENÚ\",\"SUBMENÚ\":\"SUBMENÚ\",\"OPCION\":\"OPCION\"}','2022-03-08 22:40:09','VIG'),(12,1,'medio_movimiento','{\"EFECTIVO\":\"EFECTIVO\",\"CHEQUES\":\"CHEQUES\",\"VALES\":\"VALES\",\"NOTACREDITO\":\"NOTACREDITO\"}','2022-03-08 22:44:19','VIG'),(13,1,'tipo_movimiento','{\"ENTRADA\":\"ENTRADA\",\"SALIDA\":\"SALIDA\"}','2022-03-08 22:45:13','VIG'),(14,1,'estatus_traspaso','{\"CAPTURADO\":\"CAPTURADO\",\"ENVIADO\":\"ENVIADO\",\"RECIBIDO\":\"RECIBIDO\",\"CANCELADO\":\"CANCELADO\"}','2022-03-08 22:46:49','VIG'),(15,1,'tipo_venta','{\"NORMAL\":\"NORMAL\",\"SERVICIO\":\"SERVICIO\",\"GARANTÍA\":\"GARANTÍA\"}','2022-03-08 22:48:14','VIG'),(17,1,'tipo_comprobante','{\"TICKET\":\"TICKET\",\"FACTURA\":\"FACTURA\"}','2022-03-08 22:49:04','VIG'),(18,1,'estatus_venta','{\"ENCAPTURA\":\"ENCAPTURA\",\"PORPAGAR\":\"PORPAGAR\",\"PAGADA\":\"PAGADA\",\"ENTREGADA\":\"ENTREGADA\",\"FACTURAR\":\"FACTURAR\",\"CERRADA\":\"CERRADA\",\"CANCELADA\":\"CANCELADA\"}','2022-03-09 00:36:10','VIG'),(19,1,'estatus_venta_detalle','{\"CAPTURADO\":\"CAPTURADO\",\"CANCELADO\":\"CANCELADO\",\"DEVUELTO\":\"DEVUELTO\"}','2022-03-09 00:41:27','VIG'),(20,1,'medio_pago','{\"EFECTIVO\":\"EFECTIVO\",\"TARJETA\":\"TARJETA\",\"VALE\":\"VALE\",\"CHEQUE\":\"CHEQUE\",\"TRANSFERENCIA\":\"TRANSFERENCIA\"}','2022-03-09 00:44:49','VIG');
/*!40000 ALTER TABLE `listas_catalogos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mano_obra`
--

DROP TABLE IF EXISTS `mano_obra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mano_obra` (
  `cve_mano_obra` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de mano de obra',
  `cve_empresa` int(11) NOT NULL COMMENT 'Identificador del catálogo de empresas',
  `mano_obra` varchar(200) NOT NULL COMMENT 'Nombre de la mano de obra',
  `desc_mano_obra` varchar(2000) DEFAULT NULL COMMENT 'Descripción de la mano de obra',
  `duracion` decimal(11,2) DEFAULT NULL COMMENT 'Duración en horas de la mano de obra',
  `costo_mano_obra` decimal(11,2) DEFAULT NULL COMMENT 'Costo o precio de la mano de obra',
  `porcentaje_tecnico` int(11) DEFAULT NULL COMMENT 'Porcentaje que se le paga al técnico que realiza la mano de obra',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_mano_obra`) USING BTREE,
  KEY `fk_empresa_mano_obra` (`cve_empresa`) USING BTREE,
  CONSTRAINT `fk_empresa_mano_obra` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Catálogo de mano de obra';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mano_obra`
--

LOCK TABLES `mano_obra` WRITE;
/*!40000 ALTER TABLE `mano_obra` DISABLE KEYS */;
INSERT INTO `mano_obra` VALUES (1,1,'CAMBIO DE FRENOS DELANTEROS','CAMBIO DE FRENOS DELANTEROS',1.50,220.00,50,'2022-03-08 21:46:00','VIG'),(2,1,'LIMPIEZA GENERAL','LAVADO COMPLETA DE MOTO',0.30,60.00,30,'2022-03-08 21:46:32','VIG'),(3,1,'CAMBIO DE ACEITE','CAMBIO DE ACEITE Y FILTROS DE AIRE',1.00,400.00,50,'2022-03-08 21:47:02','VIG'),(4,1,'CAMBIO DE BALATAS TRASERAS','CAMBIO DE BALATAS TRASERAS',0.45,170.00,45,'2022-03-08 21:47:40','VIG'),(5,1,'PRIMER SERVICIO','CAMBIO DE ACEITE(2), DE BUJIAS(1) Y LAVADO GENERAL',2.00,400.00,50,'2022-03-08 21:48:13','VIG'),(6,1,'CAMBIO DE AMORTIGUADOR TRASERO','CAMBIO DE AMORTIGUADOR TRASERO',1.00,210.00,50,'2022-03-08 21:48:29','VIG');
/*!40000 ALTER TABLE `mano_obra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `cve_menu` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de menús',
  `cve_empresa` int(11) DEFAULT NULL COMMENT 'Identificador del catálogo de empresas',
  `menu` varchar(100) NOT NULL COMMENT 'Nombre del menú',
  `url` varchar(500) NOT NULL COMMENT 'URL del menú',
  `orden` int(11) NOT NULL COMMENT 'Orden en que se presenta el menú',
  `tipo_menu` varchar(100) NOT NULL COMMENT 'Tipo de menú: MENÚ,SUBMENÚ,OPCION',
  `agrupador` varchar(100) NOT NULL COMMENT 'Agrupador de las opciones de menú',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_menu`) USING BTREE,
  KEY `fk_empresa_menus` (`cve_empresa`) USING BTREE,
  CONSTRAINT `fk_empresa_menus` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Almacena los menú del sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos_cortes_cajas`
--

DROP TABLE IF EXISTS `movimientos_cortes_cajas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimientos_cortes_cajas` (
  `cve_movimiento_corte_daja` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del movimiento de caja durante un corte',
  `cve_corte_caja` int(11) NOT NULL COMMENT 'Identificador del corte de caja',
  `tipo_movimiento` varchar(50) NOT NULL COMMENT 'Tipo de movimiento: ENTRADA, SALIDA',
  `fecha_movimiento` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Fecha y hora en que se realiza el movimiento',
  `importe_movimiento` decimal(11,2) NOT NULL COMMENT 'Importe del movimiento',
  `descripcion_movimiento` varchar(10) NOT NULL COMMENT 'Descripción u observación asociada al movimiento',
  `medio_movimiento` varchar(50) NOT NULL COMMENT 'Medio del movimiento: EFECTIVO, CHEQUES, VALES, NOTA CREDITO',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_movimiento_corte_daja`) USING BTREE,
  KEY `fk_corte_caja_movimientos` (`cve_corte_caja`) USING BTREE,
  CONSTRAINT `fk_corte_caja_movimientos` FOREIGN KEY (`cve_corte_caja`) REFERENCES `cortes_cajas` (`cve_corte_caja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Registra los movimientos de valores durante un corte de caja';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_cortes_cajas`
--

LOCK TABLES `movimientos_cortes_cajas` WRITE;
/*!40000 ALTER TABLE `movimientos_cortes_cajas` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientos_cortes_cajas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas_credito`
--

DROP TABLE IF EXISTS `notas_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notas_credito` (
  `cve_nota_credito` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la nota de venta',
  `cve_venta` int(11) DEFAULT NULL COMMENT 'Identificador del registro de venta',
  `folio_ticket` varchar(50) NOT NULL COMMENT 'Número o folio del ticket de venta',
  `motivo_nota_credito` varchar(500) DEFAULT NULL COMMENT 'Descripción del motivo que origina la nota de venta',
  `fecha_nota_credito` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Fecha y hora en que se registra la nota de venta',
  `usuario_alta` varchar(50) DEFAULT NULL COMMENT 'Clave de usuario que da de alta el registro',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_nota_credito`) USING BTREE,
  KEY `fk_venta_nota_credito` (`cve_venta`) USING BTREE,
  CONSTRAINT `fk_venta_nota_credito` FOREIGN KEY (`cve_venta`) REFERENCES `ventas` (`cve_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Registro de las notas de venta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas_credito`
--

LOCK TABLES `notas_credito` WRITE;
/*!40000 ALTER TABLE `notas_credito` DISABLE KEYS */;
/*!40000 ALTER TABLE `notas_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `cve_producto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de productos',
  `cve_empresa` int(11) DEFAULT NULL COMMENT 'Identificador del catálogo de empresas',
  `cve_categoria` int(11) DEFAULT NULL COMMENT 'Identificador del catálogo de categorías',
  `producto` varchar(200) NOT NULL COMMENT 'Nombre del producto o material',
  `codigo_barras` varchar(50) DEFAULT NULL COMMENT 'Código de barras asociado al producto',
  `unidad_medida` varchar(200) DEFAULT NULL COMMENT 'Unidad de medida: PIEZA, LITRO, METRO',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_producto`) USING BTREE,
  KEY `fk_categoria_producto` (`cve_categoria`) USING BTREE,
  KEY `fk_empresa_productos` (`cve_empresa`) USING BTREE,
  CONSTRAINT `fk_categoria_producto` FOREIGN KEY (`cve_categoria`) REFERENCES `categorias` (`cve_categoria`),
  CONSTRAINT `fk_empresa_productos` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Catálogo de productos o materiales';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,NULL,1,'BATERIA MF-FA ICB6L-B','F06010049','PIEZA','2022-03-08 21:32:54','VIG'),(2,NULL,3,'BASE DE SWITCH 150SZ','F12010145','PIEZA','2022-03-08 21:33:57','VIG'),(3,NULL,4,'BUJIA B7RTC Para 125FL, 125FL','E02020028','PIEZA','2022-03-08 21:34:47','VIG'),(4,NULL,4,'BUJIA GOLD GCR7HSA ','E02020015','PIEZA','2022-03-08 21:35:18','VIG'),(5,NULL,1,'BATERIA MF-FA I12N9-BS','F06010055','PIEZA','2022-03-08 21:35:52','VIG'),(6,NULL,5,'BALATAS DE FRENO DELANTERO','F14020100','PIEZA','2022-03-08 21:37:18','VIG'),(7,NULL,6,'BANDANA TUBO ITK UNITALLA MAPACHE','A120020U0002','PIEZA','2022-03-08 21:38:04','VIG'),(8,NULL,7,'SISTEMA FRENO TRAS CALIPER ROJO RT 200-RT200 GP','F15020157','PIEZA','2022-03-08 21:38:48','VIG'),(9,NULL,8,'TANQUE COMBUSTIBLE AZUL PLATA 125 Z','F17010209','PIEZA','2022-03-08 21:39:44','VIG'),(10,NULL,8,'TANQUE COMBUSTIBLE ROJO BLANCO RT200 GP','F17010161','PIEZA','2022-03-08 21:40:07','VIG'),(11,NULL,9,'AMORTIGUADOR DEL IZQ PARA CUBIERTA DM150','F01020135','PIEZA','2022-03-08 21:40:55','VIG'),(12,NULL,9,'AMORTIGUADOR DEL IZQ PARA CUBIERTA DM150','F01020135','PIEZA','2022-03-08 21:41:16','VIG'),(13,NULL,10,'SISTEMA DE ESCAPE FT 250','F07010105','PIEZA','2022-03-08 21:42:05','VIG'),(14,NULL,11,'CONJUNTO FARO RT200-RT200GP','F09010104','PIEZA','2022-03-08 21:42:48','VIG'),(15,NULL,6,'CASCO ITK CERRADO RACING','A11001040024','PIEZA','2022-03-08 21:43:27','VIG'),(16,NULL,6,'GOGLES ITK','A110020U0001','PIEZA','2022-03-08 21:44:03','VIG');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_descripciones`
--

DROP TABLE IF EXISTS `productos_descripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos_descripciones` (
  `cve_producto_descripcion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de las descripciones de productos',
  `cve_producto` int(11) NOT NULL COMMENT 'Identificador del catálogo de productos',
  `descripcion` varchar(200) DEFAULT NULL COMMENT 'Descripción asociada',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_producto_descripcion`) USING BTREE,
  KEY `fk_producto_producto_descripciones` (`cve_producto`) USING BTREE,
  CONSTRAINT `fk_producto_producto_descripciones` FOREIGN KEY (`cve_producto`) REFERENCES `productos` (`cve_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Registra las descripciones asociadas a los productos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_descripciones`
--

LOCK TABLES `productos_descripciones` WRITE;
/*!40000 ALTER TABLE `productos_descripciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos_descripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_imagenes`
--

DROP TABLE IF EXISTS `productos_imagenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos_imagenes` (
  `cve_producto_imagen` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Asociación de imagen a producto',
  `cve_producto` int(11) NOT NULL COMMENT 'Identificador del catálogo de productos',
  `url_imagen` varchar(200) NOT NULL COMMENT 'URL de la imagen asociada',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_producto_imagen`) USING BTREE,
  KEY `fk_producto_imagen` (`cve_producto`) USING BTREE,
  CONSTRAINT `fk_producto_imagen` FOREIGN KEY (`cve_producto`) REFERENCES `productos` (`cve_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Registra la asociación de imágenes a los productos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_imagenes`
--

LOCK TABLES `productos_imagenes` WRITE;
/*!40000 ALTER TABLE `productos_imagenes` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos_imagenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_sucursales`
--

DROP TABLE IF EXISTS `productos_sucursales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos_sucursales` (
  `cve_producto_sucursal` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del producto de una sucursal',
  `cve_sucursal` int(11) NOT NULL COMMENT 'Identificador del catálogo de sucursales',
  `cve_producto` int(11) NOT NULL COMMENT 'Identificador del catálogo de productos',
  `cve_impuesto` int(11) NOT NULL COMMENT 'Identificador del catálogo de impuestos',
  `precio` decimal(11,2) NOT NULL COMMENT 'Precio de venta del producto',
  `existencia` int(11) DEFAULT NULL COMMENT 'Existencia del producto en la sucursal',
  `existencia_minima` int(11) DEFAULT NULL COMMENT 'Existencia mínima del producto antes de realizar pedido',
  `ubicacion` varchar(200) DEFAULT NULL COMMENT 'Descripción de la ubicación del producto',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_producto_sucursal`) USING BTREE,
  KEY `Ref16` (`cve_sucursal`) USING BTREE,
  KEY `fk_impuesto_producto_sucursal` (`cve_impuesto`) USING BTREE,
  KEY `fk_producto_producto_sucursal` (`cve_producto`) USING BTREE,
  CONSTRAINT `Refsucursales6` FOREIGN KEY (`cve_sucursal`) REFERENCES `sucursales` (`cve_sucursal`),
  CONSTRAINT `fk_impuesto_producto_sucursal` FOREIGN KEY (`cve_impuesto`) REFERENCES `impuestos` (`cve_impuesto`),
  CONSTRAINT `fk_producto_producto_sucursal` FOREIGN KEY (`cve_producto`) REFERENCES `productos` (`cve_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Contiene la existencia de productos en una sucursal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_sucursales`
--

LOCK TABLES `productos_sucursales` WRITE;
/*!40000 ALTER TABLE `productos_sucursales` DISABLE KEYS */;
INSERT INTO `productos_sucursales` VALUES (1,1,1,1,850.25,10,2,'T1M2E1','2022-03-08 22:10:08','VIG'),(2,1,2,1,253.12,8,5,'T1M1E4','2022-03-08 22:10:25','VIG'),(3,1,3,1,25.01,24,8,'T1M4E3','2022-03-08 22:11:34','VIG'),(4,1,4,1,254.12,12,4,'B1C2M3E2','2022-03-08 22:12:08','VIG'),(5,1,5,1,896.47,25,5,'T1M6E2','2022-03-08 22:12:44','VIG'),(6,1,6,1,1254.25,6,2,'T1EX1P3','2022-03-08 22:13:07','VIG'),(7,1,7,1,965.00,15,5,'T1EX1P7','2022-03-08 22:13:29','VIG'),(8,1,8,1,1245.78,20,2,'T1M3E2','2022-03-08 22:13:50','VIG'),(9,1,9,1,541.63,85,5,'T1M4E5','2022-03-08 22:14:11','VIG'),(10,1,10,1,89.52,25,5,'T1M2E1','2022-03-08 22:14:40','VIG'),(11,1,11,1,854.21,16,3,'T1M2E1','2022-03-08 22:15:01','VIG'),(12,1,12,1,467.10,12,3,'B1C3M3E1','2022-03-08 22:15:45','VIG'),(13,1,13,1,4520.00,6,2,'B1C2M2E3','2022-03-08 22:16:06','VIG'),(14,1,14,1,874.52,5,4,'T1M2E3','2022-03-08 22:16:33','VIG');
/*!40000 ALTER TABLE `productos_sucursales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedores` (
  `cve_proveedor` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de proveedores',
  `proveedor` varchar(500) NOT NULL COMMENT 'Nombre o razón social de proveedor',
  `rfc_proveedor` varchar(50) DEFAULT NULL COMMENT 'RFC del proveedor',
  `correo_proveedor` varchar(200) DEFAULT NULL COMMENT 'Correo electrónico del proveedor',
  `celular_proveedor` varchar(50) DEFAULT NULL COMMENT 'Número de celular del proveedor',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) NOT NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_proveedor`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Catálogo de proveedores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'PROVEEDORA DE REFACCIONES DEL SURESTE S.A. DE C.V.','POR121212EE2','PROVEEDORA@GMAIL.COM','9955663322','2022-03-08 21:53:39','VIG'),(2,'DISTRIBUIDORA MERCANTIL DEL SURESTE S.A. DE C.V.','DIM121212EE5','DISTRIBUIDORA@GMAIL.COM','5544778855','2022-03-08 21:54:18','VIG');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `cve_rol` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de roles',
  `cve_empresa` int(11) DEFAULT NULL COMMENT 'Clave del catálogo de empresas',
  `rol` varchar(100) DEFAULT NULL COMMENT 'Descripción o nombre del rol',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) NOT NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_rol`) USING BTREE,
  KEY `fk_empresa_roles` (`cve_empresa`) USING BTREE,
  CONSTRAINT `fk_empresa_roles` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Catálogo de roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_menu`
--

DROP TABLE IF EXISTS `roles_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_menu` (
  `cve_rol_menu` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la asociación de menú a rol ',
  `cve_rol` int(11) NOT NULL COMMENT 'Identificador del catálogo de roles',
  `cve_menu` int(11) NOT NULL COMMENT 'Identificador del catálogo de menús',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_rol_menu`) USING BTREE,
  KEY `fk_rol_rol_menu` (`cve_rol`) USING BTREE,
  KEY `fk_menu_rol_menu` (`cve_menu`) USING BTREE,
  CONSTRAINT `fk_menu_rol_menu` FOREIGN KEY (`cve_menu`) REFERENCES `menus` (`cve_menu`),
  CONSTRAINT `fk_rol_rol_menu` FOREIGN KEY (`cve_rol`) REFERENCES `roles` (`cve_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Asociaciones de menús a roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_menu`
--

LOCK TABLES `roles_menu` WRITE;
/*!40000 ALTER TABLE `roles_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursales`
--

DROP TABLE IF EXISTS `sucursales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sucursales` (
  `cve_sucursal` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de sucursales',
  `cve_empresa` int(11) NOT NULL COMMENT 'Identificador del catálogo de empresas',
  `sucursal` varchar(200) NOT NULL COMMENT 'Nombre de la sucursal',
  `direccion` varchar(500) DEFAULT NULL COMMENT 'Dirección del sucursal',
  `correo_sucursal` varchar(200) DEFAULT NULL COMMENT 'Correo electrónico del sucursal',
  `telefono_sucursal` varchar(100) DEFAULT NULL COMMENT 'Número telefónico de la sucursal',
  `celular_sucursal` varchar(200) DEFAULT NULL COMMENT 'Número celular de la sucursal',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_sucursal`) USING BTREE,
  KEY `fk_empresa_sucursal` (`cve_empresa`) USING BTREE,
  CONSTRAINT `fk_empresa_sucursal` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Catálogo de sucursales';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursales`
--

LOCK TABLES `sucursales` WRITE;
/*!40000 ALTER TABLE `sucursales` DISABLE KEYS */;
INSERT INTO `sucursales` VALUES (1,1,'MATRIZ','AV. RAMÓN MEDOZA # 1524, FRENTE A PLAZA LAS AMÉRICAS, COL.  JOSÉ MARÍA PINO SUÁREZ, VILLAHERMOSA, TABASCO. CP. 86220.','refaccionesitalika@gmail.com','993355124578','9931524578','2022-03-08 20:47:46','VIG'),(2,1,'TABASCO 2000','AV. PASEO TABASCO 2510, COL. LOS RIOS, TABASCO 2000, VILLAHERMOSA, TABASCO. CP. 86250','sucursaltabasco2000@gmail.com','993356874112','9932458769','2022-03-08 20:49:30','VIG');
/*!40000 ALTER TABLE `sucursales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnicos`
--

DROP TABLE IF EXISTS `tecnicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnicos` (
  `cve_tecnico` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de técnicos',
  `cve_empresa` int(11) NOT NULL COMMENT 'Identificador del catálogo de empresas',
  `nombre_tecnico` varchar(200) NOT NULL COMMENT 'Nombre completo del técnico',
  `rfc_tecnico` varchar(50) DEFAULT NULL COMMENT 'RFC del técnico',
  `correo_tecnico` varchar(200) DEFAULT NULL COMMENT 'Correo electrónico del técnico',
  `celular_tecnico` varchar(50) DEFAULT NULL COMMENT 'Número celular del técnico',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_tecnico`) USING BTREE,
  KEY `idx_empresa_tecnicos` (`cve_empresa`) USING BTREE,
  CONSTRAINT `fk_empresa_tecnicos` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Catálogo de técnicos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnicos`
--

LOCK TABLES `tecnicos` WRITE;
/*!40000 ALTER TABLE `tecnicos` DISABLE KEYS */;
INSERT INTO `tecnicos` VALUES (1,1,'JOSE DEL CAMEN LOPEZ HERNANDEZ','LOHJ121212RF5','JOSELOPEZ@GMAIL.COM','5588774466','2022-03-08 21:55:27','VIG'),(2,1,'MARGARITO RICARDEZ GALLEGOS','RIGM121212WW5','MARGARITOR@GMAIL.COM','9955441122','2022-03-08 21:56:17','VIG'),(4,2,'TECNICO DE LA EMPRESA DOS','TECR121203FF3','TECNICO@GMAIL.COM','9988774455','2022-03-08 21:57:47','VIG'),(5,1,'ADRIAN RICARDO PALOMEQUE DE LA CRUZ','PADA060606FF4','ADRIANPP@HOTMAIL.COM','9933524156','2022-03-08 21:58:40','VIG');
/*!40000 ALTER TABLE `tecnicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traspasos_producto_sucursal`
--

DROP TABLE IF EXISTS `traspasos_producto_sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traspasos_producto_sucursal` (
  `cve_traspaso_sucursal` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del traspaso de producto o material',
  `cve_empresa` int(11) NOT NULL COMMENT 'Identificador del catálogo de empresas',
  `cve_producto_sucursal` int(11) NOT NULL COMMENT 'Identificador del producto en la sucursal',
  `cve_sucursal_origen` int(11) NOT NULL COMMENT 'Identificador de la sucursal origen',
  `cve_sucursal_destino` int(11) NOT NULL COMMENT 'Identificador de la sucursal destino',
  `fecha_traspaso` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Fecha en que se realiza el traspaso',
  `cantidad_traspaso` decimal(11,2) DEFAULT NULL COMMENT 'Cantidad de producto o material',
  `unidad_medida` varchar(50) DEFAULT NULL COMMENT 'Unidad de medida del producto o material: PIEZA, LITRO, METRO',
  `estatus_traspaso` varchar(50) DEFAULT NULL COMMENT 'Indica el estatus del traspaso: CAPTURADO, ENVIADO, RECIBIDO, CANCELADO',
  `usuario_alta` varchar(50) DEFAULT NULL COMMENT 'Clave de usuario que da de alta el registro',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_traspaso_sucursal`) USING BTREE,
  KEY `fk_traspaso_producto_sucursal` (`cve_producto_sucursal`) USING BTREE,
  KEY `fk_empresa_traspasos_sucursal` (`cve_empresa`) USING BTREE,
  KEY `fk_sucursal_origen` (`cve_sucursal_origen`) USING BTREE,
  KEY `fk_sucursal_destino` (`cve_sucursal_destino`) USING BTREE,
  CONSTRAINT `fk_empresa_traspasos_sucursal` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`),
  CONSTRAINT `fk_sucursal_destino` FOREIGN KEY (`cve_sucursal_destino`) REFERENCES `sucursales` (`cve_sucursal`),
  CONSTRAINT `fk_sucursal_origen` FOREIGN KEY (`cve_sucursal_origen`) REFERENCES `sucursales` (`cve_sucursal`),
  CONSTRAINT `fk_traspaso_producto_sucursal` FOREIGN KEY (`cve_producto_sucursal`) REFERENCES `productos_sucursales` (`cve_producto_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Registra los traspasos de productos o material entre sucursales';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traspasos_producto_sucursal`
--

LOCK TABLES `traspasos_producto_sucursal` WRITE;
/*!40000 ALTER TABLE `traspasos_producto_sucursal` DISABLE KEYS */;
/*!40000 ALTER TABLE `traspasos_producto_sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidades`
--

DROP TABLE IF EXISTS `unidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidades` (
  `cve_unidad` int(11) NOT NULL AUTO_INCREMENT,
  `cve_empresa` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `estatus_registro` varchar(3) NOT NULL,
  `fecha_alta` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`cve_unidad`),
  KEY `fk_empresas_unidades` (`cve_empresa`),
  CONSTRAINT `fk_empresas_unidades` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades`
--

LOCK TABLES `unidades` WRITE;
/*!40000 ALTER TABLE `unidades` DISABLE KEYS */;
INSERT INTO `unidades` VALUES (1,1,'PZA','PIEZA','VIG','2022-03-13 20:28:45'),(2,1,'CAJA','CAJA','VIG','2022-03-13 20:28:45'),(3,1,'KG','KILOGRAMNO','VIG','2022-03-13 20:28:45'),(4,1,'LT','LITROS','VIG','2022-03-13 20:28:45'),(5,1,'m','METROS','VIG','2022-03-13 20:28:45'),(6,1,'VOL','VOLUMENT','VIG','2022-03-13 21:21:21'),(7,1,'PR',NULL,'VIG','2022-03-13 21:27:15'),(8,1,'PR3','PRUEBA  DOS','VIG','2022-03-13 21:27:44'),(9,1,'PR45','PRUEBA NUMERO 45','VIG','2022-03-14 01:27:54'),(10,1,'PR46','PRUEBA NUMERO 46','VIG','2022-03-14 01:35:00'),(11,1,'PR47','PRUEBA NUMERO 47','VIG','2022-03-14 01:37:36'),(12,1,'PR48','PRUEBA NUMERO 48','VIG','2022-03-14 01:46:11'),(13,1,'PR58','PRUEBA NUMERO 58','VIG','2022-03-14 01:46:38'),(14,1,'PR59','PRUEBA NUMERO 59','VIG','2022-03-14 01:52:58');
/*!40000 ALTER TABLE `unidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `cve_usuario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de usuarios',
  `cve_empresa` int(11) NOT NULL COMMENT 'Identificador del catálogo de empresas',
  `nombre_usuario` varchar(200) NOT NULL COMMENT 'Nombre completo del usuario',
  `correo_usuario` varchar(200) DEFAULT NULL COMMENT 'Correo electrónico del usuario',
  `celular_usuario` varchar(10) DEFAULT NULL COMMENT 'Número de celular del usuario',
  `usuario` varchar(50) NOT NULL COMMENT 'Clave de usuario asignada',
  `contrasenia` varchar(200) NOT NULL COMMENT 'Contraseña encriptada del usuario',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_usuario`) USING BTREE,
  KEY `fk_empresa_usuario` (`cve_empresa`) USING BTREE,
  CONSTRAINT `fk_empresa_usuario` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Catálogo de usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_roles`
--

DROP TABLE IF EXISTS `usuarios_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_roles` (
  `cve_usuario_rol` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la asociación del rol al usuario',
  `cve_rol` int(11) NOT NULL COMMENT 'Identificador del catálogo de roles',
  `cve_usuario` int(11) NOT NULL COMMENT 'Identificador del catálogo de usuarios',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_usuario_rol`) USING BTREE,
  KEY `Ref53` (`cve_rol`) USING BTREE,
  KEY `fk_usuario_rol` (`cve_usuario`) USING BTREE,
  CONSTRAINT `Refroles3` FOREIGN KEY (`cve_rol`) REFERENCES `roles` (`cve_rol`),
  CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`cve_usuario`) REFERENCES `usuarios` (`cve_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Registra las asociaciones de los roles a los usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_roles`
--

LOCK TABLES `usuarios_roles` WRITE;
/*!40000 ALTER TABLE `usuarios_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas` (
  `cve_venta` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro de ventas',
  `cve_sucursal` int(11) NOT NULL COMMENT 'Identificador del catálogo de sucursales',
  `cve_cliente` int(11) NOT NULL COMMENT 'Identificador del catálogo de clientes',
  `cve_corte_caja` int(11) NOT NULL COMMENT 'Identificador del corte de caja',
  `cve_tecnico` int(11) DEFAULT NULL COMMENT 'Identificador del catálogo de técnicos',
  `nombre_cliente` varchar(200) DEFAULT NULL COMMENT 'Nombre del cliente de mostrador',
  `tipo_venta` varchar(50) DEFAULT NULL COMMENT 'Indica el tipo de venta: NORMAL, SERVICIO, GARANTÍA',
  `fecha_venta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Fecha en que se realiza la venta',
  `tipo_comprobante` varchar(50) DEFAULT NULL COMMENT 'Indica el tipo de comprobante: TICKET, FACTURA, CORREO',
  `estatus_venta` varchar(50) DEFAULT NULL COMMENT 'Estatus de la venta: ENCAPTURA, PORPAGAR, PAGADA, ENTREGADA, FACTURAR, CERRADA, CANCELADA',
  `folio_ticket` varchar(50) DEFAULT NULL COMMENT 'Folio del ticket de venta asociado',
  `numero_transaccion` varchar(50) DEFAULT NULL COMMENT 'Número de transacción asociado',
  `usuario_alta` varchar(50) DEFAULT NULL COMMENT 'Clave de usuario que da de alta el registro',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_venta`) USING BTREE,
  KEY `fk_tecnico_venta` (`cve_tecnico`) USING BTREE,
  KEY `fk_cliente_venta` (`cve_cliente`) USING BTREE,
  KEY `fk_corte_caja_venta` (`cve_corte_caja`) USING BTREE,
  KEY `fk_sucursal_venta` (`cve_sucursal`) USING BTREE,
  CONSTRAINT `fk_cliente_venta` FOREIGN KEY (`cve_cliente`) REFERENCES `clientes` (`cve_cliente`),
  CONSTRAINT `fk_corte_caja_venta` FOREIGN KEY (`cve_corte_caja`) REFERENCES `cortes_cajas` (`cve_corte_caja`),
  CONSTRAINT `fk_sucursal_venta` FOREIGN KEY (`cve_sucursal`) REFERENCES `sucursales` (`cve_sucursal`),
  CONSTRAINT `fk_tecnico_venta` FOREIGN KEY (`cve_tecnico`) REFERENCES `tecnicos` (`cve_tecnico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Registro de las ventas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_detalles`
--

DROP TABLE IF EXISTS `ventas_detalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas_detalles` (
  `cve_venta_detalle` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del detalle de venta',
  `cve_venta` int(11) NOT NULL COMMENT 'Identificador del registro de venta',
  `cve_producto_sucursal` int(11) DEFAULT NULL COMMENT 'Identificador del producto de la sucursal',
  `cve_mano_obra` int(11) DEFAULT NULL COMMENT 'Identificador del catálogo de mano de obra',
  `cantidad` decimal(11,2) DEFAULT NULL COMMENT 'Cantidad de producto o material',
  `unidad_medida` varchar(50) DEFAULT NULL COMMENT 'Unidad de medida del producto o material: PIEZA, LITRO, METRO',
  `precio_producto` decimal(11,2) DEFAULT NULL COMMENT 'Precio del producto al momento de la venta',
  `descuento_aplicado` int(11) DEFAULT NULL COMMENT 'Porcentaje de descuento aplicado al producto',
  `estatus_venta_detalle` varchar(50) DEFAULT NULL COMMENT 'Estatus del detalle de venta: CAPTURADO, CANCELADO, DEVUELTO',
  `cve_nota_credito` int(11) DEFAULT NULL COMMENT 'Identificador de la nota de crédito',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_venta_detalle`) USING BTREE,
  KEY `fk_mano_obra_venta_detalle` (`cve_mano_obra`) USING BTREE,
  KEY `fk_nota_credito_venta_detalle` (`cve_nota_credito`) USING BTREE,
  KEY `fk_producto_sucursal_venta_detalle` (`cve_producto_sucursal`) USING BTREE,
  KEY `idx_venta_detalle_venta` (`cve_venta`) USING BTREE,
  CONSTRAINT `fk_mano_obra_venta_detalle` FOREIGN KEY (`cve_mano_obra`) REFERENCES `mano_obra` (`cve_mano_obra`),
  CONSTRAINT `fk_nota_credito_venta_detalle` FOREIGN KEY (`cve_nota_credito`) REFERENCES `notas_credito` (`cve_nota_credito`),
  CONSTRAINT `fk_producto_sucursal_venta_detalle` FOREIGN KEY (`cve_producto_sucursal`) REFERENCES `productos_sucursales` (`cve_producto_sucursal`),
  CONSTRAINT `fk_venta_detalle_venta` FOREIGN KEY (`cve_venta`) REFERENCES `ventas` (`cve_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Registra los detalles de las ventas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_detalles`
--

LOCK TABLES `ventas_detalles` WRITE;
/*!40000 ALTER TABLE `ventas_detalles` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas_detalles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_pagos`
--

DROP TABLE IF EXISTS `ventas_pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas_pagos` (
  `cve_venta_pago` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del pago asociado a una venta',
  `cve_venta` int(11) NOT NULL COMMENT 'Identificador del registro de la venta',
  `medio_pago` varchar(10) NOT NULL COMMENT 'Medio por el cual se realiza el pago: EFECTIVO, TARJETA, VALE, CHEQUE, TRANSFERENCIA',
  `cantidad` decimal(11,2) NOT NULL COMMENT 'Cantidad de dinero',
  `numero_comprobante` varchar(100) DEFAULT NULL COMMENT 'Número de comprobante del medio de pago',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_venta_pago`) USING BTREE,
  KEY `fk_venta_ventas_pagos` (`cve_venta`) USING BTREE,
  CONSTRAINT `fk_venta_ventas_pagos` FOREIGN KEY (`cve_venta`) REFERENCES `ventas` (`cve_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Registra los pagos asociados a las ventas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_pagos`
--

LOCK TABLES `ventas_pagos` WRITE;
/*!40000 ALTER TABLE `ventas_pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas_pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'pos'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-13 21:56:33
