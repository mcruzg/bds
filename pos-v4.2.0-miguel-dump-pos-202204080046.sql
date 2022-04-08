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
-- Table structure for table `acciones`
--

DROP TABLE IF EXISTS `acciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acciones` (
  `cve_accion` int(11) NOT NULL AUTO_INCREMENT,
  `cve_emprea` int(11) DEFAULT NULL,
  `accion` varchar(50) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `fecha_alta` timestamp NULL DEFAULT current_timestamp(),
  `estatus_registro` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`cve_accion`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acciones`
--

LOCK TABLES `acciones` WRITE;
/*!40000 ALTER TABLE `acciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `acciones` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Catálogo de categorías de productos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,1,'BATERIAS','2022-03-08 21:32:40','VIG'),(2,1,'FRENOS','2022-03-08 21:32:47','VIG'),(3,1,'PLASTICOS','2022-03-08 21:33:34','VIG'),(4,1,'BUJIAS','2022-03-08 21:34:31','VIG'),(5,1,'BALATAS Y ZAPATAS','2022-03-08 21:36:48','VIG'),(6,1,'ACCESORIOS','2022-03-08 21:37:48','VIG'),(7,1,'REFACCIONES','2022-03-08 21:38:35','VIG'),(8,1,'TANQUES','2022-03-08 21:39:22','VIG'),(9,1,'AMORTIGUADORES','2022-03-08 21:40:43','VIG'),(10,1,'ESCAPES','2022-03-08 21:41:50','VIG'),(11,1,'FAROS','2022-03-08 21:42:31','VIG'),(12,1,'ACEITES Y LUBRICANTES','2022-03-21 03:46:34','VIG'),(16,1,'s','2022-03-24 18:53:09','NVI'),(17,1,'REFRESCOS','2022-03-27 04:38:33','VIG');
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
  `curp_cliente` varchar(20) DEFAULT NULL,
  `factura` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cve_cliente`) USING BTREE,
  KEY `fk_empresa_cliente` (`cve_empresa`) USING BTREE,
  CONSTRAINT `fk_empresa_cliente` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Catálogo de clientes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,1,'VENTAS EN MOSTRADOR','F','XXXX1212121XX','','',NULL,0,'2022-03-08 21:44:56','VIG',NULL,NULL),(2,1,'ROMAN DE LA CRUZ MARTINEZ PEÑA','F','CUMR070701HG3','AV. LAS GARZAS # 35, COL. CENTRO, VILLAHERMOSA, TABASCO. CP. 86210','ROMANDLCMP@GMAIL.COM','9988556644',10,'2022-03-08 22:03:41','VIG',NULL,NULL),(3,1,'SELENE DEL CARMEN LOPEZ OSORIO','F','LOOS050505LL3','AV. GARDENAS NUM. 23, COL. PORFIRIO DIAZ, CENTLA TABASCO. CP. 85210','SELENELO@HOTMAIL.COM','9934125566',10,'2022-03-08 22:05:10','VIG',NULL,NULL),(4,2,'CLIENTE QUE NO SE DEBE VER EN LA EMPRESA UNO','M','CIN040404WS1','CARRETERA VILLAHERMOSA A FRONTERA KM. 11.5, FRENTE A LA GRAVERA, VILLAHERMOSA, TABASCO. C.P. 86254','CLIENTENO@GMAIL.COM','9935886655',5,'2022-03-08 22:08:37','VIG',NULL,NULL),(5,1,'JOSE CONCEPCION MENDEZ MONDRAGON','','',NULL,'','',0,'2022-03-22 20:27:15','VIG','',0),(16,1,'MIGUEL ANGEL CRUZ GARCIA','F','CUGM910401VC5','C. LUXEMBUERGO 110, COL. GAVIOTAS SUR SECTOR SAN JOSE','miguelangel041991@gmail.com','9933465024',15,'2022-03-23 20:06:45','VIG','CUGM190401HTCRRG01',0),(17,1,'SD','F','','SDF','example@tabasco.gob.mx','9999999999',0,'2022-03-24 19:12:25','NVI','',0),(18,1,'DANIEL VAZQUEZ PERALTA','F','','INDECO','danielvazquez@tabasco.gob.mx','9933333333',20,'2022-03-24 19:42:56','VIG','',0),(19,1,'JKSDJKASD','F','','SDF','ddd@tabasco.gob','6516516516',0,'2022-03-24 19:56:32','NVI','',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Almacena las entradas de material';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entradas`
--

