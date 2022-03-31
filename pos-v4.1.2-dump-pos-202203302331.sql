/*
 Navicat Premium Data Transfer

 Source Server         : MariaDBLocal
 Source Server Type    : MariaDB
 Source Server Version : 100703
 Source Host           : localhost:3306
 Source Schema         : pos

 Target Server Type    : MariaDB
 Target Server Version : 100703
 File Encoding         : 65001

 Date: 31/03/2022 15:43:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cajas
-- ----------------------------
DROP TABLE IF EXISTS `cajas`;
CREATE TABLE `cajas`  (
  `cve_caja` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de cajas',
  `cve_sucursal` int(11) NOT NULL COMMENT 'Identificador del catálogo de sucursales',
  `caja` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Descripción de la caja',
  `codigo_caja` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Código que identifica a la caja en la sucursal',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_caja`) USING BTREE,
  INDEX `fk_sucursal_caja`(`cve_sucursal`) USING BTREE,
  CONSTRAINT `fk_sucursal_caja` FOREIGN KEY (`cve_sucursal`) REFERENCES `sucursales` (`cve_sucursal`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Catálogo de cajas registradoras de cobro' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cajas
-- ----------------------------
INSERT INTO `cajas` VALUES (1, 1, 'CAJA1', 'S1C1', '2022-03-08 15:30:25', 'VIG');
INSERT INTO `cajas` VALUES (2, 2, 'CAJA1', 'S2C1', '2022-03-08 15:30:50', 'VIG');

-- ----------------------------
-- Table structure for categorias
-- ----------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias`  (
  `cve_categoria` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de categorias',
  `cve_empresa` int(11) NULL DEFAULT NULL COMMENT 'Identificador del catálogo de empresas',
  `categoria` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Descripción de la categoria',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_categoria`) USING BTREE,
  INDEX `fk_empresas_categorias`(`cve_empresa`) USING BTREE,
  CONSTRAINT `fk_empresas_categorias` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Catálogo de categorías de productos' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categorias
-- ----------------------------
INSERT INTO `categorias` VALUES (1, 1, 'BATERIAS', '2022-03-08 15:32:40', 'VIG');
INSERT INTO `categorias` VALUES (2, 1, 'FRENOS', '2022-03-08 15:32:47', 'VIG');
INSERT INTO `categorias` VALUES (3, 1, 'PLASTICOS', '2022-03-08 15:33:34', 'VIG');
INSERT INTO `categorias` VALUES (4, 1, 'BUJIAS', '2022-03-08 15:34:31', 'VIG');
INSERT INTO `categorias` VALUES (5, 1, 'BALATAS Y ZAPATAS', '2022-03-08 15:36:48', 'VIG');
INSERT INTO `categorias` VALUES (6, 1, 'ACCESORIOS', '2022-03-08 15:37:48', 'VIG');
INSERT INTO `categorias` VALUES (7, 1, 'REFACCIONES', '2022-03-08 15:38:35', 'VIG');
INSERT INTO `categorias` VALUES (8, 1, 'TANQUES', '2022-03-08 15:39:22', 'VIG');
INSERT INTO `categorias` VALUES (9, 1, 'AMORTIGUADORES', '2022-03-08 15:40:43', 'VIG');
INSERT INTO `categorias` VALUES (10, 1, 'ESCAPES', '2022-03-08 15:41:50', 'VIG');
INSERT INTO `categorias` VALUES (11, 1, 'FAROS', '2022-03-08 15:42:31', 'VIG');
INSERT INTO `categorias` VALUES (12, 1, 'ACEITES Y LUBRICANTES', '2022-03-20 21:46:34', 'VIG');
INSERT INTO `categorias` VALUES (16, 1, 's', '2022-03-24 12:53:09', 'NVI');
INSERT INTO `categorias` VALUES (17, 1, 'REFRESCOS', '2022-03-26 22:38:33', 'VIG');

-- ----------------------------
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes`  (
  `cve_cliente` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de clientes',
  `cve_empresa` int(11) NOT NULL COMMENT 'Identificador del catálogo de empresas',
  `cliente` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nombre o razón social del cliente',
  `tipo_cliente` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'F' COMMENT 'Tipo de cliente: M = Moral o F= Física',
  `rfc_cliente` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'RFC del cliente',
  `direccion_cliente` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Dirección fiscal del cliente',
  `correo_cliente` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Correo electrónico del cliente',
  `celular_cliente` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Número de celular del cliente',
  `descuento_autorizado` int(11) NULL DEFAULT NULL COMMENT 'Porcentaje de descuento autorizado',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  `curp_cliente` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `factura` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`cve_cliente`) USING BTREE,
  INDEX `fk_empresa_cliente`(`cve_empresa`) USING BTREE,
  CONSTRAINT `fk_empresa_cliente` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Catálogo de clientes' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO `clientes` VALUES (1, 1, 'VENTAS EN MOSTRADOR', 'F', 'XXXX1212121XX', '', '', NULL, 0, '2022-03-08 15:44:56', 'VIG', NULL, NULL);
INSERT INTO `clientes` VALUES (2, 1, 'ROMAN DE LA CRUZ MARTINEZ PEÑA', 'F', 'CUMR070701HG3', 'AV. LAS GARZAS # 35, COL. CENTRO, VILLAHERMOSA, TABASCO. CP. 86210', 'ROMANDLCMP@GMAIL.COM', '9988556644', 10, '2022-03-08 16:03:41', 'VIG', NULL, NULL);
INSERT INTO `clientes` VALUES (3, 1, 'SELENE DEL CARMEN LOPEZ OSORIO', 'F', 'LOOS050505LL3', 'AV. GARDENAS NUM. 23, COL. PORFIRIO DIAZ, CENTLA TABASCO. CP. 85210', 'SELENELO@HOTMAIL.COM', '9934125566', 10, '2022-03-08 16:05:10', 'VIG', NULL, NULL);
INSERT INTO `clientes` VALUES (4, 2, 'CLIENTE QUE NO SE DEBE VER EN LA EMPRESA UNO', 'M', 'CIN040404WS1', 'CARRETERA VILLAHERMOSA A FRONTERA KM. 11.5, FRENTE A LA GRAVERA, VILLAHERMOSA, TABASCO. C.P. 86254', 'CLIENTENO@GMAIL.COM', '9935886655', 5, '2022-03-08 16:08:37', 'VIG', NULL, NULL);
INSERT INTO `clientes` VALUES (5, 1, 'JOSE CONCEPCION MENDEZ MONDRAGON', '', '', NULL, '', '', 0, '2022-03-22 14:27:15', 'VIG', '', 0);
INSERT INTO `clientes` VALUES (16, 1, 'MIGUEL ANGEL CRUZ GARCIA', 'F', 'CUGM910401VC5', 'C. LUXEMBUERGO 110, COL. GAVIOTAS SUR SECTOR SAN JOSE', 'miguelangel041991@gmail.com', '9933465024', 15, '2022-03-23 14:06:45', 'VIG', 'CUGM190401HTCRRG01', 0);
INSERT INTO `clientes` VALUES (17, 1, 'SD', 'F', '', 'SDF', 'example@tabasco.gob.mx', '9999999999', 0, '2022-03-24 13:12:25', 'NVI', '', 0);
INSERT INTO `clientes` VALUES (18, 1, 'DANIEL VAZQUEZ PERALTA', 'F', '', 'INDECO', 'danielvazquez@tabasco.gob.mx', '9933333333', 20, '2022-03-24 13:42:56', 'VIG', '', 0);
INSERT INTO `clientes` VALUES (19, 1, 'JKSDJKASD', 'F', '', 'SDF', 'ddd@tabasco.gob', '6516516516', 0, '2022-03-24 13:56:32', 'NVI', '', 0);

-- ----------------------------
-- Table structure for cortes_cajas
-- ----------------------------
DROP TABLE IF EXISTS `cortes_cajas`;
CREATE TABLE `cortes_cajas`  (
  `cve_corte_caja` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del corte de caja',
  `codigo_corte_caja` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Código que identifica al corte de caja',
  `cve_caja` int(11) NOT NULL COMMENT 'Identificador del catálogo de caja',
  `fecha_inicio` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha y hora de inicio del corte de caja',
  `fecha_cierre` timestamp NULL DEFAULT NULL COMMENT 'Fecha y hora de cierre del corte de caja',
  `monto_inicial` decimal(11, 2) NULL DEFAULT NULL COMMENT 'Monto inicial de efectivo',
  `estatus_corte_caja` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Estatus del corte de caja: ABIERTO, CERRADO',
  `usuario_alta` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Clave de usuario que da de alta el registro',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_corte_caja`) USING BTREE,
  INDEX `fk_caja_cortes_cajas`(`cve_caja`) USING BTREE,
  CONSTRAINT `fk_caja_cortes_cajas` FOREIGN KEY (`cve_caja`) REFERENCES `cajas` (`cve_caja`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Almacena los cortes de caja' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cortes_cajas
-- ----------------------------

-- ----------------------------
-- Table structure for empresas
-- ----------------------------
DROP TABLE IF EXISTS `empresas`;
CREATE TABLE `empresas`  (
  `cve_empresa` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de empresas',
  `empresa` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nombre o razón social de la empresa',
  `rfc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'RFC de la empresa',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'URL o dirección de la página web',
  `logotipo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'URL del logotipo de la empresa',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_empresa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Catálogo de empresas' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of empresas
-- ----------------------------
INSERT INTO `empresas` VALUES (1, 'REFACCIONES ITALIKA S.A DE C.V.', 'REFI121212A22', 'italika.com.mx', NULL, '2022-03-08 14:44:52', 'VIG');
INSERT INTO `empresas` VALUES (2, 'EMPRESA DOS PARA VALIDAR LA DIFERENCIA DE INFORMACION', 'EED120606GG5', 'miempresa.com', NULL, '2022-03-08 15:57:43', 'VIG');

-- ----------------------------
-- Table structure for entradas
-- ----------------------------
DROP TABLE IF EXISTS `entradas`;
CREATE TABLE `entradas`  (
  `cve_entrada` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro de entrada de material',
  `cve_sucursal` int(11) NOT NULL COMMENT 'Identificador del catálogo de sucursales',
  `cve_proveedor` int(11) NULL DEFAULT NULL COMMENT 'Identificador del catálogo de proveedores',
  `cve_traspaso_sucursal` int(11) NULL DEFAULT NULL COMMENT 'Identificador del registro de traspasos de material',
  `fecha_entrada` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de entrada del material',
  `tipo_entrada` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Tipo de entrada: COMPRA,TRASPASO,NOTA CREDITO',
  `comprobante_entrada` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Comprobante del documento que da origen a la entrada',
  `estatus_entrada` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'CAPTURA' COMMENT 'Indica el estatus de la entrada: CAPTURA, APLICADA, CANCELADA',
  `usuario_alta` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Clave de usuario que da de alta el registro',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_entrada`) USING BTREE,
  INDEX `fk_sucursal_entrada`(`cve_sucursal`) USING BTREE,
  INDEX `fk_proveedor_entrada`(`cve_proveedor`) USING BTREE,
  CONSTRAINT `fk_proveedor_entrada` FOREIGN KEY (`cve_proveedor`) REFERENCES `proveedores` (`cve_proveedor`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sucursal_entrada` FOREIGN KEY (`cve_sucursal`) REFERENCES `sucursales` (`cve_sucursal`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Almacena las entradas de material' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of entradas
-- ----------------------------

-- ----------------------------
-- Table structure for entradas_productos
-- ----------------------------
DROP TABLE IF EXISTS `entradas_productos`;
CREATE TABLE `entradas_productos`  (
  `cve_entrada_producto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del detalle de entrada de material',
  `cve_entrada` int(11) NOT NULL COMMENT 'Identificador del registro de entrada de material',
  `cve_producto` int(11) NOT NULL COMMENT 'Identificador del catálogo de productos',
  `fecha_entrada` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `cantidad_entrada` int(11) NULL DEFAULT NULL COMMENT 'Cantidad de material que entra',
  `precio_entrada` decimal(11, 2) NULL DEFAULT NULL COMMENT 'Precio de compra del material',
  `unidad_medida` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Unidad de medida del material: PIEZA, LITRO, METRO',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_entrada_producto`) USING BTREE,
  INDEX `fk_producto_entrada`(`cve_producto`) USING BTREE,
  INDEX `fk_entrada_entrada_producto`(`cve_entrada`) USING BTREE,
  CONSTRAINT `fk_entrada_entrada_producto` FOREIGN KEY (`cve_entrada`) REFERENCES `entradas` (`cve_entrada`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_producto_entrada` FOREIGN KEY (`cve_producto`) REFERENCES `productos` (`cve_producto`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Almacena el detalle de las entradas de material' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of entradas_productos
-- ----------------------------

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for impuestos
-- ----------------------------
DROP TABLE IF EXISTS `impuestos`;
CREATE TABLE `impuestos`  (
  `cve_impuesto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de impuestos',
  `cve_empresa` int(11) NULL DEFAULT NULL COMMENT 'Clave del catálogo de empresas',
  `impuesto` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Descripcion, código o nombre del impuesto',
  `tasa` decimal(11, 2) NOT NULL COMMENT 'Tasa aplica del impuesto',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_impuesto`) USING BTREE,
  INDEX `fk_empresa_impuestos`(`cve_empresa`) USING BTREE,
  CONSTRAINT `fk_empresa_impuestos` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Catálogos de impuestos' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of impuestos
-- ----------------------------
INSERT INTO `impuestos` VALUES (1, 1, 'IVA', 0.16, '2022-03-08 15:45:19', 'VIG');
INSERT INTO `impuestos` VALUES (2, 1, 'IEPS', 0.05, '2022-03-19 22:17:51', 'VIG');
INSERT INTO `impuestos` VALUES (3, 1, 'ISR', 0.07, '2022-03-19 22:17:51', 'VIG');

-- ----------------------------
-- Table structure for listas_catalogos
-- ----------------------------
DROP TABLE IF EXISTS `listas_catalogos`;
CREATE TABLE `listas_catalogos`  (
  `cve_lista_catalogo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la lista de catálogos',
  `cve_empresa` int(11) NOT NULL COMMENT 'Identificador del catálogo de empresas',
  `catalogo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nombre o descripción del catálogo',
  `valores_catalogo` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Valores de los catálogos',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_lista_catalogo`) USING BTREE,
  INDEX `fk_empresa_catalogos`(`cve_empresa`) USING BTREE,
  CONSTRAINT `fk_empresa_catalogo` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Contiene los valores de las listas de catálogos' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of listas_catalogos
-- ----------------------------
INSERT INTO `listas_catalogos` VALUES (1, 1, 'tipo_cliente1', '{\"FÍSICA\":\"FÍSICA\",\"MORAL\":\"MORAL\"}', '2022-03-08 16:30:23', 'NVI');
INSERT INTO `listas_catalogos` VALUES (2, 1, 'estatus_registro', '{\"VIG\":\"VIGENTE\",\"NVG\":\"NO VIGENTE\"}', '2022-03-08 16:31:28', 'VIG');
INSERT INTO `listas_catalogos` VALUES (3, 1, 'estatus_corte_caja', '{\"ABIERTO\":\"ABIERTO\",\"CERRADO\":\"CERRADO\"}', '2022-03-08 16:32:20', 'VIG');
INSERT INTO `listas_catalogos` VALUES (4, 1, 'tipo_entrada', '[{\"id\":\"COMPRA\",\"value\":\"COMPRA\"},{\"id\":\"TRASPASO\",\"value\":\"TRASPASO\"},{\"id\":\"NOTACREDITO\",\"value\":\"NOTA CREDITO\"}]', '2022-03-08 16:33:24', 'VIG');
INSERT INTO `listas_catalogos` VALUES (5, 1, 'estatus_entrada', '{\"CAPTURA\":\"CAPTURA\",\"APLICADA\":\"APLICADA\",\"CANCELADA\":\"CANCELADA\"}', '2022-03-08 16:35:50', 'VIG');
INSERT INTO `listas_catalogos` VALUES (6, 1, 'unidad_medida', '{\"PIEZA\":\"PIEZA\", \"LITRO\":\"LITRO\", \"METRO\":\"METRO\"}', '2022-03-08 16:36:47', 'VIG');
INSERT INTO `listas_catalogos` VALUES (11, 1, 'tipo_menu', '{\"MENÚ\":\"MENÚ\",\"SUBMENÚ\":\"SUBMENÚ\",\"OPCION\":\"OPCION\"}', '2022-03-08 16:40:09', 'VIG');
INSERT INTO `listas_catalogos` VALUES (12, 1, 'medio_movimiento', '{\"EFECTIVO\":\"EFECTIVO\",\"CHEQUES\":\"CHEQUES\",\"VALES\":\"VALES\",\"NOTACREDITO\":\"NOTACREDITO\"}', '2022-03-08 16:44:19', 'VIG');
INSERT INTO `listas_catalogos` VALUES (13, 1, 'tipo_movimiento', '{\"ENTRADA\":\"ENTRADA\",\"SALIDA\":\"SALIDA\"}', '2022-03-08 16:45:13', 'VIG');
INSERT INTO `listas_catalogos` VALUES (14, 1, 'estatus_traspaso', '{\"CAPTURADO\":\"CAPTURADO\",\"ENVIADO\":\"ENVIADO\",\"RECIBIDO\":\"RECIBIDO\",\"CANCELADO\":\"CANCELADO\"}', '2022-03-08 16:46:49', 'VIG');
INSERT INTO `listas_catalogos` VALUES (15, 1, 'tipo_venta', '[{\"id\":\"NORMAL\",\"value\":\"NORMAL\"},{\"id\":\"SERVICIO\",\"value\":\"SERVICIO\"},{\"id\":\"GARANTÍA\",\"value\":\"GARANTÍA\"}]', '2022-03-08 16:48:14', 'VIG');
INSERT INTO `listas_catalogos` VALUES (17, 1, 'tipo_comprobante', '[{\"id\":\"TICKET\",\"value\":\"TICKET\"},{\"id\":\"FACTURA\",\"value\":\"FACTURA\"}]', '2022-03-08 16:49:04', 'VIG');
INSERT INTO `listas_catalogos` VALUES (18, 1, 'estatus_venta', '{\"ENCAPTURA\":\"ENCAPTURA\",\"PORPAGAR\":\"PORPAGAR\",\"PAGADA\":\"PAGADA\",\"ENTREGADA\":\"ENTREGADA\",\"FACTURAR\":\"FACTURAR\",\"CERRADA\":\"CERRADA\",\"CANCELADA\":\"CANCELADA\"}', '2022-03-08 18:36:10', 'VIG');
INSERT INTO `listas_catalogos` VALUES (19, 1, 'estatus_venta_detalle', '{\"CAPTURADO\":\"CAPTURADO\",\"CANCELADO\":\"CANCELADO\",\"DEVUELTO\":\"DEVUELTO\"}', '2022-03-08 18:41:27', 'VIG');
INSERT INTO `listas_catalogos` VALUES (20, 1, 'medio_pago', '{\"EFECTIVO\":\"EFECTIVO\",\"TARJETA\":\"TARJETA\",\"VALE\":\"VALE\",\"CHEQUE\":\"CHEQUE\",\"TRANSFERENCIA\":\"TRANSFERENCIA\"}', '2022-03-08 18:44:49', 'VIG');
INSERT INTO `listas_catalogos` VALUES (21, 1, 'ventas_config', '{\"tipo_venta\":\"NORMAL\",\"documento\":\"TICKET\",\"imprimir\":1,\"cliente\":{\"cve_cliente\":1,\"cve_empresa\":1,\"cliente\":\"VENTAS EN MOSTRADOR\",\"descuento_autorizado\":0}}', '2022-03-24 08:46:23', 'VIG');
INSERT INTO `listas_catalogos` VALUES (22, 1, 'tipo_persona', '[{\"id\":\"F\",\"value\":\"FÍSICA\"},{\"id\":\"M\",\"value\":\"MORAL\"}]', '2022-03-24 08:51:57', 'VIG');

-- ----------------------------
-- Table structure for mano_obra
-- ----------------------------
DROP TABLE IF EXISTS `mano_obra`;
CREATE TABLE `mano_obra`  (
  `cve_mano_obra` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de mano de obra',
  `cve_empresa` int(11) NOT NULL COMMENT 'Identificador del catálogo de empresas',
  `mano_obra` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nombre de la mano de obra',
  `desc_mano_obra` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Descripción de la mano de obra',
  `duracion` decimal(11, 2) NULL DEFAULT NULL COMMENT 'Duración en horas de la mano de obra',
  `costo_mano_obra` decimal(11, 2) NULL DEFAULT NULL COMMENT 'Costo o precio de la mano de obra',
  `porcentaje_tecnico` int(11) NULL DEFAULT NULL COMMENT 'Porcentaje que se le paga al técnico que realiza la mano de obra',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_mano_obra`) USING BTREE,
  INDEX `fk_empresa_mano_obra`(`cve_empresa`) USING BTREE,
  CONSTRAINT `fk_empresa_mano_obra` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Catálogo de mano de obra' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mano_obra
-- ----------------------------
INSERT INTO `mano_obra` VALUES (1, 1, 'CAMBIO DE FRENOS DELANTEROS', 'CAMBIO DE FRENOS DELANTEROS', 1.50, 220.00, 50, '2022-03-08 15:46:00', 'VIG');
INSERT INTO `mano_obra` VALUES (2, 1, 'LIMPIEZA GENERAL', 'LAVADO COMPLETA DE MOTO', 0.30, 60.00, 30, '2022-03-08 15:46:32', 'VIG');
INSERT INTO `mano_obra` VALUES (3, 1, 'CAMBIO DE ACEITE', 'CAMBIO DE ACEITE Y FILTROS DE AIRE', 1.00, 400.00, 50, '2022-03-08 15:47:02', 'VIG');
INSERT INTO `mano_obra` VALUES (4, 1, 'CAMBIO DE BALATAS TRASERAS', 'CAMBIO DE BALATAS TRASERAS', 0.45, 170.00, 45, '2022-03-08 15:47:40', 'VIG');
INSERT INTO `mano_obra` VALUES (5, 1, 'PRIMER SERVICIO', 'CAMBIO DE ACEITE(2), DE BUJIAS(1) Y LAVADO GENERAL', 2.00, 400.00, 50, '2022-03-08 15:48:13', 'VIG');
INSERT INTO `mano_obra` VALUES (6, 1, 'CAMBIO DE AMORTIGUADOR TRASERO', 'CAMBIO DE AMORTIGUADOR TRASERO', 1.00, 210.00, 50, '2022-03-08 15:48:29', 'VIG');

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus`  (
  `cve_menu` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de menús',
  `cve_empresa` int(11) NULL DEFAULT NULL COMMENT 'Identificador del catálogo de empresas',
  `menu` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nombre del menú',
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'URL del menú',
  `orden` int(11) NOT NULL COMMENT 'Orden en que se presenta el menú',
  `tipo_menu` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Tipo de menú: MENÚ,SUBMENÚ,OPCION',
  `agrupador` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Agrupador de las opciones de menú',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_menu`) USING BTREE,
  INDEX `fk_empresa_menus`(`cve_empresa`) USING BTREE,
  CONSTRAINT `fk_empresa_menus` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Almacena los menú del sistema' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menus
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- ----------------------------
-- Table structure for movimientos_cortes_cajas
-- ----------------------------
DROP TABLE IF EXISTS `movimientos_cortes_cajas`;
CREATE TABLE `movimientos_cortes_cajas`  (
  `cve_movimiento_corte_daja` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del movimiento de caja durante un corte',
  `cve_corte_caja` int(11) NOT NULL COMMENT 'Identificador del corte de caja',
  `tipo_movimiento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Tipo de movimiento: ENTRADA, SALIDA',
  `fecha_movimiento` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha y hora en que se realiza el movimiento',
  `importe_movimiento` decimal(11, 2) NOT NULL COMMENT 'Importe del movimiento',
  `descripcion_movimiento` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Descripción u observación asociada al movimiento',
  `medio_movimiento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Medio del movimiento: EFECTIVO, CHEQUES, VALES, NOTA CREDITO',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_movimiento_corte_daja`) USING BTREE,
  INDEX `fk_corte_caja_movimientos`(`cve_corte_caja`) USING BTREE,
  CONSTRAINT `fk_corte_caja_movimientos` FOREIGN KEY (`cve_corte_caja`) REFERENCES `cortes_cajas` (`cve_corte_caja`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Registra los movimientos de valores durante un corte de caja' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movimientos_cortes_cajas
-- ----------------------------

-- ----------------------------
-- Table structure for notas_credito
-- ----------------------------
DROP TABLE IF EXISTS `notas_credito`;
CREATE TABLE `notas_credito`  (
  `cve_nota_credito` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la nota de venta',
  `cve_venta` int(11) NULL DEFAULT NULL COMMENT 'Identificador del registro de venta',
  `folio_ticket` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Número o folio del ticket de venta',
  `motivo_nota_credito` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Descripción del motivo que origina la nota de venta',
  `fecha_nota_credito` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha y hora en que se registra la nota de venta',
  `usuario_alta` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Clave de usuario que da de alta el registro',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_nota_credito`) USING BTREE,
  INDEX `fk_venta_nota_credito`(`cve_venta`) USING BTREE,
  CONSTRAINT `fk_venta_nota_credito` FOREIGN KEY (`cve_venta`) REFERENCES `ventas` (`cve_venta`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Registro de las notas de venta' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notas_credito
-- ----------------------------

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for productos
-- ----------------------------
DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos`  (
  `cve_producto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de productos',
  `cve_empresa` int(11) NULL DEFAULT NULL COMMENT 'Identificador del catálogo de empresas',
  `cve_categoria` int(11) NULL DEFAULT NULL COMMENT 'Identificador del catálogo de categorías',
  `producto` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Nombre del producto o material',
  `codigo_barras` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Código de barras asociado al producto',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  `clave_interna` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `servicio` tinyint(1) NULL DEFAULT NULL,
  `cve_unidad_compra` int(11) NULL DEFAULT NULL,
  `cve_unidad_venta` int(11) NULL DEFAULT NULL,
  `factor` decimal(11, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`cve_producto`) USING BTREE,
  INDEX `fk_categoria_producto`(`cve_categoria`) USING BTREE,
  INDEX `fk_empresa_productos`(`cve_empresa`) USING BTREE,
  INDEX `fk_unidad_compra_producto`(`cve_unidad_compra`) USING BTREE,
  INDEX `fk_unidad_venta_producto`(`cve_unidad_venta`) USING BTREE,
  CONSTRAINT `fk_categoria_producto` FOREIGN KEY (`cve_categoria`) REFERENCES `categorias` (`cve_categoria`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_empresa_productos` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_unidad_compra_producto` FOREIGN KEY (`cve_unidad_compra`) REFERENCES `unidades` (`cve_unidad`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_unidad_venta_producto` FOREIGN KEY (`cve_unidad_venta`) REFERENCES `unidades` (`cve_unidad`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Catálogo de productos o materiales' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of productos
-- ----------------------------
INSERT INTO `productos` VALUES (1, 1, 12, 'ACEITE SUPERTECH PACK DE 12 PIEZAS SAE40 DE 946 ML.', '00750300927201', '2022-03-20 22:51:58', 'VIG', '1647882251783', 0, 2, 1, 12.00);
INSERT INTO `productos` VALUES (2, 1, 4, 'BUJIA NGK DCPR8EIX (C/4) NGK', '00046355123495', '2022-03-20 23:24:55', 'VIG', '1647882224193', 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (3, 1, 7, 'PRODUCTO DE PRUEBA DE CAPTURA', '651516565', '2022-03-22 11:27:04', 'VIG', '1647969946323', 0, 2, 1, 16.00);
INSERT INTO `productos` VALUES (4, 1, 17, 'COCA COLA DE 3LT', '00750300927203', '2022-03-26 22:40:24', 'VIG', '', 0, 2, 1, 8.00);
INSERT INTO `productos` VALUES (5, 1, 2, 'ESTE ES OTRO PRODUCTO DE PRUEBA', '3', '2022-03-31 10:08:33', 'VIG', '', 0, 1, 1, 1.00);

-- ----------------------------
-- Table structure for productos_descripciones
-- ----------------------------
DROP TABLE IF EXISTS `productos_descripciones`;
CREATE TABLE `productos_descripciones`  (
  `cve_producto_descripcion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de las descripciones de productos',
  `cve_producto` int(11) NOT NULL COMMENT 'Identificador del catálogo de productos',
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Descripción asociada',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_producto_descripcion`) USING BTREE,
  INDEX `fk_producto_producto_descripciones`(`cve_producto`) USING BTREE,
  CONSTRAINT `fk_producto_producto_descripciones` FOREIGN KEY (`cve_producto`) REFERENCES `productos` (`cve_producto`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Registra las descripciones asociadas a los productos' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of productos_descripciones
-- ----------------------------
INSERT INTO `productos_descripciones` VALUES (5, 21, 'refresco que se encuentra en envase desechable', '2022-03-20 10:25:54', 'NVI');
INSERT INTO `productos_descripciones` VALUES (6, 22, 'refresco que se encuentra en envase desechable', '2022-03-20 10:37:10', 'VIG');
INSERT INTO `productos_descripciones` VALUES (7, 23, 'refresco que se encuentra en envase desechable', '2022-03-20 10:38:20', 'VIG');
INSERT INTO `productos_descripciones` VALUES (10, 26, 'CARACTERISTICAS', '2022-03-20 11:31:47', 'VIG');
INSERT INTO `productos_descripciones` VALUES (11, 27, 'CARACTERISTICAS', '2022-03-20 11:33:42', 'VIG');
INSERT INTO `productos_descripciones` VALUES (13, 29, 'CONTENIDO DEL EMPAQUE\n1 PAQUETE DE 12 BOTELLAS DE 946 ML CADA UNA\nPAÍS DE ORIGEN: MÉXICO\nTIPO DE MOTOR: MOTOR A GASOLINA\nTIPO DE ACEITE: CONVENCIONAL\nÍNDICE DE VISCOSIDAD: -15°C\nCAPACIDAD LT: MENOS DE 1 LITRO\nCLASIFICACIÓN DEL ACEITE: MONOGRADO\nPUNTO DE EBULLICIÓN: 236 °C\nPUNTO DE CONGELAMIENTO: -15°C\nESPECIFICACIONES O APROBACIONES DEL ANTICONGELANTE: SL', '2022-03-20 21:55:34', 'NVI');
INSERT INTO `productos_descripciones` VALUES (14, 30, 'KNSLKNLKDSNALKN', '2022-03-20 21:59:34', 'VIG');
INSERT INTO `productos_descripciones` VALUES (15, 31, 'KJSD K AKJDJAS DJK ', '2022-03-20 22:04:02', 'VIG');
INSERT INTO `productos_descripciones` VALUES (16, 29, 'CONTENIDO DEL EMPAQUE\n1 PAQUETE DE 12 BOTELLAS DE 946 ML CADA UNA\nPAÍS DE ORIGEN: MÉXICO\nTIPO DE MOTOR: MOTOR A GASOLINA\nTIPO DE ACEITE: CONVENCIONAL\nÍNDICE DE VISCOSIDAD: -15°C\nCAPACIDAD LT: MENOS DE 1 LITRO\nCLASIFICACIÓN DEL ACEITE: MONOGRADO\nPUNTO DE EBULLICIÓN: 236 °C\nPUNTO DE CONGELAMIENTO: -15°C\nESPECIFICACIONES O APROBACIONES DEL ANTICONGELANTE: SL\nJJ', '2022-03-20 22:22:04', 'NVI');
INSERT INTO `productos_descripciones` VALUES (17, 29, 'CONTENIDO DEL EMPAQUE\n1 PAQUETE DE 12 BOTELLAS DE 946 ML CADA UNA\nPAÍS DE ORIGEN: MÉXICO\nTIPO DE MOTOR: MOTOR A GASOLINA\nTIPO DE ACEITE: CONVENCIONAL\nÍNDICE DE VISCOSIDAD: -15°C\nCAPACIDAD LT: MENOS DE 1 LITRO\nCLASIFICACIÓN DEL ACEITE: MONOGRADO\nPUNTO DE EBULLICIÓN: 236 °C\nPUNTO DE CONGELAMIENTO: -15°C\nESPECIFICACIONES O APROBACIONES DEL ANTICONGELANTE: SL\nJJJJJJJ', '2022-03-20 22:34:00', 'NVI');
INSERT INTO `productos_descripciones` VALUES (18, 29, 'CONTENIDO DEL EMPAQUE\n1 PAQUETE DE 12 BOTELLAS DE 946 ML CADA UNA\nPAÍS DE ORIGEN: MÉXICO\nTIPO DE MOTOR: MOTOR A GASOLINA\nTIPO DE ACEITE: CONVENCIONAL\nÍNDICE DE VISCOSIDAD: -15°C\nCAPACIDAD LT: MENOS DE 1 LITRO\nCLASIFICACIÓN DEL ACEITE: MONOGRADO\nPUNTO DE EBULLICIÓN: 236 °C\nPUNTO DE CONGELAMIENTO: -15°C\nESPECIFICACIONES O APROBACIONES DEL ANTICONGELANTE: SL', '2022-03-20 22:34:41', 'VIG');
INSERT INTO `productos_descripciones` VALUES (19, 1, 'CONTENIDO DEL EMPAQUE\n1 PAQUETE DE 12 BOTELLAS DE 946 ML CADA UNA\nPAÍS DE ORIGEN: MÉXICO\nTIPO DE MOTOR: MOTOR A GASOLINA\nTIPO DE ACEITE: CONVENCIONAL\nÍNDICE DE VISCOSIDAD: -15°C\nCAPACIDAD LT: MENOS DE 1 LITRO\nCLASIFICACIÓN DEL ACEITE: MONOGRADO\nPUNTO DE EBULLICIÓN: 236 °C\nPUNTO DE CONGELAMIENTO: -15°C\nESPECIFICACIONES O APROBACIONES DEL ANTICONGELANTE: SL', '2022-03-20 22:51:58', 'VIG');
INSERT INTO `productos_descripciones` VALUES (20, 2, 'COMPATIBILIDAD: NGK\nPAÍS DE ORIGEN: CHINA\nLARGO DEL PRODUCTO ARMADO: 5 CM\nALTURA DEL PRODUCTO ARMADO: 5 CM\nTIPO DE PRESENTACIÓN: NO APLICA\nCONTENIDO DEL EMPAQUE: 1\nANCHO DEL PRODUCTO ARMADO: 5 CM\nGAMA COLOR: AMARILLO\nPESO DEL PRODUCTO ARMADO: 1 KG', '2022-03-20 23:24:55', 'VIG');
INSERT INTO `productos_descripciones` VALUES (21, 3, 'CARACTERISTICAS DEL PRODUCTO PRUEBA', '2022-03-22 11:27:04', 'VIG');
INSERT INTO `productos_descripciones` VALUES (22, 4, '', '2022-03-26 22:40:24', 'VIG');
INSERT INTO `productos_descripciones` VALUES (23, 5, '', '2022-03-31 10:08:33', 'VIG');

-- ----------------------------
-- Table structure for productos_imagenes
-- ----------------------------
DROP TABLE IF EXISTS `productos_imagenes`;
CREATE TABLE `productos_imagenes`  (
  `cve_producto_imagen` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Asociación de imagen a producto',
  `cve_producto` int(11) NOT NULL COMMENT 'Identificador del catálogo de productos',
  `url_imagen` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'URL de la imagen asociada',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_producto_imagen`) USING BTREE,
  INDEX `fk_producto_imagen`(`cve_producto`) USING BTREE,
  CONSTRAINT `fk_producto_imagen` FOREIGN KEY (`cve_producto`) REFERENCES `productos` (`cve_producto`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Registra la asociación de imágenes a los productos' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of productos_imagenes
-- ----------------------------

-- ----------------------------
-- Table structure for productos_sucursales
-- ----------------------------
DROP TABLE IF EXISTS `productos_sucursales`;
CREATE TABLE `productos_sucursales`  (
  `cve_producto_sucursal` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del producto de una sucursal',
  `cve_sucursal` int(11) NOT NULL COMMENT 'Identificador del catálogo de sucursales',
  `cve_producto` int(11) NOT NULL COMMENT 'Identificador del catálogo de productos',
  `existencia` decimal(11, 2) NULL DEFAULT NULL COMMENT 'Existencia del producto en la sucursal',
  `existencia_minima` decimal(11, 2) NULL DEFAULT NULL COMMENT 'Existencia mínima del producto antes de realizar pedido',
  `ubicacion` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Descripción de la ubicación del producto',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  `precio_compra` decimal(11, 3) NULL DEFAULT NULL,
  `precio_compra_neto_sin` decimal(11, 3) NULL DEFAULT NULL,
  `precio_venta` decimal(11, 3) NULL DEFAULT NULL,
  `precio_venta_neto` decimal(11, 2) NULL DEFAULT NULL,
  `precio_compra_neto` decimal(11, 2) NULL DEFAULT NULL,
  `neto` tinyint(1) NULL DEFAULT NULL,
  `utilidad` decimal(11, 2) NULL DEFAULT NULL,
  `precio_compra_prom` decimal(11, 3) NULL DEFAULT NULL,
  PRIMARY KEY (`cve_producto_sucursal`) USING BTREE,
  INDEX `Ref16`(`cve_sucursal`) USING BTREE,
  INDEX `fk_producto_producto_sucursal`(`cve_producto`) USING BTREE,
  CONSTRAINT `Refsucursales6` FOREIGN KEY (`cve_sucursal`) REFERENCES `sucursales` (`cve_sucursal`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_producto_producto_sucursal` FOREIGN KEY (`cve_producto`) REFERENCES `productos` (`cve_producto`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Contiene la existencia de productos en una sucursal' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of productos_sucursales
-- ----------------------------
INSERT INTO `productos_sucursales` VALUES (1, 1, 1, 0.00, 0.00, NULL, '2022-03-20 22:51:58', 'NVI', 52.371, 628.448, 78.556, 91.13, 729.00, 1, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (2, 1, 1, 0.00, 0.00, NULL, '2022-03-20 22:54:25', 'VIG', 68.822, 825.862, 103.233, 119.75, 958.00, 1, 50.00, 479.000);
INSERT INTO `productos_sucursales` VALUES (3, 1, 2, 4.00, 0.00, NULL, '2022-03-20 23:24:55', 'NVI', 1018.103, 1018.103, 1537.336, 1783.31, 1181.00, 1, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (4, 1, 2, 4.00, 0.00, NULL, '2022-03-20 23:28:15', 'NVI', 1681.422, 1681.422, 2101.778, 2438.06, 1950.45, 1, 25.00, 975.225);
INSERT INTO `productos_sucursales` VALUES (5, 1, 3, 0.00, 0.00, NULL, '2022-03-22 11:27:04', 'VIG', 80.819, 1293.103, 101.024, 117.19, 1500.00, 1, 25.00, NULL);
INSERT INTO `productos_sucursales` VALUES (6, 1, 2, 4.00, 0.00, NULL, '2022-03-22 11:27:43', 'VIG', 1853.448, 1853.448, 2316.810, 2687.50, 2150.00, 1, 25.00, 1075.000);
INSERT INTO `productos_sucursales` VALUES (7, 1, 4, 0.00, 0.00, NULL, '2022-03-26 22:40:24', 'VIG', 23.591, 188.724, 35.386, 41.05, 218.92, 1, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (8, 1, 5, 0.00, 0.00, NULL, '2022-03-31 10:08:33', 'VIG', 103.448, 103.448, 155.172, 180.00, 120.00, 1, 50.00, NULL);

-- ----------------------------
-- Table structure for productos_sucursales_impuestos
-- ----------------------------
DROP TABLE IF EXISTS `productos_sucursales_impuestos`;
CREATE TABLE `productos_sucursales_impuestos`  (
  `cve_producto_sucursal_impuesto` int(11) NOT NULL AUTO_INCREMENT,
  `cve_producto_sucursal` int(11) NOT NULL,
  `cve_impuesto` int(11) NOT NULL,
  `fecha_alta` timestamp NULL DEFAULT current_timestamp(),
  `estatus_registro` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'VIG',
  PRIMARY KEY (`cve_producto_sucursal_impuesto`) USING BTREE,
  INDEX `fk_cve_producuto_sucursal_tb_impuesto`(`cve_producto_sucursal`) USING BTREE,
  INDEX `fk_cve_impuesto_producto_sucursal`(`cve_impuesto`) USING BTREE,
  CONSTRAINT `fk_cve_impuesto_producto_sucursal` FOREIGN KEY (`cve_impuesto`) REFERENCES `impuestos` (`cve_impuesto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cve_producuto_sucursal_tb_impuesto` FOREIGN KEY (`cve_producto_sucursal`) REFERENCES `productos_sucursales` (`cve_producto_sucursal`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of productos_sucursales_impuestos
-- ----------------------------
INSERT INTO `productos_sucursales_impuestos` VALUES (16, 2, 1, '2022-03-21 11:04:14', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (21, 6, 1, '2022-03-22 11:27:43', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (25, 7, 1, '2022-03-26 22:40:24', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (26, 5, 1, '2022-03-29 21:59:55', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (27, 8, 1, '2022-03-31 10:08:33', 'VIG');

-- ----------------------------
-- Table structure for proveedores
-- ----------------------------
DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores`  (
  `cve_proveedor` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de proveedores',
  `proveedor` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nombre o razón social de proveedor',
  `rfc_proveedor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'RFC del proveedor',
  `correo_proveedor` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Correo electrónico del proveedor',
  `celular_proveedor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Número de celular del proveedor',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_proveedor`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Catálogo de proveedores' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proveedores
-- ----------------------------
INSERT INTO `proveedores` VALUES (1, 'PROVEEDORA DE REFACCIONES DEL SURESTE S.A. DE C.V.', 'POR121212EE2', 'PROVEEDORA@GMAIL.COM', '9955663322', '2022-03-08 15:53:39', 'VIG');
INSERT INTO `proveedores` VALUES (2, 'DISTRIBUIDORA MERCANTIL DEL SURESTE S.A. DE C.V.', 'DIM121212EE5', 'DISTRIBUIDORA@GMAIL.COM', '5544778855', '2022-03-08 15:54:18', 'VIG');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `cve_rol` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de roles',
  `cve_empresa` int(11) NULL DEFAULT NULL COMMENT 'Clave del catálogo de empresas',
  `rol` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Descripción o nombre del rol',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_rol`) USING BTREE,
  INDEX `fk_empresa_roles`(`cve_empresa`) USING BTREE,
  CONSTRAINT `fk_empresa_roles` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Catálogo de roles' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------

-- ----------------------------
-- Table structure for roles_menu
-- ----------------------------
DROP TABLE IF EXISTS `roles_menu`;
CREATE TABLE `roles_menu`  (
  `cve_rol_menu` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la asociación de menú a rol ',
  `cve_rol` int(11) NOT NULL COMMENT 'Identificador del catálogo de roles',
  `cve_menu` int(11) NOT NULL COMMENT 'Identificador del catálogo de menús',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_rol_menu`) USING BTREE,
  INDEX `fk_rol_rol_menu`(`cve_rol`) USING BTREE,
  INDEX `fk_menu_rol_menu`(`cve_menu`) USING BTREE,
  CONSTRAINT `fk_menu_rol_menu` FOREIGN KEY (`cve_menu`) REFERENCES `menus` (`cve_menu`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rol_rol_menu` FOREIGN KEY (`cve_rol`) REFERENCES `roles` (`cve_rol`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Asociaciones de menús a roles' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sucursales
-- ----------------------------
DROP TABLE IF EXISTS `sucursales`;
CREATE TABLE `sucursales`  (
  `cve_sucursal` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de sucursales',
  `cve_empresa` int(11) NOT NULL COMMENT 'Identificador del catálogo de empresas',
  `sucursal` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nombre de la sucursal',
  `direccion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Dirección del sucursal',
  `correo_sucursal` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Correo electrónico del sucursal',
  `telefono_sucursal` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Número telefónico de la sucursal',
  `celular_sucursal` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Número celular de la sucursal',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_sucursal`) USING BTREE,
  INDEX `fk_empresa_sucursal`(`cve_empresa`) USING BTREE,
  CONSTRAINT `fk_empresa_sucursal` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Catálogo de sucursales' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sucursales
-- ----------------------------
INSERT INTO `sucursales` VALUES (1, 1, 'MATRIZ', 'AV. RAMÓN MEDOZA # 1524, FRENTE A PLAZA LAS AMÉRICAS, COL.  JOSÉ MARÍA PINO SUÁREZ, VILLAHERMOSA, TABASCO. CP. 86220.', 'refaccionesitalika@gmail.com', '993355124578', '9931524578', '2022-03-08 14:47:46', 'VIG');
INSERT INTO `sucursales` VALUES (2, 1, 'TABASCO 2000', 'AV. PASEO TABASCO 2510, COL. LOS RIOS, TABASCO 2000, VILLAHERMOSA, TABASCO. CP. 86250', 'sucursaltabasco2000@gmail.com', '993356874112', '9932458769', '2022-03-08 14:49:30', 'VIG');

-- ----------------------------
-- Table structure for tecnicos
-- ----------------------------
DROP TABLE IF EXISTS `tecnicos`;
CREATE TABLE `tecnicos`  (
  `cve_tecnico` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de técnicos',
  `cve_empresa` int(11) NOT NULL COMMENT 'Identificador del catálogo de empresas',
  `nombre_tecnico` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nombre completo del técnico',
  `rfc_tecnico` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'RFC del técnico',
  `correo_tecnico` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Correo electrónico del técnico',
  `celular_tecnico` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Número celular del técnico',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_tecnico`) USING BTREE,
  INDEX `idx_empresa_tecnicos`(`cve_empresa`) USING BTREE,
  CONSTRAINT `fk_empresa_tecnicos` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Catálogo de técnicos' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tecnicos
-- ----------------------------
INSERT INTO `tecnicos` VALUES (1, 1, 'JOSE DEL CAMEN LOPEZ HERNANDEZ', 'LOHJ121212RF5', 'JOSELOPEZ@GMAIL.COM', '5588774466', '2022-03-08 15:55:27', 'VIG');
INSERT INTO `tecnicos` VALUES (2, 1, 'MARGARITO RICARDEZ GALLEGOS', 'RIGM121212WW5', 'MARGARITOR@GMAIL.COM', '9955441122', '2022-03-08 15:56:17', 'VIG');
INSERT INTO `tecnicos` VALUES (4, 2, 'TECNICO DE LA EMPRESA DOS', 'TECR121203FF3', 'TECNICO@GMAIL.COM', '9988774455', '2022-03-08 15:57:47', 'VIG');
INSERT INTO `tecnicos` VALUES (5, 1, 'ADRIAN RICARDO PALOMEQUE DE LA CRUZ', 'PADA060606FF4', 'ADRIANPP@HOTMAIL.COM', '9933524156', '2022-03-08 15:58:40', 'VIG');

-- ----------------------------
-- Table structure for traspasos_producto_sucursal
-- ----------------------------
DROP TABLE IF EXISTS `traspasos_producto_sucursal`;
CREATE TABLE `traspasos_producto_sucursal`  (
  `cve_traspaso_sucursal` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del traspaso de producto o material',
  `cve_empresa` int(11) NOT NULL COMMENT 'Identificador del catálogo de empresas',
  `cve_producto_sucursal` int(11) NOT NULL COMMENT 'Identificador del producto en la sucursal',
  `cve_sucursal_origen` int(11) NOT NULL COMMENT 'Identificador de la sucursal origen',
  `cve_sucursal_destino` int(11) NOT NULL COMMENT 'Identificador de la sucursal destino',
  `fecha_traspaso` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha en que se realiza el traspaso',
  `cantidad_traspaso` decimal(11, 2) NULL DEFAULT NULL COMMENT 'Cantidad de producto o material',
  `unidad_medida` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Unidad de medida del producto o material: PIEZA, LITRO, METRO',
  `estatus_traspaso` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Indica el estatus del traspaso: CAPTURADO, ENVIADO, RECIBIDO, CANCELADO',
  `usuario_alta` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Clave de usuario que da de alta el registro',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_traspaso_sucursal`) USING BTREE,
  INDEX `fk_traspaso_producto_sucursal`(`cve_producto_sucursal`) USING BTREE,
  INDEX `fk_empresa_traspasos_sucursal`(`cve_empresa`) USING BTREE,
  INDEX `fk_sucursal_origen`(`cve_sucursal_origen`) USING BTREE,
  INDEX `fk_sucursal_destino`(`cve_sucursal_destino`) USING BTREE,
  CONSTRAINT `fk_empresa_traspasos_sucursal` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sucursal_destino` FOREIGN KEY (`cve_sucursal_destino`) REFERENCES `sucursales` (`cve_sucursal`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sucursal_origen` FOREIGN KEY (`cve_sucursal_origen`) REFERENCES `sucursales` (`cve_sucursal`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_traspaso_producto_sucursal` FOREIGN KEY (`cve_producto_sucursal`) REFERENCES `productos_sucursales` (`cve_producto_sucursal`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Registra los traspasos de productos o material entre sucursales' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of traspasos_producto_sucursal
-- ----------------------------

-- ----------------------------
-- Table structure for unidades
-- ----------------------------
DROP TABLE IF EXISTS `unidades`;
CREATE TABLE `unidades`  (
  `cve_unidad` int(11) NOT NULL AUTO_INCREMENT,
  `cve_empresa` int(11) NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `estatus_registro` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fecha_alta` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`cve_unidad`) USING BTREE,
  INDEX `fk_empresas_unidades`(`cve_empresa`) USING BTREE,
  CONSTRAINT `fk_empresas_unidades` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of unidades
-- ----------------------------
INSERT INTO `unidades` VALUES (1, 1, 'PZA', 'PIEZA', 'VIG', '2022-03-13 14:28:45');
INSERT INTO `unidades` VALUES (2, 1, 'CAJA', 'CAJA', 'VIG', '2022-03-13 14:28:45');
INSERT INTO `unidades` VALUES (3, 1, 'KG', 'KILOGRAMNO', 'VIG', '2022-03-13 14:28:45');
INSERT INTO `unidades` VALUES (4, 1, 'LT', 'LITROS', 'VIG', '2022-03-13 14:28:45');
INSERT INTO `unidades` VALUES (5, 1, 'm', 'METROS', 'VIG', '2022-03-13 14:28:45');
INSERT INTO `unidades` VALUES (6, 1, 'VOL', 'VOLUMENT', 'VIG', '2022-03-13 15:21:21');
INSERT INTO `unidades` VALUES (7, 1, 'PR', NULL, 'VIG', '2022-03-13 15:27:15');
INSERT INTO `unidades` VALUES (8, 1, 'PR3', 'PRUEBA  DOS', 'VIG', '2022-03-13 15:27:44');
INSERT INTO `unidades` VALUES (9, 1, 'PR45', 'PRUEBA NUMERO 45', 'VIG', '2022-03-13 19:27:54');
INSERT INTO `unidades` VALUES (10, 1, 'PR46', 'PRUEBA NUMERO 46', 'VIG', '2022-03-13 19:35:00');
INSERT INTO `unidades` VALUES (12, 1, 'PR48', 'PRUEBA NUMERO 48', 'NVI', '2022-03-13 19:46:11');
INSERT INTO `unidades` VALUES (13, 1, 'PR58', 'PRUEBA NUMERO 58', 'VIG', '2022-03-13 19:46:38');
INSERT INTO `unidades` VALUES (16, 1, 'PR123', 'ESTO ES UNA PRUEBA', 'VIG', '2022-03-19 23:03:18');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `cve_usuario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de usuarios',
  `cve_empresa` int(11) NOT NULL COMMENT 'Identificador del catálogo de empresas',
  `nombre_usuario` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nombre completo del usuario',
  `correo_usuario` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Correo electrónico del usuario',
  `celular_usuario` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Número de celular del usuario',
  `usuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Clave de usuario asignada',
  `contrasenia` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Contraseña encriptada del usuario',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_usuario`) USING BTREE,
  INDEX `fk_empresa_usuario`(`cve_empresa`) USING BTREE,
  CONSTRAINT `fk_empresa_usuario` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Catálogo de usuarios' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usuarios
-- ----------------------------

-- ----------------------------
-- Table structure for usuarios_roles
-- ----------------------------
DROP TABLE IF EXISTS `usuarios_roles`;
CREATE TABLE `usuarios_roles`  (
  `cve_usuario_rol` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la asociación del rol al usuario',
  `cve_rol` int(11) NOT NULL COMMENT 'Identificador del catálogo de roles',
  `cve_usuario` int(11) NOT NULL COMMENT 'Identificador del catálogo de usuarios',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_usuario_rol`) USING BTREE,
  INDEX `Ref53`(`cve_rol`) USING BTREE,
  INDEX `fk_usuario_rol`(`cve_usuario`) USING BTREE,
  CONSTRAINT `Refroles3` FOREIGN KEY (`cve_rol`) REFERENCES `roles` (`cve_rol`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`cve_usuario`) REFERENCES `usuarios` (`cve_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Registra las asociaciones de los roles a los usuarios' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usuarios_roles
-- ----------------------------

-- ----------------------------
-- Table structure for ventas
-- ----------------------------
DROP TABLE IF EXISTS `ventas`;
CREATE TABLE `ventas`  (
  `cve_venta` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro de ventas',
  `cve_sucursal` int(11) NOT NULL COMMENT 'Identificador del catálogo de sucursales',
  `cve_cliente` int(11) NOT NULL COMMENT 'Identificador del catálogo de clientes',
  `cve_corte_caja` int(11) NULL DEFAULT NULL COMMENT 'Identificador del corte de caja',
  `cve_tecnico` int(11) NULL DEFAULT NULL COMMENT 'Identificador del catálogo de técnicos',
  `nombre_cliente` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Nombre del cliente de mostrador',
  `tipo_venta` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Indica el tipo de venta: NORMAL, SERVICIO, GARANTÍA',
  `fecha_venta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha en que se realiza la venta',
  `tipo_comprobante` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Indica el tipo de comprobante: TICKET, FACTURA, CORREO',
  `estatus_venta` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Estatus de la venta: ENCAPTURA, PORPAGAR, PAGADA, ENTREGADA, FACTURAR, CERRADA, CANCELADA',
  `folio_ticket` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Folio del ticket de venta asociado',
  `numero_transaccion` int(50) NULL DEFAULT NULL COMMENT 'Número de transacción asociado',
  `usuario_alta` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Clave de usuario que da de alta el registro',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  `subtotal` decimal(10, 2) NULL DEFAULT NULL,
  `descuento` decimal(10, 2) NULL DEFAULT NULL,
  `total` decimal(10, 2) NULL DEFAULT NULL,
  `cambio` decimal(10, 2) NULL DEFAULT NULL,
  `letra` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `comentario` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_compra` decimal(10, 2) NULL DEFAULT NULL,
  `total_utilidad` decimal(10, 2) NULL DEFAULT NULL,
  `subtotal_compra` decimal(10, 2) NULL DEFAULT NULL,
  `subtotal_utilidad` decimal(10, 2) NULL DEFAULT NULL,
  `cve_vendedor` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`cve_venta`) USING BTREE,
  INDEX `fk_tecnico_venta`(`cve_tecnico`) USING BTREE,
  INDEX `fk_cliente_venta`(`cve_cliente`) USING BTREE,
  INDEX `fk_corte_caja_venta`(`cve_corte_caja`) USING BTREE,
  INDEX `fk_sucursal_venta`(`cve_sucursal`) USING BTREE,
  CONSTRAINT `fk_cliente_venta` FOREIGN KEY (`cve_cliente`) REFERENCES `clientes` (`cve_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_corte_caja_venta` FOREIGN KEY (`cve_corte_caja`) REFERENCES `cortes_cajas` (`cve_corte_caja`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sucursal_venta` FOREIGN KEY (`cve_sucursal`) REFERENCES `sucursales` (`cve_sucursal`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tecnico_venta` FOREIGN KEY (`cve_tecnico`) REFERENCES `tecnicos` (`cve_tecnico`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Registro de las ventas' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ventas
-- ----------------------------
INSERT INTO `ventas` VALUES (4, 1, 1, NULL, NULL, 'MIGUEL', 'NORMAL', '2022-03-30 22:06:26', 'TICKET', 'PORPAGAR', '624528C21DF4E', NULL, NULL, '2022-03-30 22:06:26', 'VIG', 204.26, 0.00, 236.94, NULL, NULL, NULL, 173.58, 63.36, 149.64, 54.62, 1);
INSERT INTO `ventas` VALUES (5, 1, 1, NULL, NULL, 'MIGUEL CRUZ', 'NORMAL', '2022-03-30 22:25:49', 'TICKET', 'PORPAGAR', '62452D4DCBF27', NULL, NULL, '2022-03-30 22:25:49', 'VIG', 1770.41, 82.00, 2053.69, NULL, 'DOS MIL CINCUENTA Y TRES PESOS 69/100 MNX', NULL, 1439.38, 614.31, 1240.86, 529.55, 1);
INSERT INTO `ventas` VALUES (6, 1, 1, NULL, NULL, 'MIGUEL CRUZ', 'NORMAL', '2022-03-30 22:28:56', 'TICKET', 'PORPAGAR', '62452E08446D5', NULL, NULL, '2022-03-30 22:28:56', 'VIG', 3689.87, 82.00, 4280.30, NULL, 'CUATRO MIL DOSCIENTOS OCHENTA PESOS 30/100 MNX', NULL, 3220.63, 1059.67, 2776.42, 913.45, 1);
INSERT INTO `ventas` VALUES (7, 1, 1, NULL, NULL, 'MIGUEL CRUZ', 'NORMAL', '2022-03-30 23:22:19', 'TICKET', 'PAGADA', '62452F81D72B8', NULL, NULL, '2022-03-30 22:35:13', 'VIG', 1770.29, 82.10, 2053.69, NULL, 'DOS MIL CINCUENTA Y TRES PESOS 69/100 MNX', NULL, 1439.38, 614.31, 1240.86, 529.43, 1);
INSERT INTO `ventas` VALUES (8, 1, 1, NULL, NULL, 'JOSE MENDEZ', 'NORMAL', '2022-03-30 08:52:50', 'TICKET', 'PORPAGAR', '6245C04260E5E', NULL, NULL, '2022-03-31 08:52:50', 'VIG', 2521.07, 0.00, 2924.44, NULL, 'DOS MIL NOVECIENTOS VEINTICUATRO PESOS 44/100 MNX', NULL, 2323.58, 600.86, 2003.09, 517.98, 1);
INSERT INTO `ventas` VALUES (9, 1, 1, NULL, NULL, 'JOSE MENDEZ', 'NORMAL', '2022-03-30 09:58:27', 'TICKET', 'PORPAGAR', '6245CFA3DA905', NULL, NULL, '2022-03-31 09:58:27', 'VIG', 2556.45, 0.00, 2965.49, NULL, 'DOS MIL NOVECIENTOS SESENTA Y CINCO PESOS 49/100 MNX', NULL, 2350.94, 614.55, 2026.68, 529.76, 1);
INSERT INTO `ventas` VALUES (10, 1, 1, NULL, NULL, 'LAURA SANCHEZ', 'NORMAL', '2022-03-31 10:45:27', 'TICKET', 'PORPAGAR', '6245DAA773442', NULL, NULL, '2022-03-31 10:45:27', 'VIG', 103.23, 0.00, 119.75, NULL, 'CIENTO DIECINUEVE PESOS 75/100 MNX', NULL, 79.83, 39.92, 68.82, 34.41, 1);
INSERT INTO `ventas` VALUES (11, 1, 16, NULL, NULL, 'MIGUEL ANGEL CRUZ GARCIA', 'NORMAL', '2022-03-31 10:46:43', 'TICKET', 'PORPAGAR', '6245DAF3686E9', NULL, NULL, '2022-03-31 10:46:43', 'VIG', 1969.29, 403.12, 2284.38, NULL, 'DOS MIL DOSCIENTOS OCHENTA Y CUATRO PESOS 38/100 MNX', NULL, 2150.00, 134.38, 1853.45, 115.84, 1);
INSERT INTO `ventas` VALUES (12, 1, 1, NULL, NULL, 'JUAN DIEGO', 'NORMAL', '2022-03-31 10:49:14', 'TICKET', 'PORPAGAR', '6245DB8ADC122', NULL, NULL, '2022-03-31 10:49:14', 'VIG', 101.02, 0.00, 117.19, NULL, 'CIENTO DIECISIETE PESOS 19/100 MNX', NULL, 93.75, 23.44, 80.82, 20.20, 1);

-- ----------------------------
-- Table structure for ventas_detalles
-- ----------------------------
DROP TABLE IF EXISTS `ventas_detalles`;
CREATE TABLE `ventas_detalles`  (
  `cve_venta_detalle` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del detalle de venta',
  `cve_venta` int(11) NOT NULL COMMENT 'Identificador del registro de venta',
  `cve_producto_sucursal` int(11) NULL DEFAULT NULL COMMENT 'Identificador del producto de la sucursal',
  `cantidad` decimal(11, 2) NULL DEFAULT NULL COMMENT 'Cantidad de producto o material',
  `unidad_medida` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Unidad de medida del producto o material: PIEZA, LITRO, METRO',
  `estatus_venta_detalle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Estatus del detalle de venta: CAPTURADO, CANCELADO, DEVUELTO',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  `codigo_barras` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `producto` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `precio_normal` decimal(11, 3) NULL DEFAULT NULL,
  `precio_normal_neto` decimal(11, 2) NULL DEFAULT NULL,
  `precio_venta` decimal(11, 3) NULL DEFAULT NULL,
  `precio_venta_neto` decimal(11, 2) NULL DEFAULT NULL,
  `importe_normal` decimal(11, 3) NULL DEFAULT NULL,
  `importe_normal_neto` decimal(11, 2) NULL DEFAULT NULL,
  `importe_venta` decimal(11, 2) NULL DEFAULT NULL,
  `importe_venta_neto` decimal(11, 2) NULL DEFAULT NULL,
  `desc_porcentaje` decimal(11, 2) NULL DEFAULT NULL,
  `desc_total` decimal(11, 2) NULL DEFAULT NULL,
  `precio_compra` decimal(11, 2) NULL DEFAULT NULL,
  `importe_compra` decimal(11, 2) NULL DEFAULT NULL,
  `subtotal_compra` decimal(11, 2) NULL DEFAULT NULL,
  `impuesto_total` decimal(11, 3) NULL DEFAULT NULL,
  `precio_compra_neto` decimal(11, 2) NULL DEFAULT NULL,
  `factor` decimal(11, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`cve_venta_detalle`) USING BTREE,
  INDEX `fk_producto_sucursal_venta_detalle`(`cve_producto_sucursal`) USING BTREE,
  INDEX `idx_venta_detalle_venta`(`cve_venta`) USING BTREE,
  CONSTRAINT `fk_producto_sucursal_venta_detalle` FOREIGN KEY (`cve_producto_sucursal`) REFERENCES `productos_sucursales` (`cve_producto_sucursal`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_venta_detalle_venta` FOREIGN KEY (`cve_venta`) REFERENCES `ventas` (`cve_venta`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Registra los detalles de las ventas' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ventas_detalles
-- ----------------------------
INSERT INTO `ventas_detalles` VALUES (1, 4, 2, 1.00, 'PZA', 'CAPTURADO', '2022-03-30 22:06:26', 'VIG', '00750300927201', NULL, 103.233, 119.75, 103.233, 119.75, 103.233, 119.75, 103.23, 119.75, 0.00, 0.00, 68.82, 79.83, 68.82, 0.160, 958.00, 12.00);
INSERT INTO `ventas_detalles` VALUES (2, 4, 5, 1.00, 'PZA', 'CAPTURADO', '2022-03-30 22:06:26', 'VIG', '651516565', NULL, 101.024, 117.19, 101.024, 117.19, 101.024, 117.19, 101.02, 117.19, 0.00, 0.00, 80.82, 93.75, 80.82, 0.160, 1500.00, 16.00);
INSERT INTO `ventas_detalles` VALUES (3, 5, 2, 10.00, 'PZA', 'CAPTURADO', '2022-03-30 22:25:49', 'VIG', '00750300927201', 'ACEITE SUPERTECH PACK DE 12 PIEZAS SAE40 DE 946 ML.', 103.233, 119.75, 103.233, 119.75, 1032.330, 1197.50, 1032.33, 1197.50, 0.00, 0.00, 68.82, 798.33, 688.22, 0.160, 958.00, 12.00);
INSERT INTO `ventas_detalles` VALUES (4, 5, 7, 20.00, 'PZA', 'CAPTURADO', '2022-03-30 22:25:49', 'VIG', '00750300927203', 'COCA COLA DE 3LT', 35.386, 41.05, 31.853, 36.95, 707.720, 821.00, 637.06, 739.00, 10.00, 82.00, 23.59, 547.30, 471.82, 0.160, 218.92, 8.00);
INSERT INTO `ventas_detalles` VALUES (5, 5, 5, 1.00, 'PZA', 'CAPTURADO', '2022-03-30 22:25:49', 'VIG', '651516565', 'PRODUCTO DE PRUEBA DE CAPTURA', 101.024, 117.19, 101.024, 117.19, 101.024, 117.19, 101.02, 117.19, 0.00, 0.00, 80.82, 93.75, 80.82, 0.160, 1500.00, 16.00);
INSERT INTO `ventas_detalles` VALUES (6, 6, 2, 10.00, 'PZA', 'CAPTURADO', '2022-03-30 22:28:56', 'VIG', '00750300927201', 'ACEITE SUPERTECH PACK DE 12 PIEZAS SAE40 DE 946 ML.', 103.233, 119.75, 103.233, 119.75, 1032.330, 1197.50, 1032.33, 1197.50, 0.00, 0.00, 68.82, 798.33, 688.22, 0.160, 958.00, 12.00);
INSERT INTO `ventas_detalles` VALUES (7, 6, 7, 20.00, 'PZA', 'CAPTURADO', '2022-03-30 22:28:56', 'VIG', '00750300927203', 'COCA COLA DE 3LT', 35.386, 41.05, 31.853, 36.95, 707.720, 821.00, 637.06, 739.00, 10.00, 82.00, 23.59, 547.30, 471.82, 0.160, 218.92, 8.00);
INSERT INTO `ventas_detalles` VALUES (8, 6, 5, 20.00, 'PZA', 'CAPTURADO', '2022-03-30 22:28:56', 'VIG', '651516565', 'PRODUCTO DE PRUEBA DE CAPTURA', 101.024, 117.19, 101.024, 117.19, 2020.480, 2343.80, 2020.48, 2343.80, 0.00, 0.00, 80.82, 1875.00, 1616.38, 0.160, 1500.00, 16.00);
INSERT INTO `ventas_detalles` VALUES (9, 7, 2, 10.00, 'PZA', 'CAPTURADO', '2022-03-30 22:35:13', 'VIG', '00750300927201', 'ACEITE SUPERTECH SAE40 DE 946 ML.', 103.233, 119.75, 103.233, 119.75, 1032.330, 1197.50, 1032.33, 1197.50, 0.00, 0.00, 68.82, 798.33, 688.22, 0.160, 958.00, 12.00);
INSERT INTO `ventas_detalles` VALUES (10, 7, 5, 1.00, 'PZA', 'CAPTURADO', '2022-03-30 22:35:13', 'VIG', '651516565', 'PRODUCTO DE PRUEBA DE CAPTURA', 101.024, 117.19, 101.024, 117.19, 101.024, 117.19, 101.02, 117.19, 0.00, 0.00, 80.82, 93.75, 80.82, 0.160, 1500.00, 16.00);
INSERT INTO `ventas_detalles` VALUES (11, 7, 7, 20.00, 'PZA', 'CAPTURADO', '2022-03-30 22:35:13', 'VIG', '00750300927203', 'COCA COLA DE 3LT', 35.386, 41.05, 31.853, 36.95, 707.720, 821.00, 636.94, 739.00, 10.00, 82.10, 23.59, 547.30, 471.82, 0.160, 218.92, 8.00);
INSERT INTO `ventas_detalles` VALUES (12, 8, 2, 1.00, 'PZA', 'CAPTURADO', '2022-03-31 08:52:50', 'VIG', '00750300927201', 'ACEITE SUPERTECH PACK DE 12 PIEZAS SAE40 DE 946 ML.', 103.233, 119.75, 103.233, 119.75, 103.233, 119.75, 103.23, 119.75, 0.00, 0.00, 68.82, 79.83, 68.82, 0.160, 958.00, 12.00);
INSERT INTO `ventas_detalles` VALUES (13, 8, 5, 1.00, 'PZA', 'CAPTURADO', '2022-03-31 08:52:50', 'VIG', '651516565', 'PRODUCTO DE PRUEBA DE CAPTURA', 101.024, 117.19, 101.024, 117.19, 101.024, 117.19, 101.02, 117.19, 0.00, 0.00, 80.82, 93.75, 80.82, 0.160, 1500.00, 16.00);
INSERT INTO `ventas_detalles` VALUES (14, 8, 6, 1.00, 'PZA', 'CAPTURADO', '2022-03-31 08:52:50', 'VIG', '00046355123495', 'BUJIA NGK DCPR8EIX (C/4) NGK', 2316.810, 2687.50, 2316.810, 2687.50, 2316.810, 2687.50, 2316.81, 2687.50, 0.00, 0.00, 1853.45, 2150.00, 1853.45, 0.160, 2150.00, 1.00);
INSERT INTO `ventas_detalles` VALUES (15, 9, 2, 1.00, 'PZA', 'CAPTURADO', '2022-03-31 09:58:27', 'VIG', '00750300927201', 'ACEITE SUPERTECH PACK DE 12 PIEZAS SAE40 DE 946 ML.', 103.233, 119.75, 103.233, 119.75, 103.233, 119.75, 103.23, 119.75, 0.00, 0.00, 68.82, 79.83, 68.82, 0.160, 958.00, 12.00);
INSERT INTO `ventas_detalles` VALUES (16, 9, 5, 1.00, 'PZA', 'CAPTURADO', '2022-03-31 09:58:27', 'VIG', '651516565', 'PRODUCTO DE PRUEBA DE CAPTURA', 101.024, 117.19, 101.024, 117.19, 101.024, 117.19, 101.02, 117.19, 0.00, 0.00, 80.82, 93.75, 80.82, 0.160, 1500.00, 16.00);
INSERT INTO `ventas_detalles` VALUES (17, 9, 6, 1.00, 'PZA', 'CAPTURADO', '2022-03-31 09:58:27', 'VIG', '00046355123495', 'BUJIA NGK DCPR8EIX (C/4) NGK', 2316.810, 2687.50, 2316.810, 2687.50, 2316.810, 2687.50, 2316.81, 2687.50, 0.00, 0.00, 1853.45, 2150.00, 1853.45, 0.160, 2150.00, 1.00);
INSERT INTO `ventas_detalles` VALUES (18, 9, 7, 1.00, 'PZA', 'CAPTURADO', '2022-03-31 09:58:27', 'VIG', '00750300927203', 'COCA COLA DE 3LT', 35.386, 41.05, 35.386, 41.05, 35.386, 41.05, 35.39, 41.05, 0.00, 0.00, 23.59, 27.36, 23.59, 0.160, 218.92, 8.00);
INSERT INTO `ventas_detalles` VALUES (19, 10, 2, 1.00, 'PZA', 'CAPTURADO', '2022-03-31 10:45:27', 'VIG', '00750300927201', 'ACEITE SUPERTECH PACK DE 12 PIEZAS SAE40 DE 946 ML.', 103.233, 119.75, 103.233, 119.75, 103.233, 119.75, 103.23, 119.75, 0.00, 0.00, 68.82, 79.83, 68.82, 0.160, 958.00, 12.00);
INSERT INTO `ventas_detalles` VALUES (20, 11, 6, 1.00, 'PZA', 'CAPTURADO', '2022-03-31 10:46:43', 'VIG', '00046355123495', 'BUJIA NGK DCPR8EIX (C/4) NGK', 2316.810, 2687.50, 1969.288, 2284.38, 2316.810, 2687.50, 1969.29, 2284.38, 15.00, 403.12, 1853.45, 2150.00, 1853.45, 0.160, 2150.00, 1.00);
INSERT INTO `ventas_detalles` VALUES (21, 12, 5, 1.00, 'PZA', 'CAPTURADO', '2022-03-31 10:49:14', 'VIG', '651516565', 'PRODUCTO DE PRUEBA DE CAPTURA', 101.024, 117.19, 101.024, 117.19, 101.024, 117.19, 101.02, 117.19, 0.00, 0.00, 80.82, 93.75, 80.82, 0.160, 1500.00, 16.00);

-- ----------------------------
-- Table structure for ventas_pagos
-- ----------------------------
DROP TABLE IF EXISTS `ventas_pagos`;
CREATE TABLE `ventas_pagos`  (
  `cve_venta_pago` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del pago asociado a una venta',
  `cve_venta` int(11) NOT NULL COMMENT 'Identificador del registro de la venta',
  `medio_pago` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Medio por el cual se realiza el pago: EFECTIVO, TARJETA, VALE, CHEQUE, TRANSFERENCIA',
  `cantidad` decimal(11, 2) NOT NULL COMMENT 'Cantidad de dinero',
  `numero_comprobante` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Número de comprobante del medio de pago',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_venta_pago`) USING BTREE,
  INDEX `fk_venta_ventas_pagos`(`cve_venta`) USING BTREE,
  CONSTRAINT `fk_venta_ventas_pagos` FOREIGN KEY (`cve_venta`) REFERENCES `ventas` (`cve_venta`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Registra los pagos asociados a las ventas' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ventas_pagos
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