LOCK TABLES `entradas` WRITE;
/*!40000 ALTER TABLE `entradas` DISABLE KEYS */;
INSERT INTO `entradas` VALUES (17,1,2,NULL,'2022-04-05 19:27:20','COMPRA','1','CAPTURA',NULL,'2022-04-05 19:27:20','VIG'),(18,1,1,NULL,'2022-04-05 20:04:58','COMPRA','aaaaaa','CAPTURA',NULL,'2022-04-05 20:04:58','VIG'),(19,1,2,NULL,'2022-04-05 20:19:16','COMPRA','222','CAPTURA',NULL,'2022-04-05 20:19:16','VIG'),(20,1,1,NULL,'2022-04-05 20:21:06','COMPRA','333','CAPTURA',NULL,'2022-04-05 20:21:06','VIG'),(21,1,2,NULL,'2022-04-05 20:22:11','COMPRA','444','CAPTURA',NULL,'2022-04-05 20:22:11','VIG'),(22,1,2,NULL,'2022-04-05 20:23:55','COMPRA','555','CAPTURA',NULL,'2022-04-05 20:23:55','VIG'),(23,1,1,NULL,'2022-04-05 20:26:43','COMPRA','6666','CAPTURA',NULL,'2022-04-05 20:26:43','VIG');
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
  `cve_unidad_medida` int(11) NOT NULL COMMENT 'Unidad de medida del material: PIEZA, LITRO, METRO',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  `importe_entrada` decimal(11,2) DEFAULT NULL,
  `subtotal_compra` decimal(11,2) DEFAULT NULL,
  `impuesto_total` decimal(11,2) DEFAULT NULL,
  `precio_entrada_neto` decimal(11,2) DEFAULT NULL,
  `factor` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`cve_entrada_producto`) USING BTREE,
  KEY `fk_producto_entrada` (`cve_producto`) USING BTREE,
  KEY `fk_entrada_entrada_producto` (`cve_entrada`) USING BTREE,
  KEY `fk_unidad_entrada` (`cve_unidad_medida`) USING BTREE,
  CONSTRAINT `fk_entrada_entrada_producto` FOREIGN KEY (`cve_entrada`) REFERENCES `entradas` (`cve_entrada`),
  CONSTRAINT `fk_producto_entrada` FOREIGN KEY (`cve_producto`) REFERENCES `productos` (`cve_producto`),
  CONSTRAINT `fk_unidad_entrada` FOREIGN KEY (`cve_unidad_medida`) REFERENCES `unidades` (`cve_unidad`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Almacena el detalle de las entradas de material';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entradas_productos`
--

LOCK TABLES `entradas_productos` WRITE;
/*!40000 ALTER TABLE `entradas_productos` DISABLE KEYS */;
INSERT INTO `entradas_productos` VALUES (8,17,2,'2022-04-05 19:27:57',12,10.50,2,'2022-04-05 19:27:57','VIG',NULL,NULL,NULL,NULL,NULL),(9,23,1,'2022-04-05 20:30:24',12,15.00,2,'2022-04-05 20:30:24','VIG',NULL,NULL,NULL,NULL,10.00);
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
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Catálogos de impuestos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impuestos`
--

LOCK TABLES `impuestos` WRITE;
/*!40000 ALTER TABLE `impuestos` DISABLE KEYS */;
INSERT INTO `impuestos` VALUES (1,1,'IVA',0.16,'2022-03-08 21:45:19','VIG'),(2,1,'IEPS',0.05,'2022-03-20 04:17:51','VIG'),(3,1,'ISR',0.07,'2022-03-20 04:17:51','VIG');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Contiene los valores de las listas de catálogos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listas_catalogos`
--

LOCK TABLES `listas_catalogos` WRITE;
/*!40000 ALTER TABLE `listas_catalogos` DISABLE KEYS */;
INSERT INTO `listas_catalogos` VALUES (1,1,'tipo_cliente1','[{\"id\":\"FÍSICA\",\"value\":\"FÍSICA\"},{\"id\":\"MORAL\",\"value\":\"MORAL\"}]','2022-03-08 22:30:23','NVI'),(2,1,'estatus_registro','[{\"id\":\"VIG\",\"value\":\"VIGENTE\"},{\"id\":\"NVG\",\"value\":\"NO VIGENTE\"}]','2022-03-08 22:31:28','VIG'),(3,1,'estatus_corte_caja','[{\"id\":\"ABIERTO\",\"value\":\"ABIERTO\"},{\"id\":\"CERRADO\",\"value\":\"CERRADO\"}]','2022-03-08 22:32:20','VIG'),(4,1,'tipo_entrada','[{\"id\":\"COMPRA\",\"value\":\"COMPRA\"},{\"id\":\"TRASPASO\",\"value\":\"TRASPASO\"},{\"id\":\"NOTACREDITO\",\"value\":\"NOTA CREDITO\"}]','2022-03-08 22:33:24','VIG'),(5,1,'estatus_entrada','[{\"id\":\"CAPTURA\",\"value\":\"CAPTURA\"},{\"id\":\"APLICADA\",\"value\":\"APLICADA\"},{\"id\":\"CANCELADA\",\"value\":\"CANCELADA\"}]','2022-03-08 22:35:50','VIG'),(6,1,'unidad_medida','[{\"id\":\"METRO\",\"value\": \"METRO\"},{\"id\":\"LITRO\",\"value\":\"LITRO\"},{\"id\": \"PIEZA\",\"value\": \"PIEZA\"}]','2022-03-08 22:36:47','VIG'),(11,1,'tipo_menu','{\"MENÚ\":\"MENÚ\",\"SUBMENÚ\":\"SUBMENÚ\",\"OPCION\":\"OPCION\"}','2022-03-08 22:40:09','VIG'),(12,1,'medio_movimiento','{\"EFECTIVO\":\"EFECTIVO\",\"CHEQUES\":\"CHEQUES\",\"VALES\":\"VALES\",\"NOTACREDITO\":\"NOTACREDITO\"}','2022-03-08 22:44:19','VIG'),(13,1,'tipo_movimiento','{\"ENTRADA\":\"ENTRADA\",\"SALIDA\":\"SALIDA\"}','2022-03-08 22:45:13','VIG'),(14,1,'estatus_traspaso','{\"CAPTURADO\":\"CAPTURADO\",\"ENVIADO\":\"ENVIADO\",\"RECIBIDO\":\"RECIBIDO\",\"CANCELADO\":\"CANCELADO\"}','2022-03-08 22:46:49','VIG'),(15,1,'tipo_venta','[{\"id\":\"NORMAL\",\"value\":\"NORMAL\"},{\"id\":\"SERVICIO\",\"value\":\"SERVICIO\"},{\"id\":\"GARANTÍA\",\"value\":\"GARANTÍA\"}]','2022-03-08 22:48:14','VIG'),(17,1,'tipo_comprobante','[{\"id\":\"TICKET\",\"value\":\"TICKET\"},{\"id\":\"FACTURA\",\"value\":\"FACTURA\"}]','2022-03-08 22:49:04','VIG'),(18,1,'estatus_venta','{\"ENCAPTURA\":\"ENCAPTURA\",\"PORPAGAR\":\"PORPAGAR\",\"PAGADA\":\"PAGADA\",\"ENTREGADA\":\"ENTREGADA\",\"FACTURAR\":\"FACTURAR\",\"CERRADA\":\"CERRADA\",\"CANCELADA\":\"CANCELADA\"}','2022-03-09 00:36:10','VIG'),(19,1,'estatus_venta_detalle','{\"CAPTURADO\":\"CAPTURADO\",\"CANCELADO\":\"CANCELADO\",\"DEVUELTO\":\"DEVUELTO\"}','2022-03-09 00:41:27','VIG'),(20,1,'medio_pago','{\"EFECTIVO\":\"EFECTIVO\",\"TARJETA\":\"TARJETA\",\"VALE\":\"VALE\",\"CHEQUE\":\"CHEQUE\",\"TRANSFERENCIA\":\"TRANSFERENCIA\"}','2022-03-09 00:44:49','VIG'),(21,1,'ventas_config','{\"tipo_venta\":\"NORMAL\",\"documento\":\"TICKET\",\"imprimir\":1,\"cliente\":{\"cve_cliente\":1,\"cve_empresa\":1,\"cliente\":\"VENTAS EN MOSTRADOR\",\"descuento_autorizado\":0}}','2022-03-24 14:46:23','VIG'),(22,1,'tipo_persona','[{\"id\":\"F\",\"value\":\"FÍSICA\"},{\"id\":\"M\",\"value\":\"MORAL\"}]','2022-03-24 14:51:57','VIG');
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
  `url` varchar(500) NOT NULL DEFAULT 'javascript:void(0);' COMMENT 'URL del menú',
  `orden` int(11) NOT NULL COMMENT 'Orden en que se presenta el menú',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  `cve_menu_padre` int(11) DEFAULT NULL,
  `icono` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cve_menu`) USING BTREE,
  KEY `fk_empresa_menus` (`cve_empresa`) USING BTREE,
  KEY `menus_FK` (`cve_menu_padre`) USING BTREE,
  CONSTRAINT `fk_empresa_menus` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`),
  CONSTRAINT `menus_FK` FOREIGN KEY (`cve_menu_padre`) REFERENCES `menus` (`cve_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Almacena los menú del sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,1,'Operaciones','javascript:void(0);',1,'2022-04-08 02:56:13','VIG',NULL,'fas fa-users-cog'),(2,1,'Consultas','javascript:void(0);',2,'2022-04-08 02:58:25','VIG',NULL,'fas fa-search'),(3,1,'Procesos','javascript:void(0);',3,'2022-04-08 02:58:25','VIG',NULL,'fas fa-cogs'),(4,1,'Reportes','javascript:void(0);',4,'2022-04-08 02:58:25','VIG',NULL,'fas fa-clipboard-list'),(5,1,'Estadisticas','javascript:void(0);',5,'2022-04-08 02:59:20','VIG',NULL,'fas fa-chart-pie'),(6,1,'Configuraciones','javascript:void(0);',6,'2022-04-08 02:59:20','VIG',NULL,'fas fa-cog'),(7,1,'Ventas','/operaciones/ventas',1,'2022-04-08 02:59:20','VIG',1,NULL),(8,1,'Compras','/operaciones/compras',2,'2022-04-08 02:59:20','VIG',1,NULL),(9,1,'Corte Caja','/operaciones/cortes-caja',3,'2022-04-08 02:59:20','VIG',1,NULL),(10,1,'Productos','/operaciones/producto',4,'2022-04-08 02:59:20','VIG',1,NULL),(11,1,'Clientes','/operaciones/cliente',5,'2022-04-08 02:59:20','VIG',1,NULL),(12,1,'Proveedores','/operaciones/proveedores',6,'2022-04-08 02:59:20','VIG',1,NULL),(13,1,'Ventas','/consultas/ventas',1,'2022-04-08 02:59:20','VIG',2,NULL),(14,1,'Compras','/consultas/compras',2,'2022-04-08 02:59:20','VIG',2,NULL),(15,1,'Corte Caja','/consultas/cortes-caja',3,'2022-04-08 02:59:20','VIG',2,NULL),(16,1,'Productos','/consultas/productos',4,'2022-04-08 02:59:20','VIG',2,NULL),(17,1,'Clientes','/consultas/clientes',5,'2022-04-08 02:59:20','VIG',2,NULL),(18,1,'Proveedores','/consultas/proveedores',6,'2022-04-08 02:59:20','VIG',2,NULL),(19,1,'Ventas','/reportes/ventas',1,'2022-04-08 02:59:20','VIG',3,NULL),(20,1,'Devoluciones','/reportes/devoluciones',2,'2022-04-08 02:59:20','VIG',3,NULL),(21,1,'Utilidad','/reportes/utilidades',3,'2022-04-08 02:59:20','VIG',3,NULL),(22,1,'Compras','/reportes/compras',4,'2022-04-08 02:59:20','VIG',3,NULL),(23,1,'Movimientos Caja','/reportes/movimiento-caja',5,'2022-04-08 02:59:20','VIG',3,NULL),(24,1,'Corte de Caja','/reportes/cortes-caja',6,'2022-04-08 02:59:20','VIG',3,NULL);
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
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
-- Table structure for table `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimientos` (
  `cve_movimiento` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del movimiento de caja durante un corte',
  `cve_corte_caja` int(11) DEFAULT NULL COMMENT 'Identificador del corte de caja',
  `tipo_movimiento` varchar(50) NOT NULL COMMENT 'Tipo de movimiento: ENTRADA, SALIDA',
  `fecha_movimiento` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Fecha y hora en que se realiza el movimiento',
  `importe_movimiento` decimal(11,2) NOT NULL COMMENT 'Importe del movimiento',
  `descripcion_movimiento` varchar(10) DEFAULT NULL COMMENT 'Descripción u observación asociada al movimiento',
  `medio_movimiento` varchar(50) NOT NULL COMMENT 'Medio del movimiento: EFECTIVO, CHEQUES, VALES, NOTA CREDITO',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  `cve_caja` int(11) DEFAULT NULL,
  `cve_venta` int(11) DEFAULT NULL,
  `tipo_tarjeta` varchar(50) DEFAULT NULL COMMENT 'Si el pago es con tajeta se indica el tipo de tarjeta: CREDITO, DEBITO',
  PRIMARY KEY (`cve_movimiento`) USING BTREE,
  KEY `fk_corte_caja_movimientos` (`cve_corte_caja`) USING BTREE,
  KEY `fk_movimiento_caja` (`cve_caja`) USING BTREE,
  KEY `fk_movimiento_venta` (`cve_venta`) USING BTREE,
  CONSTRAINT `fk_corte_caja_movimientos` FOREIGN KEY (`cve_corte_caja`) REFERENCES `cortes_cajas` (`cve_corte_caja`),
  CONSTRAINT `fk_movimiento_caja` FOREIGN KEY (`cve_caja`) REFERENCES `cajas` (`cve_caja`),
  CONSTRAINT `fk_movimiento_venta` FOREIGN KEY (`cve_venta`) REFERENCES `ventas` (`cve_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Registra los movimientos de valores durante un corte de caja';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos`
--

LOCK TABLES `movimientos` WRITE;
/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
INSERT INTO `movimientos` VALUES (1,NULL,'ENTRADA','2022-04-03 03:34:27',100.00,NULL,'EFECTIVO','2022-04-03 03:34:27','VIG',1,42,NULL),(2,NULL,'ENTRADA','2022-04-03 03:34:27',136.94,'1415','TARJETA','2022-04-03 03:34:27','VIG',1,42,'CREDITO');
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;
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
  KEY `password_resets_email_index` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
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
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`) USING BTREE,
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',1,'auth_token','baa3fd11c82643abc286de33b7584b68927e1dda4c44e5a3e286e19ca49b93e1','[\"*\"]',NULL,'2022-04-03 21:32:37','2022-04-03 21:32:37'),(2,'App\\Models\\User',1,'auth_token','e5850cdf6f08659357e9aa68dd34c37d5864ef6b5f6bef9e96489a1ed37adeb0','[\"*\"]',NULL,'2022-04-03 21:41:12','2022-04-03 21:41:12'),(3,'App\\Models\\User',1,'auth_token','f4e6ed51ac9b5fa897319a5d560e790b869b7654ebdb6e70d47d5f3d551ab2d2','[\"*\"]',NULL,'2022-04-03 21:41:30','2022-04-03 21:41:30'),(4,'App\\Models\\User',1,'auth_token','62e7e2cc65c567ee165b46466372b3a2ceef8e86cda01c6aa6cb00cbe0bb5f9e','[\"*\"]',NULL,'2022-04-03 21:58:27','2022-04-03 21:58:27'),(5,'App\\Models\\User',1,'auth_token','2a0fc68e3daa0482a18c967453cf42b7f7862cb830fb9ad525b0f0f32cf560b0','[\"*\"]',NULL,'2022-04-03 22:00:38','2022-04-03 22:00:38'),(6,'App\\Models\\User',1,'auth_token','4e40a5c480361e9c30d440402f326305319599baa4689b032268a69d40517175','[\"*\"]',NULL,'2022-04-03 22:01:37','2022-04-03 22:01:37'),(7,'App\\Models\\User',1,'auth_token','81d516c92b43e4437cd0b184b88a07ee29ccbb1095f1a351794df7df49e81eff','[\"*\"]',NULL,'2022-04-03 22:01:37','2022-04-03 22:01:37'),(8,'App\\Models\\User',1,'auth_token','5a4d829aafb1e16d07c017188889be9fa1525cd408aea65af61cccdeeb7f5ee4','[\"*\"]',NULL,'2022-04-03 22:01:39','2022-04-03 22:01:39'),(9,'App\\Models\\User',1,'auth_token','3e40278ebcdba789fb79dca41620de77773ec8d2e39a09d99dc54c47901851ce','[\"*\"]',NULL,'2022-04-03 22:01:40','2022-04-03 22:01:40'),(10,'App\\Models\\User',1,'auth_token','fd22f79b9ea5c037c7e0a8de31126fed4fffe2af2ba2edfc7eb9326706c67158','[\"*\"]',NULL,'2022-04-03 22:01:41','2022-04-03 22:01:41'),(11,'App\\Models\\User',1,'auth_token','4ea183986201eefbe7ee9b302a43a48d1ea5d2e378f548ecae7fb0dd724e1373','[\"*\"]',NULL,'2022-04-03 22:01:41','2022-04-03 22:01:41'),(12,'App\\Models\\User',1,'auth_token','b034cc08448f4dc3e4a40feb0368e13e62b46d2cba1eda5a2845d8a44e70d7fe','[\"*\"]',NULL,'2022-04-03 22:01:42','2022-04-03 22:01:42'),(13,'App\\Models\\User',1,'auth_token','6165dbc69a1ee969177f1f981fa8f0ba22d6810fc4968a740b10ca85a173b0ed','[\"*\"]',NULL,'2022-04-03 22:01:46','2022-04-03 22:01:46'),(14,'App\\Models\\User',1,'auth_token','6191e261e5b5f99aab005849c2bfeb3776a9ba8e53b49e2fceaa2d20c1029f8e','[\"*\"]',NULL,'2022-04-03 22:03:19','2022-04-03 22:03:19'),(15,'App\\Models\\User',1,'auth_token','9ec911f6545315138fe0a1422237225dd1924cb535313531d893ae58a352919c','[\"*\"]',NULL,'2022-04-03 22:05:03','2022-04-03 22:05:03'),(16,'App\\Models\\User',1,'auth_token','1f61901f921b43c740544d19ccdd0863177abac4b0f347b486d1a548e4b638a6','[\"*\"]',NULL,'2022-04-03 22:05:47','2022-04-03 22:05:47'),(17,'App\\Models\\User',1,'auth_token','d70e4bb85e8764126113f7c2f2d31dbcd0199bf94c5a5629d8c47b9a38f65e94','[\"*\"]',NULL,'2022-04-03 23:09:22','2022-04-03 23:09:22'),(18,'App\\Models\\User',1,'auth_token','1ad79c495e21d0d564bc275d2788ab4f20903c86fc2de798c8e8c18cd66f357a','[\"*\"]',NULL,'2022-04-03 23:09:44','2022-04-03 23:09:44'),(19,'App\\Models\\User',1,'auth_token','020ab2e02e3c15ce90d5a5387aa9802e41309f21f5938d402d30ffc261d1d446','[\"*\"]',NULL,'2022-04-03 23:09:55','2022-04-03 23:09:55'),(20,'App\\Models\\User',1,'auth_token','32a89f129baa9ad39ec329e8c464dcbce9307f3695499a9ce2500b5e7a30cc04','[\"*\"]',NULL,'2022-04-03 23:10:35','2022-04-03 23:10:35'),(21,'App\\Models\\User',1,'auth_token','f343a2646b356c1cbc1cb4acc276e90b5cdc7208060669c0b0730f480390f359','[\"*\"]',NULL,'2022-04-03 23:12:55','2022-04-03 23:12:55'),(22,'App\\Models\\User',1,'auth_token','f6326b6501f5b9190579ebc89aa11d14bdb099234cab5ce9f0e510be3d1c9891','[\"*\"]',NULL,'2022-04-03 23:13:31','2022-04-03 23:13:31'),(23,'App\\Models\\User',1,'auth_token','69c7cf81dd5af9e6036e3a6edca2b1b7ed6743b405894f9119d8a52f212996bb','[\"*\"]',NULL,'2022-04-03 23:14:57','2022-04-03 23:14:57'),(24,'App\\Models\\User',1,'auth_token','b08a56446016503e3ac312db362f58f9406a7be4f4a778ae63bdaa99a41a0eac','[\"*\"]',NULL,'2022-04-03 23:17:01','2022-04-03 23:17:01'),(25,'App\\Models\\User',1,'auth_token','67bdf939c95bbbf59978296048235a8938ad20ee8feeb49e93edbbbe19d3738e','[\"*\"]',NULL,'2022-04-03 23:17:27','2022-04-03 23:17:27'),(26,'App\\Models\\User',1,'auth_token','140022992202aab12d49b07c72cc0087da62e60cb04a7594bf82cc89802c62ef','[\"*\"]',NULL,'2022-04-03 23:20:38','2022-04-03 23:20:38'),(27,'App\\Models\\User',1,'auth_token','adbb613a2d6bd1bba52841ce874b97b529c10d56ab71516055fa35b48d46cc7d','[\"*\"]',NULL,'2022-04-03 23:22:08','2022-04-03 23:22:08'),(28,'App\\Models\\User',1,'auth_token','633c5333462b6faa3bfef5e7b834aa6c7a6995f9cdf278cade581f5bdaca408b','[\"*\"]',NULL,'2022-04-03 23:22:26','2022-04-03 23:22:26'),(29,'App\\Models\\User',1,'auth_token','4fa6bfc76c34d8a963ed61634884096c29fa1a8bfaf83788fe6f848b75fdbb06','[\"*\"]',NULL,'2022-04-03 23:23:00','2022-04-03 23:23:00'),(30,'App\\Models\\User',1,'auth_token','dbb4723c62744d76d93b63a0d606c6304dc6fd898006f267b97a9ee3c354866d','[\"*\"]',NULL,'2022-04-03 23:23:37','2022-04-03 23:23:37'),(31,'App\\Models\\User',1,'auth_token','20cfefb1bca777b01f85cee10f676036fb7897cdf580ac2a713627eee729e829','[\"*\"]',NULL,'2022-04-03 23:23:45','2022-04-03 23:23:45'),(32,'App\\Models\\User',1,'auth_token','8251957f519998345f5abc6b74154d35e02a1fae2e4ecb1314376b6f1240b1d8','[\"*\"]',NULL,'2022-04-03 23:23:46','2022-04-03 23:23:46'),(33,'App\\Models\\User',1,'auth_token','4a46303cea0ea83c0dfbb8de9b5e828f7b4ec9181f336b7012294446c4fd0bf9','[\"*\"]',NULL,'2022-04-03 23:23:48','2022-04-03 23:23:48'),(34,'App\\Models\\User',1,'auth_token','abc643731c85d9897270a3ae55720d24cb0a0fe22b4a75d99f1ae0e4716377b7','[\"*\"]',NULL,'2022-04-03 23:30:53','2022-04-03 23:30:53'),(35,'App\\Models\\User',1,'auth_token','f7ed0dba7d2ddd535ed008f1c96afa2e97f4008f294aeafcc4868e0e18d1d0b8','[\"*\"]',NULL,'2022-04-03 23:34:55','2022-04-03 23:34:55'),(36,'App\\Models\\User',1,'auth_token','b027e4038c3e40c378db9eee887093a2cd0730173f41b79c8c47fb592e2ff7ca','[\"*\"]',NULL,'2022-04-03 23:35:10','2022-04-03 23:35:10'),(37,'App\\Models\\User',1,'auth_token','1b69f79015dbf2a31215b07a9f7859acfa9c71f32a48adf5a314e7db709b5be6','[\"*\"]',NULL,'2022-04-03 23:39:38','2022-04-03 23:39:38'),(38,'App\\Models\\User',1,'auth_token','e2c04abaf293f55b120018ea4575078550d1625e78cf5989de172ded542dd16e','[\"*\"]',NULL,'2022-04-03 23:48:10','2022-04-03 23:48:10'),(39,'App\\Models\\User',1,'auth_token','9ec0f0289b3079448dcfa1c6da73fbe34e925d8e527494b1e11870dde482613e','[\"*\"]',NULL,'2022-04-04 00:36:45','2022-04-04 00:36:45'),(40,'App\\Models\\User',1,'auth_token','0dc4d7a27bf8bb5689538732532ba56e9a8e252cdd0b2ace1519a15d45c6fc49','[\"*\"]',NULL,'2022-04-04 00:37:17','2022-04-04 00:37:17'),(41,'App\\Models\\User',1,'auth_token','2f1fc35c9de5551e9b7cb5a77bcbb534ee5a72eb1379ae1807d851b9ccc25608','[\"*\"]',NULL,'2022-04-04 07:20:25','2022-04-04 07:20:25'),(42,'App\\Models\\User',1,'auth_token','27de3230087716e820842fa789ac39ab1c90d2a1cb35de8576ac1dc2205af731','[\"*\"]',NULL,'2022-04-04 07:39:44','2022-04-04 07:39:44'),(43,'App\\Models\\User',1,'auth_token','680bba61082252ffbbef363a45c18a23bcba1035511ad13fa21cf7a6d9b25584','[\"*\"]',NULL,'2022-04-04 08:01:30','2022-04-04 08:01:30'),(44,'App\\Models\\User',1,'auth_token','a46d4e93dc821d9c687f77e3708ab56f2f9a4dfd4648e194ef5939af7ed60dfe','[\"*\"]',NULL,'2022-04-04 08:07:28','2022-04-04 08:07:28'),(45,'App\\Models\\User',1,'auth_token','c31dca0d2a784182d5e0697a24add6772de9297cf5635d9fd274b3eba313b438','[\"*\"]',NULL,'2022-04-04 08:09:45','2022-04-04 08:09:45'),(46,'App\\Models\\User',1,'auth_token','7654dcd9748a9169de1ba0f2f0dea1892c068369f22bf7279e97cec1c5d25e02','[\"*\"]',NULL,'2022-04-04 08:10:54','2022-04-04 08:10:54'),(47,'App\\Models\\User',2,'auth_token','df681d36e880ffe3164cdc3793753795594deeaeac88053c0be1903d86296eb4','[\"*\"]',NULL,'2022-04-05 06:43:44','2022-04-05 06:43:44'),(48,'App\\Models\\User',3,'auth_token','848e8c115bb554765234484c11c8b5dded771a3bd21b02d88940ae20f0200606','[\"*\"]',NULL,'2022-04-05 06:46:03','2022-04-05 06:46:03'),(49,'App\\Models\\User',4,'auth_token','83da59c219c54255754409cfed896fe6ad92a8a4d26ea419122f2b8a8a360058','[\"*\"]',NULL,'2022-04-05 06:48:51','2022-04-05 06:48:51'),(50,'App\\Models\\User',5,'auth_token','68db176cf1d6e57f002b2bf190bc4b921c695bf6f37f34d20871986def00897c','[\"*\"]',NULL,'2022-04-05 07:30:13','2022-04-05 07:30:13'),(51,'App\\Models\\User',6,'auth_token','808989f015dd49abf59de5c3e1a850cb70eae6af4fb1a03c706c7fa22a46e60b','[\"*\"]',NULL,'2022-04-05 07:46:50','2022-04-05 07:46:50');
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
  `producto` varchar(200) DEFAULT NULL COMMENT 'Nombre del producto o material',
  `codigo_barras` varchar(50) DEFAULT NULL COMMENT 'Código de barras asociado al producto',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  `clave_interna` varchar(50) DEFAULT NULL,
  `servicio` tinyint(1) DEFAULT NULL,
  `cve_unidad_compra` int(11) DEFAULT NULL,
  `cve_unidad_venta` int(11) DEFAULT NULL,
  `factor` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`cve_producto`) USING BTREE,
  KEY `fk_categoria_producto` (`cve_categoria`) USING BTREE,
  KEY `fk_empresa_productos` (`cve_empresa`) USING BTREE,
  KEY `fk_unidad_compra_producto` (`cve_unidad_compra`) USING BTREE,
  KEY `fk_unidad_venta_producto` (`cve_unidad_venta`) USING BTREE,
  CONSTRAINT `fk_categoria_producto` FOREIGN KEY (`cve_categoria`) REFERENCES `categorias` (`cve_categoria`),
  CONSTRAINT `fk_empresa_productos` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`),
  CONSTRAINT `fk_unidad_compra_producto` FOREIGN KEY (`cve_unidad_compra`) REFERENCES `unidades` (`cve_unidad`),
  CONSTRAINT `fk_unidad_venta_producto` FOREIGN KEY (`cve_unidad_venta`) REFERENCES `unidades` (`cve_unidad`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Catálogo de productos o materiales';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,1,12,'ACEITE SUPERTECH PACK DE 12 PIEZAS SAE40 DE 946 ML.','00750300927201','2022-03-21 04:51:58','VIG','1647882251783',0,2,1,12.00),(2,1,4,'BUJIA NGK DCPR8EIX (C/4) NGK','00046355123495','2022-03-21 05:24:55','VIG','1647882224193',0,1,1,1.00),(3,1,7,'PRODUCTO DE PRUEBA DE CAPTURA','651516565','2022-03-22 17:27:04','VIG','1647969946323',0,2,1,16.00),(4,1,17,'COCA COLA DE 3LT','00750300927203','2022-03-27 04:40:24','VIG','',0,2,1,8.00),(5,1,2,'ESTE ES OTRO PRODUCTO DE PRUEBA','3','2022-03-31 16:08:33','VIG','',0,1,1,1.00);
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
  `descripcion` text DEFAULT NULL COMMENT 'Descripción asociada',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_producto_descripcion`) USING BTREE,
  KEY `fk_producto_producto_descripciones` (`cve_producto`) USING BTREE,
  CONSTRAINT `fk_producto_producto_descripciones` FOREIGN KEY (`cve_producto`) REFERENCES `productos` (`cve_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Registra las descripciones asociadas a los productos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_descripciones`
--

LOCK TABLES `productos_descripciones` WRITE;
/*!40000 ALTER TABLE `productos_descripciones` DISABLE KEYS */;
INSERT INTO `productos_descripciones` VALUES (5,21,'refresco que se encuentra en envase desechable','2022-03-20 16:25:54','NVI'),(6,22,'refresco que se encuentra en envase desechable','2022-03-20 16:37:10','VIG'),(7,23,'refresco que se encuentra en envase desechable','2022-03-20 16:38:20','VIG'),(10,26,'CARACTERISTICAS','2022-03-20 17:31:47','VIG'),(11,27,'CARACTERISTICAS','2022-03-20 17:33:42','VIG'),(13,29,'CONTENIDO DEL EMPAQUE\n1 PAQUETE DE 12 BOTELLAS DE 946 ML CADA UNA\nPAÍS DE ORIGEN: MÉXICO\nTIPO DE MOTOR: MOTOR A GASOLINA\nTIPO DE ACEITE: CONVENCIONAL\nÍNDICE DE VISCOSIDAD: -15°C\nCAPACIDAD LT: MENOS DE 1 LITRO\nCLASIFICACIÓN DEL ACEITE: MONOGRADO\nPUNTO DE EBULLICIÓN: 236 °C\nPUNTO DE CONGELAMIENTO: -15°C\nESPECIFICACIONES O APROBACIONES DEL ANTICONGELANTE: SL','2022-03-21 03:55:34','NVI'),(14,30,'KNSLKNLKDSNALKN','2022-03-21 03:59:34','VIG'),(15,31,'KJSD K AKJDJAS DJK ','2022-03-21 04:04:02','VIG'),(16,29,'CONTENIDO DEL EMPAQUE\n1 PAQUETE DE 12 BOTELLAS DE 946 ML CADA UNA\nPAÍS DE ORIGEN: MÉXICO\nTIPO DE MOTOR: MOTOR A GASOLINA\nTIPO DE ACEITE: CONVENCIONAL\nÍNDICE DE VISCOSIDAD: -15°C\nCAPACIDAD LT: MENOS DE 1 LITRO\nCLASIFICACIÓN DEL ACEITE: MONOGRADO\nPUNTO DE EBULLICIÓN: 236 °C\nPUNTO DE CONGELAMIENTO: -15°C\nESPECIFICACIONES O APROBACIONES DEL ANTICONGELANTE: SL\nJJ','2022-03-21 04:22:04','NVI'),(17,29,'CONTENIDO DEL EMPAQUE\n1 PAQUETE DE 12 BOTELLAS DE 946 ML CADA UNA\nPAÍS DE ORIGEN: MÉXICO\nTIPO DE MOTOR: MOTOR A GASOLINA\nTIPO DE ACEITE: CONVENCIONAL\nÍNDICE DE VISCOSIDAD: -15°C\nCAPACIDAD LT: MENOS DE 1 LITRO\nCLASIFICACIÓN DEL ACEITE: MONOGRADO\nPUNTO DE EBULLICIÓN: 236 °C\nPUNTO DE CONGELAMIENTO: -15°C\nESPECIFICACIONES O APROBACIONES DEL ANTICONGELANTE: SL\nJJJJJJJ','2022-03-21 04:34:00','NVI'),(18,29,'CONTENIDO DEL EMPAQUE\n1 PAQUETE DE 12 BOTELLAS DE 946 ML CADA UNA\nPAÍS DE ORIGEN: MÉXICO\nTIPO DE MOTOR: MOTOR A GASOLINA\nTIPO DE ACEITE: CONVENCIONAL\nÍNDICE DE VISCOSIDAD: -15°C\nCAPACIDAD LT: MENOS DE 1 LITRO\nCLASIFICACIÓN DEL ACEITE: MONOGRADO\nPUNTO DE EBULLICIÓN: 236 °C\nPUNTO DE CONGELAMIENTO: -15°C\nESPECIFICACIONES O APROBACIONES DEL ANTICONGELANTE: SL','2022-03-21 04:34:41','VIG'),(19,1,'CONTENIDO DEL EMPAQUE\n1 PAQUETE DE 12 BOTELLAS DE 946 ML CADA UNA\nPAÍS DE ORIGEN: MÉXICO\nTIPO DE MOTOR: MOTOR A GASOLINA\nTIPO DE ACEITE: CONVENCIONAL\nÍNDICE DE VISCOSIDAD: -15°C\nCAPACIDAD LT: MENOS DE 1 LITRO\nCLASIFICACIÓN DEL ACEITE: MONOGRADO\nPUNTO DE EBULLICIÓN: 236 °C\nPUNTO DE CONGELAMIENTO: -15°C\nESPECIFICACIONES O APROBACIONES DEL ANTICONGELANTE: SL','2022-03-21 04:51:58','VIG'),(20,2,'COMPATIBILIDAD: NGK\nPAÍS DE ORIGEN: CHINA\nLARGO DEL PRODUCTO ARMADO: 5 CM\nALTURA DEL PRODUCTO ARMADO: 5 CM\nTIPO DE PRESENTACIÓN: NO APLICA\nCONTENIDO DEL EMPAQUE: 1\nANCHO DEL PRODUCTO ARMADO: 5 CM\nGAMA COLOR: AMARILLO\nPESO DEL PRODUCTO ARMADO: 1 KG','2022-03-21 05:24:55','VIG'),(21,3,'CARACTERISTICAS DEL PRODUCTO PRUEBA','2022-03-22 17:27:04','VIG'),(22,4,'','2022-03-27 04:40:24','VIG'),(23,5,'','2022-03-31 16:08:33','VIG');
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
  `existencia` decimal(11,2) DEFAULT NULL COMMENT 'Existencia del producto en la sucursal',
  `existencia_minima` decimal(11,2) DEFAULT NULL COMMENT 'Existencia mínima del producto antes de realizar pedido',
  `ubicacion` varchar(200) DEFAULT NULL COMMENT 'Descripción de la ubicación del producto',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  `precio_compra` decimal(11,3) DEFAULT NULL,
  `precio_compra_neto_sin` decimal(11,3) DEFAULT NULL,
  `precio_venta` decimal(11,3) DEFAULT NULL,
  `precio_venta_neto` decimal(11,2) DEFAULT NULL,
  `precio_compra_neto` decimal(11,2) DEFAULT NULL,
  `neto` tinyint(1) DEFAULT NULL,
  `utilidad` decimal(11,2) DEFAULT NULL,
  `precio_compra_prom` decimal(11,3) DEFAULT NULL,
  PRIMARY KEY (`cve_producto_sucursal`) USING BTREE,
  KEY `Ref16` (`cve_sucursal`) USING BTREE,
  KEY `fk_producto_producto_sucursal` (`cve_producto`) USING BTREE,
  CONSTRAINT `Refsucursales6` FOREIGN KEY (`cve_sucursal`) REFERENCES `sucursales` (`cve_sucursal`),
  CONSTRAINT `fk_producto_producto_sucursal` FOREIGN KEY (`cve_producto`) REFERENCES `productos` (`cve_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Contiene la existencia de productos en una sucursal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_sucursales`
--

LOCK TABLES `productos_sucursales` WRITE;
/*!40000 ALTER TABLE `productos_sucursales` DISABLE KEYS */;
INSERT INTO `productos_sucursales` VALUES (1,1,1,0.00,0.00,NULL,'2022-03-21 04:51:58','NVI',52.371,628.448,78.556,91.13,729.00,1,50.00,NULL),(2,1,1,0.00,0.00,NULL,'2022-03-21 04:54:25','VIG',68.822,825.862,103.233,119.75,958.00,1,50.00,479.000),(3,1,2,4.00,0.00,NULL,'2022-03-21 05:24:55','NVI',1018.103,1018.103,1537.336,1783.31,1181.00,1,50.00,NULL),(4,1,2,4.00,0.00,NULL,'2022-03-21 05:28:15','NVI',1681.422,1681.422,2101.778,2438.06,1950.45,1,25.00,975.225),(5,1,3,0.00,0.00,NULL,'2022-03-22 17:27:04','VIG',80.819,1293.103,101.024,117.19,1500.00,1,25.00,NULL),(6,1,2,4.00,0.00,NULL,'2022-03-22 17:27:43','VIG',1853.448,1853.448,2316.810,2687.50,2150.00,1,25.00,1075.000),(7,1,4,0.00,0.00,NULL,'2022-03-27 04:40:24','VIG',23.591,188.724,35.386,41.05,218.92,1,50.00,NULL),(8,1,5,0.00,0.00,NULL,'2022-03-31 16:08:33','VIG',103.448,103.448,155.172,180.00,120.00,1,50.00,NULL);
/*!40000 ALTER TABLE `productos_sucursales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_sucursales_impuestos`
--

DROP TABLE IF EXISTS `productos_sucursales_impuestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos_sucursales_impuestos` (
  `cve_producto_sucursal_impuesto` int(11) NOT NULL AUTO_INCREMENT,
  `cve_producto_sucursal` int(11) NOT NULL,
  `cve_impuesto` int(11) NOT NULL,
  `fecha_alta` timestamp NULL DEFAULT current_timestamp(),
  `estatus_registro` varchar(3) DEFAULT 'VIG',
  PRIMARY KEY (`cve_producto_sucursal_impuesto`) USING BTREE,
  KEY `fk_cve_producuto_sucursal_tb_impuesto` (`cve_producto_sucursal`) USING BTREE,
  KEY `fk_cve_impuesto_producto_sucursal` (`cve_impuesto`) USING BTREE,
  CONSTRAINT `fk_cve_impuesto_producto_sucursal` FOREIGN KEY (`cve_impuesto`) REFERENCES `impuestos` (`cve_impuesto`),
  CONSTRAINT `fk_cve_producuto_sucursal_tb_impuesto` FOREIGN KEY (`cve_producto_sucursal`) REFERENCES `productos_sucursales` (`cve_producto_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_sucursales_impuestos`
--

LOCK TABLES `productos_sucursales_impuestos` WRITE;
/*!40000 ALTER TABLE `productos_sucursales_impuestos` DISABLE KEYS */;
INSERT INTO `productos_sucursales_impuestos` VALUES (16,2,1,'2022-03-21 17:04:14','VIG'),(21,6,1,'2022-03-22 17:27:43','VIG'),(25,7,1,'2022-03-27 04:40:24','VIG'),(26,5,1,'2022-03-30 03:59:55','VIG'),(27,8,1,'2022-03-31 16:08:33','VIG');
/*!40000 ALTER TABLE `productos_sucursales_impuestos` ENABLE KEYS */;
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
-- Table structure for table `roles_accion`
--

DROP TABLE IF EXISTS `roles_accion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_accion` (
  `cve_rol_accion` int(11) NOT NULL AUTO_INCREMENT,
  `cve_rol` int(11) DEFAULT NULL,
  `cve_accion` int(11) DEFAULT NULL,
  `fecha_alta` timestamp NULL DEFAULT current_timestamp(),
  `estatus_registro` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`cve_rol_accion`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_accion`
--

LOCK TABLES `roles_accion` WRITE;
/*!40000 ALTER TABLE `roles_accion` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_accion` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Catálogo de sucursales';
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
  PRIMARY KEY (`cve_unidad`) USING BTREE,
  KEY `fk_empresas_unidades` (`cve_empresa`) USING BTREE,
  CONSTRAINT `fk_empresas_unidades` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades`
--

LOCK TABLES `unidades` WRITE;
/*!40000 ALTER TABLE `unidades` DISABLE KEYS */;
INSERT INTO `unidades` VALUES (1,1,'PZA','PIEZA','VIG','2022-03-13 20:28:45'),(2,1,'CAJA','CAJA','VIG','2022-03-13 20:28:45'),(3,1,'KG','KILOGRAMNO','VIG','2022-03-13 20:28:45'),(4,1,'LT','LITROS','VIG','2022-03-13 20:28:45'),(5,1,'m','METROS','VIG','2022-03-13 20:28:45'),(6,1,'VOL','VOLUMENT','VIG','2022-03-13 21:21:21'),(7,1,'PR',NULL,'VIG','2022-03-13 21:27:15'),(8,1,'PR3','PRUEBA  DOS','VIG','2022-03-13 21:27:44'),(9,1,'PR45','PRUEBA NUMERO 45','VIG','2022-03-14 01:27:54'),(10,1,'PR46','PRUEBA NUMERO 46','VIG','2022-03-14 01:35:00'),(12,1,'PR48','PRUEBA NUMERO 48','NVI','2022-03-14 01:46:11'),(13,1,'PR58','PRUEBA NUMERO 58','VIG','2022-03-14 01:46:38'),(16,1,'PR123','ESTO ES UNA PRUEBA','VIG','2022-03-20 05:03:18');
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
  `celular` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estatus_registro` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cve_empresa` int(11) DEFAULT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cve_sucursal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `users_email_unique` (`email`) USING BTREE,
  KEY `fk_users_empresa` (`cve_empresa`) USING BTREE,
  CONSTRAINT `fk_users_empresa` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Miguel Angel Cruz Garcia','miguelcruz',NULL,'$2y$10$Lf5rxaanF7QUf33D3YI9GOWFNzGVbNFJgoT.8yzRi5.ESaQ5n4fUa',NULL,'2022-04-03 21:32:37','2022-04-03 21:32:37','9933465024','VIG',1,'miguelcruz',1),(4,'DANIEL VAZQUEZ PERALTA','danielvazquez@tabasco.gob.mx',NULL,'$2y$10$YpLiX/WWuTDY2ZdOFkIrMeIY5.o9T0WqFRa3mwQ2mmdixbfDSkAH6',NULL,'2022-04-05 06:48:51','2022-04-05 06:48:51',NULL,'VIG',1,'danielvazquez',1),(5,'JOSE MENDEZ MONDRAGON','josecmendez@tabasco.gob.mx',NULL,'$2y$10$S3ISjmMRtfvwZ/YhNj6Bmuoby7Oz.OTIxWgM4dTuIsOeyn9AxOdPa',NULL,'2022-04-05 07:30:13','2022-04-05 07:30:13',NULL,'VIG',1,'josemendez',1),(10,'SOFIA ALVAREZ MORENO','sofiaalvarez1890@gmail.com',NULL,'$2y$10$lxyOPrBblyP4eApsDoRnG.72qB1C0rXOu.lRoMr6iSim0owzxSIk.',NULL,'2022-04-05 08:00:31','2022-04-05 08:00:31',NULL,NULL,1,'sofiaalvarez',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_roles` (
  `cve_usuario_rol` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la asociación del rol al usuario',
  `cve_rol` int(11) NOT NULL COMMENT 'Identificador del catálogo de roles',
  `cve_usuario` bigint(20) unsigned DEFAULT NULL COMMENT 'Identificador del catálogo de usuarios',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_usuario_rol`) USING BTREE,
  KEY `Ref53` (`cve_rol`) USING BTREE,
  KEY `fk_usuario_rol` (`cve_usuario`) USING BTREE,
  CONSTRAINT `Refroles3` FOREIGN KEY (`cve_rol`) REFERENCES `roles` (`cve_rol`),
  CONSTRAINT `users_roles_FK` FOREIGN KEY (`cve_usuario`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Registra las asociaciones de los roles a los usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
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
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas` (
  `cve_venta` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro de ventas',
  `cve_sucursal` int(11) NOT NULL COMMENT 'Identificador del catálogo de sucursales',
  `cve_cliente` int(11) NOT NULL COMMENT 'Identificador del catálogo de clientes',
  `cve_corte_caja` int(11) DEFAULT NULL COMMENT 'Identificador del corte de caja',
  `cve_tecnico` int(11) DEFAULT NULL COMMENT 'Identificador del catálogo de técnicos',
  `nombre_cliente` varchar(200) DEFAULT NULL COMMENT 'Nombre del cliente de mostrador',
  `tipo_venta` varchar(50) DEFAULT NULL COMMENT 'Indica el tipo de venta: NORMAL, SERVICIO, GARANTÍA',
  `fecha_venta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Fecha en que se realiza la venta',
  `tipo_comprobante` varchar(50) DEFAULT NULL COMMENT 'Indica el tipo de comprobante: TICKET, FACTURA, CORREO',
  `estatus_venta` varchar(50) DEFAULT NULL COMMENT 'Estatus de la venta: ENCAPTURA, PORPAGAR, PAGADA, ENTREGADA, FACTURAR, CERRADA, CANCELADA',
  `folio_ticket` varchar(50) DEFAULT NULL COMMENT 'Folio del ticket de venta asociado',
  `numero_transaccion` int(50) DEFAULT NULL COMMENT 'Número de transacción asociado',
  `usuario_alta` varchar(50) DEFAULT NULL COMMENT 'Clave de usuario que da de alta el registro',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  `subtotal` decimal(10,2) DEFAULT NULL,
  `descuento` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `cambio` decimal(10,2) DEFAULT NULL,
  `letra` varchar(255) DEFAULT NULL,
  `comentario` text DEFAULT NULL,
  `total_compra` decimal(10,2) DEFAULT NULL,
  `total_utilidad` decimal(10,2) DEFAULT NULL,
  `subtotal_compra` decimal(10,2) DEFAULT NULL,
  `subtotal_utilidad` decimal(10,2) DEFAULT NULL,
  `cve_vendedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`cve_venta`) USING BTREE,
  KEY `fk_tecnico_venta` (`cve_tecnico`) USING BTREE,
  KEY `fk_cliente_venta` (`cve_cliente`) USING BTREE,
  KEY `fk_corte_caja_venta` (`cve_corte_caja`) USING BTREE,
  KEY `fk_sucursal_venta` (`cve_sucursal`) USING BTREE,
  CONSTRAINT `fk_cliente_venta` FOREIGN KEY (`cve_cliente`) REFERENCES `clientes` (`cve_cliente`),
  CONSTRAINT `fk_corte_caja_venta` FOREIGN KEY (`cve_corte_caja`) REFERENCES `cortes_cajas` (`cve_corte_caja`),
  CONSTRAINT `fk_sucursal_venta` FOREIGN KEY (`cve_sucursal`) REFERENCES `sucursales` (`cve_sucursal`),
  CONSTRAINT `fk_tecnico_venta` FOREIGN KEY (`cve_tecnico`) REFERENCES `tecnicos` (`cve_tecnico`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Registro de las ventas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (30,1,18,NULL,NULL,'DANIEL VAZQUEZ PERALTA','NORMAL','2022-04-02 06:12:40','TICKET','PAGADA','6247E95875570',1,NULL,'2022-04-02 06:12:40','VIG',163.41,47.39,189.55,NULL,'CIENTO OCHENTA Y NUEVE PESOS 55/100 MNX',NULL,173.58,15.97,149.64,13.76,1),(31,1,18,NULL,NULL,'DANIEL VAZQUEZ PERALTA','NORMAL','2022-04-02 06:14:14','TICKET','PAGADA','6247E9B62904D',1,NULL,'2022-04-02 06:14:14','VIG',163.41,47.39,189.55,NULL,'CIENTO OCHENTA Y NUEVE PESOS 55/100 MNX',NULL,173.58,15.97,149.64,13.76,1),(32,1,1,NULL,NULL,'MIGUEL ','NORMAL','2022-04-02 14:30:25','TICKET','PAGADA','62485E01B259E',1,NULL,'2022-04-02 14:30:25','VIG',204.26,0.00,236.94,NULL,'DOSCIENTOS TREINTA Y SEIS PESOS 94/100 MNX',NULL,173.58,63.36,149.64,54.62,1),(33,1,1,NULL,NULL,'MIGUEL','NORMAL','2022-04-02 14:32:12','TICKET','PAGADA','62485E6C77B5D',1,NULL,'2022-04-02 14:32:12','VIG',204.26,0.00,236.94,63.06,'DOSCIENTOS TREINTA Y SEIS PESOS 94/100 MNX',NULL,173.58,63.36,149.64,54.62,1),(34,1,1,NULL,NULL,'SELENE DEL CARMEN','NORMAL','2022-04-02 14:34:53','TICKET','PAGADA','62485F0DA8145',2,NULL,'2022-04-02 14:34:53','VIG',204.26,0.00,236.94,13.06,'DOSCIENTOS TREINTA Y SEIS PESOS 94/100 MNX',NULL,173.58,63.36,149.64,54.62,1),(35,1,18,NULL,NULL,'DANIEL VAZQUEZ PERALTA','NORMAL','2022-04-02 14:36:43','TICKET','PAGADA','62485F7B26A7F',3,NULL,'2022-04-02 14:36:43','VIG',1936.03,561.45,2245.80,0.00,'DOS MIL DOSCIENTOS CUARENTA Y CINCO PESOS 80/100 MNX',NULL,2229.83,15.97,1922.27,13.76,1),(36,1,1,NULL,NULL,'PRUEBA','NORMAL','2022-04-02 14:40:22','TICKET','PAGADA','624860564136F',4,NULL,'2022-04-02 14:40:22','VIG',204.26,0.00,236.94,13.06,'DOSCIENTOS TREINTA Y SEIS PESOS 94/100 MNX','somos los mejores',173.58,63.36,149.64,54.62,1),(37,1,16,NULL,NULL,'MIGUEL ANGEL CRUZ GARCIA','NORMAL','2022-04-02 14:46:21','TICKET','PAGADA','624861BDB51A3',5,NULL,'2022-04-02 14:46:21','VIG',2142.91,438.66,2485.78,0.00,'DOS MIL CUATROCIENTOS OCHENTA Y CINCO PESOS 78/100 MNX','',2323.58,162.20,2003.09,139.82,1),(38,1,2,NULL,NULL,'ROMAN DE LA CRUZ MARTINEZ PEÑA','NORMAL','2022-04-03 02:08:54','TICKET','PAGADA','624901B67A537',6,NULL,'2022-04-03 02:08:54','VIG',92.91,11.97,107.78,0.00,'CIENTO SIETE PESOS 78/100 MNX','',79.83,27.95,68.82,24.09,1),(39,1,18,NULL,NULL,'DANIEL VAZQUEZ PERALTA','NORMAL','2022-04-03 02:15:14','TICKET','PAGADA','62490332C5C53',7,NULL,'2022-04-03 02:15:14','VIG',1962.58,569.15,2276.59,0.00,'DOS MIL DOSCIENTOS SETENTA Y SEIS PESOS 59/100 MNX','',2271.11,5.48,1957.86,4.72,1),(40,1,18,NULL,NULL,'DANIEL VAZQUEZ PERALTA','NORMAL','2022-04-03 02:17:35','TICKET','PAGADA','624903BFB7D86',8,NULL,'2022-04-03 02:17:35','VIG',191.71,55.60,222.39,0.00,'DOSCIENTOS VEINTIDOS PESOS 39/100 MNX','somos los mejores',200.94,21.45,173.23,18.48,1),(42,1,1,NULL,NULL,'MIKE','NORMAL','2022-04-03 03:34:27','TICKET','PAGADA','624915C3E8581',9,NULL,'2022-04-03 03:34:27','VIG',204.26,0.00,236.94,0.00,'DOSCIENTOS TREINTA Y SEIS PESOS 94/100 MNX','',173.58,63.36,149.64,54.62,1),(43,1,3,NULL,NULL,'SELENE DEL CARMEN LOPEZ OSORIO','NORMAL','2022-04-06 02:47:14','TICKET','PORPAGAR','624CFF110EC8E',NULL,NULL,'2022-04-06 02:46:41','VIG',463.14,59.69,537.25,0.00,'QUINIENTOS TREINTA Y SIETE PESOS 25/100 MNX','',413.58,123.67,356.54,106.60,1);
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
  `cantidad` decimal(11,2) DEFAULT NULL COMMENT 'Cantidad de producto o material',
  `unidad_medida` varchar(50) DEFAULT NULL COMMENT 'Unidad de medida del producto o material: PIEZA, LITRO, METRO',
  `estatus_venta_detalle` varchar(50) DEFAULT NULL COMMENT 'Estatus del detalle de venta: CAPTURADO, CANCELADO, DEVUELTO',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(5) NOT NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  `codigo_barras` varchar(50) DEFAULT NULL,
  `producto` varchar(200) DEFAULT NULL,
  `precio_normal` decimal(11,3) DEFAULT NULL,
  `precio_normal_neto` decimal(11,2) DEFAULT NULL,
  `precio_venta` decimal(11,3) DEFAULT NULL,
  `precio_venta_neto` decimal(11,2) DEFAULT NULL,
  `importe_normal` decimal(11,3) DEFAULT NULL,
  `importe_normal_neto` decimal(11,2) DEFAULT NULL,
  `importe_venta` decimal(11,2) DEFAULT NULL,
  `importe_venta_neto` decimal(11,2) DEFAULT NULL,
  `desc_porcentaje` decimal(11,2) DEFAULT NULL,
  `desc_total` decimal(11,2) DEFAULT NULL,
  `precio_compra` decimal(11,2) DEFAULT NULL,
  `importe_compra` decimal(11,2) DEFAULT NULL,
  `subtotal_compra` decimal(11,2) DEFAULT NULL,
  `impuesto_total` decimal(11,3) DEFAULT NULL,
  `precio_compra_neto` decimal(11,2) DEFAULT NULL,
  `factor` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`cve_venta_detalle`) USING BTREE,
  KEY `fk_producto_sucursal_venta_detalle` (`cve_producto_sucursal`) USING BTREE,
  KEY `idx_venta_detalle_venta` (`cve_venta`) USING BTREE,
  CONSTRAINT `fk_producto_sucursal_venta_detalle` FOREIGN KEY (`cve_producto_sucursal`) REFERENCES `productos_sucursales` (`cve_producto_sucursal`),
  CONSTRAINT `fk_venta_detalle_venta` FOREIGN KEY (`cve_venta`) REFERENCES `ventas` (`cve_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Registra los detalles de las ventas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_detalles`
--

LOCK TABLES `ventas_detalles` WRITE;
/*!40000 ALTER TABLE `ventas_detalles` DISABLE KEYS */;
INSERT INTO `ventas_detalles` VALUES (50,30,2,1.00,'PZA','CAPTURADO','2022-04-02 06:12:40','VIG','00750300927201','ACEITE SUPERTECH PACK DE 12 PIEZAS SAE40 DE 946 ML.',103.233,119.75,82.586,95.80,103.233,119.75,82.59,95.80,20.00,23.95,68.82,79.83,68.82,0.160,958.00,12.00),(51,30,5,1.00,'PZA','CAPTURADO','2022-04-02 06:12:40','VIG','651516565','PRODUCTO DE PRUEBA DE CAPTURA',101.024,117.19,80.819,93.75,101.024,117.19,80.82,93.75,20.00,23.44,80.82,93.75,80.82,0.160,1500.00,16.00),(52,31,2,1.00,'PZA','CAPTURADO','2022-04-02 06:14:14','VIG','00750300927201','ACEITE SUPERTECH PACK DE 12 PIEZAS SAE40 DE 946 ML.',103.233,119.75,82.586,95.80,103.233,119.75,82.59,95.80,20.00,23.95,68.82,79.83,68.82,0.160,958.00,12.00),(53,31,5,1.00,'PZA','CAPTURADO','2022-04-02 06:14:14','VIG','651516565','PRODUCTO DE PRUEBA DE CAPTURA',101.024,117.19,80.819,93.75,101.024,117.19,80.82,93.75,20.00,23.44,80.82,93.75,80.82,0.160,1500.00,16.00),(54,32,2,1.00,'PZA','CAPTURADO','2022-04-02 14:30:25','VIG','00750300927201','ACEITE SUPERTECH PACK DE 12 PIEZAS SAE40 DE 946 ML.',103.233,119.75,103.233,119.75,103.233,119.75,103.23,119.75,0.00,0.00,68.82,79.83,68.82,0.160,958.00,12.00),(55,32,5,1.00,'PZA','CAPTURADO','2022-04-02 14:30:25','VIG','651516565','PRODUCTO DE PRUEBA DE CAPTURA',101.024,117.19,101.024,117.19,101.024,117.19,101.02,117.19,0.00,0.00,80.82,93.75,80.82,0.160,1500.00,16.00),(56,33,2,1.00,'PZA','CAPTURADO','2022-04-02 14:32:12','VIG','00750300927201','ACEITE SUPERTECH PACK DE 12 PIEZAS SAE40 DE 946 ML.',103.233,119.75,103.233,119.75,103.233,119.75,103.23,119.75,0.00,0.00,68.82,79.83,68.82,0.160,958.00,12.00),(57,33,5,1.00,'PZA','CAPTURADO','2022-04-02 14:32:12','VIG','651516565','PRODUCTO DE PRUEBA DE CAPTURA',101.024,117.19,101.024,117.19,101.024,117.19,101.02,117.19,0.00,0.00,80.82,93.75,80.82,0.160,1500.00,16.00),(58,34,2,1.00,'PZA','CAPTURADO','2022-04-02 14:34:53','VIG','00750300927201','ACEITE SUPERTECH PACK DE 12 PIEZAS SAE40 DE 946 ML.',103.233,119.75,103.233,119.75,103.233,119.75,103.23,119.75,0.00,0.00,68.82,79.83,68.82,0.160,958.00,12.00),(59,34,5,1.00,'PZA','CAPTURADO','2022-04-02 14:34:53','VIG','651516565','PRODUCTO DE PRUEBA DE CAPTURA',101.024,117.19,101.024,117.19,101.024,117.19,101.02,117.19,0.00,0.00,80.82,93.75,80.82,0.160,1500.00,16.00),(60,35,2,1.00,'PZA','CAPTURADO','2022-04-02 14:36:43','VIG','00750300927201','ACEITE SUPERTECH PACK DE 12 PIEZAS SAE40 DE 946 ML.',103.233,119.75,82.586,95.80,103.233,119.75,82.59,95.80,20.00,23.95,68.82,79.83,68.82,0.160,958.00,12.00),(61,35,6,1.00,'PZA','CAPTURADO','2022-04-02 14:36:43','VIG','00046355123495','BUJIA NGK DCPR8EIX (C/4) NGK',2316.810,2687.50,1853.448,2150.00,2316.810,2687.50,1853.45,2150.00,20.00,537.50,1853.45,2150.00,1853.45,0.160,2150.00,1.00),(62,36,2,1.00,'PZA','CAPTURADO','2022-04-02 14:40:22','VIG','00750300927201','ACEITE SUPERTECH PACK DE 12 PIEZAS SAE40 DE 946 ML.',103.233,119.75,103.233,119.75,103.233,119.75,103.23,119.75,0.00,0.00,68.82,79.83,68.82,0.160,958.00,12.00),(63,36,5,1.00,'PZA','CAPTURADO','2022-04-02 14:40:22','VIG','651516565','PRODUCTO DE PRUEBA DE CAPTURA',101.024,117.19,101.024,117.19,101.024,117.19,101.02,117.19,0.00,0.00,80.82,93.75,80.82,0.160,1500.00,16.00),(64,37,2,1.00,'PZA','CAPTURADO','2022-04-02 14:46:21','VIG','00750300927201','ACEITE SUPERTECH PACK DE 12 PIEZAS SAE40 DE 946 ML.',103.233,119.75,87.748,101.79,103.233,119.75,87.75,101.79,15.00,17.96,68.82,79.83,68.82,0.160,958.00,12.00),(65,37,5,1.00,'PZA','CAPTURADO','2022-04-02 14:46:21','VIG','651516565','PRODUCTO DE PRUEBA DE CAPTURA',101.024,117.19,85.870,99.61,101.024,117.19,85.87,99.61,15.00,17.58,80.82,93.75,80.82,0.160,1500.00,16.00),(66,37,6,1.00,'PZA','CAPTURADO','2022-04-02 14:46:21','VIG','00046355123495','BUJIA NGK DCPR8EIX (C/4) NGK',2316.810,2687.50,1969.288,2284.38,2316.810,2687.50,1969.29,2284.38,15.00,403.12,1853.45,2150.00,1853.45,0.160,2150.00,1.00),(67,38,2,1.00,'PZA','CAPTURADO','2022-04-03 02:08:54','VIG','00750300927201','ACEITE SUPERTECH PACK DE 12 PIEZAS SAE40 DE 946 ML.',103.233,119.75,92.910,107.78,103.233,119.75,92.91,107.78,10.00,11.97,68.82,79.83,68.82,0.160,958.00,12.00),(68,39,5,1.00,'PZA','CAPTURADO','2022-04-03 02:15:14','VIG','651516565','PRODUCTO DE PRUEBA DE CAPTURA',101.024,117.19,80.819,93.75,101.024,117.19,80.82,93.75,20.00,23.44,80.82,93.75,80.82,0.160,1500.00,16.00),(69,39,6,1.00,'PZA','CAPTURADO','2022-04-03 02:15:14','VIG','00046355123495','BUJIA NGK DCPR8EIX (C/4) NGK',2316.810,2687.50,1853.448,2150.00,2316.810,2687.50,1853.45,2150.00,20.00,537.50,1853.45,2150.00,1853.45,0.160,2150.00,1.00),(70,39,7,1.00,'PZA','CAPTURADO','2022-04-03 02:15:14','VIG','00750300927203','COCA COLA DE 3LT',35.386,41.05,28.309,32.84,35.386,41.05,28.31,32.84,20.00,8.21,23.59,27.36,23.59,0.160,218.92,8.00),(71,40,2,1.00,'PZA','CAPTURADO','2022-04-03 02:17:35','VIG','00750300927201','ACEITE SUPERTECH PACK DE 12 PIEZAS SAE40 DE 946 ML.',103.233,119.75,82.586,95.80,103.233,119.75,82.59,95.80,20.00,23.95,68.82,79.83,68.82,0.160,958.00,12.00),(72,40,5,1.00,'PZA','CAPTURADO','2022-04-03 02:17:35','VIG','651516565','PRODUCTO DE PRUEBA DE CAPTURA',101.024,117.19,80.819,93.75,101.024,117.19,80.82,93.75,20.00,23.44,80.82,93.75,80.82,0.160,1500.00,16.00),(73,40,7,1.00,'PZA','CAPTURADO','2022-04-03 02:17:35','VIG','00750300927203','COCA COLA DE 3LT',35.386,41.05,28.309,32.84,35.386,41.05,28.31,32.84,20.00,8.21,23.59,27.36,23.59,0.160,218.92,8.00),(76,42,2,1.00,'PZA','CAPTURADO','2022-04-03 03:34:27','VIG','00750300927201','ACEITE SUPERTECH PACK DE 12 PIEZAS SAE40 DE 946 ML.',103.233,119.75,103.233,119.75,103.233,119.75,103.23,119.75,0.00,0.00,68.82,79.83,68.82,0.160,958.00,12.00),(77,42,5,1.00,'PZA','CAPTURADO','2022-04-03 03:34:27','VIG','651516565','PRODUCTO DE PRUEBA DE CAPTURA',101.024,117.19,101.024,117.19,101.024,117.19,101.02,117.19,0.00,0.00,80.82,93.75,80.82,0.160,1500.00,16.00),(78,43,2,1.00,'PZA','CAPTURADO','2022-04-06 02:46:41','VIG','00750300927201','ACEITE SUPERTECH PACK DE 12 PIEZAS SAE40 DE 946 ML.',103.233,119.75,92.910,107.78,103.233,119.75,92.91,107.78,10.00,11.97,68.82,79.83,68.82,0.160,958.00,12.00),(79,43,5,1.00,'PZA','CAPTURADO','2022-04-06 02:46:41','VIG','651516565','PRODUCTO DE PRUEBA DE CAPTURA',101.024,117.19,90.922,105.47,101.024,117.19,90.92,105.47,10.00,11.72,80.82,93.75,80.82,0.160,1500.00,16.00),(80,43,8,2.00,'PZA','CAPTURADO','2022-04-06 02:46:41','VIG','3','ESTE ES OTRO PRODUCTO DE PRUEBA',155.172,180.00,139.655,162.00,310.344,360.00,279.31,324.00,10.00,36.00,103.45,240.00,206.90,0.160,120.00,1.00);
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
  `medio_pago` varchar(50) NOT NULL COMMENT 'Medio por el cual se realiza el pago: EFECTIVO, TARJETA, VALE, CHEQUE, TRANSFERENCIA',
  `cantidad` decimal(11,2) NOT NULL COMMENT 'Cantidad de dinero',
  `numero_comprobante` varchar(100) DEFAULT NULL COMMENT 'Número de comprobante del medio de pago',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  `tipo_tarjeta` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cve_venta_pago`) USING BTREE,
  KEY `fk_venta_ventas_pagos` (`cve_venta`) USING BTREE,
  CONSTRAINT `fk_venta_ventas_pagos` FOREIGN KEY (`cve_venta`) REFERENCES `ventas` (`cve_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Registra los pagos asociados a las ventas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_pagos`
--

LOCK TABLES `ventas_pagos` WRITE;
/*!40000 ALTER TABLE `ventas_pagos` DISABLE KEYS */;
INSERT INTO `ventas_pagos` VALUES (94,31,'efectivo',189.55,'','2022-04-02 06:14:14','VIG',NULL),(95,31,'tarjeta',0.00,'','2022-04-02 06:14:14','VIG',NULL),(96,31,'vale',0.00,'','2022-04-02 06:14:14','VIG',NULL),(97,31,'cheque',0.00,'','2022-04-02 06:14:14','VIG',NULL),(98,31,'transferencia',0.00,'','2022-04-02 06:14:14','VIG',NULL),(99,32,'efectivo',500.00,'','2022-04-02 14:30:25','VIG',NULL),(100,32,'tarjeta',0.00,'','2022-04-02 14:30:25','VIG',NULL),(101,32,'vale',0.00,'','2022-04-02 14:30:25','VIG',NULL),(102,32,'cheque',0.00,'','2022-04-02 14:30:25','VIG',NULL),(103,32,'transferencia',0.00,'','2022-04-02 14:30:25','VIG',NULL),(104,33,'efectivo',300.00,'','2022-04-02 14:32:12','VIG',NULL),(105,33,'tarjeta',0.00,'','2022-04-02 14:32:12','VIG',NULL),(106,33,'vale',0.00,'','2022-04-02 14:32:12','VIG',NULL),(107,33,'cheque',0.00,'','2022-04-02 14:32:12','VIG',NULL),(108,33,'transferencia',0.00,'','2022-04-02 14:32:12','VIG',NULL),(109,34,'efectivo',250.00,'','2022-04-02 14:34:53','VIG',NULL),(110,34,'tarjeta',0.00,'','2022-04-02 14:34:53','VIG',NULL),(111,34,'vale',0.00,'','2022-04-02 14:34:53','VIG',NULL),(112,34,'cheque',0.00,'','2022-04-02 14:34:53','VIG',NULL),(113,34,'transferencia',0.00,'','2022-04-02 14:34:53','VIG',NULL),(114,35,'efectivo',1000.00,'','2022-04-02 14:36:43','VIG',NULL),(115,35,'tarjeta',1245.80,'1245','2022-04-02 14:36:43','VIG',NULL),(116,35,'vale',0.00,'','2022-04-02 14:36:43','VIG',NULL),(117,35,'cheque',0.00,'1245','2022-04-02 14:36:43','VIG',NULL),(118,35,'transferencia',0.00,'1245','2022-04-02 14:36:43','VIG',NULL),(119,36,'efectivo',250.00,'','2022-04-02 14:40:22','VIG',NULL),(120,36,'tarjeta',0.00,'','2022-04-02 14:40:22','VIG',NULL),(121,36,'vale',0.00,'','2022-04-02 14:40:22','VIG',NULL),(122,36,'cheque',0.00,'','2022-04-02 14:40:22','VIG',NULL),(123,36,'transferencia',0.00,'','2022-04-02 14:40:22','VIG',NULL),(124,37,'efectivo',1500.00,NULL,'2022-04-02 14:46:21','VIG',NULL),(125,37,'tarjeta',985.78,'78954','2022-04-02 14:46:21','VIG',NULL),(126,37,'vale',0.00,NULL,'2022-04-02 14:46:21','VIG',NULL),(127,37,'cheque',0.00,NULL,'2022-04-02 14:46:21','VIG',NULL),(128,37,'transferencia',0.00,NULL,'2022-04-02 14:46:21','VIG',NULL),(129,38,'efectivo',0.00,NULL,'2022-04-03 02:08:54','VIG',NULL),(130,38,'tarjeta',107.78,'8794','2022-04-03 02:08:54','VIG','CREDITO'),(131,38,'vale',0.00,NULL,'2022-04-03 02:08:54','VIG',NULL),(132,38,'cheque',0.00,NULL,'2022-04-03 02:08:54','VIG',NULL),(133,38,'transferencia',0.00,NULL,'2022-04-03 02:08:54','VIG',NULL),(134,39,'efectivo',0.00,NULL,'2022-04-03 02:15:14','VIG',NULL),(135,39,'tarjeta',0.00,NULL,'2022-04-03 02:15:14','VIG','DEBITO'),(136,39,'vale',0.00,NULL,'2022-04-03 02:15:14','VIG',NULL),(137,39,'cheque',0.00,NULL,'2022-04-03 02:15:14','VIG',NULL),(138,39,'transferencia',2276.59,'1246665789632456631566','2022-04-03 02:15:14','VIG',NULL),(139,40,'efectivo',0.00,NULL,'2022-04-03 02:17:35','VIG',NULL),(140,40,'tarjeta',0.00,NULL,'2022-04-03 02:17:35','VIG',NULL),(141,40,'vale',0.00,NULL,'2022-04-03 02:17:35','VIG',NULL),(142,40,'cheque',222.39,'122456645','2022-04-03 02:17:35','VIG',NULL),(143,40,'transferencia',0.00,NULL,'2022-04-03 02:17:35','VIG',NULL);
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

-- Dump completed on 2022-04-08  0:46:07
