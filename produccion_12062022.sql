/*
 Navicat Premium Data Transfer

 Source Server         : Daniel_Hostiguer
 Source Server Type    : MySQL
 Source Server Version : 100515
 Source Host           : 82.180.174.103:3306
 Source Schema         : u903984016_pos

 Target Server Type    : MySQL
 Target Server Version : 100515
 File Encoding         : 65001

 Date: 12/06/2022 19:01:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for acciones
-- ----------------------------
DROP TABLE IF EXISTS `acciones`;
CREATE TABLE `acciones`  (
  `cve_accion` int NOT NULL AUTO_INCREMENT,
  `accion` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `descripcion` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fecha_alta` timestamp NULL DEFAULT current_timestamp,
  `estatus_registro` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cve_menu` int NULL DEFAULT NULL,
  PRIMARY KEY (`cve_accion`) USING BTREE,
  INDEX `acciones_FK`(`cve_menu` ASC) USING BTREE,
  CONSTRAINT `acciones_FK` FOREIGN KEY (`cve_menu`) REFERENCES `menus` (`cve_menu`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of acciones
-- ----------------------------
INSERT INTO `acciones` VALUES (1, 'ope_editar_prod', 'Editar descripcion del producto en venta', '2022-04-09 21:49:07', 'VIG', 7);
INSERT INTO `acciones` VALUES (2, 'ope_cantidad_prod', 'Editar cantidad de producto en venta', '2022-04-09 21:49:07', 'VIG', 7);
INSERT INTO `acciones` VALUES (3, 'ope_borrar_prod', 'Borrar producto en venta', '2022-04-09 21:49:07', 'VIG', 7);
INSERT INTO `acciones` VALUES (4, 'ope_descuento_prod', 'Aplicar descuento producto venta', '2022-04-09 21:49:07', 'VIG', 7);
INSERT INTO `acciones` VALUES (5, 'ope_espera_venta', 'Poner en espera la venta', '2022-04-09 21:49:07', 'VIG', 7);
INSERT INTO `acciones` VALUES (6, 'ope_recupera_venta', 'Recuperar venta', '2022-04-09 21:49:07', 'VIG', 7);
INSERT INTO `acciones` VALUES (7, 'ope_paga_venta', 'Pagar venta', '2022-04-09 21:49:07', 'VIG', 7);
INSERT INTO `acciones` VALUES (8, 'ope_movimiento_caja', 'Movimiento de Caja Venta', '2022-05-16 15:12:07', 'VIG', 7);

-- ----------------------------
-- Table structure for cajas
-- ----------------------------
DROP TABLE IF EXISTS `cajas`;
CREATE TABLE `cajas`  (
  `cve_caja` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de cajas',
  `cve_sucursal` int NOT NULL COMMENT 'Identificador del catálogo de sucursales',
  `caja` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Descripción de la caja',
  `codigo_caja` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Código que identifica a la caja en la sucursal',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_caja`) USING BTREE,
  INDEX `fk_sucursal_caja`(`cve_sucursal` ASC) USING BTREE,
  CONSTRAINT `fk_sucursal_caja` FOREIGN KEY (`cve_sucursal`) REFERENCES `sucursales` (`cve_sucursal`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Catálogo de cajas registradoras de cobro' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cajas
-- ----------------------------
INSERT INTO `cajas` VALUES (1, 1, 'CAJA1', 'S1C1', '2022-06-01 18:17:26', 'VIG');
INSERT INTO `cajas` VALUES (2, 1, 'CAJA2', '3FCA18A3-F9A7-4BCD-ADEF-4B20ABF4E14D', '2022-06-03 18:40:46', 'VIG');

-- ----------------------------
-- Table structure for carga_masiva
-- ----------------------------
DROP TABLE IF EXISTS `carga_masiva`;
CREATE TABLE `carga_masiva`  (
  `cve_carga` int NOT NULL AUTO_INCREMENT,
  `cve_entrada` int NULL DEFAULT NULL,
  `codigo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `marca` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `categoria` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cantidad` int NULL DEFAULT NULL,
  `precio_compra` decimal(11, 2) NULL DEFAULT NULL,
  `precio_venta` decimal(11, 2) NULL DEFAULT NULL,
  `fecha_alta` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cve_producto` int NULL DEFAULT NULL,
  `cve_categoria` int NULL DEFAULT NULL,
  `cve_producto_sucursal` int NULL DEFAULT NULL,
  `procesado` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'no',
  PRIMARY KEY (`cve_carga`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 485 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of carga_masiva
-- ----------------------------
INSERT INTO `carga_masiva` VALUES (1, 1, 'A22001000002', 'CAJA ITK 26L', 'ITALIKA', 'Accesorios 2021 A', 1, 516.81, 749.00, NULL, 1, 3, 1, 'si');
INSERT INTO `carga_masiva` VALUES (2, 1, 'A22006000007', 'PUÑOS ITK D7', 'ITALIKA', 'Accesorios 2021 A', 5, 75.21, 109.01, NULL, 2, 3, 2, 'si');
INSERT INTO `carga_masiva` VALUES (3, 1, 'A22010000008', 'FARO C/ CUBIERTA OJO ANGEL LUZ AMARILLO', 'ITALIKA', 'Accesorios 2021 A', 2, 275.31, 399.01, NULL, 3, 3, 3, 'si');
INSERT INTO `carga_masiva` VALUES (4, 1, 'A22011000005', 'DIRECCIONALES JET', 'ITALIKA', 'Accesorios 2021 A', 4, 102.81, 149.00, NULL, 4, 3, 4, 'si');
INSERT INTO `carga_masiva` VALUES (5, 1, 'A22012000006', 'ESPEJO CITY ROAD D1', 'ITALIKA', 'Accesorios 2021 A', 3, 158.01, 229.00, NULL, 5, 3, 5, 'si');
INSERT INTO `carga_masiva` VALUES (6, 1, 'ACCCANDISFAM', 'CANDADO DISCO FRENO AMARILLO', 'ITALIKA', 'Sin Descuento', 2, 169.00, 169.00, NULL, 6, 4, 6, 'si');
INSERT INTO `carga_masiva` VALUES (7, 1, 'ACCCASAAL', 'CASCO ABATIBLE DOT AZUL L', 'ITALIKA', 'Accesorios 2021 A', 1, 827.31, 1199.00, NULL, 7, 3, 7, 'si');
INSERT INTO `carga_masiva` VALUES (8, 1, 'ACCFILTRO5G', 'FILTRO GASOLINA PIRINOLA TRANSP 10 PZAS', 'ITALIKA', 'Accesorios 2021 A', 2, 200.10, 290.00, NULL, 8, 3, 8, 'si');
INSERT INTO `carga_masiva` VALUES (9, 1, 'ACCFILTRO6G', 'FILTRO GASOLINA TRANSPARENTE 10 PZAS', 'ITALIKA', 'Accesorios 2021 A', 2, 103.50, 149.99, NULL, 9, 3, 9, 'si');
INSERT INTO `carga_masiva` VALUES (10, 1, 'ACCREDELNEG', 'RED ELASTICA NEGRA (40X40CM)', 'ITALIKA', 'Accesorios 2021 A', 8, 47.61, 69.00, NULL, 10, 3, 10, 'si');
INSERT INTO `carga_masiva` VALUES (11, 1, 'C02030040', 'CADENA TRACCION 428-108', 'HERO', 'Partes de Motor', 3, 189.90, 422.00, NULL, 11, 5, 11, 'si');
INSERT INTO `carga_masiva` VALUES (12, 1, 'E01010059', 'CARBURADOR', 'ITALIKA', 'Partes de Motor', 2, 403.65, 986.00, NULL, 12, 5, 12, 'si');
INSERT INTO `carga_masiva` VALUES (13, 1, 'E01010138', 'CARBURADOR (75-35)', 'ITALIKA', 'Partes de Motor', 4, 574.65, 1344.00, NULL, 13, 5, 13, 'si');
INSERT INTO `carga_masiva` VALUES (14, 1, 'E01020020', 'JUEGO CARBURADOR', 'ITALIKA', 'Partes de Motor', 6, 121.74, 238.70, NULL, 14, 5, 14, 'si');
INSERT INTO `carga_masiva` VALUES (15, 1, 'E01030023', 'ESPREA PRINCIPAL #75', 'ITALIKA', 'General', 9, 36.04, 67.00, NULL, 15, 6, 15, 'si');
INSERT INTO `carga_masiva` VALUES (16, 1, 'E01030064', 'ESPREA BAJA #35', 'ITALIKA', 'Partes de Motor', 4, 40.05, 93.00, NULL, 16, 5, 16, 'si');
INSERT INTO `carga_masiva` VALUES (17, 1, 'E02010008', 'CONJUNTO CABEZA DE CILINDRO', 'ITALIKA', 'Partes de Motor', 2, 452.25, 1120.00, NULL, 17, 5, 17, 'si');
INSERT INTO `carga_masiva` VALUES (18, 1, 'E02020014', 'BUJIA GOLD GDR8EA', 'ITALIKA', 'Bujías', 3, 19.07, 40.00, NULL, 18, 7, 18, 'si');
INSERT INTO `carga_masiva` VALUES (19, 1, 'E02020015', 'BUJIA GOLD GCR7HSA', 'ITALIKA', 'Bujías', 3, 19.07, 40.00, NULL, 19, 7, 19, 'si');
INSERT INTO `carga_masiva` VALUES (20, 1, 'E02020028', 'BUJIA B7RTC', 'ITALIKA', 'Sin Descuento', 80, 37.94, 37.94, NULL, 20, 4, 20, 'si');
INSERT INTO `carga_masiva` VALUES (21, 1, 'E02030105', 'EMPAQUE CABEZA CILINDRO', 'ITALIKA', 'Partes de Motor', 1, 180.00, 439.00, NULL, 21, 5, 21, 'si');
INSERT INTO `carga_masiva` VALUES (22, 1, 'E02040011', 'TORNILLO GUIA 6M*32', 'ITALIKA', 'Partes de Motor', 40, 4.50, 9.00, NULL, 22, 5, 22, 'si');
INSERT INTO `carga_masiva` VALUES (23, 1, 'E02050055', 'PIPETA', 'ITALIKA', 'Partes de Motor', 3, 84.15, 187.00, NULL, 23, 5, 23, 'si');
INSERT INTO `carga_masiva` VALUES (24, 1, 'E02050082', 'PIPETA', 'ITALIKA', 'Partes de Motor', 7, 54.45, 127.00, NULL, 24, 5, 24, 'si');
INSERT INTO `carga_masiva` VALUES (25, 1, 'E02050089', 'PIPETA', 'ITALIKA', 'Partes de Motor', 3, 229.50, 510.01, NULL, 25, 5, 25, 'si');
INSERT INTO `carga_masiva` VALUES (26, 1, 'E03010045', 'CILINDRO', 'ITALIKA', 'Partes de Motor', 1, 1034.55, 2542.00, NULL, 26, 5, 26, 'si');
INSERT INTO `carga_masiva` VALUES (27, 1, 'E03020016', 'JUNTA DE CILINDRO', 'ITALIKA', 'Partes de Motor', 16, 3.17, 5.00, NULL, 27, 5, 27, 'si');
INSERT INTO `carga_masiva` VALUES (28, 1, 'E03020041', 'EMPAQUE CILINDRO', 'ITALIKA', 'Partes de Motor', 1, 8.55, 20.00, NULL, 28, 5, 28, 'si');
INSERT INTO `carga_masiva` VALUES (29, 1, 'E03020071', 'JUNTA CILINDRO', 'ITALIKA', 'Partes de Motor', 20, 2.25, 5.00, NULL, 29, 5, 29, 'si');
INSERT INTO `carga_masiva` VALUES (30, 1, 'E03020072', 'EMPAQUE CABEZA CILINDRO', 'ITALIKA', 'Partes de Motor', 20, 23.40, 59.00, NULL, 30, 5, 30, 'si');
INSERT INTO `carga_masiva` VALUES (31, 1, 'E0304KC11', 'JUEGO CILINDRO MOTOR CBP250', 'ITALIKA', 'Partes de Motor', 3, 739.96, 1450.90, NULL, 31, 5, 31, 'si');
INSERT INTO `carga_masiva` VALUES (32, 1, 'E0304KC13', 'JUEGO CILINDRO MOTOR CGP180', 'ITALIKA', 'Partes de Motor', 1, 557.07, 1332.11, NULL, 32, 5, 32, 'si');
INSERT INTO `carga_masiva` VALUES (33, 1, 'E04010095', 'ARBOL LEVAS', 'ITALIKA', 'Partes de Motor', 4, 204.30, 478.00, NULL, 33, 5, 33, 'si');
INSERT INTO `carga_masiva` VALUES (34, 1, 'E04020005', 'SELLO DE VALVULA', 'ITALIKA', 'Partes de Motor', 20, 11.70, 29.00, NULL, 34, 5, 34, 'si');
INSERT INTO `carga_masiva` VALUES (35, 1, 'E04030004', 'ENGRANAJE DE TREN DE VALVULAS', 'ITALIKA', 'Partes de Motor', 5, 157.05, 349.00, NULL, 35, 5, 35, 'si');
INSERT INTO `carga_masiva` VALUES (36, 1, 'E04030007', 'CADENA DE CAMARA', 'ITALIKA', 'Partes de Motor', 10, 70.20, 156.00, NULL, 36, 5, 36, 'si');
INSERT INTO `carga_masiva` VALUES (37, 1, 'E04030048', 'CADENA DE CAMARA', 'ITALIKA', 'Partes de Motor', 3, 74.70, 104.01, NULL, 37, 5, 37, 'si');
INSERT INTO `carga_masiva` VALUES (38, 1, 'E04030096', 'GUIA TENSORA CADENA', 'ITALIKA', 'Partes de Motor', 1, 40.50, 97.00, NULL, 38, 5, 38, 'si');
INSERT INTO `carga_masiva` VALUES (39, 1, 'E04030097', 'CADENA TIEMPO 102 ESLABONES', 'ITALIKA', 'Partes de Motor', 2, 899.55, 2160.00, NULL, 39, 5, 39, 'si');
INSERT INTO `carga_masiva` VALUES (40, 1, 'E04030098', 'GUIA CADENA', 'ITALIKA', 'Partes de Motor', 7, 23.85, 58.00, NULL, 40, 5, 40, 'si');
INSERT INTO `carga_masiva` VALUES (41, 1, 'E04030099', 'ENGRANAJE TIEMPO 32T', 'ITALIKA', 'Partes de Motor', 7, 38.70, 90.00, NULL, 41, 5, 41, 'si');
INSERT INTO `carga_masiva` VALUES (42, 1, 'E04030100', 'RODAMIENTO GUIA CADENA', 'ITALIKA', 'Partes de Motor', 10, 13.05, 33.00, NULL, 42, 5, 42, 'si');
INSERT INTO `carga_masiva` VALUES (43, 1, 'E04030101', 'RODAMIENTO TENSOR CADENA', 'ITALIKA', 'Partes de Motor', 10, 10.35, 25.00, NULL, 43, 5, 43, 'si');
INSERT INTO `carga_masiva` VALUES (44, 1, 'E04040002', 'BUZO IMPULSOR DE VALVULA', 'ITALIKA', 'Partes de Motor', 8, 31.05, 76.00, NULL, 44, 5, 44, 'si');
INSERT INTO `carga_masiva` VALUES (45, 1, 'E04040004', 'VARILLA IMPULSORA DE BALANCIN', 'ITALIKA', 'Partes de Motor', 10, 15.75, 40.99, NULL, 45, 5, 45, 'si');
INSERT INTO `carga_masiva` VALUES (46, 1, 'E04050055', 'VALVULA DE ADMISION', 'ITALIKA', 'Partes de Motor', 5, 64.80, 125.00, NULL, 46, 5, 46, 'si');
INSERT INTO `carga_masiva` VALUES (47, 1, 'E04050056', 'VALVULA DE ESCAPE', 'ITALIKA', 'Partes de Motor', 5, 74.70, 170.00, NULL, 47, 5, 47, 'si');
INSERT INTO `carga_masiva` VALUES (48, 1, 'E04050115', 'VALVULA ESCAPE', 'ITALIKA', 'Partes de Motor', 10, 59.40, 138.01, NULL, 48, 5, 48, 'si');
INSERT INTO `carga_masiva` VALUES (49, 1, 'E04050116', 'JUEGO VALVULAS MOTOR', 'ITALIKA', 'Partes de Motor', 5, 129.15, 287.00, NULL, 49, 5, 49, 'si');
INSERT INTO `carga_masiva` VALUES (50, 1, 'E04050117', 'VALVULA ADMISION', 'ITALIKA', 'Partes de Motor', 10, 40.05, 93.00, NULL, 50, 5, 50, 'si');
INSERT INTO `carga_masiva` VALUES (51, 1, 'E05010005', 'ESTATOR', 'ITALIKA', 'Eléctrico', 4, 252.45, 561.00, NULL, 51, 8, 51, 'si');
INSERT INTO `carga_masiva` VALUES (52, 1, 'E05010029', 'ESTATOR', 'ITALIKA', 'Eléctrico', 2, 289.35, 723.00, NULL, 52, 8, 52, 'si');
INSERT INTO `carga_masiva` VALUES (53, 1, 'E05010034', 'ESTATOR', 'ITALIKA', 'Eléctrico', 3, 245.25, 545.00, NULL, 53, 8, 53, 'si');
INSERT INTO `carga_masiva` VALUES (54, 1, 'E05010062', 'ESTATOR 8 BOBINAS', 'ITALIKA', 'Eléctrico', 4, 358.20, 838.00, NULL, 54, 8, 54, 'si');
INSERT INTO `carga_masiva` VALUES (55, 1, 'E05030074', 'ROTOR', 'ITALIKA', 'Eléctrico', 2, 287.10, 568.01, NULL, 55, 8, 55, 'si');
INSERT INTO `carga_masiva` VALUES (56, 1, 'E06010030', 'BALERO BOLA RADIAL', 'ITALIKA', 'Partes de Motor', 30, 27.90, 73.00, NULL, 56, 5, 56, 'si');
INSERT INTO `carga_masiva` VALUES (57, 1, 'E06030105', 'RUEDA DENTADA 15T', 'ITALIKA', 'Partes de Motor', 20, 45.00, 100.00, NULL, 57, 5, 57, 'si');
INSERT INTO `carga_masiva` VALUES (58, 1, 'E06030109', 'RUEDA DENTADA 13T', 'ITALIKA', 'Partes de Motor', 10, 62.55, 146.00, NULL, 58, 5, 58, 'si');
INSERT INTO `carga_masiva` VALUES (59, 1, 'E06030121', 'RUEDA DENTADA 16T', 'ITALIKA', 'Partes de Motor', 10, 23.97, 53.00, NULL, 59, 5, 59, 'si');
INSERT INTO `carga_masiva` VALUES (60, 1, 'E06030128', 'RUEDA DENTADA', 'ITALIKA', 'Partes de Motor', 10, 36.00, 89.00, NULL, 60, 5, 60, 'si');
INSERT INTO `carga_masiva` VALUES (61, 1, 'E06040017', 'EMPAQUE DE CAJA DE TRANSMISION', 'ITALIKA', 'Partes de Motor', 3, 21.15, 29.00, NULL, 61, 5, 61, 'si');
INSERT INTO `carga_masiva` VALUES (62, 1, 'E06040051', 'SELLO DE ACEITE 17*29*5', 'ITALIKA', 'Partes de Motor', 16, 18.00, 40.00, NULL, 62, 5, 62, 'si');
INSERT INTO `carga_masiva` VALUES (63, 1, 'E07020042', 'SELLO DE ACEITE', 'ITALIKA', 'General', 16, 14.31, 27.00, NULL, 63, 6, 63, 'si');
INSERT INTO `carga_masiva` VALUES (64, 1, 'E07020115', 'EMPAQUE CENTRAL CARTER', 'ITALIKA', 'General', 15, 19.77, 43.00, NULL, 64, 6, 64, 'si');
INSERT INTO `carga_masiva` VALUES (65, 1, 'E07030002', 'BALERO BOLA RADIAL,6002', 'ITALIKA', 'Partes de Motor', 20, 53.55, 126.00, NULL, 65, 5, 65, 'si');
INSERT INTO `carga_masiva` VALUES (66, 1, 'E08010098', 'PISTON', 'ITALIKA', 'Partes de Motor', 1, 187.65, 457.01, NULL, 66, 5, 66, 'si');
INSERT INTO `carga_masiva` VALUES (67, 1, 'E08010100', 'PASADOR DE PISTON', 'ITALIKA', 'Partes de Motor', 1, 39.60, 88.00, NULL, 67, 5, 67, 'si');
INSERT INTO `carga_masiva` VALUES (68, 1, 'E08010101', 'SEGURO PASADOR DE PISTON', 'ITALIKA', 'Partes de Motor', 1, 1.80, 3.00, NULL, 68, 5, 68, 'si');
INSERT INTO `carga_masiva` VALUES (69, 1, 'E08010176', 'JUEGO ANILLOS PISTON', 'ITALIKA', 'Partes de Motor', 6, 93.15, 207.00, NULL, 69, 5, 69, 'si');
INSERT INTO `carga_masiva` VALUES (70, 1, 'E08010177', 'SEGURO PASADOR PISTON', 'ITALIKA', 'Partes de Motor', 60, 1.35, 3.00, NULL, 70, 5, 70, 'si');
INSERT INTO `carga_masiva` VALUES (71, 1, 'E08010178', 'PISTON', 'ITALIKA', 'Partes de Motor', 6, 82.35, 183.00, NULL, 71, 5, 71, 'si');
INSERT INTO `carga_masiva` VALUES (72, 1, 'E08010179', 'PASADOR PISTON 12X33', 'ITALIKA', 'Partes de Motor', 20, 12.60, 29.00, NULL, 72, 5, 72, 'si');
INSERT INTO `carga_masiva` VALUES (73, 1, 'E08010189', 'PISTON', 'ITALIKA', 'Partes de Motor', 1, 295.20, 656.00, NULL, 73, 5, 73, 'si');
INSERT INTO `carga_masiva` VALUES (74, 1, 'E08010190', 'JGO ANILLOS PISTON', 'ITALIKA', 'Partes de Motor', 3, 378.45, 841.00, NULL, 74, 5, 74, 'si');
INSERT INTO `carga_masiva` VALUES (75, 1, 'E08010191', 'PASADOR PISTON', 'ITALIKA', 'Partes de Motor', 2, 35.55, 79.00, NULL, 75, 5, 75, 'si');
INSERT INTO `carga_masiva` VALUES (76, 1, 'E0801KP03', 'JUEGO PISTON GY6125-STD', 'ITALIKA', 'Partes de Motor', 3, 118.35, 263.00, NULL, 76, 5, 76, 'si');
INSERT INTO `carga_masiva` VALUES (77, 1, 'E0801KP11', 'JUEGO PISTON C110-STD', 'ITALIKA', 'Partes de Motor', 1, 107.10, 240.00, NULL, 77, 5, 77, 'si');
INSERT INTO `carga_masiva` VALUES (78, 1, 'E0801KP15', 'JUEGO PISTON CG125-STD', 'ITALIKA', 'Partes de Motor', 4, 126.90, 324.00, NULL, 78, 5, 78, 'si');
INSERT INTO `carga_masiva` VALUES (79, 1, 'E08020023', 'CIGÜEÑAL', 'ITALIKA', 'Partes de Motor', 1, 709.20, 1804.99, NULL, 79, 5, 79, 'si');
INSERT INTO `carga_masiva` VALUES (80, 1, 'E08020071', 'CONJUNTO CIGÜENAL', 'ITALIKA', 'Partes de Motor', 4, 926.55, 2168.01, NULL, 80, 5, 80, 'si');
INSERT INTO `carga_masiva` VALUES (81, 1, 'E08030087', 'BALERO RADIAL BOLA 6305/P6', 'ITALIKA', 'Partes de Motor', 8, 92.70, 206.00, NULL, 81, 5, 81, 'si');
INSERT INTO `carga_masiva` VALUES (82, 1, 'E08050004', 'BUJE 30X19X9', 'ITALIKA', 'Partes de Motor', 10, 46.35, 110.00, NULL, 82, 5, 82, 'si');
INSERT INTO `carga_masiva` VALUES (83, 1, 'E09010065', 'BOMBA ACEITE', 'ITALIKA', 'Partes de Motor', 1, 122.40, 272.00, NULL, 83, 5, 83, 'si');
INSERT INTO `carga_masiva` VALUES (84, 1, 'E09040074', 'RODAMIENTO CADENA', 'ITALIKA', 'Partes de Motor', 10, 22.50, 57.00, NULL, 84, 5, 84, 'si');
INSERT INTO `carga_masiva` VALUES (85, 1, 'E09040076', 'ENGRANAJE IMPULSOR BOMBA ACEITE', 'ITALIKA', 'Partes de Motor', 3, 27.45, 61.00, NULL, 85, 5, 85, 'si');
INSERT INTO `carga_masiva` VALUES (86, 1, 'E09040077', 'CADENA BOMBA ACEITE', 'ITALIKA', 'Partes de Motor', 3, 53.55, 119.00, NULL, 86, 5, 86, 'si');
INSERT INTO `carga_masiva` VALUES (87, 1, 'E10020002', 'ACCIONADOR DE EMBRAGUE', 'ITALIKA', 'Partes de Motor', 1, 37.35, 78.00, NULL, 87, 5, 87, 'si');
INSERT INTO `carga_masiva` VALUES (88, 1, 'E10020012', 'SELECTOR DE CAMBIOS', 'ITALIKA', 'Partes de Motor', 10, 27.00, 60.00, NULL, 88, 5, 88, 'si');
INSERT INTO `carga_masiva` VALUES (89, 1, 'E10030018', 'SELLO DE ACEITE,16*28*7', 'ITALIKA', 'General', 11, 13.78, 22.01, NULL, 89, 6, 89, 'si');
INSERT INTO `carga_masiva` VALUES (90, 1, 'E10030070', 'EMPAQUE CUBIERTA DER CARTER', 'ITALIKA', 'Partes de Motor', 25, 19.80, 44.00, NULL, 90, 5, 90, 'si');
INSERT INTO `carga_masiva` VALUES (91, 1, 'E10030100', 'EMPAQUE CUBIERTA DER CARTER', 'ITALIKA', 'Partes de Motor', 21, 17.55, 45.00, NULL, 91, 5, 91, 'si');
INSERT INTO `carga_masiva` VALUES (92, 1, 'E10030105', 'EMPAQUE CUBIERTA CARTER DER', 'ITALIKA', 'Partes de Motor', 3, 29.25, 64.99, NULL, 92, 5, 92, 'si');
INSERT INTO `carga_masiva` VALUES (93, 1, 'E10050015', 'MEDIDOR DE ACEITE GRIS L=26', 'ITALIKA', 'Partes de Motor', 7, 9.00, 22.01, NULL, 93, 5, 93, 'si');
INSERT INTO `carga_masiva` VALUES (94, 1, 'E10050016', 'MEDIDOR DE ACEITE', 'ITALIKA', 'Partes de Motor', 2, 7.65, 17.01, NULL, 94, 5, 94, 'si');
INSERT INTO `carga_masiva` VALUES (95, 1, 'E11010186', 'CUBIERTA DECORATIVA IZQ GRIS', 'ITALIKA', 'Colisión', 5, 17.10, 38.00, NULL, 95, 9, 95, 'si');
INSERT INTO `carga_masiva` VALUES (96, 1, 'E11030006', 'O-RING, 2.5 *13.8', 'ITALIKA', 'General', 15, 3.02, 3.00, NULL, 96, 6, 96, 'si');
INSERT INTO `carga_masiva` VALUES (97, 1, 'E11030066', 'EMPAQUE CUBIERTA IZQ CARTER', 'ITALIKA', 'Partes de Motor', 20, 13.05, 32.00, NULL, 97, 5, 97, 'si');
INSERT INTO `carga_masiva` VALUES (98, 1, 'E11040007', 'BALERO BOLA RADIAL 63/22P55YA', 'ITALIKA', 'Partes de Motor', 10, 98.10, 229.00, NULL, 98, 5, 98, 'si');
INSERT INTO `carga_masiva` VALUES (99, 1, 'E11060005', 'O-RING 31.7X2.4', 'ITALIKA', 'Partes de Motor', 16, 2.70, 6.00, NULL, 99, 5, 99, 'si');
INSERT INTO `carga_masiva` VALUES (100, 1, 'E12010008', 'JUEGO COMPLETO DE DISCO DE ARR', 'ITALIKA', 'Partes de Motor', 4, 364.50, 810.00, NULL, 100, 5, 100, 'si');
INSERT INTO `carga_masiva` VALUES (201, 1, 'F04030006', 'CHICOTE DE FRENO TRASERO', 'ITALIKA', 'Palancas y Chicotes', 9, 49.95, 122.00, NULL, 101, 10, 101, 'si');
INSERT INTO `carga_masiva` VALUES (202, 1, 'F04030011', 'CHICOTE DE VELOCIMETRO', 'ITALIKA', 'Palancas y Chicotes', 5, 38.25, 85.00, NULL, 102, 10, 102, 'si');
INSERT INTO `carga_masiva` VALUES (203, 1, 'F04030028', 'CHICOTE DE AHOGADOR', 'ITALIKA', 'Palancas y Chicotes', 1, 27.00, 67.00, NULL, 103, 10, 103, 'si');
INSERT INTO `carga_masiva` VALUES (204, 1, 'F04030035', 'CHICOTE DE CLUTCH', 'ITALIKA', 'Palancas y Chicotes', 10, 27.00, 69.99, NULL, 104, 10, 104, 'si');
INSERT INTO `carga_masiva` VALUES (205, 1, 'F04030064', 'CHICOTE DE FRENO DELANTERO', 'ITALIKA', 'Palancas y Chicotes', 13, 33.30, 84.00, NULL, 105, 10, 105, 'si');
INSERT INTO `carga_masiva` VALUES (206, 1, 'F04030075', 'CHICOTE VELOCIMETRO', 'ITALIKA', 'Palancas y Chicotes', 9, 46.35, 121.00, NULL, 106, 10, 106, 'si');
INSERT INTO `carga_masiva` VALUES (207, 1, 'F04030117', 'CHICOTE DE FRENO DELANTERO', 'ITALIKA', 'Palancas y Chicotes', 5, 75.15, 167.01, NULL, 107, 10, 107, 'si');
INSERT INTO `carga_masiva` VALUES (208, 1, 'F04030134', 'CHICOTE DEL VELOCIMETRO', 'ITALIKA', 'Palancas y Chicotes', 9, 54.90, 135.00, NULL, 108, 10, 108, 'si');
INSERT INTO `carga_masiva` VALUES (209, 1, 'F04030147', 'CHICOTE DE VELOCIMETRO', 'ITALIKA', 'Palancas y Chicotes', 10, 28.35, 71.00, NULL, 109, 10, 109, 'si');
INSERT INTO `carga_masiva` VALUES (210, 1, 'F04030179', 'CHICOTE EMBRAGUE', 'ITALIKA', 'Palancas y Chicotes', 6, 31.50, 80.01, NULL, 110, 10, 110, 'si');
INSERT INTO `carga_masiva` VALUES (211, 1, 'F04030182', 'CHICOTE VELOCIMETRO', 'ITALIKA', 'Palancas y Chicotes', 24, 31.50, 69.99, NULL, 111, 10, 111, 'si');
INSERT INTO `carga_masiva` VALUES (212, 1, 'F04030183', 'CHICOTE ACELERADOR', 'ITALIKA', 'Palancas y Chicotes', 20, 29.25, 74.00, NULL, 112, 10, 112, 'si');
INSERT INTO `carga_masiva` VALUES (213, 1, 'F04030206', 'CHICOTE VELOCIMETRO', 'ITALIKA', 'Palancas y Chicotes', 22, 56.70, 126.00, NULL, 113, 10, 113, 'si');
INSERT INTO `carga_masiva` VALUES (214, 1, 'F04030209', 'CHICOTE EMBRAGUE', 'ITALIKA', 'Palancas y Chicotes', 9, 82.35, 183.00, NULL, 114, 10, 114, 'si');
INSERT INTO `carga_masiva` VALUES (215, 1, 'F04030215', 'CHICOTE ACELERADOR', 'ITALIKA', 'Palancas y Chicotes', 10, 32.40, 72.00, NULL, 115, 10, 115, 'si');
INSERT INTO `carga_masiva` VALUES (216, 1, 'F04030239', 'CHICOTE VELOCIMETRO', 'ITALIKA', 'Palancas y Chicotes', 10, 46.35, 120.00, NULL, 116, 10, 116, 'si');
INSERT INTO `carga_masiva` VALUES (217, 1, 'F04030248', 'CHICOTE VELOCIMETRO', 'ITALIKA', 'Palancas y Chicotes', 14, 47.70, 117.00, NULL, 117, 10, 117, 'si');
INSERT INTO `carga_masiva` VALUES (218, 1, 'F04030249', 'CHICOTE CLUTCH', 'ITALIKA', 'Palancas y Chicotes', 12, 73.35, 163.00, NULL, 118, 10, 118, 'si');
INSERT INTO `carga_masiva` VALUES (219, 1, 'F04030288', 'CHICOTE DE VELOCIMETRO', 'ITALIKA', 'Palancas y Chicotes', 17, 39.60, 103.00, NULL, 119, 10, 119, 'si');
INSERT INTO `carga_masiva` VALUES (220, 1, 'F04030327', 'CHICOTE VELOCIMETRO', 'ITALIKA', 'Palancas y Chicotes', 10, 25.65, 64.99, NULL, 120, 10, 120, 'si');
INSERT INTO `carga_masiva` VALUES (221, 1, 'F04030330', 'CHICOTE EMBRAGUE', 'ITALIKA', 'Palancas y Chicotes', 23, 51.75, 115.00, NULL, 121, 10, 121, 'si');
INSERT INTO `carga_masiva` VALUES (222, 1, 'F04030333', 'CHICOTE EMBRAGUE', 'ITALIKA', 'Palancas y Chicotes', 15, 27.45, 69.99, NULL, 122, 10, 122, 'si');
INSERT INTO `carga_masiva` VALUES (223, 1, 'F04030344', 'CHICOTE FRENO TRAS', 'ITALIKA', 'Palancas y Chicotes', 10, 80.10, 204.00, NULL, 123, 10, 123, 'si');
INSERT INTO `carga_masiva` VALUES (224, 1, 'F04030351', 'CHICOTE EMBRAGUE', 'ITALIKA', 'Palancas y Chicotes', 19, 31.95, 81.00, NULL, 124, 10, 124, 'si');
INSERT INTO `carga_masiva` VALUES (225, 1, 'F04030366', 'CHICOTE ACELERADOR', 'ITALIKA', 'Palancas y Chicotes', 3, 98.55, 219.00, NULL, 125, 10, 125, 'si');
INSERT INTO `carga_masiva` VALUES (226, 1, 'F04030367', 'CHICOTE CUENTA KILOMETROS', 'ITALIKA', 'Palancas y Chicotes', 6, 68.40, 151.99, NULL, 126, 10, 126, 'si');
INSERT INTO `carga_masiva` VALUES (227, 1, 'F04030375', 'CHICOTE VELOCIMETRO', 'ITALIKA', 'Palancas y Chicotes', 4, 83.25, 178.00, NULL, 127, 10, 127, 'si');
INSERT INTO `carga_masiva` VALUES (228, 1, 'F04040128', 'CONJUNTO DE MANDO IZQ', 'ITALIKA', 'Eléctrico', 4, 77.85, 190.00, NULL, 128, 8, 128, 'si');
INSERT INTO `carga_masiva` VALUES (229, 1, 'F04040129', 'CONJUNTO DE MANDO DER', 'ITALIKA', 'Eléctrico', 4, 78.30, 191.01, NULL, 129, 8, 129, 'si');
INSERT INTO `carga_masiva` VALUES (230, 1, 'F04040135', 'SEGURO CHICOTE ACELERADOR', 'ITALIKA', 'General', 10, 5.30, 14.00, NULL, 130, 6, 130, 'si');
INSERT INTO `carga_masiva` VALUES (231, 1, 'F04040136', 'BASE CHICOTE ACELERADOR', 'ITALIKA', 'Palancas y Chicotes', 5, 49.50, 112.00, NULL, 131, 10, 131, 'si');
INSERT INTO `carga_masiva` VALUES (232, 1, 'F04040178', 'CONJUNTO MANDO IZQ', 'ITALIKA', 'Eléctrico', 7, 93.60, 208.00, NULL, 132, 8, 132, 'si');
INSERT INTO `carga_masiva` VALUES (233, 1, 'F04040179', 'CONJUNTO MANDO DER', 'ITALIKA', 'Eléctrico', 13, 93.60, 208.00, NULL, 133, 8, 133, 'si');
INSERT INTO `carga_masiva` VALUES (234, 1, 'F04040188', 'CONJUNTO MANDO IZQ', 'ITALIKA', 'Palancas y Chicotes', 6, 155.70, 346.00, NULL, 134, 10, 134, 'si');
INSERT INTO `carga_masiva` VALUES (235, 1, 'F04040251', 'CONJUNTO MANDO IZQ', 'ITALIKA', 'Eléctrico', 3, 274.05, 609.00, NULL, 135, 8, 135, 'si');
INSERT INTO `carga_masiva` VALUES (236, 1, 'F04040252', 'INTERRUPTOR EMERGENCIA', 'ITALIKA', 'Eléctrico', 3, 102.15, 227.00, NULL, 136, 8, 136, 'si');
INSERT INTO `carga_masiva` VALUES (237, 1, 'F04040253', 'ENSAMBLE PALANCA ACELERADOR', 'ITALIKA', 'Palancas y Chicotes', 2, 445.50, 990.00, NULL, 137, 10, 137, 'si');
INSERT INTO `carga_masiva` VALUES (238, 1, 'F04040259', 'CONJUNTO MANDO IZQ', 'ITALIKA', 'Eléctrico', 3, 201.60, 466.00, NULL, 138, 8, 138, 'si');
INSERT INTO `carga_masiva` VALUES (239, 1, 'F06010048', 'BATERIA MF-FA I12N7-3B', 'ITALIKA', 'Baterías', 4, 477.34, 862.00, NULL, 139, 11, 139, 'si');
INSERT INTO `carga_masiva` VALUES (240, 1, 'F06010049', 'BATERIA MF-FA ICB6L-B', 'ITALIKA', 'Baterías', 5, 380.48, 656.00, NULL, 140, 11, 140, 'si');
INSERT INTO `carga_masiva` VALUES (241, 1, 'F06010051', 'BATERIA MF-FA ICB5L-B', 'ITALIKA', 'Baterías', 4, 334.66, 605.00, NULL, 141, 11, 141, 'si');
INSERT INTO `carga_masiva` VALUES (242, 1, 'F06010092', 'BATERIA MF-FA IYTX4L-BS', 'ITALIKA', 'Baterías', 4, 302.18, 521.00, NULL, 142, 11, 142, 'si');
INSERT INTO `carga_masiva` VALUES (243, 1, 'F06020002', 'RELE ENCENDIDO', 'ITALIKA', 'Eléctrico', 5, 81.00, 180.00, NULL, 143, 8, 143, 'si');
INSERT INTO `carga_masiva` VALUES (244, 1, 'F06020007', 'RELE DE ENCENDIDO', 'ITALIKA', 'Eléctrico', 5, 69.75, 155.00, NULL, 144, 8, 144, 'si');
INSERT INTO `carga_masiva` VALUES (245, 1, 'F06020102', 'RELE ARRANQUE', 'ITALIKA', 'Eléctrico', 9, 88.65, 197.00, NULL, 145, 8, 145, 'si');
INSERT INTO `carga_masiva` VALUES (246, 1, 'F06030005', 'RECTIFICADOR/REGULADOR', 'ITALIKA', 'Eléctrico', 6, 57.60, 127.99, NULL, 146, 8, 146, 'si');
INSERT INTO `carga_masiva` VALUES (247, 1, 'F06030008', 'RECTIFICADOR CONJUNTO', 'ITALIKA', 'Eléctrico', 5, 117.90, 262.00, NULL, 147, 8, 147, 'si');
INSERT INTO `carga_masiva` VALUES (248, 1, 'F06030025', 'REGULADOR DE CORRIENTE', 'ITALIKA', 'Eléctrico', 8, 203.85, 453.00, NULL, 148, 8, 148, 'si');
INSERT INTO `carga_masiva` VALUES (249, 1, 'F06030026', 'REGULADOR', 'ITALIKA', 'Eléctrico', 5, 129.15, 287.00, NULL, 149, 8, 149, 'si');
INSERT INTO `carga_masiva` VALUES (250, 1, 'F06030029', 'REGULADOR RECTIFICADOR', 'ITALIKA', 'Eléctrico', 5, 199.35, 443.00, NULL, 150, 8, 150, 'si');
INSERT INTO `carga_masiva` VALUES (251, 1, 'F06030048', 'RECTIFICADOR/REGULADOR', 'ITALIKA', 'Eléctrico', 4, 135.90, 301.99, NULL, 151, 8, 151, 'si');
INSERT INTO `carga_masiva` VALUES (252, 1, 'F06040002', 'UNIDAD CDI', 'ITALIKA', 'Eléctrico', 4, 114.75, 255.00, NULL, 152, 8, 152, 'si');
INSERT INTO `carga_masiva` VALUES (253, 1, 'F06040006', 'UNIDAD CDI', 'ITALIKA', 'Eléctrico', 5, 83.25, 185.00, NULL, 153, 8, 153, 'si');
INSERT INTO `carga_masiva` VALUES (254, 1, 'F06040016', 'UNIDAD CDI', 'ITALIKA', 'Eléctrico', 6, 102.15, 227.00, NULL, 154, 8, 154, 'si');
INSERT INTO `carga_masiva` VALUES (255, 1, 'F06040019', 'UNIDAD CDI', 'ITALIKA', 'Eléctrico', 4, 130.05, 289.00, NULL, 155, 8, 155, 'si');
INSERT INTO `carga_masiva` VALUES (256, 1, 'F06040023', 'UNIDAD CDI', 'ITALIKA', 'Eléctrico', 5, 145.35, 323.00, NULL, 156, 8, 156, 'si');
INSERT INTO `carga_masiva` VALUES (257, 1, 'F06040026', 'UNIDAD CDI', 'ITALIKA', 'Eléctrico', 2, 206.78, 296.00, NULL, 157, 8, 157, 'si');
INSERT INTO `carga_masiva` VALUES (258, 1, 'F06040047', 'UNIDAD CDI', 'ITALIKA', 'Eléctrico', 4, 69.30, 154.00, NULL, 158, 8, 158, 'si');
INSERT INTO `carga_masiva` VALUES (259, 1, 'F06040051', 'UNIDAD CDI', 'ITALIKA', 'Eléctrico', 4, 125.55, 317.00, NULL, 159, 8, 159, 'si');
INSERT INTO `carga_masiva` VALUES (260, 1, 'F06050060', 'ARNES PRINCIPAL', 'ITALIKA', 'Eléctrico', 3, 386.55, 859.00, NULL, 160, 8, 160, 'si');
INSERT INTO `carga_masiva` VALUES (261, 1, 'F06050105', 'CONECTOR USB', 'ITALIKA', 'Eléctrico', 5, 198.45, 501.00, NULL, 161, 8, 161, 'si');
INSERT INTO `carga_masiva` VALUES (262, 1, 'F06050179', 'ARNES PRINCIPAL', 'ITALIKA', 'Eléctrico', 1, 346.50, 886.00, NULL, 162, 8, 162, 'si');
INSERT INTO `carga_masiva` VALUES (263, 1, 'F06060002', 'BOBINA IGNICION', 'ITALIKA', 'Eléctrico', 6, 66.15, 147.00, NULL, 163, 8, 163, 'si');
INSERT INTO `carga_masiva` VALUES (264, 1, 'F06060020', 'BOBINA', 'ITALIKA', 'Eléctrico', 5, 72.90, 162.01, NULL, 164, 8, 164, 'si');
INSERT INTO `carga_masiva` VALUES (265, 1, 'F06060034', 'BOBINA DE IGNICION', 'ITALIKA', 'Eléctrico', 6, 86.40, 192.00, NULL, 165, 8, 165, 'si');
INSERT INTO `carga_masiva` VALUES (266, 1, 'F06060052', 'BOBINA DE IGNICION', 'ITALIKA', 'Eléctrico', 5, 90.00, 200.00, NULL, 166, 8, 166, 'si');
INSERT INTO `carga_masiva` VALUES (267, 1, 'F07010251', 'CUBIERTA ESCAPE', 'ITALIKA', 'Colisión', 1, 157.50, 390.00, NULL, 167, 9, 167, 'si');
INSERT INTO `carga_masiva` VALUES (268, 1, 'F07010255', 'CUBIERTA ESCAPE', 'ITALIKA', 'Colisión', 3, 85.95, 191.01, NULL, 168, 9, 168, 'si');
INSERT INTO `carga_masiva` VALUES (269, 1, 'F07010264', 'CONJUNTO ESCAPE NEGRO', 'ITALIKA', 'Colisión', 1, 1048.95, 2331.00, NULL, 169, 9, 169, 'si');
INSERT INTO `carga_masiva` VALUES (270, 1, 'F07020003', 'DEFENSA TACONERA', 'ITALIKA', 'General', 14, 28.22, 32.00, NULL, 170, 6, 170, 'si');
INSERT INTO `carga_masiva` VALUES (271, 1, 'F07030006', 'UNION DE ESCAPE', 'ITALIKA', 'General', 2, 13.78, 26.00, NULL, 171, 6, 171, 'si');
INSERT INTO `carga_masiva` VALUES (272, 1, 'F07030045', 'JUNTA DEL SILENCIADOR', 'ITALIKA', 'General', 10, 12.19, 23.00, NULL, 172, 6, 172, 'si');
INSERT INTO `carga_masiva` VALUES (273, 1, 'F07030093', 'EMPAQUE ESCAPE', 'ITALIKA', 'Colisión', 20, 4.95, 13.00, NULL, 173, 9, 173, 'si');
INSERT INTO `carga_masiva` VALUES (274, 1, 'F08010043', 'ELEMENTO FILTRANTE', 'ITALIKA', 'Partes de Motor', 10, 24.30, 62.00, NULL, 174, 5, 174, 'si');
INSERT INTO `carga_masiva` VALUES (275, 1, 'F08010108', 'ELEMENTO FILTRANTE', 'ITALIKA', 'Partes de Motor', 8, 37.35, 83.00, NULL, 175, 5, 175, 'si');
INSERT INTO `carga_masiva` VALUES (276, 1, 'F08010165', 'ELEMENTO FILTRANTE', 'ITALIKA', 'Partes de Motor', 10, 45.45, 101.00, NULL, 176, 5, 176, 'si');
INSERT INTO `carga_masiva` VALUES (277, 1, 'F08010232', 'ELEMENTO FILTRANTE', 'ITALIKA', 'Partes de Motor', 5, 92.70, 206.00, NULL, 177, 5, 177, 'si');
INSERT INTO `carga_masiva` VALUES (278, 1, 'F09010066', 'CONJUNTO DE FARO', 'ITALIKA', 'Eléctrico', 2, 288.45, 641.00, NULL, 178, 8, 178, 'si');
INSERT INTO `carga_masiva` VALUES (279, 1, 'F09010096', 'CONJUNTO FARO', 'ITALIKA', 'Eléctrico', 1, 533.70, 1261.00, NULL, 179, 8, 179, 'si');
INSERT INTO `carga_masiva` VALUES (280, 1, 'F09010107', 'CONJUNTO FARO', 'ITALIKA', 'Eléctrico', 1, 492.75, 1095.01, NULL, 180, 8, 180, 'si');
INSERT INTO `carga_masiva` VALUES (281, 1, 'F09010146', 'CONJUNTO FARO', 'ITALIKA', 'Eléctrico', 1, 576.90, 1282.00, NULL, 181, 8, 181, 'si');
INSERT INTO `carga_masiva` VALUES (282, 1, 'F09020058', 'DIRECCIONAL DEL DER', 'ITALIKA', 'Eléctrico', 7, 54.00, 137.00, NULL, 182, 8, 182, 'si');
INSERT INTO `carga_masiva` VALUES (283, 1, 'F09020071', 'DIRECCIONAL DEL IZQ', 'ITALIKA', 'Eléctrico', 8, 56.70, 144.00, NULL, 183, 8, 183, 'si');
INSERT INTO `carga_masiva` VALUES (284, 1, 'F09020084', 'REFLEJANTE LATERAL', 'ITALIKA', 'General', 8, 16.72, 24.00, NULL, 184, 6, 184, 'si');
INSERT INTO `carga_masiva` VALUES (285, 1, 'F09020086', 'DIRECCIONAL DERECHA DEL', 'ITALIKA', 'Eléctrico', 3, 80.55, 204.00, NULL, 185, 8, 185, 'si');
INSERT INTO `carga_masiva` VALUES (286, 1, 'F09020088', 'DIRECCIONAL IZQUIERDA DEL', 'ITALIKA', 'Eléctrico', 4, 76.50, 194.00, NULL, 186, 8, 186, 'si');
INSERT INTO `carga_masiva` VALUES (287, 1, 'F09020185', 'LED DIRECCIONAL TRAS IZQ', 'ITALIKA', 'Eléctrico', 5, 190.35, 423.01, NULL, 187, 8, 187, 'si');
INSERT INTO `carga_masiva` VALUES (288, 1, 'F09020187', 'LED DIRECCIONAL TRAS DER', 'ITALIKA', 'Eléctrico', 5, 190.35, 423.01, NULL, 188, 8, 188, 'si');
INSERT INTO `carga_masiva` VALUES (289, 1, 'F09020238', 'DIRECCIONAL LED DEL IZQ', 'ITALIKA', 'Eléctrico', 3, 281.70, 626.01, NULL, 189, 8, 189, 'si');
INSERT INTO `carga_masiva` VALUES (290, 1, 'F09020239', 'DIRECCIONAL LED DEL DER', 'ITALIKA', 'Eléctrico', 3, 281.70, 626.01, NULL, 190, 8, 190, 'si');
INSERT INTO `carga_masiva` VALUES (291, 1, 'F09020272', 'LAMPARA LED LATERAL IZQ', 'ITALIKA', 'Eléctrico', 1, 302.40, 778.00, NULL, 191, 8, 191, 'si');
INSERT INTO `carga_masiva` VALUES (292, 1, 'F09020318', 'LED DIRECCIONAL DEL IZQ', 'ITALIKA', 'Eléctrico', 2, 149.40, 349.00, NULL, 192, 8, 192, 'si');
INSERT INTO `carga_masiva` VALUES (293, 1, 'F09020328', 'DIRECCIONAL TRAS IZQ', 'ITALIKA', 'Eléctrico', 1, 103.95, 241.00, NULL, 193, 8, 193, 'si');
INSERT INTO `carga_masiva` VALUES (294, 1, 'F09020329', 'DIRECCIONAL TRAS DER', 'ITALIKA', 'Eléctrico', 1, 103.95, 241.00, NULL, 194, 8, 194, 'si');
INSERT INTO `carga_masiva` VALUES (295, 1, 'F09030036', 'CALAVERA TRASERA, SPORT', 'ITALIKA', 'Eléctrico', 2, 136.35, 304.00, NULL, 195, 8, 195, 'si');
INSERT INTO `carga_masiva` VALUES (296, 1, 'F09030048', 'CALAVERA DE LEDS', 'ITALIKA', 'Eléctrico', 1, 467.55, 1216.00, NULL, 196, 8, 196, 'si');
INSERT INTO `carga_masiva` VALUES (297, 1, 'F09040112', 'FOCO H4 18/18W (1 PZA)', 'ITALIKA', 'Eléctrico', 10, 20.25, 56.00, NULL, 197, 8, 197, 'si');
INSERT INTO `carga_masiva` VALUES (298, 1, 'F10010195', 'JUEGO ESPEJOS CON LOGO Y LEYENDA', 'ITALIKA', 'Colisión', 9, 67.50, 150.00, NULL, 198, 9, 198, 'si');
INSERT INTO `carga_masiva` VALUES (299, 1, 'F10010270', 'ESPEJO CROMADO DER CON LOGO', 'ITALIKA', 'Colisión', 1, 174.60, 388.00, NULL, 199, 9, 199, 'si');
INSERT INTO `carga_masiva` VALUES (300, 1, 'F10020005', 'PUÑO IZQ', 'ITALIKA', 'General', 10, 17.49, 38.00, NULL, 200, 6, 200, 'si');
INSERT INTO `carga_masiva` VALUES (301, 1, 'F10020011', 'PUÑO ACELERADOR', 'ITALIKA', 'General', 10, 18.02, 40.00, NULL, 201, 6, 201, 'si');
INSERT INTO `carga_masiva` VALUES (302, 1, 'F10020050', 'PUÑO ACELERADOR', 'ITALIKA', 'General', 8, 30.21, 58.00, NULL, 202, 6, 202, 'si');
INSERT INTO `carga_masiva` VALUES (303, 1, 'F10020079', 'PUÑO IZQ', 'ITALIKA', 'General', 4, 78.44, 148.00, NULL, 203, 6, 203, 'si');
INSERT INTO `carga_masiva` VALUES (304, 1, 'F10020087', 'PUÑO ACELERADOR', 'ITALIKA', 'General', 5, 34.98, 66.00, NULL, 204, 6, 204, 'si');
INSERT INTO `carga_masiva` VALUES (305, 1, 'F10020089', 'CONTRAPESO MANUBRIO', 'ITALIKA', 'General', 3, 53.00, 100.00, NULL, 205, 6, 205, 'si');
INSERT INTO `carga_masiva` VALUES (306, 1, 'F10020169', 'CONTRAPESO MANUBRIO', 'ITALIKA', 'Colisión', 4, 33.30, 69.99, NULL, 206, 9, 206, 'si');
INSERT INTO `carga_masiva` VALUES (307, 1, 'F10030012', 'PALANCA IZQUIERDA DE EMBRAGUE', 'ITALIKA', 'Palancas y Chicotes', 6, 66.15, 147.00, NULL, 207, 10, 207, 'si');
INSERT INTO `carga_masiva` VALUES (308, 1, 'F10030013', 'PALANCA DERECHA DE FRENO', 'ITALIKA', 'Palancas y Chicotes', 7, 70.20, 156.00, NULL, 208, 10, 208, 'si');
INSERT INTO `carga_masiva` VALUES (309, 1, 'F10030042', 'CONJUNTO PALANCA IZQUIERDA', 'ITALIKA', 'Palancas y Chicotes', 12, 111.60, 248.00, NULL, 209, 10, 209, 'si');
INSERT INTO `carga_masiva` VALUES (310, 1, 'F10030067', 'PALANCA DERECHA', 'ITALIKA', 'Palancas y Chicotes', 3, 60.75, 138.01, NULL, 210, 10, 210, 'si');
INSERT INTO `carga_masiva` VALUES (311, 1, 'F10030085', 'CONJUNTO DE PALANCA IZQUIERDA', 'ITALIKA', 'Palancas y Chicotes', 4, 99.45, 251.00, NULL, 211, 10, 211, 'si');
INSERT INTO `carga_masiva` VALUES (312, 1, 'F10030088', 'PALANCA DER FRENO DEL', 'ITALIKA', 'Palancas y Chicotes', 3, 162.90, 390.00, NULL, 212, 10, 212, 'si');
INSERT INTO `carga_masiva` VALUES (313, 1, 'F10030091', 'ENSAMBLE PALANCA IZQ', 'ITALIKA', 'Palancas y Chicotes', 6, 112.95, 251.00, NULL, 213, 10, 213, 'si');
INSERT INTO `carga_masiva` VALUES (314, 1, 'F10030094', 'CONJUNTO PALANCA DER', 'ITALIKA', 'Palancas y Chicotes', 7, 63.90, 156.00, NULL, 214, 10, 214, 'si');
INSERT INTO `carga_masiva` VALUES (315, 1, 'F10030095', 'CONJUNTO PALANCA IZQ', 'ITALIKA', 'Palancas y Chicotes', 6, 63.45, 155.00, NULL, 215, 10, 215, 'si');
INSERT INTO `carga_masiva` VALUES (316, 1, 'F10030096', 'ENS PALANCA IZQ EMBRAGUE', 'ITALIKA', 'Palancas y Chicotes', 5, 119.25, 265.00, NULL, 216, 10, 216, 'si');
INSERT INTO `carga_masiva` VALUES (317, 1, 'F10030099', 'CONJUNTO DE PALANCA IZQ', 'ITALIKA', 'Palancas y Chicotes', 5, 110.25, 245.00, NULL, 217, 10, 217, 'si');
INSERT INTO `carga_masiva` VALUES (318, 1, 'F10030110', 'PALANCA IZQ', 'ITALIKA', 'Palancas y Chicotes', 3, 66.15, 148.00, NULL, 218, 10, 218, 'si');
INSERT INTO `carga_masiva` VALUES (319, 1, 'F10030121', 'PALANCA FRENO IZQ', 'ITALIKA', 'Palancas y Chicotes', 11, 100.23, 226.00, NULL, 219, 10, 219, 'si');
INSERT INTO `carga_masiva` VALUES (320, 1, 'F10030129', 'CONJUNTO PALANCA IZQ', 'ITALIKA', 'Palancas y Chicotes', 4, 94.95, 211.00, NULL, 220, 10, 220, 'si');
INSERT INTO `carga_masiva` VALUES (321, 1, 'F10030133', 'ENS PALANCA IZQ EMBRAGUE', 'ITALIKA', 'Palancas y Chicotes', 8, 96.30, 253.00, NULL, 221, 10, 221, 'si');
INSERT INTO `carga_masiva` VALUES (322, 1, 'F10030136', 'PALANCA DER FRENO NEGRO', 'ITALIKA', 'Palancas y Chicotes', 7, 61.65, 137.00, NULL, 222, 10, 222, 'si');
INSERT INTO `carga_masiva` VALUES (323, 1, 'F10030150', 'PALANCA FRENO DER', 'ITALIKA', 'Partes de Motor', 6, 90.00, 220.01, NULL, 223, 5, 223, 'si');
INSERT INTO `carga_masiva` VALUES (324, 1, 'F10030162', 'CONJUNTO PALANCA IZQ', 'ITALIKA', 'Palancas y Chicotes', 4, 100.35, 258.00, NULL, 224, 10, 224, 'si');
INSERT INTO `carga_masiva` VALUES (325, 1, 'F10030173', 'PALANCA FRENO DER', 'ITALIKA', 'Palancas y Chicotes', 4, 102.15, 227.00, NULL, 225, 10, 225, 'si');
INSERT INTO `carga_masiva` VALUES (326, 1, 'F10030178', 'PALANCA DER FRENO', 'ITALIKA', 'Palancas y Chicotes', 6, 132.30, 294.00, NULL, 226, 10, 226, 'si');
INSERT INTO `carga_masiva` VALUES (327, 1, 'F10030189', 'PALANCA FRENO DER', 'ITALIKA', 'Palancas y Chicotes', 1, 67.05, 135.00, NULL, 227, 10, 227, 'si');
INSERT INTO `carga_masiva` VALUES (328, 1, 'F10040084', 'MANUBRIO', 'ITALIKA', 'Colisión', 2, 216.90, 566.00, NULL, 228, 9, 228, 'si');
INSERT INTO `carga_masiva` VALUES (329, 1, 'F10040098', 'MANUBRIO', 'ITALIKA', 'Colisión', 1, 250.65, 557.00, NULL, 229, 9, 229, 'si');
INSERT INTO `carga_masiva` VALUES (330, 1, 'F10040264', 'MANUBRIO', 'ITALIKA', 'Colisión', 1, 296.10, 730.00, NULL, 230, 9, 230, 'si');
INSERT INTO `carga_masiva` VALUES (331, 1, 'F11010026', 'BARRA DE POSAPIES', 'ITALIKA', 'General', 4, 125.61, 266.00, NULL, 231, 6, 231, 'si');
INSERT INTO `carga_masiva` VALUES (332, 1, 'F11010135', 'BASE DERECHA DE POSAPIES', 'ITALIKA', 'General', 1, 459.51, 1018.00, NULL, 232, 6, 232, 'si');
INSERT INTO `carga_masiva` VALUES (333, 1, 'F11010152', 'GOMA POSAPIE', 'ITALIKA', 'Colisión', 12, 28.80, 64.00, NULL, 233, 9, 233, 'si');
INSERT INTO `carga_masiva` VALUES (334, 1, 'F11010256', 'BASE POSAPIE TRA DER', 'ITALIKA', 'General', 8, 113.42, 214.00, NULL, 234, 6, 234, 'si');
INSERT INTO `carga_masiva` VALUES (335, 1, 'F11010257', 'BASE POSAPIE TRAS IZQ', 'ITALIKA', 'General', 8, 104.41, 197.00, NULL, 235, 6, 235, 'si');
INSERT INTO `carga_masiva` VALUES (336, 1, 'F11010258', 'BARRA POSAPIES', 'ITALIKA', 'General', 5, 175.96, 332.00, NULL, 236, 6, 236, 'si');
INSERT INTO `carga_masiva` VALUES (337, 1, 'F11010260', 'POSAPIE TRAS DER', 'ITALIKA', 'General', 8, 64.96, 142.00, NULL, 237, 6, 237, 'si');
INSERT INTO `carga_masiva` VALUES (338, 1, 'F11010261', 'POSAPIE TRAS IZQ', 'ITALIKA', 'General', 8, 64.96, 142.00, NULL, 238, 6, 238, 'si');
INSERT INTO `carga_masiva` VALUES (339, 1, 'F11010424', 'BARRA POSAPIES', 'ITALIKA', 'Colisión', 4, 200.25, 445.00, NULL, 239, 9, 239, 'si');
INSERT INTO `carga_masiva` VALUES (340, 1, 'F11020039', 'PARADOR CENTRAL', 'ITALIKA', 'General', 4, 144.16, 320.00, NULL, 240, 6, 240, 'si');
INSERT INTO `carga_masiva` VALUES (341, 1, 'F11020090', 'GOMA TOPE PARADOR CENTRAL', 'ITALIKA', 'Colisión', 20, 11.25, 25.00, NULL, 241, 9, 241, 'si');
INSERT INTO `carga_masiva` VALUES (342, 1, 'F11020180', 'RESORTE PARADOR CENTRAL', 'ITALIKA', 'General', 11, 10.07, 17.01, NULL, 242, 6, 242, 'si');
INSERT INTO `carga_masiva` VALUES (343, 1, 'F11030016', 'PEDAL DE CAMBIOS', 'ITALIKA', 'Palancas y Chicotes', 9, 66.60, 148.00, NULL, 243, 10, 243, 'si');
INSERT INTO `carga_masiva` VALUES (344, 1, 'F11030028', 'RESORTE DE PEDAL DE FRENO', 'ITALIKA', 'General', 10, 7.95, 15.00, NULL, 244, 6, 244, 'si');
INSERT INTO `carga_masiva` VALUES (345, 1, 'F11030034', 'PEDAL DE ARRANQUE CROMADO', 'ITALIKA', 'Palancas y Chicotes', 4, 120.60, 295.00, NULL, 245, 10, 245, 'si');
INSERT INTO `carga_masiva` VALUES (346, 1, 'F11030052', 'SWITCH FRENO TRASERO', 'ITALIKA', 'General', 20, 15.37, 32.00, NULL, 246, 6, 246, 'si');
INSERT INTO `carga_masiva` VALUES (347, 1, 'F11030061', 'JUEGO VARILLA FRENO TRASERO', 'ITALIKA', 'General', 9, 27.04, 51.01, NULL, 247, 6, 247, 'si');
INSERT INTO `carga_masiva` VALUES (348, 1, 'F11030067', 'PEDAL DE CAMBIOS', 'ITALIKA', 'Palancas y Chicotes', 6, 65.25, 159.00, NULL, 248, 10, 248, 'si');
INSERT INTO `carga_masiva` VALUES (349, 1, 'F11030120', 'PEDAL DE ARRANQUE SPORT', 'ITALIKA', 'Palancas y Chicotes', 3, 123.75, 313.00, NULL, 249, 10, 249, 'si');
INSERT INTO `carga_masiva` VALUES (350, 1, 'F11030138', 'PEDAL DE CAMBIOS', 'ITALIKA', 'Palancas y Chicotes', 4, 105.30, 226.00, NULL, 250, 10, 250, 'si');
INSERT INTO `carga_masiva` VALUES (351, 1, 'F11030190', 'VARILLA FRENO TRAS', 'ITALIKA', 'General', 6, 86.92, 146.00, NULL, 251, 6, 251, 'si');
INSERT INTO `carga_masiva` VALUES (352, 1, 'F11031022', 'VARILLA FRENO', 'ITALIKA', 'General', 6, 38.16, 67.00, NULL, 252, 6, 252, 'si');
INSERT INTO `carga_masiva` VALUES (353, 1, 'F11031024', 'VARILLA FRENO TRAS', 'ITALIKA', 'General', 5, 37.63, 71.00, NULL, 253, 6, 253, 'si');
INSERT INTO `carga_masiva` VALUES (354, 1, 'F11031027', 'PEDAL ARRANQUE', 'ITALIKA', 'Palancas y Chicotes', 4, 172.35, 383.00, NULL, 254, 10, 254, 'si');
INSERT INTO `carga_masiva` VALUES (355, 1, 'F12010116', 'CUBIERTA SUPERIOR PARACHOQUE', 'ITALIKA', 'Colisión', 1, 297.45, 427.00, NULL, 255, 9, 255, 'si');
INSERT INTO `carga_masiva` VALUES (356, 1, 'F12010230', 'CUBIERTA IZQ INT TANQUE', 'ITALIKA', 'Colisión', 5, 19.80, 44.00, NULL, 256, 9, 256, 'si');
INSERT INTO `carga_masiva` VALUES (357, 1, 'F12010231', 'CUBIERTA DER INT TANQUE', 'ITALIKA', 'Colisión', 5, 19.80, 44.00, NULL, 257, 9, 257, 'si');
INSERT INTO `carga_masiva` VALUES (358, 1, 'F12010267', 'CUBIERTA LATERAL FARO DER', 'ITALIKA', 'Colisión', 2, 38.25, 85.00, NULL, 258, 9, 258, 'si');
INSERT INTO `carga_masiva` VALUES (359, 1, 'F12010268', 'CUBIERTA LATERAL FARO IZQ', 'ITALIKA', 'Colisión', 2, 38.25, 85.00, NULL, 259, 9, 259, 'si');
INSERT INTO `carga_masiva` VALUES (360, 1, 'F12010270', 'CUBIERTA CENTRAL', 'ITALIKA', 'Colisión', 5, 338.40, 665.00, NULL, 260, 9, 260, 'si');
INSERT INTO `carga_masiva` VALUES (361, 1, 'F12010282', 'CUBIERTA INFERIOR PARACHOQUE', 'ITALIKA', 'Colisión', 1, 132.75, 267.99, NULL, 261, 9, 261, 'si');
INSERT INTO `carga_masiva` VALUES (362, 1, 'F12010383', 'CUBIERTA FARO', 'ITALIKA', 'Colisión', 3, 112.95, 251.00, NULL, 262, 9, 262, 'si');
INSERT INTO `carga_masiva` VALUES (363, 1, 'F12010384', 'CUBIERTA TRAS FARO', 'ITALIKA', 'Colisión', 3, 171.90, 437.00, NULL, 263, 9, 263, 'si');
INSERT INTO `carga_masiva` VALUES (364, 1, 'F12010487', 'CUBIERTA FARO', 'ITALIKA', 'Colisión', 2, 118.80, 264.00, NULL, 264, 9, 264, 'si');
INSERT INTO `carga_masiva` VALUES (365, 1, 'F12010489', 'CUBIERTA FARO INT NEGRO', 'ITALIKA', 'Colisión', 3, 75.60, 168.00, NULL, 265, 9, 265, 'si');
INSERT INTO `carga_masiva` VALUES (366, 1, 'F12010671', 'CUBIERTA CENTRAL', 'ITALIKA', 'Colisión', 3, 294.75, 655.01, NULL, 266, 9, 266, 'si');
INSERT INTO `carga_masiva` VALUES (367, 1, 'F12010699', 'CUBIERTA VELOCIMETRO', 'ITALIKA', 'Colisión', 1, 78.75, 175.00, NULL, 267, 9, 267, 'si');
INSERT INTO `carga_masiva` VALUES (368, 1, 'F12010700', 'CUBIERTA FARO', 'ITALIKA', 'Colisión', 3, 97.65, 217.00, NULL, 268, 9, 268, 'si');
INSERT INTO `carga_masiva` VALUES (369, 1, 'F13010393', 'CUBIERTA IZQUIERDA FARO ROJA', 'ITALIKA', 'Colisión', 1, 44.55, 98.99, NULL, 269, 9, 269, 'si');
INSERT INTO `carga_masiva` VALUES (370, 1, 'F13010396', 'CUBIERTA DERECHA FARO ROJA', 'ITALIKA', 'Colisión', 1, 45.00, 100.00, NULL, 270, 9, 270, 'si');
INSERT INTO `carga_masiva` VALUES (371, 1, 'F13010405', 'PROTECTOR PUÑO IZQ', 'ITALIKA', 'Colisión', 6, 18.00, 46.01, NULL, 271, 9, 271, 'si');
INSERT INTO `carga_masiva` VALUES (372, 1, 'F13010406', 'PROTECTOR PUÑO DER', 'ITALIKA', 'Colisión', 6, 18.00, 45.00, NULL, 272, 9, 272, 'si');
INSERT INTO `carga_masiva` VALUES (373, 1, 'F13011398', 'CUBIERTA DER AZUL BLANCO', 'ITALIKA', 'Colisión', 3, 220.50, 490.00, NULL, 273, 9, 273, 'si');
INSERT INTO `carga_masiva` VALUES (374, 1, 'F13011400', 'CUBIERTA FARO AZUL', 'ITALIKA', 'Colisión', 2, 265.05, 586.00, NULL, 274, 9, 274, 'si');
INSERT INTO `carga_masiva` VALUES (375, 1, 'F13011887', 'CUBIERTA FARO IZQ AMARILLO', 'ITALIKA', 'Colisión', 4, 46.35, 103.00, NULL, 275, 9, 275, 'si');
INSERT INTO `carga_masiva` VALUES (376, 1, 'F13011888', 'CUBIERTA FARO DER AMARILLO', 'ITALIKA', 'Colisión', 4, 46.35, 103.00, NULL, 276, 9, 276, 'si');
INSERT INTO `carga_masiva` VALUES (377, 1, 'F13011889', 'CUBIERTA FARO FRONTAL', 'ITALIKA', 'Colisión', 4, 28.80, 64.00, NULL, 277, 9, 277, 'si');
INSERT INTO `carga_masiva` VALUES (378, 1, 'F13011915', 'CUBIERTA POSAPIE DER NEGRO', 'ITALIKA', 'Colisión', 1, 108.00, 276.00, NULL, 278, 9, 278, 'si');
INSERT INTO `carga_masiva` VALUES (379, 1, 'F13012213', 'CUBIERTA DER NEGRO', 'ITALIKA', 'Colisión', 1, 149.85, 333.00, NULL, 279, 9, 279, 'si');
INSERT INTO `carga_masiva` VALUES (380, 1, 'F13012214', 'CUBIERTA IZQ NEGRO', 'ITALIKA', 'Colisión', 1, 149.85, 333.00, NULL, 280, 9, 280, 'si');
INSERT INTO `carga_masiva` VALUES (381, 1, 'F13012215', 'CUBIERTA FR MANUBRIO AZUL CELESTE', 'ITALIKA', 'Colisión', 1, 431.10, 978.00, NULL, 281, 9, 281, 'si');
INSERT INTO `carga_masiva` VALUES (382, 1, 'F13012251', 'CUBIERTA MANUBRIO FR AZUL PERLADO', 'ITALIKA', 'Colisión', 3, 258.75, 638.00, NULL, 282, 9, 282, 'si');
INSERT INTO `carga_masiva` VALUES (383, 1, 'F13012306', 'ENCARENADO AZUL', 'ITALIKA', 'Colisión', 1, 1498.05, 3329.00, NULL, 283, 9, 283, 'si');
INSERT INTO `carga_masiva` VALUES (384, 1, 'F13012309', 'CUBIERTA GUANTERA AZUL', 'ITALIKA', 'Colisión', 1, 1246.50, 2770.00, NULL, 284, 9, 284, 'si');
INSERT INTO `carga_masiva` VALUES (385, 1, 'F13012358', 'CUBIERTA LAT IZQ GRIS NEGRO', 'ITALIKA', 'Colisión', 2, 242.10, 557.00, NULL, 285, 9, 285, 'si');
INSERT INTO `carga_masiva` VALUES (386, 1, 'F13012359', 'CUBIERTA LAT DER GRIS NEGRO', 'ITALIKA', 'Colisión', 2, 242.10, 557.00, NULL, 286, 9, 286, 'si');
INSERT INTO `carga_masiva` VALUES (387, 1, 'F13012378', 'CUBIERTA COLA IZQ ROJO NEGRO', 'ITALIKA', 'Colisión', 3, 319.05, 822.00, NULL, 287, 9, 287, 'si');
INSERT INTO `carga_masiva` VALUES (388, 1, 'F13012379', 'CUBIERTA COLA DER ROJO NEGRO', 'ITALIKA', 'Colisión', 3, 376.20, 954.00, NULL, 288, 9, 288, 'si');
INSERT INTO `carga_masiva` VALUES (389, 1, 'F13012380', 'CUBIERTA CALAVERA ROJO', 'ITALIKA', 'Colisión', 1, 132.30, 294.00, NULL, 289, 9, 289, 'si');
INSERT INTO `carga_masiva` VALUES (390, 1, 'F13012385', 'CUBIERTA TANQUE IZQ ROJO NEGRO', 'ITALIKA', 'Colisión', 3, 317.70, 818.00, NULL, 290, 9, 290, 'si');
INSERT INTO `carga_masiva` VALUES (391, 1, 'F13012479', 'CUBIERTA DER AZUL', 'ITALIKA', 'Colisión', 1, 197.10, 498.00, NULL, 291, 9, 291, 'si');
INSERT INTO `carga_masiva` VALUES (392, 1, 'F13012578', 'CUBIERTA TANQUE IZQ GRIS', 'ITALIKA', 'Colisión', 1, 290.70, 734.00, NULL, 292, 9, 292, 'si');
INSERT INTO `carga_masiva` VALUES (393, 1, 'F13012579', 'CUBIERTA TANQUE DER GRIS', 'ITALIKA', 'Colisión', 1, 290.70, 734.00, NULL, 293, 9, 293, 'si');
INSERT INTO `carga_masiva` VALUES (394, 1, 'F13012581', 'CUBIERTA PROTECTOR PUÑO IZQ AZUL', 'ITALIKA', 'Colisión', 1, 128.25, 324.00, NULL, 294, 9, 294, 'si');
INSERT INTO `carga_masiva` VALUES (395, 1, 'F13012582', 'CUBIERTA PROTECTOR PUÑO DER AZUL', 'ITALIKA', 'Colisión', 1, 128.25, 324.00, NULL, 295, 9, 295, 'si');
INSERT INTO `carga_masiva` VALUES (396, 1, 'F13012599', 'CUBIERTA TRAS IZQ NEGRO GRANITO VERDE', 'ITALIKA', 'Colisión', 1, 227.70, 573.01, NULL, 296, 9, 296, 'si');
INSERT INTO `carga_masiva` VALUES (397, 1, 'F14010156', 'CAMARA 80/100-21', 'ITALIKA', 'Cámaras', 3, 57.78, 109.01, NULL, 297, 12, 297, 'si');
INSERT INTO `carga_masiva` VALUES (398, 1, 'F14010161', 'LLANTA CITY ROAD 3.50-10 (TT)', 'ITALIKA', 'Llantas', 4, 321.90, 628.00, NULL, 298, 13, 298, 'si');
INSERT INTO `carga_masiva` VALUES (399, 1, 'F14010213', 'LLANTA DEL CITY CROSS PIRELLI 2.75-17', 'ITALIKA', 'Especiales 10', 14, 999.00, 1110.00, NULL, 299, 14, 299, 'si');
INSERT INTO `carga_masiva` VALUES (400, 1, 'F14020052', 'DISCO DE FRENO ABS', 'ITALIKA', 'Palancas y Chicotes', 2, 237.60, 528.00, NULL, 300, 10, 300, 'si');
INSERT INTO `carga_masiva` VALUES (401, 1, 'F14020060', 'FRENO DELANTERO', 'ITALIKA', 'Palancas y Chicotes', 1, 345.60, 768.00, NULL, 301, 10, 301, 'si');
INSERT INTO `carga_masiva` VALUES (402, 1, 'F14020129', 'MANGUERA FRENO DELANTERO', 'ITALIKA', 'General', 4, 134.09, 255.00, NULL, 302, 6, 302, 'si');
INSERT INTO `carga_masiva` VALUES (403, 1, 'F14020143', 'ENSAMBLE FRENO DEL DER', 'ITALIKA', 'Palancas y Chicotes', 3, 617.85, 1373.00, NULL, 303, 10, 303, 'si');
INSERT INTO `carga_masiva` VALUES (404, 1, 'F14020144', 'ENSAMBLE FRENO DEL IZQ', 'ITALIKA', 'Palancas y Chicotes', 1, 617.85, 1373.00, NULL, 304, 10, 304, 'si');
INSERT INTO `carga_masiva` VALUES (405, 1, 'F14020276', 'BALATAS FRENO DEL', 'ITALIKA', 'Balatas y zapatas', 12, 31.50, 72.00, NULL, 305, 15, 305, 'si');
INSERT INTO `carga_masiva` VALUES (406, 1, 'F14020277', 'ZAPATAS FRENO DEL', 'ITALIKA', 'Balatas y zapatas', 8, 45.50, 91.00, NULL, 306, 15, 306, 'si');
INSERT INTO `carga_masiva` VALUES (407, 1, 'F14020297', 'BALATAS FRENO DEL', 'ITALIKA', 'Balatas y zapatas', 10, 39.00, 78.00, NULL, 307, 15, 307, 'si');
INSERT INTO `carga_masiva` VALUES (408, 1, 'F14020446', 'BALATAS FRENO DEL', 'ITALIKA', 'Sin Descuento', 2, 58.82, 69.53, NULL, 308, 4, 308, 'si');
INSERT INTO `carga_masiva` VALUES (409, 1, 'F14020449', 'DISCO FRENO DEL', 'ITALIKA', 'Palancas y Chicotes', 3, 296.55, 748.00, NULL, 309, 10, 309, 'si');
INSERT INTO `carga_masiva` VALUES (410, 1, 'F14020451', 'BALATAS FRENO DEL', 'ITALIKA', 'Balatas y zapatas', 21, 50.50, 114.00, NULL, 310, 15, 310, 'si');
INSERT INTO `carga_masiva` VALUES (411, 1, 'F14020528', 'CALIPER FRENO DEL NEGRO CON LOGO', 'ITALIKA', 'Sin Descuento', 5, 473.29, 473.29, NULL, 311, 4, 311, 'si');
INSERT INTO `carga_masiva` VALUES (412, 1, 'F14030011', 'RAYO EXTERNO RUEDA DEL', 'ITALIKA', 'General', 65, 3.18, 9.00, NULL, 312, 6, 312, 'si');
INSERT INTO `carga_masiva` VALUES (413, 1, 'F14030251', 'RAYO EXT RUEDA DEL 3.2X181', 'ITALIKA', 'Colisión', 54, 3.60, 8.00, NULL, 313, 9, 313, 'si');
INSERT INTO `carga_masiva` VALUES (414, 1, 'F14030252', 'RAYO INT RUEDA DEL 3.2X181', 'ITALIKA', 'Colisión', 72, 3.60, 8.00, NULL, 314, 9, 314, 'si');
INSERT INTO `carga_masiva` VALUES (415, 1, 'F14030253', 'ARO RIN DEL 17X1.60', 'ITALIKA', 'Colisión', 3, 426.15, 947.00, NULL, 315, 9, 315, 'si');
INSERT INTO `carga_masiva` VALUES (416, 1, 'F14030260', 'RIN DEL ROJO 17X1.4', 'ITALIKA', 'Colisión', 3, 1431.45, 3181.00, NULL, 316, 9, 316, 'si');
INSERT INTO `carga_masiva` VALUES (417, 1, 'F14030300', 'ARO RIN DEL NEGRO 1.4X17', 'ITALIKA', 'Colisión', 1, 352.35, 854.00, NULL, 317, 9, 317, 'si');
INSERT INTO `carga_masiva` VALUES (418, 1, 'F14040016', 'COLLAR INTERNO PLATO TRACCIÓN', 'ITALIKA', 'General', 19, 15.90, 34.00, NULL, 318, 6, 318, 'si');
INSERT INTO `carga_masiva` VALUES (419, 1, 'F14040018', 'EJE DE LA RUEDA DELANTERA', 'ITALIKA', 'General', 3, 32.33, 61.00, NULL, 319, 6, 319, 'si');
INSERT INTO `carga_masiva` VALUES (420, 1, 'F14040020', 'BALERO RADIAL BOLA,6301', 'ITALIKA', 'Partes de Motor', 30, 34.65, 77.00, NULL, 320, 5, 320, 'si');
INSERT INTO `carga_masiva` VALUES (421, 1, 'F14040114', 'BALERO 6202-2RS', 'ITALIKA', 'Partes de Motor', 20, 43.20, 96.00, NULL, 321, 5, 321, 'si');
INSERT INTO `carga_masiva` VALUES (422, 1, 'F14040184', 'BALERO 6302-2RS', 'ITALIKA', 'Sin Descuento', 41, 25.68, 25.68, NULL, 322, 4, 322, 'si');
INSERT INTO `carga_masiva` VALUES (423, 1, 'F15010104', 'LLANTA 110/80-18', 'ITALIKA', 'Sin Descuento', 3, 554.91, 610.40, NULL, 323, 4, 323, 'si');
INSERT INTO `carga_masiva` VALUES (424, 1, 'F15010121', 'CAMARA 4.10-18', 'ITALIKA', 'Cámaras', 15, 76.85, 145.00, NULL, 324, 12, 324, 'si');
INSERT INTO `carga_masiva` VALUES (425, 1, 'F15010124', 'CAMARA 3.00-17', 'ITALIKA', 'Cámaras', 50, 42.93, 89.00, NULL, 325, 12, 325, 'si');
INSERT INTO `carga_masiva` VALUES (426, 1, 'F15010126', 'CAMARA 120/80-18', 'ITALIKA', 'Cámaras', 12, 62.54, 130.00, NULL, 326, 12, 326, 'si');
INSERT INTO `carga_masiva` VALUES (427, 1, 'F15010150', 'LLANTA S 90/90-17', 'ITALIKA', 'Sin Descuento', 6, 407.50, 448.25, NULL, 327, 4, 327, 'si');
INSERT INTO `carga_masiva` VALUES (428, 1, 'F15010176', 'LLANTA TRAS CITY CROSS PIRELLI 3.00-17', 'ITALIKA', 'Especiales 10', 14, 1206.89, 1340.99, NULL, 328, 14, 328, 'si');
INSERT INTO `carga_masiva` VALUES (429, 1, 'F15010203', 'LLANTA CITY ROAD 130/90 - 15', 'ITALIKA', 'Sin Descuento', 5, 559.24, 632.91, NULL, 329, 4, 329, 'si');
INSERT INTO `carga_masiva` VALUES (430, 1, 'F15010206', 'LLANTA CITY ROAD 110/80-17', 'ITALIKA', 'Llantas', 2, 582.90, 1137.00, NULL, 330, 13, 330, 'si');
INSERT INTO `carga_masiva` VALUES (431, 1, 'F15010212', 'LLANTA CITY ROAD 130/90 – 10', 'ITALIKA', 'Llantas', 5, 560.28, 966.00, NULL, 331, 13, 331, 'si');
INSERT INTO `carga_masiva` VALUES (432, 1, 'F15020028', 'FRENO TRASERO', 'ITALIKA', 'Palancas y Chicotes', 4, 349.20, 776.01, NULL, 332, 10, 332, 'si');
INSERT INTO `carga_masiva` VALUES (433, 1, 'F15020030', 'ZAPATAS DE FRENO TRASERO', 'ITALIKA', 'Balatas y zapatas', 20, 41.00, 95.00, NULL, 333, 15, 333, 'si');
INSERT INTO `carga_masiva` VALUES (434, 1, 'F15020072', 'JUEGO ZAPATAS FRENO TRAS', 'ITALIKA', 'Balatas y zapatas', 60, 41.50, 97.00, NULL, 334, 15, 334, 'si');
INSERT INTO `carga_masiva` VALUES (435, 1, 'F15020081', 'FRENO TRASERO NEGRO', 'ITALIKA', 'Palancas y Chicotes', 2, 294.30, 750.00, NULL, 335, 10, 335, 'si');
INSERT INTO `carga_masiva` VALUES (436, 1, 'F15020106', 'BOMBA DE FRENO TRASERO', 'ITALIKA', 'Palancas y Chicotes', 1, 443.58, 802.00, NULL, 336, 10, 336, 'si');
INSERT INTO `carga_masiva` VALUES (437, 1, 'F15020163', 'BALATAS FRENO TRAS', 'ITALIKA', 'Sin Descuento', 10, 174.17, 197.88, NULL, 337, 4, 337, 'si');
INSERT INTO `carga_masiva` VALUES (438, 1, 'F15020180', 'BALATAS FRENO TRAS', 'ITALIKA', 'Balatas y zapatas', 6, 35.50, 71.00, NULL, 338, 15, 338, 'si');
INSERT INTO `carga_masiva` VALUES (439, 1, 'F15020181', 'ZAPATAS FRENO TRAS', 'ITALIKA', 'Balatas y zapatas', 10, 51.00, 118.00, NULL, 339, 15, 339, 'si');
INSERT INTO `carga_masiva` VALUES (440, 1, 'F15020182', 'ZAPATAS FRENO TRAS', 'ITALIKA', 'Balatas y zapatas', 25, 47.50, 95.00, NULL, 340, 15, 340, 'si');
INSERT INTO `carga_masiva` VALUES (441, 1, 'F15020186', 'ZAPATAS FRENO TRAS', 'ITALIKA', 'Balatas y zapatas', 30, 66.00, 132.00, NULL, 341, 15, 341, 'si');
INSERT INTO `carga_masiva` VALUES (442, 1, 'F15020189', 'BALATAS FRENO TRAS', 'ITALIKA', 'Sin Descuento', 7, 92.12, 104.64, NULL, 342, 4, 342, 'si');
INSERT INTO `carga_masiva` VALUES (443, 1, 'F15020207', 'BALATAS FRENO', 'ITALIKA', 'Sin Descuento', 14, 392.46, 392.46, NULL, 343, 4, 343, 'si');
INSERT INTO `carga_masiva` VALUES (444, 1, 'F15020273', 'ZAPATA FRENO TRAS', 'ITALIKA', 'Sin Descuento', 9, 131.17, 131.17, NULL, 344, 4, 344, 'si');
INSERT INTO `carga_masiva` VALUES (445, 1, 'F15020276', 'ENSAMBLE BOMBA FRENO TRAS', 'ITALIKA', 'Palancas y Chicotes', 1, 522.00, 1316.99, NULL, 345, 10, 345, 'si');
INSERT INTO `carga_masiva` VALUES (446, 1, 'F15020313', 'BRAZO ACCIONADOR BOMBA FRENO', 'ITALIKA', 'Partes de Motor', 6, 92.25, 205.00, NULL, 346, 5, 346, 'si');
INSERT INTO `carga_masiva` VALUES (447, 1, 'F15030033', 'RIN TRASERO ALUMINIO', 'ITALIKA', 'Colisión', 1, 1134.00, 2520.00, NULL, 347, 9, 347, 'si');
INSERT INTO `carga_masiva` VALUES (448, 1, 'F15030237', 'ARO RIN TRAS 17X1.60', 'ITALIKA', 'Colisión', 2, 378.45, 886.00, NULL, 348, 9, 348, 'si');
INSERT INTO `carga_masiva` VALUES (449, 1, 'F15030238', 'RAYO INT RUEDA TRAS 3.8X150', 'ITALIKA', 'Colisión', 108, 3.15, 8.00, NULL, 349, 9, 349, 'si');
INSERT INTO `carga_masiva` VALUES (450, 1, 'F15030244', 'RIN TRAS ROJO 17X1.85', 'ITALIKA', 'Colisión', 1, 1644.75, 3655.00, NULL, 350, 9, 350, 'si');
INSERT INTO `carga_masiva` VALUES (451, 1, 'F15040006', 'EJE RUEDA TRAS', 'ITALIKA', 'General', 5, 34.44, 64.99, NULL, 351, 6, 351, 'si');
INSERT INTO `carga_masiva` VALUES (452, 1, 'F15040024', 'EJE DE LA RUEDA TRASERA', 'ITALIKA', 'General', 5, 56.71, 107.00, NULL, 352, 6, 352, 'si');
INSERT INTO `carga_masiva` VALUES (453, 1, 'F15040037', 'ESPACIADOR IZQ EJE TRASERO', 'ITALIKA', 'General', 20, 21.20, 40.00, NULL, 353, 6, 353, 'si');
INSERT INTO `carga_masiva` VALUES (454, 1, 'F15040131', 'BALERO 6206-RZ', 'ITALIKA', 'Partes de Motor', 7, 100.80, 224.00, NULL, 354, 5, 354, 'si');
INSERT INTO `carga_masiva` VALUES (455, 1, 'F15040134', 'FLECHA EJE TRASERO', 'ITALIKA', 'General', 2, 1094.45, 2065.00, NULL, 355, 6, 355, 'si');
INSERT INTO `carga_masiva` VALUES (456, 1, 'F15040166', 'FLECHA EJE TRAS', 'ITALIKA', 'General', 1, 1594.24, 3008.00, NULL, 356, 6, 356, 'si');
INSERT INTO `carga_masiva` VALUES (457, 1, 'F15040191', 'EJE RUEDA TRAS M15X260', 'ITALIKA', 'General', 7, 66.25, 125.00, NULL, 357, 6, 357, 'si');
INSERT INTO `carga_masiva` VALUES (458, 1, 'F15040228', 'BUJE EJE TRAS 152X34X27', 'ITALIKA', 'General', 4, 161.65, 305.00, NULL, 358, 6, 358, 'si');
INSERT INTO `carga_masiva` VALUES (459, 1, 'F15040273', 'BUJE MAZA RUEDA TRAS 24X9.3X20.5', 'ITALIKA', 'Colisión', 100, 17.55, 43.00, NULL, 359, 9, 359, 'si');
INSERT INTO `carga_masiva` VALUES (460, 1, 'F15060007', 'EJE RUEDA TRAS M12X225', 'ITALIKA', 'General', 3, 33.39, 63.00, NULL, 360, 6, 360, 'si');
INSERT INTO `carga_masiva` VALUES (461, 1, 'F16010063', 'LODERA DEL', 'ITALIKA', 'Colisión', 5, 4.95, 11.99, NULL, 361, 9, 361, 'si');
INSERT INTO `carga_masiva` VALUES (462, 1, 'F16010083', 'LODERA', 'ITALIKA', 'Colisión', 5, 18.00, 46.01, NULL, 362, 9, 362, 'si');
INSERT INTO `carga_masiva` VALUES (463, 1, 'F16010099', 'SALPICADERA DELANT/ROJO/.', 'ITALIKA', 'Colisión', 2, 239.85, 533.00, NULL, 363, 9, 363, 'si');
INSERT INTO `carga_masiva` VALUES (464, 1, 'F16010116', 'SALPICADERA TRAS NEGRA SPORT', 'ITALIKA', 'Colisión', 3, 302.40, 672.00, NULL, 364, 9, 364, 'si');
INSERT INTO `carga_masiva` VALUES (465, 1, 'F16010241', 'SALPICADERA DEL AZUL BLANCO', 'ITALIKA', 'Colisión', 3, 402.30, 615.99, NULL, 365, 9, 365, 'si');
INSERT INTO `carga_masiva` VALUES (466, 1, 'F16010305', 'SALPICADERA DEL GRIS', 'ITALIKA', 'Colisión', 2, 261.00, 649.99, NULL, 366, 9, 366, 'si');
INSERT INTO `carga_masiva` VALUES (467, 1, 'F16010330', 'SALPICADERA DEL BLANCO', 'ITALIKA', 'Colisión', 2, 331.20, 736.00, NULL, 367, 9, 367, 'si');
INSERT INTO `carga_masiva` VALUES (468, 1, 'F16010343', 'SALPICADERA DEL NEGRO AMARILLO', 'ITALIKA', 'Colisión', 1, 330.30, 760.00, NULL, 368, 9, 368, 'si');
INSERT INTO `carga_masiva` VALUES (469, 1, 'F16020170', 'CUBIERTA SALPICADERA TRAS', 'ITALIKA', 'Colisión', 2, 117.45, 282.00, NULL, 369, 9, 369, 'si');
INSERT INTO `carga_masiva` VALUES (470, 1, 'F16020172', 'SALPICADERA TRAS', 'ITALIKA', 'Colisión', 2, 195.30, 422.00, NULL, 370, 9, 370, 'si');
INSERT INTO `carga_masiva` VALUES (471, 1, 'F16020201', 'SALPICADERA TRAS', 'ITALIKA', 'Colisión', 3, 125.10, 305.00, NULL, 371, 9, 371, 'si');
INSERT INTO `carga_masiva` VALUES (472, 1, 'F16030007', 'BASE SALPICADERA DELANTERA', 'ITALIKA', 'Colisión', 6, 50.40, 127.99, NULL, 372, 9, 372, 'si');
INSERT INTO `carga_masiva` VALUES (473, 1, 'F17010202', 'TANQUE COMBUSTIBLE BLANCO FL', 'ITALIKA', 'Colisión', 1, 1728.90, 3842.00, NULL, 373, 9, 373, 'si');
INSERT INTO `carga_masiva` VALUES (474, 1, 'F17010219', 'TANQUE COMBUSTIBLE NEGRO', 'ITALIKA', 'Colisión', 3, 2172.15, 4827.00, NULL, 374, 9, 374, 'si');
INSERT INTO `carga_masiva` VALUES (475, 1, 'F17010220', 'TAPON TANQUE COMBUSTIBLE', 'ITALIKA', 'Colisión', 3, 96.30, 214.00, NULL, 375, 9, 375, 'si');
INSERT INTO `carga_masiva` VALUES (476, 1, 'F17020004', 'LLAVE COMBUSTIBLE', 'ITALIKA', 'General', 7, 72.61, 156.00, NULL, 376, 6, 376, 'si');
INSERT INTO `carga_masiva` VALUES (477, 1, 'F17020005', 'LLAVE DE GASOLINA', 'ITALIKA', 'General', 6, 76.32, 164.00, NULL, 377, 6, 377, 'si');
INSERT INTO `carga_masiva` VALUES (478, 1, 'F17020067', 'DEPOSITO DE GASOLINA', 'ITALIKA', 'Colisión', 7, 53.55, 119.00, NULL, 378, 9, 378, 'si');
INSERT INTO `carga_masiva` VALUES (479, 1, 'F17030017', 'SENSOR COMBUSTIBLE', 'ITALIKA', 'General', 5, 72.61, 137.00, NULL, 379, 6, 379, 'si');
INSERT INTO `carga_masiva` VALUES (480, 1, 'F17030050', 'SENSOR COMBUSTIBLE', 'ITALIKA', 'General', 4, 76.32, 144.00, NULL, 380, 6, 380, 'si');
INSERT INTO `carga_masiva` VALUES (481, 1, 'F17030066', 'SENSOR COMBUSTIBLE', 'ITALIKA', 'Eléctrico', 5, 65.25, 156.99, NULL, 381, 8, 381, 'si');
INSERT INTO `carga_masiva` VALUES (482, 1, 'F17030087', 'SENSOR NIVEL COMBUSTIBLE', 'ITALIKA', 'Eléctrico', 3, 88.20, 196.01, NULL, 382, 8, 382, 'si');
INSERT INTO `carga_masiva` VALUES (483, 1, 'F17040157', 'PROTECTOR TANQUE', 'ITALIKA', 'Colisión', 1, 148.95, 330.99, NULL, 383, 9, 383, 'si');
INSERT INTO `carga_masiva` VALUES (484, 1, 'L01010006', 'ACEITE 4 TIEMPOS SAE 20W50 SL', 'ITALIKA', 'Aceite SL', 6, 1760.02, 1900.00, NULL, 384, 16, 384, 'si');

-- ----------------------------
-- Table structure for categorias
-- ----------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias`  (
  `cve_categoria` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de categorias',
  `cve_empresa` int NULL DEFAULT NULL COMMENT 'Identificador del catálogo de empresas',
  `categoria` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Descripción de la categoria',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_categoria`) USING BTREE,
  INDEX `fk_empresas_categorias`(`cve_empresa` ASC) USING BTREE,
  CONSTRAINT `fk_empresas_categorias` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Catálogo de categorías de productos' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categorias
-- ----------------------------
INSERT INTO `categorias` VALUES (1, 1, 'SERVICIOS', '2022-06-01 18:17:26', 'VIG');
INSERT INTO `categorias` VALUES (2, 1, 'REFACCIONES', '2022-06-01 18:17:26', 'VIG');
INSERT INTO `categorias` VALUES (3, 1, 'ACCESORIOS 2021 A', '2022-06-01 18:18:40', 'VIG');
INSERT INTO `categorias` VALUES (4, 1, 'SIN DESCUENTO', '2022-06-01 18:21:25', 'VIG');
INSERT INTO `categorias` VALUES (5, 1, 'PARTES DE MOTOR', '2022-06-01 18:21:25', 'VIG');
INSERT INTO `categorias` VALUES (6, 1, 'GENERAL', '2022-06-01 18:21:25', 'VIG');
INSERT INTO `categorias` VALUES (7, 1, 'BUJÍAS', '2022-06-01 18:21:25', 'VIG');
INSERT INTO `categorias` VALUES (8, 1, 'ELÉCTRICO', '2022-06-01 18:21:25', 'VIG');
INSERT INTO `categorias` VALUES (9, 1, 'COLISIÓN', '2022-06-01 18:21:25', 'VIG');
INSERT INTO `categorias` VALUES (10, 1, 'PALANCAS Y CHICOTES', '2022-06-01 18:21:25', 'VIG');
INSERT INTO `categorias` VALUES (11, 1, 'BATERÍAS', '2022-06-01 18:21:25', 'VIG');
INSERT INTO `categorias` VALUES (12, 1, 'CÁMARAS', '2022-06-01 18:21:25', 'VIG');
INSERT INTO `categorias` VALUES (13, 1, 'LLANTAS', '2022-06-01 18:21:25', 'VIG');
INSERT INTO `categorias` VALUES (14, 1, 'ESPECIALES 10', '2022-06-01 18:21:25', 'VIG');
INSERT INTO `categorias` VALUES (15, 1, 'BALATAS Y ZAPATAS', '2022-06-01 18:21:25', 'VIG');
INSERT INTO `categorias` VALUES (16, 1, 'ACEITE SL', '2022-06-01 18:21:25', 'VIG');
INSERT INTO `categorias` VALUES (17, 1, 'REFRESCOS', '2022-06-03 18:14:05', 'VIG');

-- ----------------------------
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes`  (
  `cve_cliente` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de clientes',
  `cve_empresa` int NOT NULL COMMENT 'Identificador del catálogo de empresas',
  `cliente` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nombre o razón social del cliente',
  `tipo_cliente` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'F' COMMENT 'Tipo de cliente: M = Moral o F= Física',
  `rfc_cliente` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'RFC del cliente',
  `direccion_cliente` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Dirección fiscal del cliente',
  `correo_cliente` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Correo electrónico del cliente',
  `celular_cliente` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Número de celular del cliente',
  `descuento_autorizado` int NULL DEFAULT NULL COMMENT 'Porcentaje de descuento autorizado',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  `curp_cliente` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `factura` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`cve_cliente`) USING BTREE,
  INDEX `fk_empresa_cliente`(`cve_empresa` ASC) USING BTREE,
  CONSTRAINT `fk_empresa_cliente` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Catálogo de clientes' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO `clientes` VALUES (1, 1, 'VENTAS AL MOSTRADOR', 'F', NULL, NULL, NULL, NULL, NULL, '2022-06-01 18:57:21', 'VIG', NULL, NULL);

-- ----------------------------
-- Table structure for cortes_cajas
-- ----------------------------
DROP TABLE IF EXISTS `cortes_cajas`;
CREATE TABLE `cortes_cajas`  (
  `cve_corte_caja` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador del corte de caja',
  `codigo_corte_caja` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Código que identifica al corte de caja',
  `cve_caja` int NOT NULL COMMENT 'Identificador del catálogo de caja',
  `fecha_inicio` timestamp NULL DEFAULT NULL COMMENT 'Fecha y hora de inicio del corte de caja',
  `fecha_cierre` timestamp NULL DEFAULT NULL COMMENT 'Fecha y hora de cierre del corte de caja',
  `monto_inicial` decimal(11, 2) NULL DEFAULT NULL COMMENT 'Monto inicial de efectivo',
  `estatus_corte_caja` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Estatus del corte de caja: ABIERTO, CERRADO',
  `usuario_alta` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Clave de usuario que da de alta el registro',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  `contado` decimal(11, 2) NULL DEFAULT NULL,
  `calculado` decimal(11, 2) NULL DEFAULT NULL,
  `diferencia` decimal(11, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`cve_corte_caja`) USING BTREE,
  INDEX `fk_caja_cortes_cajas`(`cve_caja` ASC) USING BTREE,
  CONSTRAINT `fk_caja_cortes_cajas` FOREIGN KEY (`cve_caja`) REFERENCES `cajas` (`cve_caja`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Almacena los cortes de caja' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cortes_cajas
-- ----------------------------
INSERT INTO `cortes_cajas` VALUES (1, 'BE7ECDC4-3692-471E-B55D-668720048C65', 1, '2022-06-01 14:06:45', '2022-06-06 14:12:40', NULL, 'CERRADO', '12', '2022-06-01 19:06:45', 'VIG', 465435.21, 465435.21, 0.00);
INSERT INTO `cortes_cajas` VALUES (2, '780EF872-9206-4714-818A-1D21F307141F', 2, '2022-06-03 13:40:48', NULL, NULL, 'ABIERTO', '5', '2022-06-03 18:40:48', 'VIG', NULL, NULL, NULL);
INSERT INTO `cortes_cajas` VALUES (3, '52E7BF37-030C-441B-BB65-38497917278B', 1, '2022-06-06 14:13:02', '2022-06-06 14:34:02', NULL, 'CERRADO', '39', '2022-06-06 19:13:02', 'VIG', 2021.50, 2021.50, 0.00);
INSERT INTO `cortes_cajas` VALUES (4, '6DB71999-27EE-4F25-A9E0-F59A660A2C56', 1, '2022-06-06 14:34:51', NULL, NULL, 'ABIERTO', '39', '2022-06-06 19:34:51', 'VIG', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for debug
-- ----------------------------
DROP TABLE IF EXISTS `debug`;
CREATE TABLE `debug`  (
  `variable` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `valor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of debug
-- ----------------------------
INSERT INTO `debug` VALUES ('vcve_empresa', NULL);
INSERT INTO `debug` VALUES ('vcve_sucursal', NULL);
INSERT INTO `debug` VALUES ('vcve_empresa', '1');
INSERT INTO `debug` VALUES ('vcve_sucursal', '1');

-- ----------------------------
-- Table structure for devoluciones
-- ----------------------------
DROP TABLE IF EXISTS `devoluciones`;
CREATE TABLE `devoluciones`  (
  `cve_devolucion` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cve_principal` int NULL DEFAULT NULL,
  `cve_detalle` int NULL DEFAULT NULL,
  `tipo_devolucion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`cve_devolucion`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of devoluciones
-- ----------------------------

-- ----------------------------
-- Table structure for empresas
-- ----------------------------
DROP TABLE IF EXISTS `empresas`;
CREATE TABLE `empresas`  (
  `cve_empresa` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de empresas',
  `empresa` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nombre o razón social de la empresa',
  `rfc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'RFC de la empresa',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'URL o dirección de la página web',
  `logotipo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'URL del logotipo de la empresa',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_empresa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Catálogo de empresas' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of empresas
-- ----------------------------
INSERT INTO `empresas` VALUES (1, 'VICENTE RAFAEL CASILLAS DIEGO', 'CADV860531R41\r', '', NULL, '2022-03-08 14:44:52', 'VIG');
INSERT INTO `empresas` VALUES (2, 'EMPRESA DOS PARA VALIDAR LA DIFERENCIA DE INFORMACION', 'EED120606GG5', 'miempresa.com', NULL, '2022-03-08 15:57:43', 'VIG');

-- ----------------------------
-- Table structure for entradas
-- ----------------------------
DROP TABLE IF EXISTS `entradas`;
CREATE TABLE `entradas`  (
  `cve_entrada` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro de entrada de material',
  `cve_sucursal` int NOT NULL COMMENT 'Identificador del catálogo de sucursales',
  `cve_proveedor` int NULL DEFAULT NULL COMMENT 'Identificador del catálogo de proveedores',
  `cve_traspaso_sucursal` int NULL DEFAULT NULL COMMENT 'Identificador del registro de traspasos de material',
  `fecha_entrada` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de entrada del material',
  `tipo_entrada` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Tipo de entrada: COMPRA,TRASPASO,NOTA CREDITO',
  `comprobante_entrada` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Comprobante del documento que da origen a la entrada',
  `estatus_entrada` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'CAPTURA' COMMENT 'Indica el estatus de la entrada: CAPTURA, APLICADA, CANCELADA',
  `usuario_alta` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Clave de usuario que da de alta el registro',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_entrada`) USING BTREE,
  INDEX `fk_sucursal_entrada`(`cve_sucursal` ASC) USING BTREE,
  INDEX `fk_proveedor_entrada`(`cve_proveedor` ASC) USING BTREE,
  CONSTRAINT `fk_proveedor_entrada` FOREIGN KEY (`cve_proveedor`) REFERENCES `proveedores` (`cve_proveedor`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sucursal_entrada` FOREIGN KEY (`cve_sucursal`) REFERENCES `sucursales` (`cve_sucursal`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Almacena las entradas de material' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of entradas
-- ----------------------------
INSERT INTO `entradas` VALUES (1, 1, NULL, NULL, '2022-06-01 18:19:32', 'INVENTARIO INICIAL', NULL, 'CAPTURA', '1', '2022-06-01 18:19:32', 'VIG');
INSERT INTO `entradas` VALUES (2, 1, 1, NULL, '2022-06-03 18:49:38', 'COMPRA', '1', 'APLICADA', NULL, '2022-06-03 18:49:38', 'VIG');
INSERT INTO `entradas` VALUES (3, 1, 1, NULL, '2022-06-03 18:51:01', 'COMPRA', '2', 'APLICADA', NULL, '2022-06-03 18:51:01', 'VIG');

-- ----------------------------
-- Table structure for entradas_productos
-- ----------------------------
DROP TABLE IF EXISTS `entradas_productos`;
CREATE TABLE `entradas_productos`  (
  `cve_entrada_producto` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador del detalle de entrada de material',
  `cve_entrada` int NOT NULL COMMENT 'Identificador del registro de entrada de material',
  `cve_producto` int NOT NULL COMMENT 'Identificador del catálogo de productos',
  `producto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `codigo_barra` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fecha_entrada` timestamp NOT NULL DEFAULT current_timestamp COMMENT 'Fecha de alta del registro',
  `cantidad_entrada` int NULL DEFAULT NULL COMMENT 'Cantidad de material que entra',
  `cve_unidad_medida` int NOT NULL COMMENT 'Unidad de medida del material: PIEZA, LITRO, METRO',
  `unidad_medida_entrada` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  `precio_entrada` decimal(11, 2) NULL DEFAULT NULL COMMENT 'Precio de compra del material',
  `precio_entrada_neto` decimal(11, 2) NULL DEFAULT NULL,
  `precio_normal` decimal(11, 2) NULL DEFAULT NULL,
  `precio_normal_neto` decimal(11, 2) NULL DEFAULT NULL,
  `importe_normal` decimal(11, 2) NULL DEFAULT NULL,
  `importe_normal_neto` decimal(11, 2) NULL DEFAULT NULL,
  `importe_entrada` decimal(11, 2) NULL DEFAULT NULL,
  `impuesto_total` decimal(11, 2) NULL DEFAULT NULL,
  `desc_porcentaje` decimal(11, 2) NULL DEFAULT NULL,
  `desc_total` decimal(11, 2) NULL DEFAULT NULL,
  `importe_entrada_neto` decimal(11, 2) NULL DEFAULT NULL,
  `subtotal_compra` decimal(11, 2) NULL DEFAULT NULL,
  `factor` decimal(11, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`cve_entrada_producto`) USING BTREE,
  INDEX `fk_producto_entrada`(`cve_producto` ASC) USING BTREE,
  INDEX `fk_entrada_entrada_producto`(`cve_entrada` ASC) USING BTREE,
  INDEX `fk_unidad_entrada`(`cve_unidad_medida` ASC) USING BTREE,
  CONSTRAINT `fk_entrada_entrada_producto` FOREIGN KEY (`cve_entrada`) REFERENCES `entradas` (`cve_entrada`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_producto_entrada` FOREIGN KEY (`cve_producto`) REFERENCES `productos` (`cve_producto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_unidad_entrada` FOREIGN KEY (`cve_unidad_medida`) REFERENCES `unidades` (`cve_unidad`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Almacena el detalle de las entradas de material' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of entradas_productos
-- ----------------------------
INSERT INTO `entradas_productos` VALUES (1, 2, 1, 'CAJA ITK 26L', 'A22001000002', '2022-06-03 18:49:38', 3, 1, 'PZA', '2022-06-03 18:49:38', 'VIG', 517.00, 517.00, 517.00, 517.00, NULL, 1551.00, 1799.16, 248.16, 0.00, 0.00, 1551.00, 1799.16, 1.00);
INSERT INTO `entradas_productos` VALUES (2, 3, 428, 'AGUA PURIFICADA', '096619334346', '2022-06-03 18:51:01', 3, 2, 'CAJA', '2022-06-03 18:51:01', 'VIG', 3.00, 60.00, 3.00, 60.00, NULL, 180.00, 155.17, 24.83, 0.00, 0.00, 180.00, 180.00, 20.00);

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for impuestos
-- ----------------------------
DROP TABLE IF EXISTS `impuestos`;
CREATE TABLE `impuestos`  (
  `cve_impuesto` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de impuestos',
  `cve_empresa` int NULL DEFAULT NULL COMMENT 'Clave del catálogo de empresas',
  `impuesto` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Descripcion, código o nombre del impuesto',
  `tasa` decimal(11, 4) NOT NULL COMMENT 'Tasa aplica del impuesto',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_impuesto`) USING BTREE,
  INDEX `fk_empresa_impuestos`(`cve_empresa` ASC) USING BTREE,
  CONSTRAINT `fk_empresa_impuestos` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Catálogos de impuestos' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of impuestos
-- ----------------------------
INSERT INTO `impuestos` VALUES (1, 1, 'IVA', 0.1600, '2022-03-08 15:45:19', 'VIG');
INSERT INTO `impuestos` VALUES (2, 1, 'IEPS', 0.0736, '2022-03-19 22:17:51', 'VIG');
INSERT INTO `impuestos` VALUES (3, 1, 'ISR', 0.1000, '2022-03-19 22:17:51', 'VIG');

-- ----------------------------
-- Table structure for listas_catalogos
-- ----------------------------
DROP TABLE IF EXISTS `listas_catalogos`;
CREATE TABLE `listas_catalogos`  (
  `cve_lista_catalogo` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la lista de catálogos',
  `cve_empresa` int NOT NULL COMMENT 'Identificador del catálogo de empresas',
  `catalogo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nombre o descripción del catálogo',
  `valores_catalogo` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Valores de los catálogos',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_lista_catalogo`) USING BTREE,
  INDEX `fk_empresa_catalogos`(`cve_empresa` ASC) USING BTREE,
  CONSTRAINT `fk_empresa_catalogo` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Contiene los valores de las listas de catálogos' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of listas_catalogos
-- ----------------------------
INSERT INTO `listas_catalogos` VALUES (1, 1, 'tipo_cliente1', '[{\"id\":\"FÍSICA\",\"value\":\"FÍSICA\"},{\"id\":\"MORAL\",\"value\":\"MORAL\"}]', '2022-03-08 16:30:23', 'NVI');
INSERT INTO `listas_catalogos` VALUES (2, 1, 'estatus_registro', '[{\"id\":\"VIG\",\"value\":\"VIGENTE\"},{\"id\":\"NVG\",\"value\":\"NO VIGENTE\"}]', '2022-03-08 16:31:28', 'VIG');
INSERT INTO `listas_catalogos` VALUES (3, 1, 'estatus_corte_caja', '[{\"id\":\"ABIERTO\",\"value\":\"ABIERTO\"},{\"id\":\"CERRADO\",\"value\":\"CERRADO\"}]', '2022-03-08 16:32:20', 'VIG');
INSERT INTO `listas_catalogos` VALUES (4, 1, 'tipo_entrada', '[{\"id\":\"COMPRA\",\"value\":\"COMPRA\"},{\"id\":\"TRASPASO\",\"value\":\"TRASPASO\"},{\"id\":\"NOTACREDITO\",\"value\":\"NOTA CREDITO\"}]', '2022-03-08 16:33:24', 'VIG');
INSERT INTO `listas_catalogos` VALUES (5, 1, 'estatus_entrada', '[{\"id\":\"CAPTURA\",\"value\":\"CAPTURA\"},{\"id\":\"APLICADA\",\"value\":\"APLICADA\"},{\"id\":\"CANCELADA\",\"value\":\"CANCELADA\"}]', '2022-03-08 16:35:50', 'VIG');
INSERT INTO `listas_catalogos` VALUES (6, 1, 'unidad_medida', '[{\"id\":\"METRO\",\"value\": \"METRO\"},{\"id\":\"LITRO\",\"value\":\"LITRO\"},{\"id\": \"PIEZA\",\"value\": \"PIEZA\"}]', '2022-03-08 16:36:47', 'VIG');
INSERT INTO `listas_catalogos` VALUES (11, 1, 'tipo_menu', '{\"MENÚ\":\"MENÚ\",\"SUBMENÚ\":\"SUBMENÚ\",\"OPCION\":\"OPCION\"}', '2022-03-08 16:40:09', 'VIG');
INSERT INTO `listas_catalogos` VALUES (12, 1, 'medio_movimiento', '{\"EFECTIVO\":\"EFECTIVO\",\"CHEQUES\":\"CHEQUES\",\"VALES\":\"VALES\",\"NOTACREDITO\":\"NOTACREDITO\"}', '2022-03-08 16:44:19', 'VIG');
INSERT INTO `listas_catalogos` VALUES (13, 1, 'tipo_movimiento', '[{\"id\":\"ENTRADA\",\"value\":\"ENTRADA\"},{\"id\":\"SALIDA\",\"value\":\"SALIDA\"}]', '2022-03-08 16:45:13', 'VIG');
INSERT INTO `listas_catalogos` VALUES (14, 1, 'estatus_traspaso', '{\"CAPTURADO\":\"CAPTURADO\",\"ENVIADO\":\"ENVIADO\",\"RECIBIDO\":\"RECIBIDO\",\"CANCELADO\":\"CANCELADO\"}', '2022-03-08 16:46:49', 'VIG');
INSERT INTO `listas_catalogos` VALUES (15, 1, 'tipo_venta', '[{\"id\":\"NORMAL\",\"value\":\"NORMAL\"},{\"id\":\"SERVICIO\",\"value\":\"SERVICIO\"},{\"id\":\"GARANTÍA\",\"value\":\"GARANTÍA\"}]', '2022-03-08 16:48:14', 'VIG');
INSERT INTO `listas_catalogos` VALUES (17, 1, 'tipo_comprobante', '[{\"id\":\"TICKET\",\"value\":\"TICKET\"},{\"id\":\"FACTURA\",\"value\":\"FACTURA\"}]', '2022-03-08 16:49:04', 'VIG');
INSERT INTO `listas_catalogos` VALUES (18, 1, 'estatus_venta', '{\"ENCAPTURA\":\"ENCAPTURA\",\"PORPAGAR\":\"PORPAGAR\",\"PAGADA\":\"PAGADA\",\"ENTREGADA\":\"ENTREGADA\",\"FACTURAR\":\"FACTURAR\",\"CERRADA\":\"CERRADA\",\"CANCELADA\":\"CANCELADA\"}', '2022-03-08 18:36:10', 'VIG');
INSERT INTO `listas_catalogos` VALUES (19, 1, 'estatus_venta_detalle', '{\"CAPTURADO\":\"CAPTURADO\",\"CANCELADO\":\"CANCELADO\",\"DEVUELTO\":\"DEVUELTO\"}', '2022-03-08 18:41:27', 'VIG');
INSERT INTO `listas_catalogos` VALUES (20, 1, 'medio_pago', '[{\"id\":\"EF\",\"value\":\"EFECTIVO\"},{\"id\":\"TA\",\"value\":\"TARJETA\"},{\"id\":\"VA\",\"value\":\"VALE\"},{\"id\":\"CH\",\"value\":\"CHEQUE\"},{\"id\":\"TR\",\"value\":\"TRANSFERENCIA\"}]', '2022-03-08 18:44:49', 'VIG');
INSERT INTO `listas_catalogos` VALUES (21, 1, 'ventas_config', '{\"tipo_venta\":\"NORMAL\",\"documento\":\"TICKET\",\"imprimir\":1,\"cliente\":{\"cve_cliente\":1,\"cve_empresa\":1,\"cliente\":\"VENTAS EN MOSTRADOR\",\"descuento_autorizado\":0}}', '2022-03-24 08:46:23', 'VIG');
INSERT INTO `listas_catalogos` VALUES (22, 1, 'tipo_persona', '[{\"id\":\"F\",\"value\":\"FÍSICA\"},{\"id\":\"M\",\"value\":\"MORAL\"}]', '2022-03-24 08:51:57', 'VIG');

-- ----------------------------
-- Table structure for mano_obra
-- ----------------------------
DROP TABLE IF EXISTS `mano_obra`;
CREATE TABLE `mano_obra`  (
  `cve_mano_obra` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de mano de obra',
  `cve_empresa` int NOT NULL COMMENT 'Identificador del catálogo de empresas',
  `mano_obra` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nombre de la mano de obra',
  `desc_mano_obra` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Descripción de la mano de obra',
  `duracion` decimal(11, 2) NULL DEFAULT NULL COMMENT 'Duración en horas de la mano de obra',
  `costo_mano_obra` decimal(11, 2) NULL DEFAULT NULL COMMENT 'Costo o precio de la mano de obra',
  `porcentaje_tecnico` int NULL DEFAULT NULL COMMENT 'Porcentaje que se le paga al técnico que realiza la mano de obra',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_mano_obra`) USING BTREE,
  INDEX `fk_empresa_mano_obra`(`cve_empresa` ASC) USING BTREE,
  CONSTRAINT `fk_empresa_mano_obra` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Catálogo de mano de obra' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mano_obra
-- ----------------------------

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus`  (
  `cve_menu` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de menús',
  `cve_empresa` int NULL DEFAULT NULL COMMENT 'Identificador del catálogo de empresas',
  `menu` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nombre del menú',
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'javascript:void(0);' COMMENT 'URL del menú',
  `orden` int NOT NULL COMMENT 'Orden en que se presenta el menú',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  `cve_menu_padre` int NULL DEFAULT NULL,
  `icono` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cve_menu`) USING BTREE,
  INDEX `fk_empresa_menus`(`cve_empresa` ASC) USING BTREE,
  INDEX `menus_FK`(`cve_menu_padre` ASC) USING BTREE,
  CONSTRAINT `fk_empresa_menus` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `menus_FK` FOREIGN KEY (`cve_menu_padre`) REFERENCES `menus` (`cve_menu`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Almacena los menú del sistema' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES (1, 1, 'Operaciones', 'javascript:void(0);', 1, '2022-04-07 21:56:13', 'VIG', NULL, 'fas fa-users-cog');
INSERT INTO `menus` VALUES (2, 1, 'Consultas', 'javascript:void(0);', 2, '2022-04-07 21:58:25', 'VIG', NULL, 'fas fa-search');
INSERT INTO `menus` VALUES (3, 1, 'Procesos', 'javascript:void(0);', 3, '2022-04-07 21:58:25', 'VIG', NULL, 'fas fa-cogs');
INSERT INTO `menus` VALUES (4, 1, 'Reportes', 'javascript:void(0);', 4, '2022-04-07 21:58:25', 'VIG', NULL, 'fas fa-clipboard-list');
INSERT INTO `menus` VALUES (5, 1, 'Estadisticas', 'javascript:void(0);', 5, '2022-04-07 21:59:20', 'VIG', NULL, 'fas fa-chart-pie');
INSERT INTO `menus` VALUES (6, 1, 'Configuraciones', 'javascript:void(0);', 6, '2022-04-07 21:59:20', 'VIG', NULL, 'fas fa-cog');
INSERT INTO `menus` VALUES (7, 1, 'Ventas', '/operaciones/ventas', 1, '2022-04-07 21:59:20', 'VIG', 1, NULL);
INSERT INTO `menus` VALUES (8, 1, 'Compras', '/operaciones/compras', 2, '2022-04-07 21:59:20', 'VIG', 1, NULL);
INSERT INTO `menus` VALUES (9, 1, 'Corte Caja', '/operaciones/cortes-caja', 3, '2022-04-07 21:59:20', 'VIG', 1, NULL);
INSERT INTO `menus` VALUES (10, 1, 'Productos', '/operaciones/productos', 4, '2022-04-07 21:59:20', 'VIG', 1, NULL);
INSERT INTO `menus` VALUES (11, 1, 'Clientes', '/operaciones/clientes', 5, '2022-04-07 21:59:20', 'VIG', 1, NULL);
INSERT INTO `menus` VALUES (12, 1, 'Proveedores', '/operaciones/proveedores', 6, '2022-04-07 21:59:20', 'VIG', 1, NULL);
INSERT INTO `menus` VALUES (13, 1, 'Ventas', '/consultas/ventas', 1, '2022-04-07 21:59:20', 'VIG', 2, NULL);
INSERT INTO `menus` VALUES (14, 1, 'Compras', '/consultas/compras', 2, '2022-04-07 21:59:20', 'VIG', 2, NULL);
INSERT INTO `menus` VALUES (15, 1, 'Corte Caja', '/consultas/corte-caja', 3, '2022-04-07 21:59:20', 'VIG', 2, NULL);
INSERT INTO `menus` VALUES (16, 1, 'Productos', '/consultas/productos', 4, '2022-04-07 21:59:20', 'VIG', 2, NULL);
INSERT INTO `menus` VALUES (17, 1, 'Clientes', '/consultas/clientes', 5, '2022-04-07 21:59:20', 'VIG', 2, NULL);
INSERT INTO `menus` VALUES (18, 1, 'Proveedores', '/consultas/proveedores', 6, '2022-04-07 21:59:20', 'VIG', 2, NULL);
INSERT INTO `menus` VALUES (19, 1, 'Ventas', '/reportes/ventas', 1, '2022-04-07 21:59:20', 'VIG', 3, NULL);
INSERT INTO `menus` VALUES (20, 1, 'Devoluciones', '/reportes/devoluciones', 2, '2022-04-07 21:59:20', 'VIG', 3, NULL);
INSERT INTO `menus` VALUES (21, 1, 'Utilidad', '/reportes/utilidades', 3, '2022-04-07 21:59:20', 'VIG', 3, NULL);
INSERT INTO `menus` VALUES (22, 1, 'Compras', '/reportes/compras', 4, '2022-04-07 21:59:20', 'VIG', 3, NULL);
INSERT INTO `menus` VALUES (23, 1, 'Movimientos Caja', '/reportes/movimiento-caja', 5, '2022-04-07 21:59:20', 'VIG', 3, NULL);
INSERT INTO `menus` VALUES (24, 1, 'Corte de Caja', 'reportes/corte-caja', 6, '2022-04-07 21:59:20', 'VIG', 3, NULL);
INSERT INTO `menus` VALUES (25, 1, 'Devoluciones', 'operaciones/devoluciones', 7, '2022-05-02 23:09:37', 'VIG', 1, NULL);
INSERT INTO `menus` VALUES (26, 1, 'Servicios', '/consultas/tecnico', 0, '2022-06-01 20:59:55', 'VIG', 2, 'fa-regular fa-screwdriver-wrench');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- ----------------------------
-- Table structure for movimientos
-- ----------------------------
DROP TABLE IF EXISTS `movimientos`;
CREATE TABLE `movimientos`  (
  `cve_movimiento` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador del movimiento de caja durante un corte',
  `cve_corte_caja` int NULL DEFAULT NULL COMMENT 'Identificador del corte de caja',
  `tipo_movimiento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Tipo de movimiento: ENTRADA, SALIDA',
  `fecha_movimiento` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha y hora en que se realiza el movimiento',
  `importe_movimiento` decimal(11, 2) NOT NULL COMMENT 'Importe del movimiento',
  `descripcion_movimiento` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Descripción u observación asociada al movimiento',
  `medio_movimiento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Medio del movimiento: EFECTIVO, CHEQUES, VALES, NOTA CREDITO',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  `cve_caja` int NULL DEFAULT NULL,
  `cve_venta` int NULL DEFAULT NULL,
  `tipo_tarjeta` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Si el pago es con tajeta se indica el tipo de tarjeta: CREDITO, DEBITO',
  PRIMARY KEY (`cve_movimiento`) USING BTREE,
  INDEX `fk_corte_caja_movimientos`(`cve_corte_caja` ASC) USING BTREE,
  INDEX `fk_movimiento_caja`(`cve_caja` ASC) USING BTREE,
  INDEX `fk_movimiento_venta`(`cve_venta` ASC) USING BTREE,
  CONSTRAINT `fk_corte_caja_movimientos` FOREIGN KEY (`cve_corte_caja`) REFERENCES `cortes_cajas` (`cve_corte_caja`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_movimiento_caja` FOREIGN KEY (`cve_caja`) REFERENCES `cajas` (`cve_caja`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_movimiento_venta` FOREIGN KEY (`cve_venta`) REFERENCES `ventas` (`cve_venta`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Registra los movimientos de valores durante un corte de caja' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of movimientos
-- ----------------------------
INSERT INTO `movimientos` VALUES (1, 1, 'ENTRADA', '2022-06-01 19:07:11', 687.00, NULL, 'EF', '2022-06-01 19:07:11', 'VIG', 1, 1, NULL);
INSERT INTO `movimientos` VALUES (2, 1, 'ENTRADA', '2022-06-03 00:39:31', 462815.91, NULL, 'EF', '2022-06-03 00:39:31', 'VIG', 1, 3, NULL);
INSERT INTO `movimientos` VALUES (3, 1, 'ENTRADA', '2022-06-03 00:41:30', 1474.15, NULL, 'EF', '2022-06-03 00:41:30', 'VIG', 1, 4, NULL);
INSERT INTO `movimientos` VALUES (4, 1, 'ENTRADA', '2022-06-03 00:47:51', 65.45, NULL, 'EF', '2022-06-03 00:47:51', 'VIG', 1, 5, NULL);
INSERT INTO `movimientos` VALUES (5, 1, 'ENTRADA', '2022-06-03 00:48:36', 65.45, NULL, 'EF', '2022-06-03 00:48:36', 'VIG', 1, 6, NULL);
INSERT INTO `movimientos` VALUES (6, 1, 'ENTRADA', '2022-06-03 00:51:40', 65.45, NULL, 'EF', '2022-06-03 00:51:40', 'VIG', 1, 7, NULL);
INSERT INTO `movimientos` VALUES (7, 1, 'ENTRADA', '2022-06-03 00:55:20', 65.45, NULL, 'EF', '2022-06-03 00:55:20', 'VIG', 1, 8, NULL);
INSERT INTO `movimientos` VALUES (8, 1, 'ENTRADA', '2022-06-03 01:03:08', 65.45, NULL, 'EF', '2022-06-03 01:03:08', 'VIG', 1, 9, NULL);
INSERT INTO `movimientos` VALUES (9, 1, 'ENTRADA', '2022-06-03 01:04:23', 65.45, NULL, 'EF', '2022-06-03 01:04:23', 'VIG', 1, 10, NULL);
INSERT INTO `movimientos` VALUES (10, 1, 'ENTRADA', '2022-06-03 01:07:57', 65.45, NULL, 'EF', '2022-06-03 01:07:57', 'VIG', 1, 11, NULL);
INSERT INTO `movimientos` VALUES (11, 2, 'ENTRADA', '2022-06-03 18:41:01', 57.00, NULL, 'EF', '2022-06-03 18:41:01', 'VIG', 2, 12, NULL);
INSERT INTO `movimientos` VALUES (12, 2, 'ENTRADA', '2022-06-03 18:51:45', 45.00, NULL, 'EF', '2022-06-03 18:51:45', 'VIG', 2, 13, NULL);
INSERT INTO `movimientos` VALUES (13, 2, 'ENTRADA', '2022-06-03 18:55:31', 775.50, NULL, 'EF', '2022-06-03 18:55:31', 'VIG', 2, 14, NULL);
INSERT INTO `movimientos` VALUES (14, 2, 'ENTRADA', '2022-06-03 18:59:46', 109.00, NULL, 'EF', '2022-06-03 18:59:46', 'VIG', 2, 15, NULL);
INSERT INTO `movimientos` VALUES (15, 2, 'ENTRADA', '2022-06-03 19:01:26', 775.50, NULL, 'EF', '2022-06-03 19:01:26', 'VIG', 2, 16, NULL);
INSERT INTO `movimientos` VALUES (16, 2, 'ENTRADA', '2022-06-03 19:04:32', 12326.88, '12344', 'TA', '2022-06-03 19:04:32', 'VIG', 2, 17, 'DEBITO');
INSERT INTO `movimientos` VALUES (17, 2, 'ENTRADA', '2022-06-06 18:40:41', 149.00, NULL, 'EF', '2022-06-06 18:40:41', 'VIG', 2, 18, NULL);
INSERT INTO `movimientos` VALUES (18, 2, 'ENTRADA', '2022-06-06 18:48:38', 775.50, NULL, 'EF', '2022-06-06 18:48:38', 'VIG', 2, 19, NULL);
INSERT INTO `movimientos` VALUES (19, 3, 'ENTRADA', '2022-06-06 19:13:25', 500.00, 'caja chica', 'EF', '2022-06-06 19:13:25', 'VIG', 1, NULL, NULL);
INSERT INTO `movimientos` VALUES (20, 3, 'ENTRADA', '2022-06-06 19:14:26', 385.00, '25142525', 'TA', '2022-06-06 19:14:26', 'VIG', 1, 20, 'DEBITO');
INSERT INTO `movimientos` VALUES (21, 3, 'ENTRADA', '2022-06-06 19:22:53', 131.00, NULL, 'EF', '2022-06-06 19:22:53', 'VIG', 1, 21, NULL);
INSERT INTO `movimientos` VALUES (22, 3, 'ENTRADA', '2022-06-06 19:26:59', 100.00, NULL, 'EF', '2022-06-06 19:26:59', 'VIG', 1, 22, NULL);
INSERT INTO `movimientos` VALUES (23, 3, 'ENTRADA', '2022-06-06 19:26:59', 130.00, '123', 'TA', '2022-06-06 19:26:59', 'VIG', 1, 22, 'DEBITO');
INSERT INTO `movimientos` VALUES (24, 3, 'ENTRADA', '2022-06-06 19:30:43', 775.50, NULL, 'EF', '2022-06-06 19:30:43', 'VIG', 1, 23, NULL);
INSERT INTO `movimientos` VALUES (25, 4, 'ENTRADA', '2022-06-06 19:35:07', 109.00, NULL, 'EF', '2022-06-06 19:35:07', 'VIG', 1, 25, NULL);

-- ----------------------------
-- Table structure for notas_credito
-- ----------------------------
DROP TABLE IF EXISTS `notas_credito`;
CREATE TABLE `notas_credito`  (
  `cve_nota_credito` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la nota de venta',
  `cve_venta` int NULL DEFAULT NULL COMMENT 'Identificador del registro de venta',
  `folio_ticket` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Número o folio del ticket de venta',
  `motivo_nota_credito` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Descripción del motivo que origina la nota de venta',
  `fecha_nota_credito` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha y hora en que se registra la nota de venta',
  `usuario_alta` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Clave de usuario que da de alta el registro',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_nota_credito`) USING BTREE,
  INDEX `fk_venta_nota_credito`(`cve_venta` ASC) USING BTREE,
  CONSTRAINT `fk_venta_nota_credito` FOREIGN KEY (`cve_venta`) REFERENCES `ventas` (`cve_venta`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Registro de las notas de venta' ROW_FORMAT = DYNAMIC;

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
  INDEX `password_resets_email_index`(`email` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token` ASC) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type` ASC, `tokenable_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
INSERT INTO `personal_access_tokens` VALUES (1, 'App\\Models\\User', 1, 'auth_token', 'baa3fd11c82643abc286de33b7584b68927e1dda4c44e5a3e286e19ca49b93e1', '[\"*\"]', NULL, '2022-04-03 16:32:37', '2022-04-03 16:32:37');
INSERT INTO `personal_access_tokens` VALUES (2, 'App\\Models\\User', 1, 'auth_token', 'e5850cdf6f08659357e9aa68dd34c37d5864ef6b5f6bef9e96489a1ed37adeb0', '[\"*\"]', NULL, '2022-04-03 16:41:12', '2022-04-03 16:41:12');
INSERT INTO `personal_access_tokens` VALUES (3, 'App\\Models\\User', 1, 'auth_token', 'f4e6ed51ac9b5fa897319a5d560e790b869b7654ebdb6e70d47d5f3d551ab2d2', '[\"*\"]', NULL, '2022-04-03 16:41:30', '2022-04-03 16:41:30');
INSERT INTO `personal_access_tokens` VALUES (4, 'App\\Models\\User', 1, 'auth_token', '62e7e2cc65c567ee165b46466372b3a2ceef8e86cda01c6aa6cb00cbe0bb5f9e', '[\"*\"]', NULL, '2022-04-03 16:58:27', '2022-04-03 16:58:27');
INSERT INTO `personal_access_tokens` VALUES (5, 'App\\Models\\User', 1, 'auth_token', '2a0fc68e3daa0482a18c967453cf42b7f7862cb830fb9ad525b0f0f32cf560b0', '[\"*\"]', NULL, '2022-04-03 17:00:38', '2022-04-03 17:00:38');
INSERT INTO `personal_access_tokens` VALUES (6, 'App\\Models\\User', 1, 'auth_token', '4e40a5c480361e9c30d440402f326305319599baa4689b032268a69d40517175', '[\"*\"]', NULL, '2022-04-03 17:01:37', '2022-04-03 17:01:37');
INSERT INTO `personal_access_tokens` VALUES (7, 'App\\Models\\User', 1, 'auth_token', '81d516c92b43e4437cd0b184b88a07ee29ccbb1095f1a351794df7df49e81eff', '[\"*\"]', NULL, '2022-04-03 17:01:37', '2022-04-03 17:01:37');
INSERT INTO `personal_access_tokens` VALUES (8, 'App\\Models\\User', 1, 'auth_token', '5a4d829aafb1e16d07c017188889be9fa1525cd408aea65af61cccdeeb7f5ee4', '[\"*\"]', NULL, '2022-04-03 17:01:39', '2022-04-03 17:01:39');
INSERT INTO `personal_access_tokens` VALUES (9, 'App\\Models\\User', 1, 'auth_token', '3e40278ebcdba789fb79dca41620de77773ec8d2e39a09d99dc54c47901851ce', '[\"*\"]', NULL, '2022-04-03 17:01:40', '2022-04-03 17:01:40');
INSERT INTO `personal_access_tokens` VALUES (10, 'App\\Models\\User', 1, 'auth_token', 'fd22f79b9ea5c037c7e0a8de31126fed4fffe2af2ba2edfc7eb9326706c67158', '[\"*\"]', NULL, '2022-04-03 17:01:41', '2022-04-03 17:01:41');
INSERT INTO `personal_access_tokens` VALUES (11, 'App\\Models\\User', 1, 'auth_token', '4ea183986201eefbe7ee9b302a43a48d1ea5d2e378f548ecae7fb0dd724e1373', '[\"*\"]', NULL, '2022-04-03 17:01:41', '2022-04-03 17:01:41');
INSERT INTO `personal_access_tokens` VALUES (12, 'App\\Models\\User', 1, 'auth_token', 'b034cc08448f4dc3e4a40feb0368e13e62b46d2cba1eda5a2845d8a44e70d7fe', '[\"*\"]', NULL, '2022-04-03 17:01:42', '2022-04-03 17:01:42');
INSERT INTO `personal_access_tokens` VALUES (13, 'App\\Models\\User', 1, 'auth_token', '6165dbc69a1ee969177f1f981fa8f0ba22d6810fc4968a740b10ca85a173b0ed', '[\"*\"]', NULL, '2022-04-03 17:01:46', '2022-04-03 17:01:46');
INSERT INTO `personal_access_tokens` VALUES (14, 'App\\Models\\User', 1, 'auth_token', '6191e261e5b5f99aab005849c2bfeb3776a9ba8e53b49e2fceaa2d20c1029f8e', '[\"*\"]', NULL, '2022-04-03 17:03:19', '2022-04-03 17:03:19');
INSERT INTO `personal_access_tokens` VALUES (15, 'App\\Models\\User', 1, 'auth_token', '9ec911f6545315138fe0a1422237225dd1924cb535313531d893ae58a352919c', '[\"*\"]', NULL, '2022-04-03 17:05:03', '2022-04-03 17:05:03');
INSERT INTO `personal_access_tokens` VALUES (16, 'App\\Models\\User', 1, 'auth_token', '1f61901f921b43c740544d19ccdd0863177abac4b0f347b486d1a548e4b638a6', '[\"*\"]', NULL, '2022-04-03 17:05:47', '2022-04-03 17:05:47');
INSERT INTO `personal_access_tokens` VALUES (17, 'App\\Models\\User', 1, 'auth_token', 'd70e4bb85e8764126113f7c2f2d31dbcd0199bf94c5a5629d8c47b9a38f65e94', '[\"*\"]', NULL, '2022-04-03 18:09:22', '2022-04-03 18:09:22');
INSERT INTO `personal_access_tokens` VALUES (18, 'App\\Models\\User', 1, 'auth_token', '1ad79c495e21d0d564bc275d2788ab4f20903c86fc2de798c8e8c18cd66f357a', '[\"*\"]', NULL, '2022-04-03 18:09:44', '2022-04-03 18:09:44');
INSERT INTO `personal_access_tokens` VALUES (19, 'App\\Models\\User', 1, 'auth_token', '020ab2e02e3c15ce90d5a5387aa9802e41309f21f5938d402d30ffc261d1d446', '[\"*\"]', NULL, '2022-04-03 18:09:55', '2022-04-03 18:09:55');
INSERT INTO `personal_access_tokens` VALUES (20, 'App\\Models\\User', 1, 'auth_token', '32a89f129baa9ad39ec329e8c464dcbce9307f3695499a9ce2500b5e7a30cc04', '[\"*\"]', NULL, '2022-04-03 18:10:35', '2022-04-03 18:10:35');
INSERT INTO `personal_access_tokens` VALUES (21, 'App\\Models\\User', 1, 'auth_token', 'f343a2646b356c1cbc1cb4acc276e90b5cdc7208060669c0b0730f480390f359', '[\"*\"]', NULL, '2022-04-03 18:12:55', '2022-04-03 18:12:55');
INSERT INTO `personal_access_tokens` VALUES (22, 'App\\Models\\User', 1, 'auth_token', 'f6326b6501f5b9190579ebc89aa11d14bdb099234cab5ce9f0e510be3d1c9891', '[\"*\"]', NULL, '2022-04-03 18:13:31', '2022-04-03 18:13:31');
INSERT INTO `personal_access_tokens` VALUES (23, 'App\\Models\\User', 1, 'auth_token', '69c7cf81dd5af9e6036e3a6edca2b1b7ed6743b405894f9119d8a52f212996bb', '[\"*\"]', NULL, '2022-04-03 18:14:57', '2022-04-03 18:14:57');
INSERT INTO `personal_access_tokens` VALUES (24, 'App\\Models\\User', 1, 'auth_token', 'b08a56446016503e3ac312db362f58f9406a7be4f4a778ae63bdaa99a41a0eac', '[\"*\"]', NULL, '2022-04-03 18:17:01', '2022-04-03 18:17:01');
INSERT INTO `personal_access_tokens` VALUES (25, 'App\\Models\\User', 1, 'auth_token', '67bdf939c95bbbf59978296048235a8938ad20ee8feeb49e93edbbbe19d3738e', '[\"*\"]', NULL, '2022-04-03 18:17:27', '2022-04-03 18:17:27');
INSERT INTO `personal_access_tokens` VALUES (26, 'App\\Models\\User', 1, 'auth_token', '140022992202aab12d49b07c72cc0087da62e60cb04a7594bf82cc89802c62ef', '[\"*\"]', NULL, '2022-04-03 18:20:38', '2022-04-03 18:20:38');
INSERT INTO `personal_access_tokens` VALUES (27, 'App\\Models\\User', 1, 'auth_token', 'adbb613a2d6bd1bba52841ce874b97b529c10d56ab71516055fa35b48d46cc7d', '[\"*\"]', NULL, '2022-04-03 18:22:08', '2022-04-03 18:22:08');
INSERT INTO `personal_access_tokens` VALUES (28, 'App\\Models\\User', 1, 'auth_token', '633c5333462b6faa3bfef5e7b834aa6c7a6995f9cdf278cade581f5bdaca408b', '[\"*\"]', NULL, '2022-04-03 18:22:26', '2022-04-03 18:22:26');
INSERT INTO `personal_access_tokens` VALUES (29, 'App\\Models\\User', 1, 'auth_token', '4fa6bfc76c34d8a963ed61634884096c29fa1a8bfaf83788fe6f848b75fdbb06', '[\"*\"]', NULL, '2022-04-03 18:23:00', '2022-04-03 18:23:00');
INSERT INTO `personal_access_tokens` VALUES (30, 'App\\Models\\User', 1, 'auth_token', 'dbb4723c62744d76d93b63a0d606c6304dc6fd898006f267b97a9ee3c354866d', '[\"*\"]', NULL, '2022-04-03 18:23:37', '2022-04-03 18:23:37');
INSERT INTO `personal_access_tokens` VALUES (31, 'App\\Models\\User', 1, 'auth_token', '20cfefb1bca777b01f85cee10f676036fb7897cdf580ac2a713627eee729e829', '[\"*\"]', NULL, '2022-04-03 18:23:45', '2022-04-03 18:23:45');
INSERT INTO `personal_access_tokens` VALUES (32, 'App\\Models\\User', 1, 'auth_token', '8251957f519998345f5abc6b74154d35e02a1fae2e4ecb1314376b6f1240b1d8', '[\"*\"]', NULL, '2022-04-03 18:23:46', '2022-04-03 18:23:46');
INSERT INTO `personal_access_tokens` VALUES (33, 'App\\Models\\User', 1, 'auth_token', '4a46303cea0ea83c0dfbb8de9b5e828f7b4ec9181f336b7012294446c4fd0bf9', '[\"*\"]', NULL, '2022-04-03 18:23:48', '2022-04-03 18:23:48');
INSERT INTO `personal_access_tokens` VALUES (34, 'App\\Models\\User', 1, 'auth_token', 'abc643731c85d9897270a3ae55720d24cb0a0fe22b4a75d99f1ae0e4716377b7', '[\"*\"]', NULL, '2022-04-03 18:30:53', '2022-04-03 18:30:53');
INSERT INTO `personal_access_tokens` VALUES (35, 'App\\Models\\User', 1, 'auth_token', 'f7ed0dba7d2ddd535ed008f1c96afa2e97f4008f294aeafcc4868e0e18d1d0b8', '[\"*\"]', NULL, '2022-04-03 18:34:55', '2022-04-03 18:34:55');
INSERT INTO `personal_access_tokens` VALUES (36, 'App\\Models\\User', 1, 'auth_token', 'b027e4038c3e40c378db9eee887093a2cd0730173f41b79c8c47fb592e2ff7ca', '[\"*\"]', NULL, '2022-04-03 18:35:10', '2022-04-03 18:35:10');
INSERT INTO `personal_access_tokens` VALUES (37, 'App\\Models\\User', 1, 'auth_token', '1b69f79015dbf2a31215b07a9f7859acfa9c71f32a48adf5a314e7db709b5be6', '[\"*\"]', NULL, '2022-04-03 18:39:38', '2022-04-03 18:39:38');
INSERT INTO `personal_access_tokens` VALUES (38, 'App\\Models\\User', 1, 'auth_token', 'e2c04abaf293f55b120018ea4575078550d1625e78cf5989de172ded542dd16e', '[\"*\"]', NULL, '2022-04-03 18:48:10', '2022-04-03 18:48:10');
INSERT INTO `personal_access_tokens` VALUES (39, 'App\\Models\\User', 1, 'auth_token', '9ec0f0289b3079448dcfa1c6da73fbe34e925d8e527494b1e11870dde482613e', '[\"*\"]', NULL, '2022-04-03 19:36:45', '2022-04-03 19:36:45');
INSERT INTO `personal_access_tokens` VALUES (40, 'App\\Models\\User', 1, 'auth_token', '0dc4d7a27bf8bb5689538732532ba56e9a8e252cdd0b2ace1519a15d45c6fc49', '[\"*\"]', NULL, '2022-04-03 19:37:17', '2022-04-03 19:37:17');
INSERT INTO `personal_access_tokens` VALUES (41, 'App\\Models\\User', 1, 'auth_token', '2f1fc35c9de5551e9b7cb5a77bcbb534ee5a72eb1379ae1807d851b9ccc25608', '[\"*\"]', NULL, '2022-04-04 02:20:25', '2022-04-04 02:20:25');
INSERT INTO `personal_access_tokens` VALUES (42, 'App\\Models\\User', 1, 'auth_token', '27de3230087716e820842fa789ac39ab1c90d2a1cb35de8576ac1dc2205af731', '[\"*\"]', NULL, '2022-04-04 02:39:44', '2022-04-04 02:39:44');
INSERT INTO `personal_access_tokens` VALUES (43, 'App\\Models\\User', 1, 'auth_token', '680bba61082252ffbbef363a45c18a23bcba1035511ad13fa21cf7a6d9b25584', '[\"*\"]', NULL, '2022-04-04 03:01:30', '2022-04-04 03:01:30');
INSERT INTO `personal_access_tokens` VALUES (44, 'App\\Models\\User', 1, 'auth_token', 'a46d4e93dc821d9c687f77e3708ab56f2f9a4dfd4648e194ef5939af7ed60dfe', '[\"*\"]', NULL, '2022-04-04 03:07:28', '2022-04-04 03:07:28');
INSERT INTO `personal_access_tokens` VALUES (45, 'App\\Models\\User', 1, 'auth_token', 'c31dca0d2a784182d5e0697a24add6772de9297cf5635d9fd274b3eba313b438', '[\"*\"]', NULL, '2022-04-04 03:09:45', '2022-04-04 03:09:45');
INSERT INTO `personal_access_tokens` VALUES (46, 'App\\Models\\User', 1, 'auth_token', '7654dcd9748a9169de1ba0f2f0dea1892c068369f22bf7279e97cec1c5d25e02', '[\"*\"]', NULL, '2022-04-04 03:10:54', '2022-04-04 03:10:54');
INSERT INTO `personal_access_tokens` VALUES (47, 'App\\Models\\User', 2, 'auth_token', 'df681d36e880ffe3164cdc3793753795594deeaeac88053c0be1903d86296eb4', '[\"*\"]', NULL, '2022-04-05 01:43:44', '2022-04-05 01:43:44');
INSERT INTO `personal_access_tokens` VALUES (48, 'App\\Models\\User', 3, 'auth_token', '848e8c115bb554765234484c11c8b5dded771a3bd21b02d88940ae20f0200606', '[\"*\"]', NULL, '2022-04-05 01:46:03', '2022-04-05 01:46:03');
INSERT INTO `personal_access_tokens` VALUES (49, 'App\\Models\\User', 4, 'auth_token', '83da59c219c54255754409cfed896fe6ad92a8a4d26ea419122f2b8a8a360058', '[\"*\"]', NULL, '2022-04-05 01:48:51', '2022-04-05 01:48:51');
INSERT INTO `personal_access_tokens` VALUES (50, 'App\\Models\\User', 5, 'auth_token', '68db176cf1d6e57f002b2bf190bc4b921c695bf6f37f34d20871986def00897c', '[\"*\"]', NULL, '2022-04-05 02:30:13', '2022-04-05 02:30:13');
INSERT INTO `personal_access_tokens` VALUES (51, 'App\\Models\\User', 6, 'auth_token', '808989f015dd49abf59de5c3e1a850cb70eae6af4fb1a03c706c7fa22a46e60b', '[\"*\"]', NULL, '2022-04-05 02:46:50', '2022-04-05 02:46:50');

-- ----------------------------
-- Table structure for productos
-- ----------------------------
DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos`  (
  `cve_producto` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de productos',
  `cve_empresa` int NULL DEFAULT NULL COMMENT 'Identificador del catálogo de empresas',
  `cve_categoria` int NULL DEFAULT NULL COMMENT 'Identificador del catálogo de categorías',
  `producto` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Nombre del producto o material',
  `codigo_barras` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Código de barras asociado al producto',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  `clave_interna` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `servicio` tinyint(1) NULL DEFAULT NULL,
  `cve_unidad_compra` int NULL DEFAULT NULL,
  `cve_unidad_venta` int NULL DEFAULT NULL,
  `factor` decimal(11, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`cve_producto`) USING BTREE,
  INDEX `fk_categoria_producto`(`cve_categoria` ASC) USING BTREE,
  INDEX `fk_empresa_productos`(`cve_empresa` ASC) USING BTREE,
  INDEX `fk_unidad_compra_producto`(`cve_unidad_compra` ASC) USING BTREE,
  INDEX `fk_unidad_venta_producto`(`cve_unidad_venta` ASC) USING BTREE,
  CONSTRAINT `fk_categoria_producto` FOREIGN KEY (`cve_categoria`) REFERENCES `categorias` (`cve_categoria`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_empresa_productos` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_unidad_compra_producto` FOREIGN KEY (`cve_unidad_compra`) REFERENCES `unidades` (`cve_unidad`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_unidad_venta_producto` FOREIGN KEY (`cve_unidad_venta`) REFERENCES `unidades` (`cve_unidad`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 436 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Catálogo de productos o materiales' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of productos
-- ----------------------------
INSERT INTO `productos` VALUES (1, 1, 3, 'CAJA ITK 26L', 'A22001000002', '2022-06-01 18:18:40', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (2, 1, 3, 'PUÑOS ITK D7', 'A22006000007', '2022-06-01 18:21:25', 'VIG', '2525', 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (3, 1, 3, 'FARO C/ CUBIERTA OJO ANGEL LUZ AMARILLO', 'A22010000008', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (4, 1, 3, 'DIRECCIONALES JET', 'A22011000005', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (5, 1, 3, 'ESPEJO CITY ROAD D1', 'A22012000006', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (6, 1, 4, 'CANDADO DISCO FRENO AMARILLO', 'ACCCANDISFAM', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (7, 1, 3, 'CASCO ABATIBLE DOT AZUL L', 'ACCCASAAL', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (8, 1, 3, 'FILTRO GASOLINA PIRINOLA TRANSP 10 PZAS', 'ACCFILTRO5G', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (9, 1, 3, 'FILTRO GASOLINA TRANSPARENTE 10 PZAS', 'ACCFILTRO6G', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (10, 1, 3, 'RED ELASTICA NEGRA (40X40CM)', 'ACCREDELNEG', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (11, 1, 5, 'CADENA TRACCION 428-108', 'C02030040', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (12, 1, 5, 'CARBURADOR', 'E01010059', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (13, 1, 5, 'CARBURADOR (75-35)', 'E01010138', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (14, 1, 5, 'JUEGO CARBURADOR', 'E01020020', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (15, 1, 6, 'ESPREA PRINCIPAL #75', 'E01030023', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (16, 1, 5, 'ESPREA BAJA #35', 'E01030064', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (17, 1, 5, 'CONJUNTO CABEZA DE CILINDRO', 'E02010008', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (18, 1, 7, 'BUJIA GOLD GDR8EA', 'E02020014', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (19, 1, 7, 'BUJIA GOLD GCR7HSA', 'E02020015', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (20, 1, 4, 'BUJIA B7RTC', 'E02020028', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (21, 1, 5, 'EMPAQUE CABEZA CILINDRO', 'E02030105', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (22, 1, 5, 'TORNILLO GUIA 6M*32', 'E02040011', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (23, 1, 5, 'PIPETA', 'E02050055', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (24, 1, 5, 'PIPETA', 'E02050082', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (25, 1, 5, 'PIPETA', 'E02050089', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (26, 1, 5, 'CILINDRO', 'E03010045', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (27, 1, 5, 'JUNTA DE CILINDRO', 'E03020016', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (28, 1, 5, 'EMPAQUE CILINDRO', 'E03020041', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (29, 1, 5, 'JUNTA CILINDRO', 'E03020071', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (30, 1, 5, 'EMPAQUE CABEZA CILINDRO', 'E03020072', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (31, 1, 5, 'JUEGO CILINDRO MOTOR CBP250', 'E0304KC11', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (32, 1, 5, 'JUEGO CILINDRO MOTOR CGP180', 'E0304KC13', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (33, 1, 5, 'ARBOL LEVAS', 'E04010095', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (34, 1, 5, 'SELLO DE VALVULA', 'E04020005', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (35, 1, 5, 'ENGRANAJE DE TREN DE VALVULAS', 'E04030004', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (36, 1, 5, 'CADENA DE CAMARA', 'E04030007', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (37, 1, 5, 'CADENA DE CAMARA', 'E04030048', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (38, 1, 5, 'GUIA TENSORA CADENA', 'E04030096', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (39, 1, 5, 'CADENA TIEMPO 102 ESLABONES', 'E04030097', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (40, 1, 5, 'GUIA CADENA', 'E04030098', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (41, 1, 5, 'ENGRANAJE TIEMPO 32T', 'E04030099', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (42, 1, 5, 'RODAMIENTO GUIA CADENA', 'E04030100', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (43, 1, 5, 'RODAMIENTO TENSOR CADENA', 'E04030101', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (44, 1, 5, 'BUZO IMPULSOR DE VALVULA', 'E04040002', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (45, 1, 5, 'VARILLA IMPULSORA DE BALANCIN', 'E04040004', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (46, 1, 5, 'VALVULA DE ADMISION', 'E04050055', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (47, 1, 5, 'VALVULA DE ESCAPE', 'E04050056', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (48, 1, 5, 'VALVULA ESCAPE', 'E04050115', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (49, 1, 5, 'JUEGO VALVULAS MOTOR', 'E04050116', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (50, 1, 5, 'VALVULA ADMISION', 'E04050117', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (51, 1, 8, 'ESTATOR', 'E05010005', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (52, 1, 8, 'ESTATOR', 'E05010029', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (53, 1, 8, 'ESTATOR', 'E05010034', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (54, 1, 8, 'ESTATOR 8 BOBINAS', 'E05010062', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (55, 1, 8, 'ROTOR', 'E05030074', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (56, 1, 5, 'BALERO BOLA RADIAL', 'E06010030', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (57, 1, 5, 'RUEDA DENTADA 15T', 'E06030105', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (58, 1, 5, 'RUEDA DENTADA 13T', 'E06030109', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (59, 1, 5, 'RUEDA DENTADA 16T', 'E06030121', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (60, 1, 5, 'RUEDA DENTADA', 'E06030128', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (61, 1, 5, 'EMPAQUE DE CAJA DE TRANSMISION', 'E06040017', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (62, 1, 5, 'SELLO DE ACEITE 17*29*5', 'E06040051', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (63, 1, 6, 'SELLO DE ACEITE', 'E07020042', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (64, 1, 6, 'EMPAQUE CENTRAL CARTER', 'E07020115', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (65, 1, 5, 'BALERO BOLA RADIAL,6002', 'E07030002', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (66, 1, 5, 'PISTON', 'E08010098', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (67, 1, 5, 'PASADOR DE PISTON', 'E08010100', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (68, 1, 5, 'SEGURO PASADOR DE PISTON', 'E08010101', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (69, 1, 5, 'JUEGO ANILLOS PISTON', 'E08010176', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (70, 1, 5, 'SEGURO PASADOR PISTON', 'E08010177', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (71, 1, 5, 'PISTON', 'E08010178', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (72, 1, 5, 'PASADOR PISTON 12X33', 'E08010179', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (73, 1, 5, 'PISTON', 'E08010189', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (74, 1, 5, 'JGO ANILLOS PISTON', 'E08010190', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (75, 1, 5, 'PASADOR PISTON', 'E08010191', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (76, 1, 5, 'JUEGO PISTON GY6125-STD', 'E0801KP03', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (77, 1, 5, 'JUEGO PISTON C110-STD', 'E0801KP11', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (78, 1, 5, 'JUEGO PISTON CG125-STD', 'E0801KP15', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (79, 1, 5, 'CIGÜEÑAL', 'E08020023', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (80, 1, 5, 'CONJUNTO CIGÜENAL', 'E08020071', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (81, 1, 5, 'BALERO RADIAL BOLA 6305/P6', 'E08030087', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (82, 1, 5, 'BUJE 30X19X9', 'E08050004', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (83, 1, 5, 'BOMBA ACEITE', 'E09010065', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (84, 1, 5, 'RODAMIENTO CADENA', 'E09040074', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (85, 1, 5, 'ENGRANAJE IMPULSOR BOMBA ACEITE', 'E09040076', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (86, 1, 5, 'CADENA BOMBA ACEITE', 'E09040077', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (87, 1, 5, 'ACCIONADOR DE EMBRAGUE', 'E10020002', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (88, 1, 5, 'SELECTOR DE CAMBIOS', 'E10020012', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (89, 1, 6, 'SELLO DE ACEITE,16*28*7', 'E10030018', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (90, 1, 5, 'EMPAQUE CUBIERTA DER CARTER', 'E10030070', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (91, 1, 5, 'EMPAQUE CUBIERTA DER CARTER', 'E10030100', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (92, 1, 5, 'EMPAQUE CUBIERTA CARTER DER', 'E10030105', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (93, 1, 5, 'MEDIDOR DE ACEITE GRIS L=26', 'E10050015', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (94, 1, 5, 'MEDIDOR DE ACEITE', 'E10050016', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (95, 1, 9, 'CUBIERTA DECORATIVA IZQ GRIS', 'E11010186', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (96, 1, 6, 'O-RING, 2.5 *13.8', 'E11030006', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (97, 1, 5, 'EMPAQUE CUBIERTA IZQ CARTER', 'E11030066', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (98, 1, 5, 'BALERO BOLA RADIAL 63/22P55YA', 'E11040007', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (99, 1, 5, 'O-RING 31.7X2.4', 'E11060005', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (100, 1, 5, 'JUEGO COMPLETO DE DISCO DE ARR', 'E12010008', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (101, 1, 10, 'CHICOTE DE FRENO TRASERO', 'F04030006', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (102, 1, 10, 'CHICOTE DE VELOCIMETRO', 'F04030011', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (103, 1, 10, 'CHICOTE DE AHOGADOR', 'F04030028', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (104, 1, 10, 'CHICOTE DE CLUTCH', 'F04030035', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (105, 1, 10, 'CHICOTE DE FRENO DELANTERO', 'F04030064', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (106, 1, 10, 'CHICOTE VELOCIMETRO', 'F04030075', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (107, 1, 10, 'CHICOTE DE FRENO DELANTERO', 'F04030117', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (108, 1, 10, 'CHICOTE DEL VELOCIMETRO', 'F04030134', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (109, 1, 10, 'CHICOTE DE VELOCIMETRO', 'F04030147', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (110, 1, 10, 'CHICOTE EMBRAGUE', 'F04030179', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (111, 1, 10, 'CHICOTE VELOCIMETRO', 'F04030182', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (112, 1, 10, 'CHICOTE ACELERADOR', 'F04030183', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (113, 1, 10, 'CHICOTE VELOCIMETRO', 'F04030206', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (114, 1, 10, 'CHICOTE EMBRAGUE', 'F04030209', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (115, 1, 10, 'CHICOTE ACELERADOR', 'F04030215', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (116, 1, 10, 'CHICOTE VELOCIMETRO', 'F04030239', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (117, 1, 10, 'CHICOTE VELOCIMETRO', 'F04030248', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (118, 1, 10, 'CHICOTE CLUTCH', 'F04030249', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (119, 1, 10, 'CHICOTE DE VELOCIMETRO', 'F04030288', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (120, 1, 10, 'CHICOTE VELOCIMETRO', 'F04030327', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (121, 1, 10, 'CHICOTE EMBRAGUE', 'F04030330', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (122, 1, 10, 'CHICOTE EMBRAGUE', 'F04030333', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (123, 1, 10, 'CHICOTE FRENO TRAS', 'F04030344', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (124, 1, 10, 'CHICOTE EMBRAGUE', 'F04030351', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (125, 1, 10, 'CHICOTE ACELERADOR', 'F04030366', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (126, 1, 10, 'CHICOTE CUENTA KILOMETROS', 'F04030367', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (127, 1, 10, 'CHICOTE VELOCIMETRO', 'F04030375', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (128, 1, 8, 'CONJUNTO DE MANDO IZQ', 'F04040128', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (129, 1, 8, 'CONJUNTO DE MANDO DER', 'F04040129', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (130, 1, 6, 'SEGURO CHICOTE ACELERADOR', 'F04040135', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (131, 1, 10, 'BASE CHICOTE ACELERADOR', 'F04040136', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (132, 1, 8, 'CONJUNTO MANDO IZQ', 'F04040178', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (133, 1, 8, 'CONJUNTO MANDO DER', 'F04040179', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (134, 1, 10, 'CONJUNTO MANDO IZQ', 'F04040188', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (135, 1, 8, 'CONJUNTO MANDO IZQ', 'F04040251', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (136, 1, 8, 'INTERRUPTOR EMERGENCIA', 'F04040252', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (137, 1, 10, 'ENSAMBLE PALANCA ACELERADOR', 'F04040253', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (138, 1, 8, 'CONJUNTO MANDO IZQ', 'F04040259', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (139, 1, 11, 'BATERIA MF-FA I12N7-3B', 'F06010048', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (140, 1, 11, 'BATERIA MF-FA ICB6L-B', 'F06010049', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (141, 1, 11, 'BATERIA MF-FA ICB5L-B', 'F06010051', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (142, 1, 11, 'BATERIA MF-FA IYTX4L-BS', 'F06010092', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (143, 1, 8, 'RELE ENCENDIDO', 'F06020002', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (144, 1, 8, 'RELE DE ENCENDIDO', 'F06020007', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (145, 1, 8, 'RELE ARRANQUE', 'F06020102', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (146, 1, 8, 'RECTIFICADOR/REGULADOR', 'F06030005', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (147, 1, 8, 'RECTIFICADOR CONJUNTO', 'F06030008', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (148, 1, 8, 'REGULADOR DE CORRIENTE', 'F06030025', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (149, 1, 8, 'REGULADOR', 'F06030026', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (150, 1, 8, 'REGULADOR RECTIFICADOR', 'F06030029', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (151, 1, 8, 'RECTIFICADOR/REGULADOR', 'F06030048', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (152, 1, 8, 'UNIDAD CDI', 'F06040002', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (153, 1, 8, 'UNIDAD CDI', 'F06040006', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (154, 1, 8, 'UNIDAD CDI', 'F06040016', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (155, 1, 8, 'UNIDAD CDI', 'F06040019', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (156, 1, 8, 'UNIDAD CDI', 'F06040023', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (157, 1, 8, 'UNIDAD CDI', 'F06040026', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (158, 1, 8, 'UNIDAD CDI', 'F06040047', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (159, 1, 8, 'UNIDAD CDI', 'F06040051', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (160, 1, 8, 'ARNES PRINCIPAL', 'F06050060', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (161, 1, 8, 'CONECTOR USB', 'F06050105', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (162, 1, 8, 'ARNES PRINCIPAL', 'F06050179', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (163, 1, 8, 'BOBINA IGNICION', 'F06060002', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (164, 1, 8, 'BOBINA', 'F06060020', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (165, 1, 8, 'BOBINA DE IGNICION', 'F06060034', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (166, 1, 8, 'BOBINA DE IGNICION', 'F06060052', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (167, 1, 9, 'CUBIERTA ESCAPE', 'F07010251', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (168, 1, 9, 'CUBIERTA ESCAPE', 'F07010255', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (169, 1, 9, 'CONJUNTO ESCAPE NEGRO', 'F07010264', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (170, 1, 6, 'DEFENSA TACONERA', 'F07020003', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (171, 1, 6, 'UNION DE ESCAPE', 'F07030006', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (172, 1, 6, 'JUNTA DEL SILENCIADOR', 'F07030045', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (173, 1, 9, 'EMPAQUE ESCAPE', 'F07030093', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (174, 1, 5, 'ELEMENTO FILTRANTE', 'F08010043', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (175, 1, 5, 'ELEMENTO FILTRANTE', 'F08010108', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (176, 1, 5, 'ELEMENTO FILTRANTE', 'F08010165', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (177, 1, 5, 'ELEMENTO FILTRANTE', 'F08010232', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (178, 1, 8, 'CONJUNTO DE FARO', 'F09010066', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (179, 1, 8, 'CONJUNTO FARO', 'F09010096', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (180, 1, 8, 'CONJUNTO FARO', 'F09010107', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (181, 1, 8, 'CONJUNTO FARO', 'F09010146', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (182, 1, 8, 'DIRECCIONAL DEL DER', 'F09020058', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (183, 1, 8, 'DIRECCIONAL DEL IZQ', 'F09020071', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (184, 1, 6, 'REFLEJANTE LATERAL', 'F09020084', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (185, 1, 8, 'DIRECCIONAL DERECHA DEL', 'F09020086', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (186, 1, 8, 'DIRECCIONAL IZQUIERDA DEL', 'F09020088', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (187, 1, 8, 'LED DIRECCIONAL TRAS IZQ', 'F09020185', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (188, 1, 8, 'LED DIRECCIONAL TRAS DER', 'F09020187', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (189, 1, 8, 'DIRECCIONAL LED DEL IZQ', 'F09020238', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (190, 1, 8, 'DIRECCIONAL LED DEL DER', 'F09020239', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (191, 1, 8, 'LAMPARA LED LATERAL IZQ', 'F09020272', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (192, 1, 8, 'LED DIRECCIONAL DEL IZQ', 'F09020318', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (193, 1, 8, 'DIRECCIONAL TRAS IZQ', 'F09020328', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (194, 1, 8, 'DIRECCIONAL TRAS DER', 'F09020329', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (195, 1, 8, 'CALAVERA TRASERA, SPORT', 'F09030036', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (196, 1, 8, 'CALAVERA DE LEDS', 'F09030048', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (197, 1, 8, 'FOCO H4 18/18W (1 PZA)', 'F09040112', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (198, 1, 9, 'JUEGO ESPEJOS CON LOGO Y LEYENDA', 'F10010195', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (199, 1, 9, 'ESPEJO CROMADO DER CON LOGO', 'F10010270', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (200, 1, 6, 'PUÑO IZQ', 'F10020005', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (201, 1, 6, 'PUÑO ACELERADOR', 'F10020011', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (202, 1, 6, 'PUÑO ACELERADOR', 'F10020050', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (203, 1, 6, 'PUÑO IZQ', 'F10020079', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (204, 1, 6, 'PUÑO ACELERADOR', 'F10020087', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (205, 1, 6, 'CONTRAPESO MANUBRIO', 'F10020089', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (206, 1, 9, 'CONTRAPESO MANUBRIO', 'F10020169', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (207, 1, 10, 'PALANCA IZQUIERDA DE EMBRAGUE', 'F10030012', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (208, 1, 10, 'PALANCA DERECHA DE FRENO', 'F10030013', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (209, 1, 10, 'CONJUNTO PALANCA IZQUIERDA', 'F10030042', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (210, 1, 10, 'PALANCA DERECHA', 'F10030067', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (211, 1, 10, 'CONJUNTO DE PALANCA IZQUIERDA', 'F10030085', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (212, 1, 10, 'PALANCA DER FRENO DEL', 'F10030088', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (213, 1, 10, 'ENSAMBLE PALANCA IZQ', 'F10030091', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (214, 1, 10, 'CONJUNTO PALANCA DER', 'F10030094', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (215, 1, 10, 'CONJUNTO PALANCA IZQ', 'F10030095', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (216, 1, 10, 'ENS PALANCA IZQ EMBRAGUE', 'F10030096', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (217, 1, 10, 'CONJUNTO DE PALANCA IZQ', 'F10030099', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (218, 1, 10, 'PALANCA IZQ', 'F10030110', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (219, 1, 10, 'PALANCA FRENO IZQ', 'F10030121', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (220, 1, 10, 'CONJUNTO PALANCA IZQ', 'F10030129', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (221, 1, 10, 'ENS PALANCA IZQ EMBRAGUE', 'F10030133', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (222, 1, 10, 'PALANCA DER FRENO NEGRO', 'F10030136', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (223, 1, 5, 'PALANCA FRENO DER', 'F10030150', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (224, 1, 10, 'CONJUNTO PALANCA IZQ', 'F10030162', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (225, 1, 10, 'PALANCA FRENO DER', 'F10030173', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (226, 1, 10, 'PALANCA DER FRENO', 'F10030178', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (227, 1, 10, 'PALANCA FRENO DER', 'F10030189', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (228, 1, 9, 'MANUBRIO', 'F10040084', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (229, 1, 9, 'MANUBRIO', 'F10040098', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (230, 1, 9, 'MANUBRIO', 'F10040264', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (231, 1, 6, 'BARRA DE POSAPIES', 'F11010026', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (232, 1, 6, 'BASE DERECHA DE POSAPIES', 'F11010135', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (233, 1, 9, 'GOMA POSAPIE', 'F11010152', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (234, 1, 6, 'BASE POSAPIE TRA DER', 'F11010256', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (235, 1, 6, 'BASE POSAPIE TRAS IZQ', 'F11010257', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (236, 1, 6, 'BARRA POSAPIES', 'F11010258', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (237, 1, 6, 'POSAPIE TRAS DER', 'F11010260', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (238, 1, 6, 'POSAPIE TRAS IZQ', 'F11010261', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (239, 1, 9, 'BARRA POSAPIES', 'F11010424', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (240, 1, 6, 'PARADOR CENTRAL', 'F11020039', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (241, 1, 9, 'GOMA TOPE PARADOR CENTRAL', 'F11020090', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (242, 1, 6, 'RESORTE PARADOR CENTRAL', 'F11020180', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (243, 1, 10, 'PEDAL DE CAMBIOS', 'F11030016', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (244, 1, 6, 'RESORTE DE PEDAL DE FRENO', 'F11030028', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (245, 1, 10, 'PEDAL DE ARRANQUE CROMADO', 'F11030034', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (246, 1, 6, 'SWITCH FRENO TRASERO', 'F11030052', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (247, 1, 6, 'JUEGO VARILLA FRENO TRASERO', 'F11030061', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (248, 1, 10, 'PEDAL DE CAMBIOS', 'F11030067', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (249, 1, 10, 'PEDAL DE ARRANQUE SPORT', 'F11030120', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (250, 1, 10, 'PEDAL DE CAMBIOS', 'F11030138', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (251, 1, 6, 'VARILLA FRENO TRAS', 'F11030190', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (252, 1, 6, 'VARILLA FRENO', 'F11031022', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (253, 1, 6, 'VARILLA FRENO TRAS', 'F11031024', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (254, 1, 10, 'PEDAL ARRANQUE', 'F11031027', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (255, 1, 9, 'CUBIERTA SUPERIOR PARACHOQUE', 'F12010116', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (256, 1, 9, 'CUBIERTA IZQ INT TANQUE', 'F12010230', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (257, 1, 9, 'CUBIERTA DER INT TANQUE', 'F12010231', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (258, 1, 9, 'CUBIERTA LATERAL FARO DER', 'F12010267', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (259, 1, 9, 'CUBIERTA LATERAL FARO IZQ', 'F12010268', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (260, 1, 9, 'CUBIERTA CENTRAL', 'F12010270', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (261, 1, 9, 'CUBIERTA INFERIOR PARACHOQUE', 'F12010282', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (262, 1, 9, 'CUBIERTA FARO', 'F12010383', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (263, 1, 9, 'CUBIERTA TRAS FARO', 'F12010384', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (264, 1, 9, 'CUBIERTA FARO', 'F12010487', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (265, 1, 9, 'CUBIERTA FARO INT NEGRO', 'F12010489', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (266, 1, 9, 'CUBIERTA CENTRAL', 'F12010671', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (267, 1, 9, 'CUBIERTA VELOCIMETRO', 'F12010699', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (268, 1, 9, 'CUBIERTA FARO', 'F12010700', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (269, 1, 9, 'CUBIERTA IZQUIERDA FARO ROJA', 'F13010393', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (270, 1, 9, 'CUBIERTA DERECHA FARO ROJA', 'F13010396', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (271, 1, 9, 'PROTECTOR PUÑO IZQ', 'F13010405', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (272, 1, 9, 'PROTECTOR PUÑO DER', 'F13010406', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (273, 1, 9, 'CUBIERTA DER AZUL BLANCO', 'F13011398', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (274, 1, 9, 'CUBIERTA FARO AZUL', 'F13011400', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (275, 1, 9, 'CUBIERTA FARO IZQ AMARILLO', 'F13011887', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (276, 1, 9, 'CUBIERTA FARO DER AMARILLO', 'F13011888', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (277, 1, 9, 'CUBIERTA FARO FRONTAL', 'F13011889', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (278, 1, 9, 'CUBIERTA POSAPIE DER NEGRO', 'F13011915', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (279, 1, 9, 'CUBIERTA DER NEGRO', 'F13012213', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (280, 1, 9, 'CUBIERTA IZQ NEGRO', 'F13012214', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (281, 1, 9, 'CUBIERTA FR MANUBRIO AZUL CELESTE', 'F13012215', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (282, 1, 9, 'CUBIERTA MANUBRIO FR AZUL PERLADO', 'F13012251', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (283, 1, 9, 'ENCARENADO AZUL', 'F13012306', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (284, 1, 9, 'CUBIERTA GUANTERA AZUL', 'F13012309', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (285, 1, 9, 'CUBIERTA LAT IZQ GRIS NEGRO', 'F13012358', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (286, 1, 9, 'CUBIERTA LAT DER GRIS NEGRO', 'F13012359', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (287, 1, 9, 'CUBIERTA COLA IZQ ROJO NEGRO', 'F13012378', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (288, 1, 9, 'CUBIERTA COLA DER ROJO NEGRO', 'F13012379', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (289, 1, 9, 'CUBIERTA CALAVERA ROJO', 'F13012380', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (290, 1, 9, 'CUBIERTA TANQUE IZQ ROJO NEGRO', 'F13012385', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (291, 1, 9, 'CUBIERTA DER AZUL', 'F13012479', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (292, 1, 9, 'CUBIERTA TANQUE IZQ GRIS', 'F13012578', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (293, 1, 9, 'CUBIERTA TANQUE DER GRIS', 'F13012579', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (294, 1, 9, 'CUBIERTA PROTECTOR PUÑO IZQ AZUL', 'F13012581', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (295, 1, 9, 'CUBIERTA PROTECTOR PUÑO DER AZUL', 'F13012582', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (296, 1, 9, 'CUBIERTA TRAS IZQ NEGRO GRANITO VERDE', 'F13012599', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (297, 1, 12, 'CAMARA 80/100-21', 'F14010156', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (298, 1, 13, 'LLANTA CITY ROAD 3.50-10 (TT)', 'F14010161', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (299, 1, 14, 'LLANTA DEL CITY CROSS PIRELLI 2.75-17', 'F14010213', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (300, 1, 10, 'DISCO DE FRENO ABS', 'F14020052', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (301, 1, 10, 'FRENO DELANTERO', 'F14020060', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (302, 1, 6, 'MANGUERA FRENO DELANTERO', 'F14020129', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (303, 1, 10, 'ENSAMBLE FRENO DEL DER', 'F14020143', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (304, 1, 10, 'ENSAMBLE FRENO DEL IZQ', 'F14020144', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (305, 1, 15, 'BALATAS FRENO DEL', 'F14020276', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (306, 1, 15, 'ZAPATAS FRENO DEL', 'F14020277', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (307, 1, 15, 'BALATAS FRENO DEL', 'F14020297', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (308, 1, 4, 'BALATAS FRENO DEL', 'F14020446', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (309, 1, 10, 'DISCO FRENO DEL', 'F14020449', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (310, 1, 15, 'BALATAS FRENO DEL', 'F14020451', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (311, 1, 4, 'CALIPER FRENO DEL NEGRO CON LOGO', 'F14020528', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (312, 1, 6, 'RAYO EXTERNO RUEDA DEL', 'F14030011', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (313, 1, 9, 'RAYO EXT RUEDA DEL 3.2X181', 'F14030251', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (314, 1, 9, 'RAYO INT RUEDA DEL 3.2X181', 'F14030252', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (315, 1, 9, 'ARO RIN DEL 17X1.60', 'F14030253', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (316, 1, 9, 'RIN DEL ROJO 17X1.4', 'F14030260', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (317, 1, 9, 'ARO RIN DEL NEGRO 1.4X17', 'F14030300', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (318, 1, 6, 'COLLAR INTERNO PLATO TRACCIÓN', 'F14040016', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (319, 1, 6, 'EJE DE LA RUEDA DELANTERA', 'F14040018', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (320, 1, 5, 'BALERO RADIAL BOLA,6301', 'F14040020', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (321, 1, 5, 'BALERO 6202-2RS', 'F14040114', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (322, 1, 4, 'BALERO 6302-2RS', 'F14040184', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (323, 1, 4, 'LLANTA 110/80-18', 'F15010104', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (324, 1, 12, 'CAMARA 4.10-18', 'F15010121', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (325, 1, 12, 'CAMARA 3.00-17', 'F15010124', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (326, 1, 12, 'CAMARA 120/80-18', 'F15010126', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (327, 1, 4, 'LLANTA S 90/90-17', 'F15010150', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (328, 1, 14, 'LLANTA TRAS CITY CROSS PIRELLI 3.00-17', 'F15010176', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (329, 1, 4, 'LLANTA CITY ROAD 130/90 - 15', 'F15010203', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (330, 1, 13, 'LLANTA CITY ROAD 110/80-17', 'F15010206', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (331, 1, 13, 'LLANTA CITY ROAD 130/90 – 10', 'F15010212', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (332, 1, 10, 'FRENO TRASERO', 'F15020028', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (333, 1, 15, 'ZAPATAS DE FRENO TRASERO', 'F15020030', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (334, 1, 15, 'JUEGO ZAPATAS FRENO TRAS', 'F15020072', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (335, 1, 10, 'FRENO TRASERO NEGRO', 'F15020081', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (336, 1, 10, 'BOMBA DE FRENO TRASERO', 'F15020106', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (337, 1, 4, 'BALATAS FRENO TRAS', 'F15020163', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (338, 1, 15, 'BALATAS FRENO TRAS', 'F15020180', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (339, 1, 15, 'ZAPATAS FRENO TRAS', 'F15020181', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (340, 1, 15, 'ZAPATAS FRENO TRAS', 'F15020182', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (341, 1, 15, 'ZAPATAS FRENO TRAS', 'F15020186', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (342, 1, 4, 'BALATAS FRENO TRAS', 'F15020189', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (343, 1, 4, 'BALATAS FRENO', 'F15020207', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (344, 1, 4, 'ZAPATA FRENO TRAS', 'F15020273', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (345, 1, 10, 'ENSAMBLE BOMBA FRENO TRAS', 'F15020276', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (346, 1, 5, 'BRAZO ACCIONADOR BOMBA FRENO', 'F15020313', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (347, 1, 9, 'RIN TRASERO ALUMINIO', 'F15030033', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (348, 1, 9, 'ARO RIN TRAS 17X1.60', 'F15030237', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (349, 1, 9, 'RAYO INT RUEDA TRAS 3.8X150', 'F15030238', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (350, 1, 9, 'RIN TRAS ROJO 17X1.85', 'F15030244', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (351, 1, 6, 'EJE RUEDA TRAS', 'F15040006', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (352, 1, 6, 'EJE DE LA RUEDA TRASERA', 'F15040024', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (353, 1, 6, 'ESPACIADOR IZQ EJE TRASERO', 'F15040037', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (354, 1, 5, 'BALERO 6206-RZ', 'F15040131', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (355, 1, 6, 'FLECHA EJE TRASERO', 'F15040134', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (356, 1, 6, 'FLECHA EJE TRAS', 'F15040166', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (357, 1, 6, 'EJE RUEDA TRAS M15X260', 'F15040191', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (358, 1, 6, 'BUJE EJE TRAS 152X34X27', 'F15040228', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (359, 1, 9, 'BUJE MAZA RUEDA TRAS 24X9.3X20.5', 'F15040273', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (360, 1, 6, 'EJE RUEDA TRAS M12X225', 'F15060007', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (361, 1, 9, 'LODERA DEL', 'F16010063', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (362, 1, 9, 'LODERA', 'F16010083', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (363, 1, 9, 'SALPICADERA DELANT/ROJO/.', 'F16010099', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (364, 1, 9, 'SALPICADERA TRAS NEGRA SPORT', 'F16010116', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (365, 1, 9, 'SALPICADERA DEL AZUL BLANCO', 'F16010241', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (366, 1, 9, 'SALPICADERA DEL GRIS', 'F16010305', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (367, 1, 9, 'SALPICADERA DEL BLANCO', 'F16010330', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (368, 1, 9, 'SALPICADERA DEL NEGRO AMARILLO', 'F16010343', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (369, 1, 9, 'CUBIERTA SALPICADERA TRAS', 'F16020170', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (370, 1, 9, 'SALPICADERA TRAS', 'F16020172', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (371, 1, 9, 'SALPICADERA TRAS', 'F16020201', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (372, 1, 9, 'BASE SALPICADERA DELANTERA', 'F16030007', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (373, 1, 9, 'TANQUE COMBUSTIBLE BLANCO FL', 'F17010202', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (374, 1, 9, 'TANQUE COMBUSTIBLE NEGRO', 'F17010219', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (375, 1, 9, 'TAPON TANQUE COMBUSTIBLE', 'F17010220', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (376, 1, 6, 'LLAVE COMBUSTIBLE', 'F17020004', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (377, 1, 6, 'LLAVE DE GASOLINA', 'F17020005', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (378, 1, 9, 'DEPOSITO DE GASOLINA', 'F17020067', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (379, 1, 6, 'SENSOR COMBUSTIBLE', 'F17030017', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (380, 1, 6, 'SENSOR COMBUSTIBLE', 'F17030050', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (381, 1, 8, 'SENSOR COMBUSTIBLE', 'F17030066', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (382, 1, 8, 'SENSOR NIVEL COMBUSTIBLE', 'F17030087', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (383, 1, 9, 'PROTECTOR TANQUE', 'F17040157', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (384, 1, 16, 'ACEITE 4 TIEMPOS SAE 20W50 SL', 'L01010006', '2022-06-01 18:21:25', 'VIG', NULL, 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (385, 1, 1, '1ER SERVICIO DE MANTENIMIENTO', NULL, '2022-06-01 20:10:12', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (386, 1, 1, '2DO SERVICIO DE MANTENIMIENTO', NULL, '2022-06-01 20:10:12', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (387, 1, 1, 'SERVICIO MANTENIMIENTO COMPLETO', NULL, '2022-06-01 20:10:12', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (388, 1, 1, 'AJUSTE DE PUNTERIAS CARTER CHICO', NULL, '2022-06-01 20:10:12', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (389, 1, 1, 'AJUSTE DE PUNTERIAS CARTER GRANDE', NULL, '2022-06-01 20:10:12', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (390, 1, 1, 'CAMBIO DE LLANTA TRAS MOTO DE TRABAJO', NULL, '2022-06-01 20:10:13', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (391, 1, 1, 'CAMBIO DE LLANTA DEL MOTO DE TRABAJO', NULL, '2022-06-01 20:10:13', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (392, 1, 1, 'CAMBIO DE LLANTA TRASERA MOTONETA ', NULL, '2022-06-01 20:10:13', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (393, 1, 1, 'CAMBIO DE LLANTA DEL DE MOTONETA', NULL, '2022-06-01 20:10:13', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (394, 1, 1, 'CAMBIO DE KIT DE SPROKET', NULL, '2022-06-01 20:10:13', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (395, 1, 1, 'CAMBIO DE FOCO DE FARO', NULL, '2022-06-01 20:10:13', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (396, 1, 1, 'CAMBIO DE BALATA TRAS MOTO DE TRABAJO', NULL, '2022-06-01 20:10:13', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (397, 1, 1, 'CAMBIO DE BALATA TRASERA MOTONETA', NULL, '2022-06-01 20:10:13', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (398, 1, 1, 'CAMBIO DE BALATA DELANTERA MOTONETA', NULL, '2022-06-01 20:10:13', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (399, 1, 1, 'CAMBIO DE CONJ. DE MANIJA IZQ O DER', NULL, '2022-06-01 20:10:13', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (400, 1, 1, 'SISTEMA ELECTRICO GENERAL ', NULL, '2022-06-01 20:10:13', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (401, 1, 1, 'SISTEMA ELECTRICO ', NULL, '2022-06-01 20:10:13', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (402, 1, 1, 'CORTE DE CADENA', NULL, '2022-06-01 20:10:13', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (403, 1, 1, 'AJUSTE DE CADENA', NULL, '2022-06-01 20:10:13', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (404, 1, 1, 'CAMBIO DE FOCO DE STOP', NULL, '2022-06-01 20:10:14', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (405, 1, 1, 'CAMBIO FOCO DE STOP AT110, ', NULL, '2022-06-01 20:10:14', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (406, 1, 1, 'CAMBIO DE BONINA ESTATOR SCOOTER, TRABAJO', NULL, '2022-06-01 20:10:14', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (407, 1, 1, 'CAMBIO DE PASTAS DE EMBRAGUE', NULL, '2022-06-01 20:10:14', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (408, 1, 1, 'MANTENIMIENTO AL SISTEMA DE AVANCE ', NULL, '2022-06-01 20:10:14', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (409, 1, 1, 'CAMBIO DE BANDA ', NULL, '2022-06-01 20:10:14', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (410, 1, 1, 'CAMBIO DE VALVULAS SCOOTER Y TRABAJO ', NULL, '2022-06-01 20:10:14', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (411, 1, 1, 'CAMBIO DE JUNTAS DE CILINDRO(ANILLADO)', NULL, '2022-06-01 20:10:14', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (412, 1, 1, 'LIMPIEZA DE CARBURADOR', NULL, '2022-06-01 20:10:14', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (413, 1, 1, 'CAMBIO DE CHICOTE DE FRENO SCOOTER', NULL, '2022-06-01 20:10:14', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (414, 1, 1, 'CAMBIO DE CHICOTE DE FRENO DEL TRABAJO', NULL, '2022-06-01 20:10:14', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (415, 1, 1, 'CAMBIO DE RETEBES DE BARRA C/U', NULL, '2022-06-01 20:10:14', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (416, 1, 1, 'CAMBIO DE BALEROS DE RIN ', NULL, '2022-06-01 20:10:14', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (417, 1, 1, 'CAMBIO DE BALEROS DE TRANSMICION ', NULL, '2022-06-01 20:10:14', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (418, 1, 1, 'CAMBIO DE TASAS DE DIRECCION', NULL, '2022-06-01 20:10:15', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (419, 1, 1, 'CAMBIO DE BUJES DE RIN TRASERO', NULL, '2022-06-01 20:10:15', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (420, 1, 1, 'INSTALACION DE FAROS AUXILIARES', NULL, '2022-06-01 20:10:15', 'VIG', NULL, 1, 6, 6, 1.00);
INSERT INTO `productos` VALUES (421, 1, 3, 'LECTOR CODIGO DE BARRAS', '7503025182414', '2022-06-02 23:25:29', 'VIG', '', 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (422, 1, 6, 'TOTOPOS CHARRICOS', '7501146010388', '2022-06-03 00:06:30', 'VIG', '', 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (423, 1, 6, 'PLAYERA CHIDA', '2500074129433', '2022-06-03 00:14:05', 'VIG', '', 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (424, 1, 6, 'ANTIGRANOS', '7501088559112', '2022-06-03 00:16:11', 'VIG', '', 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (425, 1, 6, 'JUST DANCE 2021', '887256110314', '2022-06-03 00:24:43', 'VIG', '', 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (426, 1, 6, 'FUNKO POP CLASSIC MICKEY', '889698498906', '2022-06-03 00:28:40', 'VIG', '', 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (427, 1, 6, 'CELULAR CHAFA 100 PRZIENTO NO FACE PERDON FAKE\n', '862399041046072', '2022-06-03 00:33:38', 'VIG', '', 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (428, 1, 17, 'AGUA PURIFICADA', '096619334346', '2022-06-03 18:14:44', 'VIG', '', 0, 2, 1, 20.00);
INSERT INTO `productos` VALUES (429, 1, 3, 'GEL ANTIBATECRIAL PATITO', '7503020089855', '2022-06-03 18:16:06', 'VIG', '', 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (430, 1, 3, 'LIBRETA ROJA DE RAYAS', '7508310252117', '2022-06-03 18:17:36', 'VIG', '', 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (431, 1, 3, 'LAPTOP GHIA LIBERO CORE I3 10A GEN/8 GB RAM/256 GB SSD', '7503032754512', '2022-06-03 18:19:49', 'VIG', '', 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (432, 1, 2, 'LAMPARA TRA DM', 'F09030093', '2022-06-06 18:48:07', 'VIG', '', 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (433, 1, 2, 'BOMBA DE FRENO ATV 250', 'F14020220', '2022-06-06 19:05:45', 'VIG', '', 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (434, 1, 2, 'GANCHO RESORTE PARADOR CENTRAL', 'F11030090', '2022-06-06 19:12:00', 'VIG', '', 0, 1, 1, 1.00);
INSERT INTO `productos` VALUES (435, 1, 2, 'ENS BOMBA DE FRENO DEL ', 'F10030107', '2022-06-06 19:31:49', 'VIG', '', 0, 1, 1, 1.00);

-- ----------------------------
-- Table structure for productos_descripciones
-- ----------------------------
DROP TABLE IF EXISTS `productos_descripciones`;
CREATE TABLE `productos_descripciones`  (
  `cve_producto_descripcion` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador de las descripciones de productos',
  `cve_producto` int NOT NULL COMMENT 'Identificador del catálogo de productos',
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Descripción asociada',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_producto_descripcion`) USING BTREE,
  INDEX `fk_producto_producto_descripciones`(`cve_producto` ASC) USING BTREE,
  CONSTRAINT `fk_producto_producto_descripciones` FOREIGN KEY (`cve_producto`) REFERENCES `productos` (`cve_producto`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 590 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Registra las descripciones asociadas a los productos' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of productos_descripciones
-- ----------------------------
INSERT INTO `productos_descripciones` VALUES (1, 1, 'CAJA ITK 26L', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (2, 2, 'PUÑOS ITK D7', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (3, 3, 'FARO C/ CUBIERTA OJO ANGEL LUZ AMARILLO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (4, 4, 'DIRECCIONALES JET', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (5, 5, 'ESPEJO CITY ROAD D1', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (6, 6, 'CANDADO DISCO FRENO AMARILLO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (7, 7, 'CASCO ABATIBLE DOT AZUL L', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (8, 8, 'FILTRO GASOLINA PIRINOLA TRANSP 10 PZAS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (9, 9, 'FILTRO GASOLINA TRANSPARENTE 10 PZAS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (10, 10, 'RED ELASTICA NEGRA (40X40CM)', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (11, 11, 'CADENA TRACCION 428-108', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (12, 12, 'CARBURADOR', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (13, 13, 'CARBURADOR (75-35)', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (14, 14, 'JUEGO CARBURADOR', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (15, 15, 'ESPREA PRINCIPAL #75', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (16, 16, 'ESPREA BAJA #35', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (17, 17, 'CONJUNTO CABEZA DE CILINDRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (18, 18, 'BUJIA GOLD GDR8EA', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (19, 19, 'BUJIA GOLD GCR7HSA', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (20, 20, 'BUJIA B7RTC', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (21, 21, 'EMPAQUE CABEZA CILINDRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (22, 22, 'TORNILLO GUIA 6M*32', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (23, 23, 'PIPETA', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (24, 24, 'PIPETA', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (25, 25, 'PIPETA', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (26, 26, 'CILINDRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (27, 27, 'JUNTA DE CILINDRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (28, 28, 'EMPAQUE CILINDRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (29, 29, 'JUNTA CILINDRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (30, 30, 'EMPAQUE CABEZA CILINDRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (31, 31, 'JUEGO CILINDRO MOTOR CBP250', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (32, 32, 'JUEGO CILINDRO MOTOR CGP180', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (33, 33, 'ARBOL LEVAS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (34, 34, 'SELLO DE VALVULA', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (35, 35, 'ENGRANAJE DE TREN DE VALVULAS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (36, 36, 'CADENA DE CAMARA', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (37, 37, 'CADENA DE CAMARA', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (38, 38, 'GUIA TENSORA CADENA', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (39, 39, 'CADENA TIEMPO 102 ESLABONES', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (40, 40, 'GUIA CADENA', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (41, 41, 'ENGRANAJE TIEMPO 32T', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (42, 42, 'RODAMIENTO GUIA CADENA', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (43, 43, 'RODAMIENTO TENSOR CADENA', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (44, 44, 'BUZO IMPULSOR DE VALVULA', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (45, 45, 'VARILLA IMPULSORA DE BALANCIN', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (46, 46, 'VALVULA DE ADMISION', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (47, 47, 'VALVULA DE ESCAPE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (48, 48, 'VALVULA ESCAPE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (49, 49, 'JUEGO VALVULAS MOTOR', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (50, 50, 'VALVULA ADMISION', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (51, 51, 'ESTATOR', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (52, 52, 'ESTATOR', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (53, 53, 'ESTATOR', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (54, 54, 'ESTATOR 8 BOBINAS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (55, 55, 'ROTOR', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (56, 56, 'BALERO BOLA RADIAL', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (57, 57, 'RUEDA DENTADA 15T', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (58, 58, 'RUEDA DENTADA 13T', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (59, 59, 'RUEDA DENTADA 16T', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (60, 60, 'RUEDA DENTADA', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (61, 61, 'EMPAQUE DE CAJA DE TRANSMISION', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (62, 62, 'SELLO DE ACEITE 17*29*5', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (63, 63, 'SELLO DE ACEITE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (64, 64, 'EMPAQUE CENTRAL CARTER', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (65, 65, 'BALERO BOLA RADIAL,6002', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (66, 66, 'PISTON', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (67, 67, 'PASADOR DE PISTON', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (68, 68, 'SEGURO PASADOR DE PISTON', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (69, 69, 'JUEGO ANILLOS PISTON', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (70, 70, 'SEGURO PASADOR PISTON', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (71, 71, 'PISTON', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (72, 72, 'PASADOR PISTON 12X33', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (73, 73, 'PISTON', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (74, 74, 'JGO ANILLOS PISTON', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (75, 75, 'PASADOR PISTON', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (76, 76, 'JUEGO PISTON GY6125-STD', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (77, 77, 'JUEGO PISTON C110-STD', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (78, 78, 'JUEGO PISTON CG125-STD', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (79, 79, 'CIGÜEÑAL', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (80, 80, 'CONJUNTO CIGÜENAL', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (81, 81, 'BALERO RADIAL BOLA 6305/P6', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (82, 82, 'BUJE 30X19X9', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (83, 83, 'BOMBA ACEITE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (84, 84, 'RODAMIENTO CADENA', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (85, 85, 'ENGRANAJE IMPULSOR BOMBA ACEITE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (86, 86, 'CADENA BOMBA ACEITE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (87, 87, 'ACCIONADOR DE EMBRAGUE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (88, 88, 'SELECTOR DE CAMBIOS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (89, 89, 'SELLO DE ACEITE,16*28*7', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (90, 90, 'EMPAQUE CUBIERTA DER CARTER', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (91, 91, 'EMPAQUE CUBIERTA DER CARTER', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (92, 92, 'EMPAQUE CUBIERTA CARTER DER', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (93, 93, 'MEDIDOR DE ACEITE GRIS L=26', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (94, 94, 'MEDIDOR DE ACEITE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (95, 95, 'CUBIERTA DECORATIVA IZQ GRIS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (96, 96, 'O-RING, 2.5 *13.8', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (97, 97, 'EMPAQUE CUBIERTA IZQ CARTER', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (98, 98, 'BALERO BOLA RADIAL 63/22P55YA', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (99, 99, 'O-RING 31.7X2.4', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (100, 100, 'JUEGO COMPLETO DE DISCO DE ARR', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (101, 101, 'CHICOTE DE FRENO TRASERO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (102, 102, 'CHICOTE DE VELOCIMETRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (103, 103, 'CHICOTE DE AHOGADOR', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (104, 104, 'CHICOTE DE CLUTCH', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (105, 105, 'CHICOTE DE FRENO DELANTERO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (106, 106, 'CHICOTE VELOCIMETRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (107, 107, 'CHICOTE DE FRENO DELANTERO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (108, 108, 'CHICOTE DEL VELOCIMETRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (109, 109, 'CHICOTE DE VELOCIMETRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (110, 110, 'CHICOTE EMBRAGUE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (111, 111, 'CHICOTE VELOCIMETRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (112, 112, 'CHICOTE ACELERADOR', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (113, 113, 'CHICOTE VELOCIMETRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (114, 114, 'CHICOTE EMBRAGUE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (115, 115, 'CHICOTE ACELERADOR', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (116, 116, 'CHICOTE VELOCIMETRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (117, 117, 'CHICOTE VELOCIMETRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (118, 118, 'CHICOTE CLUTCH', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (119, 119, 'CHICOTE DE VELOCIMETRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (120, 120, 'CHICOTE VELOCIMETRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (121, 121, 'CHICOTE EMBRAGUE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (122, 122, 'CHICOTE EMBRAGUE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (123, 123, 'CHICOTE FRENO TRAS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (124, 124, 'CHICOTE EMBRAGUE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (125, 125, 'CHICOTE ACELERADOR', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (126, 126, 'CHICOTE CUENTA KILOMETROS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (127, 127, 'CHICOTE VELOCIMETRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (128, 128, 'CONJUNTO DE MANDO IZQ', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (129, 129, 'CONJUNTO DE MANDO DER', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (130, 130, 'SEGURO CHICOTE ACELERADOR', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (131, 131, 'BASE CHICOTE ACELERADOR', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (132, 132, 'CONJUNTO MANDO IZQ', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (133, 133, 'CONJUNTO MANDO DER', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (134, 134, 'CONJUNTO MANDO IZQ', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (135, 135, 'CONJUNTO MANDO IZQ', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (136, 136, 'INTERRUPTOR EMERGENCIA', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (137, 137, 'ENSAMBLE PALANCA ACELERADOR', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (138, 138, 'CONJUNTO MANDO IZQ', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (139, 139, 'BATERIA MF-FA I12N7-3B', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (140, 140, 'BATERIA MF-FA ICB6L-B', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (141, 141, 'BATERIA MF-FA ICB5L-B', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (142, 142, 'BATERIA MF-FA IYTX4L-BS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (143, 143, 'RELE ENCENDIDO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (144, 144, 'RELE DE ENCENDIDO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (145, 145, 'RELE ARRANQUE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (146, 146, 'RECTIFICADOR/REGULADOR', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (147, 147, 'RECTIFICADOR CONJUNTO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (148, 148, 'REGULADOR DE CORRIENTE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (149, 149, 'REGULADOR', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (150, 150, 'REGULADOR RECTIFICADOR', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (151, 151, 'RECTIFICADOR/REGULADOR', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (152, 152, 'UNIDAD CDI', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (153, 153, 'UNIDAD CDI', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (154, 154, 'UNIDAD CDI', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (155, 155, 'UNIDAD CDI', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (156, 156, 'UNIDAD CDI', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (157, 157, 'UNIDAD CDI', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (158, 158, 'UNIDAD CDI', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (159, 159, 'UNIDAD CDI', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (160, 160, 'ARNES PRINCIPAL', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (161, 161, 'CONECTOR USB', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (162, 162, 'ARNES PRINCIPAL', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (163, 163, 'BOBINA IGNICION', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (164, 164, 'BOBINA', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (165, 165, 'BOBINA DE IGNICION', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (166, 166, 'BOBINA DE IGNICION', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (167, 167, 'CUBIERTA ESCAPE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (168, 168, 'CUBIERTA ESCAPE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (169, 169, 'CONJUNTO ESCAPE NEGRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (170, 170, 'DEFENSA TACONERA', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (171, 171, 'UNION DE ESCAPE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (172, 172, 'JUNTA DEL SILENCIADOR', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (173, 173, 'EMPAQUE ESCAPE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (174, 174, 'ELEMENTO FILTRANTE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (175, 175, 'ELEMENTO FILTRANTE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (176, 176, 'ELEMENTO FILTRANTE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (177, 177, 'ELEMENTO FILTRANTE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (178, 178, 'CONJUNTO DE FARO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (179, 179, 'CONJUNTO FARO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (180, 180, 'CONJUNTO FARO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (181, 181, 'CONJUNTO FARO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (182, 182, 'DIRECCIONAL DEL DER', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (183, 183, 'DIRECCIONAL DEL IZQ', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (184, 184, 'REFLEJANTE LATERAL', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (185, 185, 'DIRECCIONAL DERECHA DEL', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (186, 186, 'DIRECCIONAL IZQUIERDA DEL', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (187, 187, 'LED DIRECCIONAL TRAS IZQ', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (188, 188, 'LED DIRECCIONAL TRAS DER', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (189, 189, 'DIRECCIONAL LED DEL IZQ', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (190, 190, 'DIRECCIONAL LED DEL DER', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (191, 191, 'LAMPARA LED LATERAL IZQ', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (192, 192, 'LED DIRECCIONAL DEL IZQ', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (193, 193, 'DIRECCIONAL TRAS IZQ', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (194, 194, 'DIRECCIONAL TRAS DER', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (195, 195, 'CALAVERA TRASERA, SPORT', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (196, 196, 'CALAVERA DE LEDS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (197, 197, 'FOCO H4 18/18W (1 PZA)', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (198, 198, 'JUEGO ESPEJOS CON LOGO Y LEYENDA', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (199, 199, 'ESPEJO CROMADO DER CON LOGO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (200, 200, 'PUÑO IZQ', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (201, 201, 'PUÑO ACELERADOR', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (202, 202, 'PUÑO ACELERADOR', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (203, 203, 'PUÑO IZQ', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (204, 204, 'PUÑO ACELERADOR', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (205, 205, 'CONTRAPESO MANUBRIO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (206, 206, 'CONTRAPESO MANUBRIO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (207, 207, 'PALANCA IZQUIERDA DE EMBRAGUE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (208, 208, 'PALANCA DERECHA DE FRENO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (209, 209, 'CONJUNTO PALANCA IZQUIERDA', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (210, 210, 'PALANCA DERECHA', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (211, 211, 'CONJUNTO DE PALANCA IZQUIERDA', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (212, 212, 'PALANCA DER FRENO DEL', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (213, 213, 'ENSAMBLE PALANCA IZQ', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (214, 214, 'CONJUNTO PALANCA DER', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (215, 215, 'CONJUNTO PALANCA IZQ', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (216, 216, 'ENS PALANCA IZQ EMBRAGUE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (217, 217, 'CONJUNTO DE PALANCA IZQ', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (218, 218, 'PALANCA IZQ', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (219, 219, 'PALANCA FRENO IZQ', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (220, 220, 'CONJUNTO PALANCA IZQ', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (221, 221, 'ENS PALANCA IZQ EMBRAGUE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (222, 222, 'PALANCA DER FRENO NEGRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (223, 223, 'PALANCA FRENO DER', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (224, 224, 'CONJUNTO PALANCA IZQ', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (225, 225, 'PALANCA FRENO DER', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (226, 226, 'PALANCA DER FRENO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (227, 227, 'PALANCA FRENO DER', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (228, 228, 'MANUBRIO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (229, 229, 'MANUBRIO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (230, 230, 'MANUBRIO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (231, 231, 'BARRA DE POSAPIES', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (232, 232, 'BASE DERECHA DE POSAPIES', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (233, 233, 'GOMA POSAPIE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (234, 234, 'BASE POSAPIE TRA DER', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (235, 235, 'BASE POSAPIE TRAS IZQ', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (236, 236, 'BARRA POSAPIES', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (237, 237, 'POSAPIE TRAS DER', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (238, 238, 'POSAPIE TRAS IZQ', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (239, 239, 'BARRA POSAPIES', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (240, 240, 'PARADOR CENTRAL', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (241, 241, 'GOMA TOPE PARADOR CENTRAL', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (242, 242, 'RESORTE PARADOR CENTRAL', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (243, 243, 'PEDAL DE CAMBIOS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (244, 244, 'RESORTE DE PEDAL DE FRENO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (245, 245, 'PEDAL DE ARRANQUE CROMADO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (246, 246, 'SWITCH FRENO TRASERO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (247, 247, 'JUEGO VARILLA FRENO TRASERO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (248, 248, 'PEDAL DE CAMBIOS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (249, 249, 'PEDAL DE ARRANQUE SPORT', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (250, 250, 'PEDAL DE CAMBIOS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (251, 251, 'VARILLA FRENO TRAS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (252, 252, 'VARILLA FRENO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (253, 253, 'VARILLA FRENO TRAS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (254, 254, 'PEDAL ARRANQUE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (255, 255, 'CUBIERTA SUPERIOR PARACHOQUE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (256, 256, 'CUBIERTA IZQ INT TANQUE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (257, 257, 'CUBIERTA DER INT TANQUE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (258, 258, 'CUBIERTA LATERAL FARO DER', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (259, 259, 'CUBIERTA LATERAL FARO IZQ', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (260, 260, 'CUBIERTA CENTRAL', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (261, 261, 'CUBIERTA INFERIOR PARACHOQUE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (262, 262, 'CUBIERTA FARO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (263, 263, 'CUBIERTA TRAS FARO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (264, 264, 'CUBIERTA FARO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (265, 265, 'CUBIERTA FARO INT NEGRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (266, 266, 'CUBIERTA CENTRAL', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (267, 267, 'CUBIERTA VELOCIMETRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (268, 268, 'CUBIERTA FARO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (269, 269, 'CUBIERTA IZQUIERDA FARO ROJA', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (270, 270, 'CUBIERTA DERECHA FARO ROJA', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (271, 271, 'PROTECTOR PUÑO IZQ', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (272, 272, 'PROTECTOR PUÑO DER', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (273, 273, 'CUBIERTA DER AZUL BLANCO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (274, 274, 'CUBIERTA FARO AZUL', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (275, 275, 'CUBIERTA FARO IZQ AMARILLO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (276, 276, 'CUBIERTA FARO DER AMARILLO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (277, 277, 'CUBIERTA FARO FRONTAL', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (278, 278, 'CUBIERTA POSAPIE DER NEGRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (279, 279, 'CUBIERTA DER NEGRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (280, 280, 'CUBIERTA IZQ NEGRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (281, 281, 'CUBIERTA FR MANUBRIO AZUL CELESTE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (282, 282, 'CUBIERTA MANUBRIO FR AZUL PERLADO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (283, 283, 'ENCARENADO AZUL', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (284, 284, 'CUBIERTA GUANTERA AZUL', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (285, 285, 'CUBIERTA LAT IZQ GRIS NEGRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (286, 286, 'CUBIERTA LAT DER GRIS NEGRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (287, 287, 'CUBIERTA COLA IZQ ROJO NEGRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (288, 288, 'CUBIERTA COLA DER ROJO NEGRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (289, 289, 'CUBIERTA CALAVERA ROJO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (290, 290, 'CUBIERTA TANQUE IZQ ROJO NEGRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (291, 291, 'CUBIERTA DER AZUL', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (292, 292, 'CUBIERTA TANQUE IZQ GRIS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (293, 293, 'CUBIERTA TANQUE DER GRIS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (294, 294, 'CUBIERTA PROTECTOR PUÑO IZQ AZUL', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (295, 295, 'CUBIERTA PROTECTOR PUÑO DER AZUL', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (296, 296, 'CUBIERTA TRAS IZQ NEGRO GRANITO VERDE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (297, 297, 'CAMARA 80/100-21', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (298, 298, 'LLANTA CITY ROAD 3.50-10 (TT)', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (299, 299, 'LLANTA DEL CITY CROSS PIRELLI 2.75-17', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (300, 300, 'DISCO DE FRENO ABS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (301, 301, 'FRENO DELANTERO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (302, 302, 'MANGUERA FRENO DELANTERO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (303, 303, 'ENSAMBLE FRENO DEL DER', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (304, 304, 'ENSAMBLE FRENO DEL IZQ', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (305, 305, 'BALATAS FRENO DEL', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (306, 306, 'ZAPATAS FRENO DEL', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (307, 307, 'BALATAS FRENO DEL', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (308, 308, 'BALATAS FRENO DEL', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (309, 309, 'DISCO FRENO DEL', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (310, 310, 'BALATAS FRENO DEL', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (311, 311, 'CALIPER FRENO DEL NEGRO CON LOGO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (312, 312, 'RAYO EXTERNO RUEDA DEL', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (313, 313, 'RAYO EXT RUEDA DEL 3.2X181', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (314, 314, 'RAYO INT RUEDA DEL 3.2X181', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (315, 315, 'ARO RIN DEL 17X1.60', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (316, 316, 'RIN DEL ROJO 17X1.4', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (317, 317, 'ARO RIN DEL NEGRO 1.4X17', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (318, 318, 'COLLAR INTERNO PLATO TRACCIÓN', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (319, 319, 'EJE DE LA RUEDA DELANTERA', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (320, 320, 'BALERO RADIAL BOLA,6301', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (321, 321, 'BALERO 6202-2RS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (322, 322, 'BALERO 6302-2RS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (323, 323, 'LLANTA 110/80-18', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (324, 324, 'CAMARA 4.10-18', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (325, 325, 'CAMARA 3.00-17', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (326, 326, 'CAMARA 120/80-18', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (327, 327, 'LLANTA S 90/90-17', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (328, 328, 'LLANTA TRAS CITY CROSS PIRELLI 3.00-17', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (329, 329, 'LLANTA CITY ROAD 130/90 - 15', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (330, 330, 'LLANTA CITY ROAD 110/80-17', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (331, 331, 'LLANTA CITY ROAD 130/90 – 10', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (332, 332, 'FRENO TRASERO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (333, 333, 'ZAPATAS DE FRENO TRASERO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (334, 334, 'JUEGO ZAPATAS FRENO TRAS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (335, 335, 'FRENO TRASERO NEGRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (336, 336, 'BOMBA DE FRENO TRASERO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (337, 337, 'BALATAS FRENO TRAS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (338, 338, 'BALATAS FRENO TRAS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (339, 339, 'ZAPATAS FRENO TRAS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (340, 340, 'ZAPATAS FRENO TRAS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (341, 341, 'ZAPATAS FRENO TRAS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (342, 342, 'BALATAS FRENO TRAS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (343, 343, 'BALATAS FRENO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (344, 344, 'ZAPATA FRENO TRAS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (345, 345, 'ENSAMBLE BOMBA FRENO TRAS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (346, 346, 'BRAZO ACCIONADOR BOMBA FRENO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (347, 347, 'RIN TRASERO ALUMINIO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (348, 348, 'ARO RIN TRAS 17X1.60', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (349, 349, 'RAYO INT RUEDA TRAS 3.8X150', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (350, 350, 'RIN TRAS ROJO 17X1.85', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (351, 351, 'EJE RUEDA TRAS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (352, 352, 'EJE DE LA RUEDA TRASERA', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (353, 353, 'ESPACIADOR IZQ EJE TRASERO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (354, 354, 'BALERO 6206-RZ', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (355, 355, 'FLECHA EJE TRASERO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (356, 356, 'FLECHA EJE TRAS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (357, 357, 'EJE RUEDA TRAS M15X260', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (358, 358, 'BUJE EJE TRAS 152X34X27', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (359, 359, 'BUJE MAZA RUEDA TRAS 24X9.3X20.5', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (360, 360, 'EJE RUEDA TRAS M12X225', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (361, 361, 'LODERA DEL', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (362, 362, 'LODERA', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (363, 363, 'SALPICADERA DELANT/ROJO/.', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (364, 364, 'SALPICADERA TRAS NEGRA SPORT', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (365, 365, 'SALPICADERA DEL AZUL BLANCO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (366, 366, 'SALPICADERA DEL GRIS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (367, 367, 'SALPICADERA DEL BLANCO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (368, 368, 'SALPICADERA DEL NEGRO AMARILLO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (369, 369, 'CUBIERTA SALPICADERA TRAS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (370, 370, 'SALPICADERA TRAS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (371, 371, 'SALPICADERA TRAS', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (372, 372, 'BASE SALPICADERA DELANTERA', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (373, 373, 'TANQUE COMBUSTIBLE BLANCO FL', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (374, 374, 'TANQUE COMBUSTIBLE NEGRO', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (375, 375, 'TAPON TANQUE COMBUSTIBLE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (376, 376, 'LLAVE COMBUSTIBLE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (377, 377, 'LLAVE DE GASOLINA', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (378, 378, 'DEPOSITO DE GASOLINA', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (379, 379, 'SENSOR COMBUSTIBLE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (380, 380, 'SENSOR COMBUSTIBLE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (381, 381, 'SENSOR COMBUSTIBLE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (382, 382, 'SENSOR NIVEL COMBUSTIBLE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (383, 383, 'PROTECTOR TANQUE', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (384, 384, 'ACEITE 4 TIEMPOS SAE 20W50 SL', '2022-06-01 19:00:17', 'VIG');
INSERT INTO `productos_descripciones` VALUES (512, 385, '1ER SERVICIO DE MANTENIMIENTO', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (513, 386, '2DO SERVICIO DE MANTENIMIENTO', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (514, 387, 'SERVICIO MANTENIMIENTO COMPLETO', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (515, 388, 'AJUSTE DE PUNTERIAS CARTER CHICO', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (516, 389, 'AJUSTE DE PUNTERIAS CARTER GRANDE', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (517, 390, 'CAMBIO DE LLANTA TRAS MOTO DE TRABAJO', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (518, 391, 'CAMBIO DE LLANTA DEL MOTO DE TRABAJO', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (519, 392, 'CAMBIO DE LLANTA TRASERA MOTONETA ', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (520, 393, 'CAMBIO DE LLANTA DEL DE MOTONETA', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (521, 394, 'CAMBIO DE KIT DE SPROKET', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (522, 395, 'CAMBIO DE FOCO DE FARO', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (523, 396, 'CAMBIO DE BALATA TRAS MOTO DE TRABAJO', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (524, 397, 'CAMBIO DE BALATA TRASERA MOTONETA', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (525, 398, 'CAMBIO DE BALATA DELANTERA MOTONETA', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (526, 399, 'CAMBIO DE CONJ. DE MANIJA IZQ O DER', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (527, 400, 'SISTEMA ELECTRICO GENERAL ', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (528, 401, 'SISTEMA ELECTRICO ', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (529, 402, 'CORTE DE CADENA', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (530, 403, 'AJUSTE DE CADENA', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (531, 404, 'CAMBIO DE FOCO DE STOP', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (532, 405, 'CAMBIO FOCO DE STOP AT110, ', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (533, 406, 'CAMBIO DE BONINA ESTATOR SCOOTER, TRABAJO', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (534, 407, 'CAMBIO DE PASTAS DE EMBRAGUE', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (535, 408, 'MANTENIMIENTO AL SISTEMA DE AVANCE ', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (536, 409, 'CAMBIO DE BANDA ', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (537, 410, 'CAMBIO DE VALVULAS SCOOTER Y TRABAJO ', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (538, 411, 'CAMBIO DE JUNTAS DE CILINDRO(ANILLADO)', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (539, 412, 'LIMPIEZA DE CARBURADOR', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (540, 413, 'CAMBIO DE CHICOTE DE FRENO SCOOTER', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (541, 414, 'CAMBIO DE CHICOTE DE FRENO DEL TRABAJO', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (542, 415, 'CAMBIO DE RETEBES DE BARRA C/U', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (543, 416, 'CAMBIO DE BALEROS DE RIN ', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (544, 417, 'CAMBIO DE BALEROS DE TRANSMICION ', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (545, 418, 'CAMBIO DE TASAS DE DIRECCION', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (546, 419, 'CAMBIO DE BUJES DE RIN TRASERO', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (547, 420, 'INSTALACION DE FAROS AUXILIARES', '2022-06-01 20:14:19', 'VIG');
INSERT INTO `productos_descripciones` VALUES (575, 421, 'LECTOR DE ALTA VELOCIDAD', '2022-06-02 23:25:29', 'VIG');
INSERT INTO `productos_descripciones` VALUES (576, 422, 'TORTILLAS DE MAIZ CON 280 G', '2022-06-03 00:06:30', 'VIG');
INSERT INTO `productos_descripciones` VALUES (577, 423, 'PLAYERA DE GUCCI DE MICKEY MOUSE\n', '2022-06-03 00:14:05', 'VIG');
INSERT INTO `productos_descripciones` VALUES (578, 424, 'COSA QUE QUITA GRANOS Y COSAS INSOPORTABLES', '2022-06-03 00:16:11', 'VIG');
INSERT INTO `productos_descripciones` VALUES (579, 425, 'UN JUEGO MUY  DIVERTIDO DE BAILE CON LAS MEJORES CANCIONES', '2022-06-03 00:24:43', 'VIG');
INSERT INTO `productos_descripciones` VALUES (580, 426, 'FUNKO POP WALT DISNEYARCHIVES PRESERVING THE MAGIC  NUMBER 2 OF THE COLLECTION #789', '2022-06-03 00:28:40', 'VIG');
INSERT INTO `productos_descripciones` VALUES (581, 427, 'NO SE SOLO FOTOS Y MUY POCO ESPACIO TE ESTAFAREMOS :)', '2022-06-03 00:33:38', 'VIG');
INSERT INTO `productos_descripciones` VALUES (582, 428, 'CONTENIDO NETO DE 1L', '2022-06-03 18:14:44', 'VIG');
INSERT INTO `productos_descripciones` VALUES (583, 429, 'CONTENIDO NETO 200ML', '2022-06-03 18:16:06', 'VIG');
INSERT INTO `productos_descripciones` VALUES (584, 430, 'ROCA', '2022-06-03 18:17:36', 'VIG');
INSERT INTO `productos_descripciones` VALUES (585, 431, 'PANTALLA: 14.1” DE DIAGONAL CON RESOLUCIÓN FULL HD LED IPS\nCORE I3 10ª GEN: MEJORA EN LA EXPERIENCIA DE USO, POR LA CAPACIDAD DE RESPUESTA DEL SISTEMA, CON TIEMPOS DE CARGA RÁPIDOS\nWINDOWS 10 HOME: HAZ COSAS INCREÍBLES CON LA SENSACIÓN FAMILIAR DE WINDOWS, SOLO QUE MEJORADA', '2022-06-03 18:19:49', 'VIG');
INSERT INTO `productos_descripciones` VALUES (586, 432, 'DM 150RED', '2022-06-06 18:48:07', 'VIG');
INSERT INTO `productos_descripciones` VALUES (587, 433, 'ATV 250 ', '2022-06-06 19:05:45', 'VIG');
INSERT INTO `productos_descripciones` VALUES (588, 434, 'FT 125', '2022-06-06 19:12:00', 'VIG');
INSERT INTO `productos_descripciones` VALUES (589, 435, '125Z, FL125', '2022-06-06 19:31:49', 'VIG');

-- ----------------------------
-- Table structure for productos_imagenes
-- ----------------------------
DROP TABLE IF EXISTS `productos_imagenes`;
CREATE TABLE `productos_imagenes`  (
  `cve_producto_imagen` int NOT NULL AUTO_INCREMENT COMMENT 'Asociación de imagen a producto',
  `cve_producto` int NOT NULL COMMENT 'Identificador del catálogo de productos',
  `url_imagen` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'URL de la imagen asociada',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_producto_imagen`) USING BTREE,
  INDEX `fk_producto_imagen`(`cve_producto` ASC) USING BTREE,
  CONSTRAINT `fk_producto_imagen` FOREIGN KEY (`cve_producto`) REFERENCES `productos` (`cve_producto`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Registra la asociación de imágenes a los productos' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of productos_imagenes
-- ----------------------------

-- ----------------------------
-- Table structure for productos_sucursales
-- ----------------------------
DROP TABLE IF EXISTS `productos_sucursales`;
CREATE TABLE `productos_sucursales`  (
  `cve_producto_sucursal` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador del producto de una sucursal',
  `cve_sucursal` int NOT NULL COMMENT 'Identificador del catálogo de sucursales',
  `cve_producto` int NOT NULL COMMENT 'Identificador del catálogo de productos',
  `existencia` decimal(11, 2) NULL DEFAULT NULL COMMENT 'Existencia del producto en la sucursal',
  `existencia_minima` decimal(11, 2) NULL DEFAULT NULL COMMENT 'Existencia mínima del producto antes de realizar pedido',
  `ubicacion` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Descripción de la ubicación del producto',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp COMMENT 'Fecha de alta del registro',
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
  INDEX `Ref16`(`cve_sucursal` ASC) USING BTREE,
  INDEX `fk_producto_producto_sucursal`(`cve_producto` ASC) USING BTREE,
  CONSTRAINT `Refsucursales6` FOREIGN KEY (`cve_sucursal`) REFERENCES `sucursales` (`cve_sucursal`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_producto_producto_sucursal` FOREIGN KEY (`cve_producto`) REFERENCES `productos` (`cve_producto`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 436 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Contiene la existencia de productos en una sucursal' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of productos_sucursales
-- ----------------------------
INSERT INTO `productos_sucursales` VALUES (1, 1, 1, 0.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 517.000, 434.280, 629.160, 775.50, 517.00, 1, 50.00, 517.000);
INSERT INTO `productos_sucursales` VALUES (2, 1, 2, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 63.000, 63.000, 91.560, 109.00, 75.00, 1, 45.33, NULL);
INSERT INTO `productos_sucursales` VALUES (3, 1, 3, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 231.000, 231.000, 335.160, 399.00, 275.00, 1, 45.09, NULL);
INSERT INTO `productos_sucursales` VALUES (4, 1, 4, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 86.520, 86.520, 125.160, 149.00, 103.00, 1, 44.66, NULL);
INSERT INTO `productos_sucursales` VALUES (5, 1, 5, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 132.720, 132.720, 192.360, 229.00, 158.00, 1, 44.94, NULL);
INSERT INTO `productos_sucursales` VALUES (6, 1, 6, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 141.960, 141.960, 141.960, 169.00, 169.00, 1, 0.00, NULL);
INSERT INTO `productos_sucursales` VALUES (7, 1, 7, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 694.680, 694.680, 1007.160, 1199.00, 827.00, 1, 44.98, NULL);
INSERT INTO `productos_sucursales` VALUES (8, 1, 8, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 168.000, 168.000, 243.600, 290.00, 200.00, 1, 45.00, NULL);
INSERT INTO `productos_sucursales` VALUES (9, 1, 9, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 87.360, 87.360, 126.000, 150.00, 104.00, 1, 44.23, NULL);
INSERT INTO `productos_sucursales` VALUES (10, 1, 10, 8.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 40.320, 40.320, 57.960, 69.00, 48.00, 1, 43.75, NULL);
INSERT INTO `productos_sucursales` VALUES (11, 1, 11, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 159.600, 159.600, 354.480, 422.00, 190.00, 1, 122.11, NULL);
INSERT INTO `productos_sucursales` VALUES (12, 1, 12, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 339.360, 339.360, 828.240, 986.00, 404.00, 1, 144.06, NULL);
INSERT INTO `productos_sucursales` VALUES (13, 1, 13, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 483.000, 483.000, 1128.960, 1344.00, 575.00, 1, 133.74, NULL);
INSERT INTO `productos_sucursales` VALUES (14, 1, 14, 6.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 102.480, 102.480, 200.760, 239.00, 122.00, 1, 95.90, NULL);
INSERT INTO `productos_sucursales` VALUES (15, 1, 15, 9.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 30.240, 30.240, 56.280, 67.00, 36.00, 1, 86.11, NULL);
INSERT INTO `productos_sucursales` VALUES (16, 1, 16, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 33.600, 33.600, 78.120, 93.00, 40.00, 1, 132.50, NULL);
INSERT INTO `productos_sucursales` VALUES (17, 1, 17, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 379.680, 379.680, 940.800, 1120.00, 452.00, 1, 147.79, NULL);
INSERT INTO `productos_sucursales` VALUES (18, 1, 18, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 15.960, 15.960, 33.600, 40.00, 19.00, 1, 110.53, NULL);
INSERT INTO `productos_sucursales` VALUES (19, 1, 19, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 15.960, 15.960, 33.600, 40.00, 19.00, 1, 110.53, NULL);
INSERT INTO `productos_sucursales` VALUES (20, 1, 20, 80.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 31.920, 31.920, 31.920, 38.00, 38.00, 1, 0.00, NULL);
INSERT INTO `productos_sucursales` VALUES (21, 1, 21, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 151.200, 151.200, 368.760, 439.00, 180.00, 1, 143.89, NULL);
INSERT INTO `productos_sucursales` VALUES (22, 1, 22, 40.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 4.200, 4.200, 7.560, 9.00, 5.00, 1, 80.00, NULL);
INSERT INTO `productos_sucursales` VALUES (23, 1, 23, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 70.560, 70.560, 157.080, 187.00, 84.00, 1, 122.62, NULL);
INSERT INTO `productos_sucursales` VALUES (24, 1, 24, 7.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 45.360, 45.360, 106.680, 127.00, 54.00, 1, 135.19, NULL);
INSERT INTO `productos_sucursales` VALUES (25, 1, 25, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 193.200, 193.200, 428.400, 510.00, 230.00, 1, 121.74, NULL);
INSERT INTO `productos_sucursales` VALUES (26, 1, 26, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 869.400, 869.400, 2135.280, 2542.00, 1035.00, 1, 145.60, NULL);
INSERT INTO `productos_sucursales` VALUES (27, 1, 27, 16.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 2.520, 2.520, 4.200, 5.00, 3.00, 1, 66.67, NULL);
INSERT INTO `productos_sucursales` VALUES (28, 1, 28, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 7.560, 7.560, 16.800, 20.00, 9.00, 1, 122.22, NULL);
INSERT INTO `productos_sucursales` VALUES (29, 1, 29, 20.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 1.680, 1.680, 4.200, 5.00, 2.00, 1, 150.00, NULL);
INSERT INTO `productos_sucursales` VALUES (30, 1, 30, 20.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 19.320, 19.320, 49.560, 59.00, 23.00, 1, 156.52, NULL);
INSERT INTO `productos_sucursales` VALUES (31, 1, 31, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 621.600, 621.600, 1218.840, 1451.00, 740.00, 1, 96.08, NULL);
INSERT INTO `productos_sucursales` VALUES (32, 1, 32, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 467.880, 467.880, 1118.880, 1332.00, 557.00, 1, 139.14, NULL);
INSERT INTO `productos_sucursales` VALUES (33, 1, 33, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 171.360, 171.360, 401.520, 478.00, 204.00, 1, 134.31, NULL);
INSERT INTO `productos_sucursales` VALUES (34, 1, 34, 20.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 10.080, 10.080, 24.360, 29.00, 12.00, 1, 141.67, NULL);
INSERT INTO `productos_sucursales` VALUES (35, 1, 35, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 131.880, 131.880, 293.160, 349.00, 157.00, 1, 122.29, NULL);
INSERT INTO `productos_sucursales` VALUES (36, 1, 36, 10.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 58.800, 58.800, 131.040, 156.00, 70.00, 1, 122.86, NULL);
INSERT INTO `productos_sucursales` VALUES (37, 1, 37, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 63.000, 63.000, 87.360, 104.00, 75.00, 1, 38.67, NULL);
INSERT INTO `productos_sucursales` VALUES (38, 1, 38, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 34.440, 34.440, 81.480, 97.00, 41.00, 1, 136.59, NULL);
INSERT INTO `productos_sucursales` VALUES (39, 1, 39, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 756.000, 756.000, 1814.400, 2160.00, 900.00, 1, 140.00, NULL);
INSERT INTO `productos_sucursales` VALUES (40, 1, 40, 7.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 20.160, 20.160, 48.720, 58.00, 24.00, 1, 141.67, NULL);
INSERT INTO `productos_sucursales` VALUES (41, 1, 41, 7.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 32.760, 32.760, 75.600, 90.00, 39.00, 1, 130.77, NULL);
INSERT INTO `productos_sucursales` VALUES (42, 1, 42, 10.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 10.920, 10.920, 27.720, 33.00, 13.00, 1, 153.85, NULL);
INSERT INTO `productos_sucursales` VALUES (43, 1, 43, 10.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 8.400, 8.400, 21.000, 25.00, 10.00, 1, 150.00, NULL);
INSERT INTO `productos_sucursales` VALUES (44, 1, 44, 8.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 26.040, 26.040, 63.840, 76.00, 31.00, 1, 145.16, NULL);
INSERT INTO `productos_sucursales` VALUES (45, 1, 45, 10.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 13.440, 13.440, 34.440, 41.00, 16.00, 1, 156.25, NULL);
INSERT INTO `productos_sucursales` VALUES (46, 1, 46, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 54.600, 54.600, 105.000, 125.00, 65.00, 1, 92.31, NULL);
INSERT INTO `productos_sucursales` VALUES (47, 1, 47, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 63.000, 63.000, 142.800, 170.00, 75.00, 1, 126.67, NULL);
INSERT INTO `productos_sucursales` VALUES (48, 1, 48, 10.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 49.560, 49.560, 115.920, 138.00, 59.00, 1, 133.90, NULL);
INSERT INTO `productos_sucursales` VALUES (49, 1, 49, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 108.360, 108.360, 241.080, 287.00, 129.00, 1, 122.48, NULL);
INSERT INTO `productos_sucursales` VALUES (50, 1, 50, 10.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 33.600, 33.600, 78.120, 93.00, 40.00, 1, 132.50, NULL);
INSERT INTO `productos_sucursales` VALUES (51, 1, 51, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 211.680, 211.680, 471.240, 561.00, 252.00, 1, 122.62, NULL);
INSERT INTO `productos_sucursales` VALUES (52, 1, 52, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 242.760, 242.760, 607.320, 723.00, 289.00, 1, 150.17, NULL);
INSERT INTO `productos_sucursales` VALUES (53, 1, 53, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 205.800, 205.800, 457.800, 545.00, 245.00, 1, 122.45, NULL);
INSERT INTO `productos_sucursales` VALUES (54, 1, 54, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 300.720, 300.720, 703.920, 838.00, 358.00, 1, 134.08, NULL);
INSERT INTO `productos_sucursales` VALUES (55, 1, 55, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 241.080, 241.080, 477.120, 568.00, 287.00, 1, 97.91, NULL);
INSERT INTO `productos_sucursales` VALUES (56, 1, 56, 30.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 23.520, 23.520, 61.320, 73.00, 28.00, 1, 160.71, NULL);
INSERT INTO `productos_sucursales` VALUES (57, 1, 57, 20.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 37.800, 37.800, 84.000, 100.00, 45.00, 1, 122.22, NULL);
INSERT INTO `productos_sucursales` VALUES (58, 1, 58, 10.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 52.920, 52.920, 122.640, 146.00, 63.00, 1, 131.75, NULL);
INSERT INTO `productos_sucursales` VALUES (59, 1, 59, 10.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 20.160, 20.160, 44.520, 53.00, 24.00, 1, 120.83, NULL);
INSERT INTO `productos_sucursales` VALUES (60, 1, 60, 10.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 30.240, 30.240, 74.760, 89.00, 36.00, 1, 147.22, NULL);
INSERT INTO `productos_sucursales` VALUES (61, 1, 61, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 17.640, 17.640, 24.360, 29.00, 21.00, 1, 38.10, NULL);
INSERT INTO `productos_sucursales` VALUES (62, 1, 62, 16.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 15.120, 15.120, 33.600, 40.00, 18.00, 1, 122.22, NULL);
INSERT INTO `productos_sucursales` VALUES (63, 1, 63, 16.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 11.760, 11.760, 22.680, 27.00, 14.00, 1, 92.86, NULL);
INSERT INTO `productos_sucursales` VALUES (64, 1, 64, 15.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 16.800, 16.800, 36.120, 43.00, 20.00, 1, 115.00, NULL);
INSERT INTO `productos_sucursales` VALUES (65, 1, 65, 20.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 45.360, 45.360, 105.840, 126.00, 54.00, 1, 133.33, NULL);
INSERT INTO `productos_sucursales` VALUES (66, 1, 66, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 157.920, 157.920, 383.880, 457.00, 188.00, 1, 143.09, NULL);
INSERT INTO `productos_sucursales` VALUES (67, 1, 67, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 33.600, 33.600, 73.920, 88.00, 40.00, 1, 120.00, NULL);
INSERT INTO `productos_sucursales` VALUES (68, 1, 68, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 1.680, 1.680, 2.520, 3.00, 2.00, 1, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (69, 1, 69, 6.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 78.120, 78.120, 173.880, 207.00, 93.00, 1, 122.58, NULL);
INSERT INTO `productos_sucursales` VALUES (70, 1, 70, 60.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 0.840, 0.840, 2.520, 3.00, 1.00, 1, 200.00, NULL);
INSERT INTO `productos_sucursales` VALUES (71, 1, 71, 6.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 68.880, 68.880, 153.720, 183.00, 82.00, 1, 123.17, NULL);
INSERT INTO `productos_sucursales` VALUES (72, 1, 72, 20.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 10.920, 10.920, 24.360, 29.00, 13.00, 1, 123.08, NULL);
INSERT INTO `productos_sucursales` VALUES (73, 1, 73, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 247.800, 247.800, 551.040, 656.00, 295.00, 1, 122.37, NULL);
INSERT INTO `productos_sucursales` VALUES (74, 1, 74, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 317.520, 317.520, 706.440, 841.00, 378.00, 1, 122.49, NULL);
INSERT INTO `productos_sucursales` VALUES (75, 1, 75, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 30.240, 30.240, 66.360, 79.00, 36.00, 1, 119.44, NULL);
INSERT INTO `productos_sucursales` VALUES (76, 1, 76, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 99.120, 99.120, 220.920, 263.00, 118.00, 1, 122.88, NULL);
INSERT INTO `productos_sucursales` VALUES (77, 1, 77, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 89.880, 89.880, 201.600, 240.00, 107.00, 1, 124.30, NULL);
INSERT INTO `productos_sucursales` VALUES (78, 1, 78, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 106.680, 106.680, 272.160, 324.00, 127.00, 1, 155.12, NULL);
INSERT INTO `productos_sucursales` VALUES (79, 1, 79, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 595.560, 595.560, 1516.200, 1805.00, 709.00, 1, 154.58, NULL);
INSERT INTO `productos_sucursales` VALUES (80, 1, 80, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 778.680, 778.680, 1821.120, 2168.00, 927.00, 1, 133.87, NULL);
INSERT INTO `productos_sucursales` VALUES (81, 1, 81, 8.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 78.120, 78.120, 173.040, 206.00, 93.00, 1, 121.51, NULL);
INSERT INTO `productos_sucursales` VALUES (82, 1, 82, 10.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 38.640, 38.640, 92.400, 110.00, 46.00, 1, 139.13, NULL);
INSERT INTO `productos_sucursales` VALUES (83, 1, 83, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 102.480, 102.480, 228.480, 272.00, 122.00, 1, 122.95, NULL);
INSERT INTO `productos_sucursales` VALUES (84, 1, 84, 10.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 19.320, 19.320, 47.880, 57.00, 23.00, 1, 147.83, NULL);
INSERT INTO `productos_sucursales` VALUES (85, 1, 85, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 22.680, 22.680, 51.240, 61.00, 27.00, 1, 125.93, NULL);
INSERT INTO `productos_sucursales` VALUES (86, 1, 86, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 45.360, 45.360, 99.960, 119.00, 54.00, 1, 120.37, NULL);
INSERT INTO `productos_sucursales` VALUES (87, 1, 87, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 31.080, 31.080, 65.520, 78.00, 37.00, 1, 110.81, NULL);
INSERT INTO `productos_sucursales` VALUES (88, 1, 88, 10.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 22.680, 22.680, 50.400, 60.00, 27.00, 1, 122.22, NULL);
INSERT INTO `productos_sucursales` VALUES (89, 1, 89, 11.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 11.760, 11.760, 18.480, 22.00, 14.00, 1, 57.14, NULL);
INSERT INTO `productos_sucursales` VALUES (90, 1, 90, 25.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 16.800, 16.800, 36.960, 44.00, 20.00, 1, 120.00, NULL);
INSERT INTO `productos_sucursales` VALUES (91, 1, 91, 21.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 15.120, 15.120, 37.800, 45.00, 18.00, 1, 150.00, NULL);
INSERT INTO `productos_sucursales` VALUES (92, 1, 92, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 24.360, 24.360, 54.600, 65.00, 29.00, 1, 124.14, NULL);
INSERT INTO `productos_sucursales` VALUES (93, 1, 93, 7.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 7.560, 7.560, 18.480, 22.00, 9.00, 1, 144.44, NULL);
INSERT INTO `productos_sucursales` VALUES (94, 1, 94, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 6.720, 6.720, 14.280, 17.00, 8.00, 1, 112.50, NULL);
INSERT INTO `productos_sucursales` VALUES (95, 1, 95, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 14.280, 14.280, 31.920, 38.00, 17.00, 1, 123.53, NULL);
INSERT INTO `productos_sucursales` VALUES (96, 1, 96, 15.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 2.520, 2.520, 2.520, 3.00, 3.00, 1, 0.00, NULL);
INSERT INTO `productos_sucursales` VALUES (97, 1, 97, 20.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 10.920, 10.920, 26.880, 32.00, 13.00, 1, 146.15, NULL);
INSERT INTO `productos_sucursales` VALUES (98, 1, 98, 10.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 82.320, 82.320, 192.360, 229.00, 98.00, 1, 133.67, NULL);
INSERT INTO `productos_sucursales` VALUES (99, 1, 99, 16.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 2.520, 2.520, 5.040, 6.00, 3.00, 1, 100.00, NULL);
INSERT INTO `productos_sucursales` VALUES (100, 1, 100, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 306.600, 306.600, 680.400, 810.00, 365.00, 1, 121.92, NULL);
INSERT INTO `productos_sucursales` VALUES (101, 1, 101, 9.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 42.000, 42.000, 102.480, 122.00, 50.00, 1, 144.00, NULL);
INSERT INTO `productos_sucursales` VALUES (102, 1, 102, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 31.920, 31.920, 71.400, 85.00, 38.00, 1, 123.68, NULL);
INSERT INTO `productos_sucursales` VALUES (103, 1, 103, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 22.680, 22.680, 56.280, 67.00, 27.00, 1, 148.15, NULL);
INSERT INTO `productos_sucursales` VALUES (104, 1, 104, 10.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 22.680, 22.680, 58.800, 70.00, 27.00, 1, 159.26, NULL);
INSERT INTO `productos_sucursales` VALUES (105, 1, 105, 13.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 27.720, 27.720, 70.560, 84.00, 33.00, 1, 154.55, NULL);
INSERT INTO `productos_sucursales` VALUES (106, 1, 106, 9.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 38.640, 38.640, 101.640, 121.00, 46.00, 1, 163.04, NULL);
INSERT INTO `productos_sucursales` VALUES (107, 1, 107, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 63.000, 63.000, 140.280, 167.00, 75.00, 1, 122.67, NULL);
INSERT INTO `productos_sucursales` VALUES (108, 1, 108, 9.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 46.200, 46.200, 113.400, 135.00, 55.00, 1, 145.45, NULL);
INSERT INTO `productos_sucursales` VALUES (109, 1, 109, 10.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 23.520, 23.520, 59.640, 71.00, 28.00, 1, 153.57, NULL);
INSERT INTO `productos_sucursales` VALUES (110, 1, 110, 6.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 26.880, 26.880, 67.200, 80.00, 32.00, 1, 150.00, NULL);
INSERT INTO `productos_sucursales` VALUES (111, 1, 111, 24.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 26.880, 26.880, 58.800, 70.00, 32.00, 1, 118.75, NULL);
INSERT INTO `productos_sucursales` VALUES (112, 1, 112, 20.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 24.360, 24.360, 62.160, 74.00, 29.00, 1, 155.17, NULL);
INSERT INTO `productos_sucursales` VALUES (113, 1, 113, 22.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 47.880, 47.880, 105.840, 126.00, 57.00, 1, 121.05, NULL);
INSERT INTO `productos_sucursales` VALUES (114, 1, 114, 9.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 68.880, 68.880, 153.720, 183.00, 82.00, 1, 123.17, NULL);
INSERT INTO `productos_sucursales` VALUES (115, 1, 115, 10.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 26.880, 26.880, 60.480, 72.00, 32.00, 1, 125.00, NULL);
INSERT INTO `productos_sucursales` VALUES (116, 1, 116, 10.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 38.640, 38.640, 100.800, 120.00, 46.00, 1, 160.87, NULL);
INSERT INTO `productos_sucursales` VALUES (117, 1, 117, 14.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 40.320, 40.320, 98.280, 117.00, 48.00, 1, 143.75, NULL);
INSERT INTO `productos_sucursales` VALUES (118, 1, 118, 12.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 61.320, 61.320, 136.920, 163.00, 73.00, 1, 123.29, NULL);
INSERT INTO `productos_sucursales` VALUES (119, 1, 119, 17.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 33.600, 33.600, 86.520, 103.00, 40.00, 1, 157.50, NULL);
INSERT INTO `productos_sucursales` VALUES (120, 1, 120, 10.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 21.840, 21.840, 54.600, 65.00, 26.00, 1, 150.00, NULL);
INSERT INTO `productos_sucursales` VALUES (121, 1, 121, 23.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 43.680, 43.680, 96.600, 115.00, 52.00, 1, 121.15, NULL);
INSERT INTO `productos_sucursales` VALUES (122, 1, 122, 15.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 22.680, 22.680, 58.800, 70.00, 27.00, 1, 159.26, NULL);
INSERT INTO `productos_sucursales` VALUES (123, 1, 123, 10.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 67.200, 67.200, 171.360, 204.00, 80.00, 1, 155.00, NULL);
INSERT INTO `productos_sucursales` VALUES (124, 1, 124, 19.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 26.880, 26.880, 68.040, 81.00, 32.00, 1, 153.13, NULL);
INSERT INTO `productos_sucursales` VALUES (125, 1, 125, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 83.160, 83.160, 183.960, 219.00, 99.00, 1, 121.21, NULL);
INSERT INTO `productos_sucursales` VALUES (126, 1, 126, 6.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 57.120, 57.120, 127.680, 152.00, 68.00, 1, 123.53, NULL);
INSERT INTO `productos_sucursales` VALUES (127, 1, 127, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 69.720, 69.720, 149.520, 178.00, 83.00, 1, 114.46, NULL);
INSERT INTO `productos_sucursales` VALUES (128, 1, 128, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 65.520, 65.520, 159.600, 190.00, 78.00, 1, 143.59, NULL);
INSERT INTO `productos_sucursales` VALUES (129, 1, 129, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 65.520, 65.520, 160.440, 191.00, 78.00, 1, 144.87, NULL);
INSERT INTO `productos_sucursales` VALUES (130, 1, 130, 10.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 4.200, 4.200, 11.760, 14.00, 5.00, 1, 180.00, NULL);
INSERT INTO `productos_sucursales` VALUES (131, 1, 131, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 42.000, 42.000, 94.080, 112.00, 50.00, 1, 124.00, NULL);
INSERT INTO `productos_sucursales` VALUES (132, 1, 132, 7.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 78.960, 78.960, 174.720, 208.00, 94.00, 1, 121.28, NULL);
INSERT INTO `productos_sucursales` VALUES (133, 1, 133, 13.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 78.960, 78.960, 174.720, 208.00, 94.00, 1, 121.28, NULL);
INSERT INTO `productos_sucursales` VALUES (134, 1, 134, 6.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 131.040, 131.040, 290.640, 346.00, 156.00, 1, 121.79, NULL);
INSERT INTO `productos_sucursales` VALUES (135, 1, 135, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 230.160, 230.160, 511.560, 609.00, 274.00, 1, 122.26, NULL);
INSERT INTO `productos_sucursales` VALUES (136, 1, 136, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 85.680, 85.680, 190.680, 227.00, 102.00, 1, 122.55, NULL);
INSERT INTO `productos_sucursales` VALUES (137, 1, 137, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 374.640, 374.640, 831.600, 990.00, 446.00, 1, 121.97, NULL);
INSERT INTO `productos_sucursales` VALUES (138, 1, 138, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 169.680, 169.680, 391.440, 466.00, 202.00, 1, 130.69, NULL);
INSERT INTO `productos_sucursales` VALUES (139, 1, 139, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 400.680, 400.680, 724.080, 862.00, 477.00, 1, 80.71, NULL);
INSERT INTO `productos_sucursales` VALUES (140, 1, 140, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 319.200, 319.200, 551.040, 656.00, 380.00, 1, 72.63, NULL);
INSERT INTO `productos_sucursales` VALUES (141, 1, 141, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 281.400, 281.400, 508.200, 605.00, 335.00, 1, 80.60, NULL);
INSERT INTO `productos_sucursales` VALUES (142, 1, 142, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 253.680, 253.680, 437.640, 521.00, 302.00, 1, 72.52, NULL);
INSERT INTO `productos_sucursales` VALUES (143, 1, 143, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 68.040, 68.040, 151.200, 180.00, 81.00, 1, 122.22, NULL);
INSERT INTO `productos_sucursales` VALUES (144, 1, 144, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 58.800, 58.800, 130.200, 155.00, 70.00, 1, 121.43, NULL);
INSERT INTO `productos_sucursales` VALUES (145, 1, 145, 9.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 74.760, 74.760, 165.480, 197.00, 89.00, 1, 121.35, NULL);
INSERT INTO `productos_sucursales` VALUES (146, 1, 146, 6.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 48.720, 48.720, 107.520, 128.00, 58.00, 1, 120.69, NULL);
INSERT INTO `productos_sucursales` VALUES (147, 1, 147, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 99.120, 99.120, 220.080, 262.00, 118.00, 1, 122.03, NULL);
INSERT INTO `productos_sucursales` VALUES (148, 1, 148, 8.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 171.360, 171.360, 380.520, 453.00, 204.00, 1, 122.06, NULL);
INSERT INTO `productos_sucursales` VALUES (149, 1, 149, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 108.360, 108.360, 241.080, 287.00, 129.00, 1, 122.48, NULL);
INSERT INTO `productos_sucursales` VALUES (150, 1, 150, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 167.160, 167.160, 372.120, 443.00, 199.00, 1, 122.61, NULL);
INSERT INTO `productos_sucursales` VALUES (151, 1, 151, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 114.240, 114.240, 253.680, 302.00, 136.00, 1, 122.06, NULL);
INSERT INTO `productos_sucursales` VALUES (152, 1, 152, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 96.600, 96.600, 214.200, 255.00, 115.00, 1, 121.74, NULL);
INSERT INTO `productos_sucursales` VALUES (153, 1, 153, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 69.720, 69.720, 155.400, 185.00, 83.00, 1, 122.89, NULL);
INSERT INTO `productos_sucursales` VALUES (154, 1, 154, 6.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 85.680, 85.680, 190.680, 227.00, 102.00, 1, 122.55, NULL);
INSERT INTO `productos_sucursales` VALUES (155, 1, 155, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 109.200, 109.200, 242.760, 289.00, 130.00, 1, 122.31, NULL);
INSERT INTO `productos_sucursales` VALUES (156, 1, 156, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 121.800, 121.800, 271.320, 323.00, 145.00, 1, 122.76, NULL);
INSERT INTO `productos_sucursales` VALUES (157, 1, 157, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 173.880, 173.880, 248.640, 296.00, 207.00, 1, 43.00, NULL);
INSERT INTO `productos_sucursales` VALUES (158, 1, 158, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 57.960, 57.960, 129.360, 154.00, 69.00, 1, 123.19, NULL);
INSERT INTO `productos_sucursales` VALUES (159, 1, 159, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 105.840, 105.840, 266.280, 317.00, 126.00, 1, 151.59, NULL);
INSERT INTO `productos_sucursales` VALUES (160, 1, 160, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 325.080, 325.080, 721.560, 859.00, 387.00, 1, 121.96, NULL);
INSERT INTO `productos_sucursales` VALUES (161, 1, 161, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 166.320, 166.320, 420.840, 501.00, 198.00, 1, 153.03, NULL);
INSERT INTO `productos_sucursales` VALUES (162, 1, 162, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 291.480, 291.480, 744.240, 886.00, 347.00, 1, 155.33, NULL);
INSERT INTO `productos_sucursales` VALUES (163, 1, 163, 6.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 55.440, 55.440, 123.480, 147.00, 66.00, 1, 122.73, NULL);
INSERT INTO `productos_sucursales` VALUES (164, 1, 164, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 61.320, 61.320, 136.080, 162.00, 73.00, 1, 121.92, NULL);
INSERT INTO `productos_sucursales` VALUES (165, 1, 165, 6.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 72.240, 72.240, 161.280, 192.00, 86.00, 1, 123.26, NULL);
INSERT INTO `productos_sucursales` VALUES (166, 1, 166, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 75.600, 75.600, 168.000, 200.00, 90.00, 1, 122.22, NULL);
INSERT INTO `productos_sucursales` VALUES (167, 1, 167, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 132.720, 132.720, 327.600, 390.00, 158.00, 1, 146.84, NULL);
INSERT INTO `productos_sucursales` VALUES (168, 1, 168, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 72.240, 72.240, 160.440, 191.00, 86.00, 1, 122.09, NULL);
INSERT INTO `productos_sucursales` VALUES (169, 1, 169, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 881.160, 881.160, 1958.040, 2331.00, 1049.00, 1, 122.21, NULL);
INSERT INTO `productos_sucursales` VALUES (170, 1, 170, 14.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 23.520, 23.520, 26.880, 32.00, 28.00, 1, 14.29, NULL);
INSERT INTO `productos_sucursales` VALUES (171, 1, 171, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 11.760, 11.760, 21.840, 26.00, 14.00, 1, 85.71, NULL);
INSERT INTO `productos_sucursales` VALUES (172, 1, 172, 10.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 10.080, 10.080, 19.320, 23.00, 12.00, 1, 91.67, NULL);
INSERT INTO `productos_sucursales` VALUES (173, 1, 173, 20.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 4.200, 4.200, 10.920, 13.00, 5.00, 1, 160.00, NULL);
INSERT INTO `productos_sucursales` VALUES (174, 1, 174, 10.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 20.160, 20.160, 52.080, 62.00, 24.00, 1, 158.33, NULL);
INSERT INTO `productos_sucursales` VALUES (175, 1, 175, 8.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 31.080, 31.080, 69.720, 83.00, 37.00, 1, 124.32, NULL);
INSERT INTO `productos_sucursales` VALUES (176, 1, 176, 10.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 37.800, 37.800, 84.840, 101.00, 45.00, 1, 124.44, NULL);
INSERT INTO `productos_sucursales` VALUES (177, 1, 177, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 78.120, 78.120, 173.040, 206.00, 93.00, 1, 121.51, NULL);
INSERT INTO `productos_sucursales` VALUES (178, 1, 178, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 241.920, 241.920, 538.440, 641.00, 288.00, 1, 122.57, NULL);
INSERT INTO `productos_sucursales` VALUES (179, 1, 179, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 448.560, 448.560, 1059.240, 1261.00, 534.00, 1, 136.14, NULL);
INSERT INTO `productos_sucursales` VALUES (180, 1, 180, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 414.120, 414.120, 919.800, 1095.00, 493.00, 1, 122.11, NULL);
INSERT INTO `productos_sucursales` VALUES (181, 1, 181, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 484.680, 484.680, 1076.880, 1282.00, 577.00, 1, 122.18, NULL);
INSERT INTO `productos_sucursales` VALUES (182, 1, 182, 7.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 45.360, 45.360, 115.080, 137.00, 54.00, 1, 153.70, NULL);
INSERT INTO `productos_sucursales` VALUES (183, 1, 183, 6.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 47.880, 47.880, 120.960, 144.00, 57.00, 1, 152.63, NULL);
INSERT INTO `productos_sucursales` VALUES (184, 1, 184, 8.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 14.280, 14.280, 20.160, 24.00, 17.00, 1, 41.18, NULL);
INSERT INTO `productos_sucursales` VALUES (185, 1, 185, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 68.040, 68.040, 171.360, 204.00, 81.00, 1, 151.85, NULL);
INSERT INTO `productos_sucursales` VALUES (186, 1, 186, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 64.680, 64.680, 162.960, 194.00, 77.00, 1, 151.95, NULL);
INSERT INTO `productos_sucursales` VALUES (187, 1, 187, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 159.600, 159.600, 355.320, 423.00, 190.00, 1, 122.63, NULL);
INSERT INTO `productos_sucursales` VALUES (188, 1, 188, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 159.600, 159.600, 355.320, 423.00, 190.00, 1, 122.63, NULL);
INSERT INTO `productos_sucursales` VALUES (189, 1, 189, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 236.880, 236.880, 525.840, 626.00, 282.00, 1, 121.99, NULL);
INSERT INTO `productos_sucursales` VALUES (190, 1, 190, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 236.880, 236.880, 525.840, 626.00, 282.00, 1, 121.99, NULL);
INSERT INTO `productos_sucursales` VALUES (191, 1, 191, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 253.680, 253.680, 653.520, 778.00, 302.00, 1, 157.62, NULL);
INSERT INTO `productos_sucursales` VALUES (192, 1, 192, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 125.160, 125.160, 293.160, 349.00, 149.00, 1, 134.23, NULL);
INSERT INTO `productos_sucursales` VALUES (193, 1, 193, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 87.360, 87.360, 202.440, 241.00, 104.00, 1, 131.73, NULL);
INSERT INTO `productos_sucursales` VALUES (194, 1, 194, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 87.360, 87.360, 202.440, 241.00, 104.00, 1, 131.73, NULL);
INSERT INTO `productos_sucursales` VALUES (195, 1, 195, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 114.240, 114.240, 255.360, 304.00, 136.00, 1, 123.53, NULL);
INSERT INTO `productos_sucursales` VALUES (196, 1, 196, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 393.120, 393.120, 1021.440, 1216.00, 468.00, 1, 159.83, NULL);
INSERT INTO `productos_sucursales` VALUES (197, 1, 197, 10.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 16.800, 16.800, 47.040, 56.00, 20.00, 1, 180.00, NULL);
INSERT INTO `productos_sucursales` VALUES (198, 1, 198, 9.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 57.120, 57.120, 126.000, 150.00, 68.00, 1, 120.59, NULL);
INSERT INTO `productos_sucursales` VALUES (199, 1, 199, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 147.000, 147.000, 325.920, 388.00, 175.00, 1, 121.71, NULL);
INSERT INTO `productos_sucursales` VALUES (200, 1, 200, 10.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 14.280, 14.280, 31.920, 38.00, 17.00, 1, 123.53, NULL);
INSERT INTO `productos_sucursales` VALUES (201, 1, 201, 10.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 15.120, 15.120, 33.600, 40.00, 18.00, 1, 122.22, NULL);
INSERT INTO `productos_sucursales` VALUES (202, 1, 202, 8.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 25.200, 25.200, 48.720, 58.00, 30.00, 1, 93.33, NULL);
INSERT INTO `productos_sucursales` VALUES (203, 1, 203, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 65.520, 65.520, 124.320, 148.00, 78.00, 1, 89.74, NULL);
INSERT INTO `productos_sucursales` VALUES (204, 1, 204, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 29.400, 29.400, 55.440, 66.00, 35.00, 1, 88.57, NULL);
INSERT INTO `productos_sucursales` VALUES (205, 1, 205, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 44.520, 44.520, 84.000, 100.00, 53.00, 1, 88.68, NULL);
INSERT INTO `productos_sucursales` VALUES (206, 1, 206, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 27.720, 27.720, 58.800, 70.00, 33.00, 1, 112.12, NULL);
INSERT INTO `productos_sucursales` VALUES (207, 1, 207, 6.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 55.440, 55.440, 123.480, 147.00, 66.00, 1, 122.73, NULL);
INSERT INTO `productos_sucursales` VALUES (208, 1, 208, 7.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 58.800, 58.800, 131.040, 156.00, 70.00, 1, 122.86, NULL);
INSERT INTO `productos_sucursales` VALUES (209, 1, 209, 12.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 94.080, 94.080, 208.320, 248.00, 112.00, 1, 121.43, NULL);
INSERT INTO `productos_sucursales` VALUES (210, 1, 210, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 51.240, 51.240, 115.920, 138.00, 61.00, 1, 126.23, NULL);
INSERT INTO `productos_sucursales` VALUES (211, 1, 211, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 83.160, 83.160, 210.840, 251.00, 99.00, 1, 153.54, NULL);
INSERT INTO `productos_sucursales` VALUES (212, 1, 212, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 136.920, 136.920, 327.600, 390.00, 163.00, 1, 139.26, NULL);
INSERT INTO `productos_sucursales` VALUES (213, 1, 213, 6.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 94.920, 94.920, 210.840, 251.00, 113.00, 1, 122.12, NULL);
INSERT INTO `productos_sucursales` VALUES (214, 1, 214, 7.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 53.760, 53.760, 131.040, 156.00, 64.00, 1, 143.75, NULL);
INSERT INTO `productos_sucursales` VALUES (215, 1, 215, 6.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 52.920, 52.920, 130.200, 155.00, 63.00, 1, 146.03, NULL);
INSERT INTO `productos_sucursales` VALUES (216, 1, 216, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 99.960, 99.960, 222.600, 265.00, 119.00, 1, 122.69, NULL);
INSERT INTO `productos_sucursales` VALUES (217, 1, 217, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 92.400, 92.400, 205.800, 245.00, 110.00, 1, 122.73, NULL);
INSERT INTO `productos_sucursales` VALUES (218, 1, 218, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 55.440, 55.440, 124.320, 148.00, 66.00, 1, 124.24, NULL);
INSERT INTO `productos_sucursales` VALUES (219, 1, 219, 11.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 84.000, 84.000, 189.840, 226.00, 100.00, 1, 126.00, NULL);
INSERT INTO `productos_sucursales` VALUES (220, 1, 220, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 79.800, 79.800, 177.240, 211.00, 95.00, 1, 122.11, NULL);
INSERT INTO `productos_sucursales` VALUES (221, 1, 221, 8.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 80.640, 80.640, 212.520, 253.00, 96.00, 1, 163.54, NULL);
INSERT INTO `productos_sucursales` VALUES (222, 1, 222, 7.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 52.080, 52.080, 115.080, 137.00, 62.00, 1, 120.97, NULL);
INSERT INTO `productos_sucursales` VALUES (223, 1, 223, 6.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 75.600, 75.600, 184.800, 220.00, 90.00, 1, 144.44, NULL);
INSERT INTO `productos_sucursales` VALUES (224, 1, 224, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 84.000, 84.000, 216.720, 258.00, 100.00, 1, 158.00, NULL);
INSERT INTO `productos_sucursales` VALUES (225, 1, 225, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 85.680, 85.680, 190.680, 227.00, 102.00, 1, 122.55, NULL);
INSERT INTO `productos_sucursales` VALUES (226, 1, 226, 6.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 110.880, 110.880, 246.960, 294.00, 132.00, 1, 122.73, NULL);
INSERT INTO `productos_sucursales` VALUES (227, 1, 227, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 56.280, 56.280, 113.400, 135.00, 67.00, 1, 101.49, NULL);
INSERT INTO `productos_sucursales` VALUES (228, 1, 228, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 182.280, 182.280, 475.440, 566.00, 217.00, 1, 160.83, NULL);
INSERT INTO `productos_sucursales` VALUES (229, 1, 229, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 210.840, 210.840, 467.880, 557.00, 251.00, 1, 121.91, NULL);
INSERT INTO `productos_sucursales` VALUES (230, 1, 230, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 248.640, 248.640, 613.200, 730.00, 296.00, 1, 146.62, NULL);
INSERT INTO `productos_sucursales` VALUES (231, 1, 231, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 105.840, 105.840, 223.440, 266.00, 126.00, 1, 111.11, NULL);
INSERT INTO `productos_sucursales` VALUES (232, 1, 232, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 386.400, 386.400, 855.120, 1018.00, 460.00, 1, 121.30, NULL);
INSERT INTO `productos_sucursales` VALUES (233, 1, 233, 12.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 24.360, 24.360, 53.760, 64.00, 29.00, 1, 120.69, NULL);
INSERT INTO `productos_sucursales` VALUES (234, 1, 234, 8.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 94.920, 94.920, 179.760, 214.00, 113.00, 1, 89.38, NULL);
INSERT INTO `productos_sucursales` VALUES (235, 1, 235, 8.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 87.360, 87.360, 165.480, 197.00, 104.00, 1, 89.42, NULL);
INSERT INTO `productos_sucursales` VALUES (236, 1, 236, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 147.840, 147.840, 278.880, 332.00, 176.00, 1, 88.64, NULL);
INSERT INTO `productos_sucursales` VALUES (237, 1, 237, 8.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 54.600, 54.600, 119.280, 142.00, 65.00, 1, 118.46, NULL);
INSERT INTO `productos_sucursales` VALUES (238, 1, 238, 8.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 54.600, 54.600, 119.280, 142.00, 65.00, 1, 118.46, NULL);
INSERT INTO `productos_sucursales` VALUES (239, 1, 239, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 168.000, 168.000, 373.800, 445.00, 200.00, 1, 122.50, NULL);
INSERT INTO `productos_sucursales` VALUES (240, 1, 240, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 120.960, 120.960, 268.800, 320.00, 144.00, 1, 122.22, NULL);
INSERT INTO `productos_sucursales` VALUES (241, 1, 241, 20.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 9.240, 9.240, 21.000, 25.00, 11.00, 1, 127.27, NULL);
INSERT INTO `productos_sucursales` VALUES (242, 1, 242, 11.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 8.400, 8.400, 14.280, 17.00, 10.00, 1, 70.00, NULL);
INSERT INTO `productos_sucursales` VALUES (243, 1, 243, 9.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 56.280, 56.280, 124.320, 148.00, 67.00, 1, 120.90, NULL);
INSERT INTO `productos_sucursales` VALUES (244, 1, 244, 10.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 6.720, 6.720, 12.600, 15.00, 8.00, 1, 87.50, NULL);
INSERT INTO `productos_sucursales` VALUES (245, 1, 245, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 101.640, 101.640, 247.800, 295.00, 121.00, 1, 143.80, NULL);
INSERT INTO `productos_sucursales` VALUES (246, 1, 246, 20.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 12.600, 12.600, 26.880, 32.00, 15.00, 1, 113.33, NULL);
INSERT INTO `productos_sucursales` VALUES (247, 1, 247, 9.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 22.680, 22.680, 42.840, 51.00, 27.00, 1, 88.89, NULL);
INSERT INTO `productos_sucursales` VALUES (248, 1, 248, 6.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 54.600, 54.600, 133.560, 159.00, 65.00, 1, 144.62, NULL);
INSERT INTO `productos_sucursales` VALUES (249, 1, 249, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 104.160, 104.160, 262.920, 313.00, 124.00, 1, 152.42, NULL);
INSERT INTO `productos_sucursales` VALUES (250, 1, 250, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 88.200, 88.200, 189.840, 226.00, 105.00, 1, 115.24, NULL);
INSERT INTO `productos_sucursales` VALUES (251, 1, 251, 6.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 73.080, 73.080, 122.640, 146.00, 87.00, 1, 67.82, NULL);
INSERT INTO `productos_sucursales` VALUES (252, 1, 252, 6.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 31.920, 31.920, 56.280, 67.00, 38.00, 1, 76.32, NULL);
INSERT INTO `productos_sucursales` VALUES (253, 1, 253, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 31.920, 31.920, 59.640, 71.00, 38.00, 1, 86.84, NULL);
INSERT INTO `productos_sucursales` VALUES (254, 1, 254, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 144.480, 144.480, 321.720, 383.00, 172.00, 1, 122.67, NULL);
INSERT INTO `productos_sucursales` VALUES (255, 1, 255, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 249.480, 249.480, 358.680, 427.00, 297.00, 1, 43.77, NULL);
INSERT INTO `productos_sucursales` VALUES (256, 1, 256, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 16.800, 16.800, 36.960, 44.00, 20.00, 1, 120.00, NULL);
INSERT INTO `productos_sucursales` VALUES (257, 1, 257, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 16.800, 16.800, 36.960, 44.00, 20.00, 1, 120.00, NULL);
INSERT INTO `productos_sucursales` VALUES (258, 1, 258, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 31.920, 31.920, 71.400, 85.00, 38.00, 1, 123.68, NULL);
INSERT INTO `productos_sucursales` VALUES (259, 1, 259, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 31.920, 31.920, 71.400, 85.00, 38.00, 1, 123.68, NULL);
INSERT INTO `productos_sucursales` VALUES (260, 1, 260, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 283.920, 283.920, 558.600, 665.00, 338.00, 1, 96.75, NULL);
INSERT INTO `productos_sucursales` VALUES (261, 1, 261, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 111.720, 111.720, 225.120, 268.00, 133.00, 1, 101.50, NULL);
INSERT INTO `productos_sucursales` VALUES (262, 1, 262, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 94.920, 94.920, 210.840, 251.00, 113.00, 1, 122.12, NULL);
INSERT INTO `productos_sucursales` VALUES (263, 1, 263, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 144.480, 144.480, 367.080, 437.00, 172.00, 1, 154.07, NULL);
INSERT INTO `productos_sucursales` VALUES (264, 1, 264, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 99.960, 99.960, 221.760, 264.00, 119.00, 1, 121.85, NULL);
INSERT INTO `productos_sucursales` VALUES (265, 1, 265, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 63.840, 63.840, 141.120, 168.00, 76.00, 1, 121.05, NULL);
INSERT INTO `productos_sucursales` VALUES (266, 1, 266, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 247.800, 247.800, 550.200, 655.00, 295.00, 1, 122.03, NULL);
INSERT INTO `productos_sucursales` VALUES (267, 1, 267, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 66.360, 66.360, 147.000, 175.00, 79.00, 1, 121.52, NULL);
INSERT INTO `productos_sucursales` VALUES (268, 1, 268, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 82.320, 82.320, 182.280, 217.00, 98.00, 1, 121.43, NULL);
INSERT INTO `productos_sucursales` VALUES (269, 1, 269, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 37.800, 37.800, 83.160, 99.00, 45.00, 1, 120.00, NULL);
INSERT INTO `productos_sucursales` VALUES (270, 1, 270, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 37.800, 37.800, 84.000, 100.00, 45.00, 1, 122.22, NULL);
INSERT INTO `productos_sucursales` VALUES (271, 1, 271, 6.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 15.120, 15.120, 38.640, 46.00, 18.00, 1, 155.56, NULL);
INSERT INTO `productos_sucursales` VALUES (272, 1, 272, 6.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 15.120, 15.120, 37.800, 45.00, 18.00, 1, 150.00, NULL);
INSERT INTO `productos_sucursales` VALUES (273, 1, 273, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 185.640, 185.640, 411.600, 490.00, 221.00, 1, 121.72, NULL);
INSERT INTO `productos_sucursales` VALUES (274, 1, 274, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 222.600, 222.600, 492.240, 586.00, 265.00, 1, 121.13, NULL);
INSERT INTO `productos_sucursales` VALUES (275, 1, 275, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 38.640, 38.640, 86.520, 103.00, 46.00, 1, 123.91, NULL);
INSERT INTO `productos_sucursales` VALUES (276, 1, 276, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 38.640, 38.640, 86.520, 103.00, 46.00, 1, 123.91, NULL);
INSERT INTO `productos_sucursales` VALUES (277, 1, 277, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 24.360, 24.360, 53.760, 64.00, 29.00, 1, 120.69, NULL);
INSERT INTO `productos_sucursales` VALUES (278, 1, 278, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 90.720, 90.720, 231.840, 276.00, 108.00, 1, 155.56, NULL);
INSERT INTO `productos_sucursales` VALUES (279, 1, 279, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 126.000, 126.000, 279.720, 333.00, 150.00, 1, 122.00, NULL);
INSERT INTO `productos_sucursales` VALUES (280, 1, 280, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 126.000, 126.000, 279.720, 333.00, 150.00, 1, 122.00, NULL);
INSERT INTO `productos_sucursales` VALUES (281, 1, 281, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 362.040, 362.040, 821.520, 978.00, 431.00, 1, 126.91, NULL);
INSERT INTO `productos_sucursales` VALUES (282, 1, 282, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 217.560, 217.560, 535.920, 638.00, 259.00, 1, 146.33, NULL);
INSERT INTO `productos_sucursales` VALUES (283, 1, 283, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 1258.320, 1258.320, 2796.360, 3329.00, 1498.00, 1, 122.23, NULL);
INSERT INTO `productos_sucursales` VALUES (284, 1, 284, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 1047.480, 1047.480, 2326.800, 2770.00, 1247.00, 1, 122.13, NULL);
INSERT INTO `productos_sucursales` VALUES (285, 1, 285, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 203.280, 203.280, 467.880, 557.00, 242.00, 1, 130.17, NULL);
INSERT INTO `productos_sucursales` VALUES (286, 1, 286, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 203.280, 203.280, 467.880, 557.00, 242.00, 1, 130.17, NULL);
INSERT INTO `productos_sucursales` VALUES (287, 1, 287, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 267.960, 267.960, 690.480, 822.00, 319.00, 1, 157.68, NULL);
INSERT INTO `productos_sucursales` VALUES (288, 1, 288, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 315.840, 315.840, 801.360, 954.00, 376.00, 1, 153.72, NULL);
INSERT INTO `productos_sucursales` VALUES (289, 1, 289, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 110.880, 110.880, 246.960, 294.00, 132.00, 1, 122.73, NULL);
INSERT INTO `productos_sucursales` VALUES (290, 1, 290, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 267.120, 267.120, 687.120, 818.00, 318.00, 1, 157.23, NULL);
INSERT INTO `productos_sucursales` VALUES (291, 1, 291, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 165.480, 165.480, 418.320, 498.00, 197.00, 1, 152.79, NULL);
INSERT INTO `productos_sucursales` VALUES (292, 1, 292, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 244.440, 244.440, 616.560, 734.00, 291.00, 1, 152.23, NULL);
INSERT INTO `productos_sucursales` VALUES (293, 1, 293, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 244.440, 244.440, 616.560, 734.00, 291.00, 1, 152.23, NULL);
INSERT INTO `productos_sucursales` VALUES (294, 1, 294, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 107.520, 107.520, 272.160, 324.00, 128.00, 1, 153.13, NULL);
INSERT INTO `productos_sucursales` VALUES (295, 1, 295, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 107.520, 107.520, 272.160, 324.00, 128.00, 1, 153.13, NULL);
INSERT INTO `productos_sucursales` VALUES (296, 1, 296, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 191.520, 191.520, 481.320, 573.00, 228.00, 1, 151.32, NULL);
INSERT INTO `productos_sucursales` VALUES (297, 1, 297, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 48.720, 48.720, 91.560, 109.00, 58.00, 1, 87.93, NULL);
INSERT INTO `productos_sucursales` VALUES (298, 1, 298, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 270.480, 270.480, 527.520, 628.00, 322.00, 1, 95.03, NULL);
INSERT INTO `productos_sucursales` VALUES (299, 1, 299, 14.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 839.160, 839.160, 932.400, 1110.00, 999.00, 1, 11.11, NULL);
INSERT INTO `productos_sucursales` VALUES (300, 1, 300, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 199.920, 199.920, 443.520, 528.00, 238.00, 1, 121.85, NULL);
INSERT INTO `productos_sucursales` VALUES (301, 1, 301, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 290.640, 290.640, 645.120, 768.00, 346.00, 1, 121.97, NULL);
INSERT INTO `productos_sucursales` VALUES (302, 1, 302, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 112.560, 112.560, 214.200, 255.00, 134.00, 1, 90.30, NULL);
INSERT INTO `productos_sucursales` VALUES (303, 1, 303, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 519.120, 519.120, 1153.320, 1373.00, 618.00, 1, 122.17, NULL);
INSERT INTO `productos_sucursales` VALUES (304, 1, 304, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 519.120, 519.120, 1153.320, 1373.00, 618.00, 1, 122.17, NULL);
INSERT INTO `productos_sucursales` VALUES (305, 1, 305, 12.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 26.880, 26.880, 60.480, 72.00, 32.00, 1, 125.00, NULL);
INSERT INTO `productos_sucursales` VALUES (306, 1, 306, 8.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 38.640, 38.640, 76.440, 91.00, 46.00, 1, 97.83, NULL);
INSERT INTO `productos_sucursales` VALUES (307, 1, 307, 10.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 32.760, 32.760, 65.520, 78.00, 39.00, 1, 100.00, NULL);
INSERT INTO `productos_sucursales` VALUES (308, 1, 308, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 49.560, 49.560, 58.800, 70.00, 59.00, 1, 18.64, NULL);
INSERT INTO `productos_sucursales` VALUES (309, 1, 309, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 249.480, 249.480, 628.320, 748.00, 297.00, 1, 151.85, NULL);
INSERT INTO `productos_sucursales` VALUES (310, 1, 310, 21.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 42.840, 42.840, 95.760, 114.00, 51.00, 1, 123.53, NULL);
INSERT INTO `productos_sucursales` VALUES (311, 1, 311, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 397.320, 397.320, 397.320, 473.00, 473.00, 1, 0.00, NULL);
INSERT INTO `productos_sucursales` VALUES (312, 1, 312, 65.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 2.520, 2.520, 7.560, 9.00, 3.00, 1, 200.00, NULL);
INSERT INTO `productos_sucursales` VALUES (313, 1, 313, 54.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 3.360, 3.360, 6.720, 8.00, 4.00, 1, 100.00, NULL);
INSERT INTO `productos_sucursales` VALUES (314, 1, 314, 72.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 3.360, 3.360, 6.720, 8.00, 4.00, 1, 100.00, NULL);
INSERT INTO `productos_sucursales` VALUES (315, 1, 315, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 357.840, 357.840, 795.480, 947.00, 426.00, 1, 122.30, NULL);
INSERT INTO `productos_sucursales` VALUES (316, 1, 316, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 1202.040, 1202.040, 2672.040, 3181.00, 1431.00, 1, 122.29, NULL);
INSERT INTO `productos_sucursales` VALUES (317, 1, 317, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 295.680, 295.680, 717.360, 854.00, 352.00, 1, 142.61, NULL);
INSERT INTO `productos_sucursales` VALUES (318, 1, 318, 19.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 13.440, 13.440, 28.560, 34.00, 16.00, 1, 112.50, NULL);
INSERT INTO `productos_sucursales` VALUES (319, 1, 319, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 26.880, 26.880, 51.240, 61.00, 32.00, 1, 90.63, NULL);
INSERT INTO `productos_sucursales` VALUES (320, 1, 320, 30.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 29.400, 29.400, 64.680, 77.00, 35.00, 1, 120.00, NULL);
INSERT INTO `productos_sucursales` VALUES (321, 1, 321, 20.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 36.120, 36.120, 80.640, 96.00, 43.00, 1, 123.26, NULL);
INSERT INTO `productos_sucursales` VALUES (322, 1, 322, 41.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 21.840, 21.840, 21.840, 26.00, 26.00, 1, 0.00, NULL);
INSERT INTO `productos_sucursales` VALUES (323, 1, 323, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 466.200, 466.200, 512.400, 610.00, 555.00, 1, 9.91, NULL);
INSERT INTO `productos_sucursales` VALUES (324, 1, 324, 15.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 64.680, 64.680, 121.800, 145.00, 77.00, 1, 88.31, NULL);
INSERT INTO `productos_sucursales` VALUES (325, 1, 325, 50.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 36.120, 36.120, 74.760, 89.00, 43.00, 1, 106.98, NULL);
INSERT INTO `productos_sucursales` VALUES (326, 1, 326, 12.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 52.920, 52.920, 109.200, 130.00, 63.00, 1, 106.35, NULL);
INSERT INTO `productos_sucursales` VALUES (327, 1, 327, 6.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 342.720, 342.720, 376.320, 448.00, 408.00, 1, 9.80, NULL);
INSERT INTO `productos_sucursales` VALUES (328, 1, 328, 14.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 1013.880, 1013.880, 1126.440, 1341.00, 1207.00, 1, 11.10, NULL);
INSERT INTO `productos_sucursales` VALUES (329, 1, 329, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 469.560, 469.560, 531.720, 633.00, 559.00, 1, 13.24, NULL);
INSERT INTO `productos_sucursales` VALUES (330, 1, 330, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 489.720, 489.720, 955.080, 1137.00, 583.00, 1, 95.03, NULL);
INSERT INTO `productos_sucursales` VALUES (331, 1, 331, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 470.400, 470.400, 811.440, 966.00, 560.00, 1, 72.50, NULL);
INSERT INTO `productos_sucursales` VALUES (332, 1, 332, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 293.160, 293.160, 651.840, 776.00, 349.00, 1, 122.35, NULL);
INSERT INTO `productos_sucursales` VALUES (333, 1, 333, 20.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 34.440, 34.440, 79.800, 95.00, 41.00, 1, 131.71, NULL);
INSERT INTO `productos_sucursales` VALUES (334, 1, 334, 60.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 35.280, 35.280, 81.480, 97.00, 42.00, 1, 130.95, NULL);
INSERT INTO `productos_sucursales` VALUES (335, 1, 335, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 246.960, 246.960, 630.000, 750.00, 294.00, 1, 155.10, NULL);
INSERT INTO `productos_sucursales` VALUES (336, 1, 336, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 372.960, 372.960, 673.680, 802.00, 444.00, 1, 80.63, NULL);
INSERT INTO `productos_sucursales` VALUES (337, 1, 337, 10.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 146.160, 146.160, 166.320, 198.00, 174.00, 1, 13.79, NULL);
INSERT INTO `productos_sucursales` VALUES (338, 1, 338, 6.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 30.240, 30.240, 59.640, 71.00, 36.00, 1, 97.22, NULL);
INSERT INTO `productos_sucursales` VALUES (339, 1, 339, 10.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 42.840, 42.840, 99.120, 118.00, 51.00, 1, 131.37, NULL);
INSERT INTO `productos_sucursales` VALUES (340, 1, 340, 25.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 40.320, 40.320, 79.800, 95.00, 48.00, 1, 97.92, NULL);
INSERT INTO `productos_sucursales` VALUES (341, 1, 341, 30.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 55.440, 55.440, 110.880, 132.00, 66.00, 1, 100.00, NULL);
INSERT INTO `productos_sucursales` VALUES (342, 1, 342, 7.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 77.280, 77.280, 88.200, 105.00, 92.00, 1, 14.13, NULL);
INSERT INTO `productos_sucursales` VALUES (343, 1, 343, 14.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 329.280, 329.280, 329.280, 392.00, 392.00, 1, 0.00, NULL);
INSERT INTO `productos_sucursales` VALUES (344, 1, 344, 8.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 110.040, 110.040, 110.040, 131.00, 131.00, 1, 0.00, NULL);
INSERT INTO `productos_sucursales` VALUES (345, 1, 345, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 438.480, 438.480, 1106.280, 1317.00, 522.00, 1, 152.30, NULL);
INSERT INTO `productos_sucursales` VALUES (346, 1, 346, 6.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 77.280, 77.280, 172.200, 205.00, 92.00, 1, 122.83, NULL);
INSERT INTO `productos_sucursales` VALUES (347, 1, 347, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 952.560, 952.560, 2116.800, 2520.00, 1134.00, 1, 122.22, NULL);
INSERT INTO `productos_sucursales` VALUES (348, 1, 348, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 317.520, 317.520, 744.240, 886.00, 378.00, 1, 134.39, NULL);
INSERT INTO `productos_sucursales` VALUES (349, 1, 349, 108.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 2.520, 2.520, 6.720, 8.00, 3.00, 1, 166.67, NULL);
INSERT INTO `productos_sucursales` VALUES (350, 1, 350, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 1381.800, 1381.800, 3070.200, 3655.00, 1645.00, 1, 122.19, NULL);
INSERT INTO `productos_sucursales` VALUES (351, 1, 351, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 28.560, 28.560, 54.600, 65.00, 34.00, 1, 91.18, NULL);
INSERT INTO `productos_sucursales` VALUES (352, 1, 352, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 47.880, 47.880, 89.880, 107.00, 57.00, 1, 87.72, NULL);
INSERT INTO `productos_sucursales` VALUES (353, 1, 353, 20.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 17.640, 17.640, 33.600, 40.00, 21.00, 1, 90.48, NULL);
INSERT INTO `productos_sucursales` VALUES (354, 1, 354, 7.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 84.840, 84.840, 188.160, 224.00, 101.00, 1, 121.78, NULL);
INSERT INTO `productos_sucursales` VALUES (355, 1, 355, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 918.960, 918.960, 1734.600, 2065.00, 1094.00, 1, 88.76, NULL);
INSERT INTO `productos_sucursales` VALUES (356, 1, 356, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 1338.960, 1338.960, 2526.720, 3008.00, 1594.00, 1, 88.71, NULL);
INSERT INTO `productos_sucursales` VALUES (357, 1, 357, 7.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 55.440, 55.440, 105.000, 125.00, 66.00, 1, 89.39, NULL);
INSERT INTO `productos_sucursales` VALUES (358, 1, 358, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 136.080, 136.080, 256.200, 305.00, 162.00, 1, 88.27, NULL);
INSERT INTO `productos_sucursales` VALUES (359, 1, 359, 100.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 15.120, 15.120, 36.120, 43.00, 18.00, 1, 138.89, NULL);
INSERT INTO `productos_sucursales` VALUES (360, 1, 360, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 27.720, 27.720, 52.920, 63.00, 33.00, 1, 90.91, NULL);
INSERT INTO `productos_sucursales` VALUES (361, 1, 361, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 4.200, 4.200, 10.080, 12.00, 5.00, 1, 140.00, NULL);
INSERT INTO `productos_sucursales` VALUES (362, 1, 362, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 15.120, 15.120, 38.640, 46.00, 18.00, 1, 155.56, NULL);
INSERT INTO `productos_sucursales` VALUES (363, 1, 363, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 201.600, 201.600, 447.720, 533.00, 240.00, 1, 122.08, NULL);
INSERT INTO `productos_sucursales` VALUES (364, 1, 364, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 253.680, 253.680, 564.480, 672.00, 302.00, 1, 122.52, NULL);
INSERT INTO `productos_sucursales` VALUES (365, 1, 365, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 337.680, 337.680, 517.440, 616.00, 402.00, 1, 53.23, NULL);
INSERT INTO `productos_sucursales` VALUES (366, 1, 366, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 219.240, 219.240, 546.000, 650.00, 261.00, 1, 149.04, NULL);
INSERT INTO `productos_sucursales` VALUES (367, 1, 367, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 278.040, 278.040, 618.240, 736.00, 331.00, 1, 122.36, NULL);
INSERT INTO `productos_sucursales` VALUES (368, 1, 368, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 277.200, 277.200, 638.400, 760.00, 330.00, 1, 130.30, NULL);
INSERT INTO `productos_sucursales` VALUES (369, 1, 369, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 98.280, 98.280, 236.880, 282.00, 117.00, 1, 141.03, NULL);
INSERT INTO `productos_sucursales` VALUES (370, 1, 370, 2.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 163.800, 163.800, 354.480, 422.00, 195.00, 1, 116.41, NULL);
INSERT INTO `productos_sucursales` VALUES (371, 1, 371, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 105.000, 105.000, 256.200, 305.00, 125.00, 1, 144.00, NULL);
INSERT INTO `productos_sucursales` VALUES (372, 1, 372, 6.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 42.000, 42.000, 107.520, 128.00, 50.00, 1, 156.00, NULL);
INSERT INTO `productos_sucursales` VALUES (373, 1, 373, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 1452.360, 1452.360, 3227.280, 3842.00, 1729.00, 1, 122.21, NULL);
INSERT INTO `productos_sucursales` VALUES (374, 1, 374, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 1824.480, 1824.480, 4054.680, 4827.00, 2172.00, 1, 122.24, NULL);
INSERT INTO `productos_sucursales` VALUES (375, 1, 375, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 80.640, 80.640, 179.760, 214.00, 96.00, 1, 122.92, NULL);
INSERT INTO `productos_sucursales` VALUES (376, 1, 376, 7.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 61.320, 61.320, 131.040, 156.00, 73.00, 1, 113.70, NULL);
INSERT INTO `productos_sucursales` VALUES (377, 1, 377, 6.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 63.840, 63.840, 137.760, 164.00, 76.00, 1, 115.79, NULL);
INSERT INTO `productos_sucursales` VALUES (378, 1, 378, 7.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 45.360, 45.360, 99.960, 119.00, 54.00, 1, 120.37, NULL);
INSERT INTO `productos_sucursales` VALUES (379, 1, 379, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 61.320, 61.320, 115.080, 137.00, 73.00, 1, 87.67, NULL);
INSERT INTO `productos_sucursales` VALUES (380, 1, 380, 4.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 63.840, 63.840, 120.960, 144.00, 76.00, 1, 89.47, NULL);
INSERT INTO `productos_sucursales` VALUES (381, 1, 381, 5.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 54.600, 54.600, 131.880, 157.00, 65.00, 1, 141.54, NULL);
INSERT INTO `productos_sucursales` VALUES (382, 1, 382, 3.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 73.920, 73.920, 164.640, 196.00, 88.00, 1, 122.73, NULL);
INSERT INTO `productos_sucursales` VALUES (383, 1, 383, 1.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 125.160, 125.160, 278.040, 331.00, 149.00, 1, 122.15, NULL);
INSERT INTO `productos_sucursales` VALUES (384, 1, 384, 12.00, 1.00, NULL, '2022-06-01 18:21:25', 'VIG', 1478.400, 1478.400, 1596.000, 1596.00, 1760.00, 1, 7.95, NULL);
INSERT INTO `productos_sucursales` VALUES (385, 1, 385, 10000.00, 1.00, NULL, '2022-06-01 20:34:36', 'VIG', 42.000, 42.000, 42.000, 50.00, 50.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (386, 1, 386, 10000.00, 1.00, NULL, '2022-06-01 20:34:47', 'VIG', 42.000, 42.000, 42.000, 50.00, 50.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (387, 1, 387, 10000.00, 1.00, NULL, '2022-06-01 20:34:47', 'VIG', 67.200, 67.200, 67.200, 80.00, 80.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (388, 1, 388, 10000.00, 1.00, NULL, '2022-06-01 20:34:47', 'VIG', 100.800, 100.800, 100.800, 120.00, 120.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (389, 1, 389, 10000.00, 1.00, NULL, '2022-06-01 20:34:47', 'VIG', 210.000, 210.000, 210.000, 250.00, 250.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (390, 1, 390, 9999.00, 1.00, NULL, '2022-06-01 20:34:47', 'VIG', 67.200, 67.200, 67.200, 80.00, 80.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (391, 1, 391, 10000.00, 1.00, NULL, '2022-06-01 20:34:47', 'VIG', 67.200, 67.200, 67.200, 80.00, 80.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (392, 1, 392, 10000.00, 1.00, NULL, '2022-06-01 20:34:47', 'VIG', 100.800, 100.800, 100.800, 120.00, 120.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (393, 1, 393, 10000.00, 1.00, NULL, '2022-06-01 20:34:47', 'VIG', 67.200, 67.200, 67.200, 80.00, 80.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (394, 1, 394, 10000.00, 1.00, NULL, '2022-06-01 20:34:47', 'VIG', 117.600, 117.600, 117.600, 140.00, 140.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (395, 1, 395, 10000.00, 1.00, NULL, '2022-06-01 20:34:47', 'VIG', 33.600, 33.600, 33.600, 40.00, 40.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (396, 1, 396, 10000.00, 1.00, NULL, '2022-06-01 20:34:47', 'VIG', 67.200, 67.200, 67.200, 80.00, 80.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (397, 1, 397, 10000.00, 1.00, NULL, '2022-06-01 20:34:47', 'VIG', 100.800, 100.800, 100.800, 120.00, 120.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (398, 1, 398, 10000.00, 1.00, NULL, '2022-06-01 20:34:47', 'VIG', 100.800, 100.800, 100.800, 120.00, 120.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (399, 1, 399, 10000.00, 1.00, NULL, '2022-06-01 20:34:48', 'VIG', 50.400, 50.400, 50.400, 60.00, 60.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (400, 1, 400, 10000.00, 1.00, NULL, '2022-06-01 20:34:48', 'VIG', 201.600, 201.600, 201.600, 240.00, 240.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (401, 1, 401, 10000.00, 1.00, NULL, '2022-06-01 20:34:48', 'VIG', 126.000, 126.000, 126.000, 150.00, 150.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (402, 1, 402, 10000.00, 1.00, NULL, '2022-06-01 20:34:48', 'VIG', 42.000, 42.000, 42.000, 50.00, 50.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (403, 1, 403, 10000.00, 1.00, NULL, '2022-06-01 20:34:48', 'VIG', 33.600, 33.600, 33.600, 40.00, 40.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (404, 1, 404, 10000.00, 1.00, NULL, '2022-06-01 20:34:48', 'VIG', 33.600, 33.600, 33.600, 40.00, 40.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (405, 1, 405, 10000.00, 1.00, NULL, '2022-06-01 20:34:48', 'VIG', 67.200, 67.200, 67.200, 80.00, 80.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (406, 1, 406, 10000.00, 1.00, NULL, '2022-06-01 20:34:48', 'VIG', 252.000, 252.000, 252.000, 300.00, 300.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (407, 1, 407, 10000.00, 1.00, NULL, '2022-06-01 20:34:48', 'VIG', 319.200, 319.200, 319.200, 380.00, 380.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (408, 1, 408, 10000.00, 1.00, NULL, '2022-06-01 20:34:48', 'VIG', 319.200, 319.200, 319.200, 380.00, 380.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (409, 1, 409, 10000.00, 1.00, NULL, '2022-06-01 20:34:48', 'VIG', 117.600, 117.600, 117.600, 140.00, 140.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (410, 1, 410, 10000.00, 1.00, NULL, '2022-06-01 20:34:48', 'VIG', 336.000, 336.000, 336.000, 400.00, 400.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (411, 1, 411, 10000.00, 1.00, NULL, '2022-06-01 20:34:48', 'VIG', 630.000, 630.000, 630.000, 750.00, 750.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (412, 1, 412, 10000.00, 1.00, NULL, '2022-06-01 20:34:49', 'VIG', 100.800, 100.800, 100.800, 120.00, 120.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (413, 1, 413, 10000.00, 1.00, NULL, '2022-06-01 20:34:49', 'VIG', 117.600, 117.600, 117.600, 140.00, 140.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (414, 1, 414, 10000.00, 1.00, NULL, '2022-06-01 20:34:49', 'VIG', 67.200, 67.200, 67.200, 80.00, 80.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (415, 1, 415, 10000.00, 1.00, NULL, '2022-06-01 20:34:49', 'VIG', 126.000, 126.000, 126.000, 150.00, 150.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (416, 1, 416, 10000.00, 1.00, NULL, '2022-06-01 20:34:49', 'VIG', 75.600, 75.600, 75.600, 90.00, 90.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (417, 1, 417, 10000.00, 1.00, NULL, '2022-06-01 20:34:49', 'VIG', 336.000, 336.000, 336.000, 400.00, 400.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (418, 1, 418, 10000.00, 1.00, NULL, '2022-06-01 20:34:49', 'VIG', 336.000, 336.000, 336.000, 400.00, 400.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (419, 1, 419, 10000.00, 1.00, NULL, '2022-06-01 20:34:49', 'VIG', 151.200, 151.200, 151.200, 180.00, 180.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (420, 1, 420, 10000.00, 1.00, NULL, '2022-06-01 20:34:49', 'VIG', 100.800, 100.800, 100.800, 120.00, 120.00, 0, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (421, 1, 421, 0.00, 0.00, NULL, '2022-06-02 23:25:29', 'VIG', 689.655, 689.655, 1034.414, 1199.92, 800.00, 1, 6.25, NULL);
INSERT INTO `productos_sucursales` VALUES (422, 1, 422, -2.00, 0.00, NULL, '2022-06-03 00:06:30', 'VIG', 21.552, 21.552, 29.095, 33.75, 25.00, 1, 140.00, NULL);
INSERT INTO `productos_sucursales` VALUES (423, 1, 423, -1.00, 0.00, NULL, '2022-06-03 00:14:05', 'VIG', 172.328, 172.328, 206.794, 239.88, 199.90, 1, 10.01, NULL);
INSERT INTO `productos_sucursales` VALUES (424, 1, 424, -9.00, 0.00, NULL, '2022-06-03 00:16:11', 'VIG', 51.293, 51.293, 56.422, 65.45, 59.50, 1, 16.81, NULL);
INSERT INTO `productos_sucursales` VALUES (425, 1, 425, -4.00, 0.00, NULL, '2022-06-03 00:24:43', 'VIG', 257.931, 257.931, 283.724, 329.12, 299.20, 1, 3.34, NULL);
INSERT INTO `productos_sucursales` VALUES (426, 1, 426, -2.00, 0.00, NULL, '2022-06-03 00:28:40', 'VIG', 324.397, 324.397, 334.129, 387.59, 376.30, 1, 0.80, NULL);
INSERT INTO `productos_sucursales` VALUES (427, 1, 427, -3.00, 0.00, NULL, '2022-06-03 00:33:38', 'VIG', 18965.517, 18965.517, 132758.619, 154000.00, 22000.00, 1, 2.73, NULL);
INSERT INTO `productos_sucursales` VALUES (428, 1, 428, 48.00, 0.00, NULL, '2022-06-03 18:14:44', 'VIG', 3.000, 51.724, 3.879, 4.50, 60.00, 1, 50.00, 3.000);
INSERT INTO `productos_sucursales` VALUES (429, 1, 429, -2.00, 0.00, NULL, '2022-06-03 18:16:06', 'VIG', 12.931, 12.931, 19.396, 22.50, 15.00, 1, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (430, 1, 430, -3.00, 0.00, NULL, '2022-06-03 18:17:36', 'VIG', 17.241, 17.241, 25.861, 30.00, 20.00, 1, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (431, 1, 431, -1.00, 0.00, NULL, '2022-06-03 18:19:49', 'VIG', 6896.552, 6896.552, 10344.828, 12000.00, 8000.00, 1, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (432, 1, 432, -1.00, 0.00, NULL, '2022-06-06 18:48:07', 'VIG', 215.517, 215.517, 331.896, 385.00, 250.00, 1, 54.00, NULL);
INSERT INTO `productos_sucursales` VALUES (433, 1, 433, 0.00, 0.00, NULL, '2022-06-06 19:05:45', 'VIG', 689.655, 689.655, 1034.483, 1200.00, 800.00, 1, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (434, 1, 434, 0.00, 0.00, NULL, '2022-06-06 19:12:00', 'VIG', 6.897, 6.897, 10.346, 12.00, 8.00, 1, 50.00, NULL);
INSERT INTO `productos_sucursales` VALUES (435, 1, 435, 0.00, 0.00, NULL, '2022-06-06 19:31:49', 'VIG', 603.448, 603.448, 905.172, 1050.00, 700.00, 1, 50.00, NULL);

-- ----------------------------
-- Table structure for productos_sucursales_impuestos
-- ----------------------------
DROP TABLE IF EXISTS `productos_sucursales_impuestos`;
CREATE TABLE `productos_sucursales_impuestos`  (
  `cve_producto_sucursal_impuesto` int NOT NULL AUTO_INCREMENT,
  `cve_producto_sucursal` int NOT NULL,
  `cve_impuesto` int NOT NULL,
  `fecha_alta` timestamp NULL DEFAULT current_timestamp,
  `estatus_registro` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'VIG',
  PRIMARY KEY (`cve_producto_sucursal_impuesto`) USING BTREE,
  INDEX `fk_cve_producuto_sucursal_tb_impuesto`(`cve_producto_sucursal` ASC) USING BTREE,
  INDEX `fk_cve_impuesto_producto_sucursal`(`cve_impuesto` ASC) USING BTREE,
  CONSTRAINT `fk_cve_impuesto_producto_sucursal` FOREIGN KEY (`cve_impuesto`) REFERENCES `impuestos` (`cve_impuesto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cve_producuto_sucursal_tb_impuesto` FOREIGN KEY (`cve_producto_sucursal`) REFERENCES `productos_sucursales` (`cve_producto_sucursal`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 529 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of productos_sucursales_impuestos
-- ----------------------------
INSERT INTO `productos_sucursales_impuestos` VALUES (1, 1, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (2, 2, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (3, 3, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (4, 4, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (5, 5, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (6, 6, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (7, 7, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (8, 8, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (9, 9, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (10, 10, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (11, 11, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (12, 12, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (13, 13, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (14, 14, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (15, 15, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (16, 16, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (17, 17, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (18, 18, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (19, 19, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (20, 20, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (21, 21, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (22, 22, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (23, 23, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (24, 24, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (25, 25, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (26, 26, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (27, 27, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (28, 28, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (29, 29, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (30, 30, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (31, 31, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (32, 32, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (33, 33, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (34, 34, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (35, 35, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (36, 36, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (37, 37, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (38, 38, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (39, 39, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (40, 40, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (41, 41, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (42, 42, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (43, 43, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (44, 44, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (45, 45, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (46, 46, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (47, 47, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (48, 48, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (49, 49, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (50, 50, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (51, 51, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (52, 52, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (53, 53, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (54, 54, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (55, 55, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (56, 56, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (57, 57, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (58, 58, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (59, 59, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (60, 60, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (61, 61, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (62, 62, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (63, 63, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (64, 64, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (65, 65, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (66, 66, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (67, 67, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (68, 68, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (69, 69, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (70, 70, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (71, 71, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (72, 72, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (73, 73, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (74, 74, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (75, 75, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (76, 76, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (77, 77, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (78, 78, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (79, 79, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (80, 80, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (81, 81, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (82, 82, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (83, 83, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (84, 84, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (85, 85, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (86, 86, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (87, 87, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (88, 88, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (89, 89, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (90, 90, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (91, 91, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (92, 92, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (93, 93, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (94, 94, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (95, 95, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (96, 96, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (97, 97, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (98, 98, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (99, 99, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (100, 100, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (101, 101, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (102, 102, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (103, 103, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (104, 104, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (105, 105, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (106, 106, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (107, 107, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (108, 108, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (109, 109, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (110, 110, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (111, 111, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (112, 112, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (113, 113, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (114, 114, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (115, 115, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (116, 116, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (117, 117, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (118, 118, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (119, 119, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (120, 120, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (121, 121, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (122, 122, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (123, 123, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (124, 124, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (125, 125, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (126, 126, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (127, 127, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (128, 128, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (129, 129, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (130, 130, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (131, 131, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (132, 132, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (133, 133, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (134, 134, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (135, 135, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (136, 136, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (137, 137, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (138, 138, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (139, 139, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (140, 140, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (141, 141, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (142, 142, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (143, 143, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (144, 144, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (145, 145, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (146, 146, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (147, 147, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (148, 148, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (149, 149, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (150, 150, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (151, 151, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (152, 152, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (153, 153, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (154, 154, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (155, 155, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (156, 156, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (157, 157, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (158, 158, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (159, 159, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (160, 160, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (161, 161, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (162, 162, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (163, 163, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (164, 164, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (165, 165, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (166, 166, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (167, 167, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (168, 168, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (169, 169, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (170, 170, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (171, 171, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (172, 172, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (173, 173, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (174, 174, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (175, 175, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (176, 176, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (177, 177, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (178, 178, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (179, 179, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (180, 180, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (181, 181, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (182, 182, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (183, 183, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (184, 184, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (185, 185, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (186, 186, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (187, 187, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (188, 188, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (189, 189, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (190, 190, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (191, 191, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (192, 192, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (193, 193, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (194, 194, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (195, 195, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (196, 196, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (197, 197, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (198, 198, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (199, 199, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (200, 200, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (201, 201, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (202, 202, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (203, 203, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (204, 204, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (205, 205, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (206, 206, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (207, 207, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (208, 208, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (209, 209, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (210, 210, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (211, 211, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (212, 212, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (213, 213, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (214, 214, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (215, 215, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (216, 216, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (217, 217, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (218, 218, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (219, 219, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (220, 220, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (221, 221, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (222, 222, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (223, 223, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (224, 224, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (225, 225, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (226, 226, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (227, 227, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (228, 228, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (229, 229, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (230, 230, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (231, 231, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (232, 232, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (233, 233, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (234, 234, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (235, 235, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (236, 236, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (237, 237, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (238, 238, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (239, 239, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (240, 240, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (241, 241, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (242, 242, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (243, 243, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (244, 244, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (245, 245, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (246, 246, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (247, 247, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (248, 248, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (249, 249, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (250, 250, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (251, 251, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (252, 252, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (253, 253, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (254, 254, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (255, 255, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (256, 256, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (257, 257, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (258, 258, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (259, 259, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (260, 260, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (261, 261, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (262, 262, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (263, 263, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (264, 264, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (265, 265, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (266, 266, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (267, 267, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (268, 268, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (269, 269, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (270, 270, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (271, 271, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (272, 272, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (273, 273, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (274, 274, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (275, 275, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (276, 276, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (277, 277, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (278, 278, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (279, 279, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (280, 280, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (281, 281, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (282, 282, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (283, 283, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (284, 284, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (285, 285, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (286, 286, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (287, 287, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (288, 288, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (289, 289, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (290, 290, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (291, 291, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (292, 292, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (293, 293, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (294, 294, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (295, 295, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (296, 296, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (297, 297, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (298, 298, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (299, 299, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (300, 300, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (301, 301, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (302, 302, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (303, 303, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (304, 304, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (305, 305, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (306, 306, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (307, 307, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (308, 308, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (309, 309, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (310, 310, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (311, 311, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (312, 312, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (313, 313, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (314, 314, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (315, 315, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (316, 316, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (317, 317, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (318, 318, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (319, 319, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (320, 320, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (321, 321, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (322, 322, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (323, 323, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (324, 324, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (325, 325, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (326, 326, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (327, 327, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (328, 328, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (329, 329, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (330, 330, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (331, 331, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (332, 332, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (333, 333, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (334, 334, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (335, 335, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (336, 336, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (337, 337, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (338, 338, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (339, 339, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (340, 340, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (341, 341, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (342, 342, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (343, 343, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (344, 344, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (345, 345, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (346, 346, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (347, 347, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (348, 348, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (349, 349, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (350, 350, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (351, 351, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (352, 352, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (353, 353, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (354, 354, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (355, 355, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (356, 356, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (357, 357, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (358, 358, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (359, 359, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (360, 360, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (361, 361, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (362, 362, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (363, 363, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (364, 364, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (365, 365, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (366, 366, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (367, 367, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (368, 368, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (369, 369, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (370, 370, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (371, 371, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (372, 372, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (373, 373, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (374, 374, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (375, 375, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (376, 376, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (377, 377, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (378, 378, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (379, 379, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (380, 380, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (381, 381, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (382, 382, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (383, 383, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (384, 384, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (385, 385, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (386, 386, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (387, 387, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (388, 388, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (389, 389, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (390, 390, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (391, 391, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (392, 392, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (393, 393, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (394, 394, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (395, 395, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (396, 396, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (397, 397, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (398, 398, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (399, 399, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (400, 400, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (401, 401, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (402, 402, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (403, 403, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (404, 404, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (405, 405, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (406, 406, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (407, 407, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (408, 408, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (409, 409, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (410, 410, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (411, 411, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (412, 412, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (413, 413, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (414, 414, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (415, 415, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (416, 416, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (417, 417, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (418, 418, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (419, 419, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (420, 420, 1, '2022-06-01 20:37:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (512, 421, 1, '2022-06-02 23:25:29', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (513, 422, 1, '2022-06-03 00:06:30', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (514, 423, 1, '2022-06-03 00:14:05', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (515, 424, 1, '2022-06-03 00:16:11', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (516, 425, 1, '2022-06-03 00:24:43', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (517, 426, 1, '2022-06-03 00:28:40', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (519, 427, 1, '2022-06-03 00:36:29', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (520, 428, 1, '2022-06-03 18:14:44', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (521, 429, 1, '2022-06-03 18:16:06', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (522, 430, 1, '2022-06-03 18:17:36', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (523, 431, 1, '2022-06-03 18:19:49', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (524, 432, 1, '2022-06-06 18:48:07', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (525, 433, 1, '2022-06-06 19:05:45', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (526, 434, 1, '2022-06-06 19:12:00', 'VIG');
INSERT INTO `productos_sucursales_impuestos` VALUES (528, 435, 1, '2022-06-06 19:36:21', 'VIG');

-- ----------------------------
-- Table structure for proveedores
-- ----------------------------
DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores`  (
  `cve_proveedor` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de proveedores',
  `proveedor` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nombre o razón social de proveedor',
  `rfc_proveedor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'RFC del proveedor',
  `correo_proveedor` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Correo electrónico del proveedor',
  `celular_proveedor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Número de celular del proveedor',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_proveedor`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Catálogo de proveedores' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proveedores
-- ----------------------------
INSERT INTO `proveedores` VALUES (1, 'REFRI', 'REFI200812R4F', 'refri@gmail.com', '9999999999', '2022-06-03 18:48:47', 'VIG');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `cve_rol` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de roles',
  `cve_empresa` int NULL DEFAULT NULL COMMENT 'Clave del catálogo de empresas',
  `rol` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Descripción o nombre del rol',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_rol`) USING BTREE,
  INDEX `fk_empresa_roles`(`cve_empresa` ASC) USING BTREE,
  CONSTRAINT `fk_empresa_roles` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Catálogo de roles' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 1, 'Administrador', '2022-04-09 17:22:53', 'VIG');
INSERT INTO `roles` VALUES (2, 1, 'Vendedor', '2022-04-09 17:22:53', 'VIG');
INSERT INTO `roles` VALUES (3, 1, 'Cajero', '2022-04-09 17:22:53', 'VIG');
INSERT INTO `roles` VALUES (4, 1, 'Consultor', '2022-04-09 17:22:53', 'VIG');

-- ----------------------------
-- Table structure for roles_accion
-- ----------------------------
DROP TABLE IF EXISTS `roles_accion`;
CREATE TABLE `roles_accion`  (
  `cve_rol_accion` int NOT NULL AUTO_INCREMENT,
  `cve_rol` int NULL DEFAULT NULL,
  `cve_accion` int NULL DEFAULT NULL,
  `fecha_alta` timestamp NULL DEFAULT current_timestamp,
  `estatus_registro` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cve_rol_accion`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles_accion
-- ----------------------------
INSERT INTO `roles_accion` VALUES (1, 1, 1, '2022-04-09 21:53:35', 'VIG');
INSERT INTO `roles_accion` VALUES (2, 1, 2, '2022-04-09 21:53:35', 'VIG');
INSERT INTO `roles_accion` VALUES (3, 1, 3, '2022-04-09 21:53:35', 'VIG');
INSERT INTO `roles_accion` VALUES (4, 1, 4, '2022-04-09 21:53:35', 'VIG');
INSERT INTO `roles_accion` VALUES (5, 1, 5, '2022-04-09 21:53:35', 'VIG');
INSERT INTO `roles_accion` VALUES (6, 1, 6, '2022-04-09 21:53:35', 'VIG');
INSERT INTO `roles_accion` VALUES (7, 1, 7, '2022-04-09 21:53:35', 'VIG');
INSERT INTO `roles_accion` VALUES (8, 1, 8, '2022-05-16 15:12:23', 'VIG');
INSERT INTO `roles_accion` VALUES (9, 2, 1, '2022-05-03 09:54:19', 'VIG');
INSERT INTO `roles_accion` VALUES (10, 2, 2, '2022-05-03 09:54:26', 'VIG');
INSERT INTO `roles_accion` VALUES (11, 2, 3, '2022-05-03 09:54:33', 'VIG');
INSERT INTO `roles_accion` VALUES (12, 2, 4, '2022-05-03 09:54:38', 'VIG');
INSERT INTO `roles_accion` VALUES (13, 2, 5, '2022-05-03 09:54:47', 'VIG');
INSERT INTO `roles_accion` VALUES (14, 3, 1, '2022-05-03 09:55:04', 'VIG');
INSERT INTO `roles_accion` VALUES (15, 3, 2, '2022-05-03 09:55:08', 'VIG');
INSERT INTO `roles_accion` VALUES (16, 3, 3, '2022-05-03 09:55:13', 'VIG');
INSERT INTO `roles_accion` VALUES (17, 3, 4, '2022-05-03 09:55:17', 'VIG');
INSERT INTO `roles_accion` VALUES (18, 3, 5, '2022-05-03 09:55:20', 'VIG');
INSERT INTO `roles_accion` VALUES (19, 3, 6, '2022-05-03 09:55:27', 'VIG');
INSERT INTO `roles_accion` VALUES (20, 3, 7, '2022-05-03 09:55:36', 'VIG');
INSERT INTO `roles_accion` VALUES (21, 3, 8, '2022-05-03 19:50:51', 'VIG');

-- ----------------------------
-- Table structure for roles_menu
-- ----------------------------
DROP TABLE IF EXISTS `roles_menu`;
CREATE TABLE `roles_menu`  (
  `cve_rol_menu` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la asociación de menú a rol ',
  `cve_rol` int NOT NULL COMMENT 'Identificador del catálogo de roles',
  `cve_menu` int NOT NULL COMMENT 'Identificador del catálogo de menús',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_rol_menu`) USING BTREE,
  INDEX `fk_rol_rol_menu`(`cve_rol` ASC) USING BTREE,
  INDEX `fk_menu_rol_menu`(`cve_menu` ASC) USING BTREE,
  CONSTRAINT `fk_menu_rol_menu` FOREIGN KEY (`cve_menu`) REFERENCES `menus` (`cve_menu`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rol_rol_menu` FOREIGN KEY (`cve_rol`) REFERENCES `roles` (`cve_rol`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Asociaciones de menús a roles' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles_menu
-- ----------------------------
INSERT INTO `roles_menu` VALUES (1, 1, 1, '2022-04-09 17:24:24', 'VIG');
INSERT INTO `roles_menu` VALUES (2, 1, 2, '2022-04-09 17:24:24', 'VIG');
INSERT INTO `roles_menu` VALUES (3, 1, 3, '2022-04-09 17:24:24', 'NVI');
INSERT INTO `roles_menu` VALUES (4, 1, 4, '2022-04-09 17:24:24', 'NVI');
INSERT INTO `roles_menu` VALUES (5, 1, 5, '2022-04-09 17:24:24', 'NVI');
INSERT INTO `roles_menu` VALUES (6, 1, 6, '2022-04-09 17:24:24', 'NVI');
INSERT INTO `roles_menu` VALUES (7, 1, 7, '2022-04-09 17:24:24', 'VIG');
INSERT INTO `roles_menu` VALUES (8, 1, 8, '2022-04-09 17:24:24', 'VIG');
INSERT INTO `roles_menu` VALUES (9, 1, 9, '2022-04-09 17:24:24', 'VIG');
INSERT INTO `roles_menu` VALUES (10, 1, 10, '2022-04-09 17:24:24', 'VIG');
INSERT INTO `roles_menu` VALUES (11, 1, 11, '2022-04-09 17:24:24', 'VIG');
INSERT INTO `roles_menu` VALUES (12, 1, 12, '2022-04-09 17:24:24', 'VIG');
INSERT INTO `roles_menu` VALUES (13, 1, 13, '2022-04-09 17:24:24', 'NVG');
INSERT INTO `roles_menu` VALUES (14, 1, 14, '2022-04-09 17:24:24', 'NVG');
INSERT INTO `roles_menu` VALUES (15, 1, 15, '2022-04-09 17:24:24', 'VIG');
INSERT INTO `roles_menu` VALUES (16, 1, 16, '2022-04-09 17:24:24', 'NVG');
INSERT INTO `roles_menu` VALUES (17, 1, 17, '2022-04-09 17:24:24', 'NVG');
INSERT INTO `roles_menu` VALUES (18, 1, 18, '2022-04-09 17:24:24', 'NVG');
INSERT INTO `roles_menu` VALUES (19, 1, 19, '2022-04-09 17:24:24', 'VIG');
INSERT INTO `roles_menu` VALUES (20, 1, 20, '2022-04-09 17:24:24', 'NVG');
INSERT INTO `roles_menu` VALUES (21, 1, 21, '2022-04-09 17:24:24', 'NVG');
INSERT INTO `roles_menu` VALUES (22, 1, 22, '2022-04-09 17:24:24', 'NVG');
INSERT INTO `roles_menu` VALUES (23, 1, 23, '2022-04-09 17:24:24', 'NVG');
INSERT INTO `roles_menu` VALUES (24, 1, 24, '2022-04-09 17:24:24', 'NVG');
INSERT INTO `roles_menu` VALUES (25, 1, 25, '2022-05-02 23:10:36', 'NVG');
INSERT INTO `roles_menu` VALUES (26, 2, 1, '2022-05-24 18:17:47', 'VIG');
INSERT INTO `roles_menu` VALUES (27, 2, 7, '2022-05-24 18:17:47', 'VIG');
INSERT INTO `roles_menu` VALUES (28, 2, 11, '2022-05-24 18:17:47', 'VIG');
INSERT INTO `roles_menu` VALUES (29, 2, 10, '2022-05-24 18:17:47', 'VIG');
INSERT INTO `roles_menu` VALUES (30, 3, 1, '2022-05-24 18:17:47', 'VIG');
INSERT INTO `roles_menu` VALUES (31, 3, 7, '2022-05-24 18:17:47', 'VIG');
INSERT INTO `roles_menu` VALUES (32, 3, 9, '2022-05-24 18:17:47', 'VIG');
INSERT INTO `roles_menu` VALUES (33, 3, 10, '2022-05-24 18:17:47', 'VIG');
INSERT INTO `roles_menu` VALUES (34, 3, 11, '2022-05-24 18:17:47', 'VIG');
INSERT INTO `roles_menu` VALUES (35, 1, 26, '2022-06-01 21:02:58', 'VIG');

-- ----------------------------
-- Table structure for sucursales
-- ----------------------------
DROP TABLE IF EXISTS `sucursales`;
CREATE TABLE `sucursales`  (
  `cve_sucursal` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de sucursales',
  `cve_empresa` int NOT NULL COMMENT 'Identificador del catálogo de empresas',
  `sucursal` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nombre de la sucursal',
  `direccion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Dirección del sucursal',
  `correo_sucursal` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Correo electrónico del sucursal',
  `telefono_sucursal` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Número telefónico de la sucursal',
  `celular_sucursal` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Número celular de la sucursal',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_sucursal`) USING BTREE,
  INDEX `fk_empresa_sucursal`(`cve_empresa` ASC) USING BTREE,
  CONSTRAINT `fk_empresa_sucursal` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Catálogo de sucursales' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sucursales
-- ----------------------------
INSERT INTO `sucursales` VALUES (1, 1, 'MATRIZ', 'AV. RAMON MEDOZA # 103, FRENTE A PLAZA LAS AMERICAS, COL.  JOSE MARIA PINO SUAREZ, VILLAHERMOSA, TABASCO. CP. 86020.', 'refaccionesitalika@gmail.com', '555555555555', '7777777777', '2022-03-08 14:47:46', 'VIG');
INSERT INTO `sucursales` VALUES (2, 1, 'TABASCO 2000', 'AV. PASEO TABASCO 2510, COL. LOS RIOS, TABASCO 2000, VILLAHERMOSA, TABASCO. CP. 86250', 'sucursaltabasco2000@gmail.com', '993356874112', '9932458769', '2022-03-08 14:49:30', 'VIG');
INSERT INTO `sucursales` VALUES (26, 1, 'MATRIZ', 'AV. RAMON MEDOZA # 103, COL. JOSE MARIA PINO SUAREZ, VILLAHERMOSA, TAB. CP. 86020.', 'refaccionesitalika@gmail.com', '9999999999', '6666666666', '2022-06-01 17:45:24', 'VIG');
INSERT INTO `sucursales` VALUES (27, 1, 'MATRIZ', 'AV. RAMON MEDOZA # 103, COL. JOSE MARIA PINO SUAREZ, VILLAHERMOSA, TAB. CP. 86020.', 'refaccionesitalika@gmail.com', '9999999999', '6666666666', '2022-06-01 17:47:32', 'VIG');
INSERT INTO `sucursales` VALUES (28, 1, 'MATRIZ', 'AV. RAMON MEDOZA # 103, COL. JOSE MARIA PINO SUAREZ, VILLAHERMOSA, TAB. CP. 86020.', 'refaccionesitalika@gmail.com', '9999999999', '6666666666', '2022-06-01 18:17:26', 'VIG');

-- ----------------------------
-- Table structure for tecnicos
-- ----------------------------
DROP TABLE IF EXISTS `tecnicos`;
CREATE TABLE `tecnicos`  (
  `cve_tecnico` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de técnicos',
  `cve_empresa` int NOT NULL COMMENT 'Identificador del catálogo de empresas',
  `nombre_tecnico` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nombre completo del técnico',
  `rfc_tecnico` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'RFC del técnico',
  `correo_tecnico` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Correo electrónico del técnico',
  `celular_tecnico` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Número celular del técnico',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_tecnico`) USING BTREE,
  INDEX `idx_empresa_tecnicos`(`cve_empresa` ASC) USING BTREE,
  CONSTRAINT `fk_empresa_tecnicos` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Catálogo de técnicos' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tecnicos
-- ----------------------------
INSERT INTO `tecnicos` VALUES (1, 1, 'Jose Maria Hernández Gerónimo', NULL, NULL, NULL, '2022-06-01 19:32:31', 'VIG');
INSERT INTO `tecnicos` VALUES (2, 1, 'Angel Gabriel Frias Reyes', NULL, NULL, NULL, '2022-06-01 19:32:44', 'VIG');
INSERT INTO `tecnicos` VALUES (3, 1, 'Jose Guadalupe López Perez', NULL, NULL, NULL, '2022-06-01 19:32:55', 'VIG');
INSERT INTO `tecnicos` VALUES (4, 1, 'Ruben Antonio Frias Reyes', NULL, NULL, NULL, '2022-06-01 19:33:23', 'VIG');
INSERT INTO `tecnicos` VALUES (5, 1, 'Hector', NULL, NULL, NULL, '2022-06-01 19:33:34', 'VIG');
INSERT INTO `tecnicos` VALUES (6, 1, 'Domingo', NULL, NULL, NULL, '2022-06-01 19:33:45', 'VIG');

-- ----------------------------
-- Table structure for traspasos_producto_sucursal
-- ----------------------------
DROP TABLE IF EXISTS `traspasos_producto_sucursal`;
CREATE TABLE `traspasos_producto_sucursal`  (
  `cve_traspaso_sucursal` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador del traspaso de producto o material',
  `cve_empresa` int NOT NULL COMMENT 'Identificador del catálogo de empresas',
  `cve_producto_sucursal` int NOT NULL COMMENT 'Identificador del producto en la sucursal',
  `cve_sucursal_origen` int NOT NULL COMMENT 'Identificador de la sucursal origen',
  `cve_sucursal_destino` int NOT NULL COMMENT 'Identificador de la sucursal destino',
  `fecha_traspaso` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha en que se realiza el traspaso',
  `cantidad_traspaso` decimal(11, 2) NULL DEFAULT NULL COMMENT 'Cantidad de producto o material',
  `unidad_medida` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Unidad de medida del producto o material: PIEZA, LITRO, METRO',
  `estatus_traspaso` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Indica el estatus del traspaso: CAPTURADO, ENVIADO, RECIBIDO, CANCELADO',
  `usuario_alta` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Clave de usuario que da de alta el registro',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_traspaso_sucursal`) USING BTREE,
  INDEX `fk_traspaso_producto_sucursal`(`cve_producto_sucursal` ASC) USING BTREE,
  INDEX `fk_empresa_traspasos_sucursal`(`cve_empresa` ASC) USING BTREE,
  INDEX `fk_sucursal_origen`(`cve_sucursal_origen` ASC) USING BTREE,
  INDEX `fk_sucursal_destino`(`cve_sucursal_destino` ASC) USING BTREE,
  CONSTRAINT `fk_empresa_traspasos_sucursal` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sucursal_destino` FOREIGN KEY (`cve_sucursal_destino`) REFERENCES `sucursales` (`cve_sucursal`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sucursal_origen` FOREIGN KEY (`cve_sucursal_origen`) REFERENCES `sucursales` (`cve_sucursal`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_traspaso_producto_sucursal` FOREIGN KEY (`cve_producto_sucursal`) REFERENCES `productos_sucursales` (`cve_producto_sucursal`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Registra los traspasos de productos o material entre sucursales' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of traspasos_producto_sucursal
-- ----------------------------

-- ----------------------------
-- Table structure for unidades
-- ----------------------------
DROP TABLE IF EXISTS `unidades`;
CREATE TABLE `unidades`  (
  `cve_unidad` int NOT NULL AUTO_INCREMENT,
  `cve_empresa` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `estatus_registro` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fecha_alta` timestamp NULL DEFAULT current_timestamp,
  PRIMARY KEY (`cve_unidad`) USING BTREE,
  INDEX `fk_empresas_unidades`(`cve_empresa` ASC) USING BTREE,
  CONSTRAINT `fk_empresas_unidades` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of unidades
-- ----------------------------
INSERT INTO `unidades` VALUES (1, 1, 'PZA', 'PIEZA', 'VIG', '2022-06-01 18:17:26');
INSERT INTO `unidades` VALUES (2, 1, 'CAJA', 'CAJA', 'VIG', '2022-06-01 18:17:26');
INSERT INTO `unidades` VALUES (3, 1, 'KG', 'KILOGRAMO', 'VIG', '2022-06-01 18:17:26');
INSERT INTO `unidades` VALUES (4, 1, 'LT', 'LITRO', 'VIG', '2022-06-01 18:17:26');
INSERT INTO `unidades` VALUES (5, 1, 'M', 'METRO', 'VIG', '2022-06-01 18:17:27');
INSERT INTO `unidades` VALUES (6, 1, 'SERV', 'SERVICIO', 'VIG', '2022-06-01 18:17:27');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `celular` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `cve_empresa` int NULL DEFAULT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `cve_sucursal` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE,
  INDEX `fk_users_empresa`(`cve_empresa` ASC) USING BTREE,
  CONSTRAINT `fk_users_empresa` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Miguel Angel Cruz Garcia', 'miguelcruz', NULL, '$2y$10$Lf5rxaanF7QUf33D3YI9GOWFNzGVbNFJgoT.8yzRi5.ESaQ5n4fUa', NULL, '2022-04-03 16:32:37', '2022-04-03 16:32:37', '9933465024', 'VIG', 1, 'miguelcruz', 1);
INSERT INTO `users` VALUES (4, 'DANIEL VAZQUEZ PERALTA', 'danielvazquez@tabasco.gob.mx', NULL, '$2y$10$YpLiX/WWuTDY2ZdOFkIrMeIY5.o9T0WqFRa3mwQ2mmdixbfDSkAH6', NULL, '2022-04-05 01:48:51', '2022-04-05 01:48:51', NULL, 'VIG', 1, 'danielvazquez', 1);
INSERT INTO `users` VALUES (5, 'JOSE MENDEZ MONDRAGON', 'josecmendez@tabasco.gob.mx', NULL, '$2y$10$S3ISjmMRtfvwZ/YhNj6Bmuoby7Oz.OTIxWgM4dTuIsOeyn9AxOdPa', NULL, '2022-04-05 02:30:13', '2022-04-05 02:30:13', NULL, 'VIG', 1, 'josemendez', 1);
INSERT INTO `users` VALUES (11, 'USUARIO DE VENTAS EN MOSTRADOR', 'ventas@gmail.com', NULL, '$2y$10$lxyOPrBblyP4eApsDoRnG.72qB1C0rXOu.lRoMr6iSim0owzxSIk.', NULL, '2022-06-01 14:46:37', NULL, NULL, 'VIG', 1, 'ventas', 1);
INSERT INTO `users` VALUES (12, 'USUARIO DE CAJAS', 'cajas@gmail.com', NULL, '$2y$10$lxyOPrBblyP4eApsDoRnG.72qB1C0rXOu.lRoMr6iSim0owzxSIk.', NULL, '2022-06-01 14:46:37', NULL, NULL, 'VIG', 1, 'cajas', 1);
INSERT INTO `users` VALUES (13, 'USUARIO ADMINISTRADOR DEL SISTEMA', 'administrador@gmail.com', NULL, '$2y$10$lxyOPrBblyP4eApsDoRnG.72qB1C0rXOu.lRoMr6iSim0owzxSIk.', NULL, '2022-06-01 14:46:37', NULL, NULL, 'VIG', 1, 'admin', 1);
INSERT INTO `users` VALUES (14, 'Argenis Hernández Castillo', '', NULL, '$2y$10$lxyOPrBblyP4eApsDoRnG.72qB1C0rXOu.lRoMr6iSim0owzxSIk.', NULL, '2022-06-01 14:46:37', NULL, NULL, 'VIG', 1, 'argenishc', 1);
INSERT INTO `users` VALUES (35, 'Karen Cecilia Martínez Montalvo', 'karem@italika.com', NULL, '$2y$10$lxyOPrBblyP4eApsDoRnG.72qB1C0rXOu.lRoMr6iSim0owzxSIk.', NULL, '2022-06-01 14:46:37', NULL, NULL, 'VIG', 1, 'karenmm', 1);
INSERT INTO `users` VALUES (36, 'Karen Valeria Morales León ', 'karenmorales@italika.com', NULL, '$2y$10$lxyOPrBblyP4eApsDoRnG.72qB1C0rXOu.lRoMr6iSim0owzxSIk.', NULL, '2022-06-01 14:46:37', NULL, NULL, 'VIG', 1, 'valeriaml', 1);
INSERT INTO `users` VALUES (37, 'Guadalupe Gómez López', 'guadalupe@italika.com', NULL, '$2y$10$lxyOPrBblyP4eApsDoRnG.72qB1C0rXOu.lRoMr6iSim0owzxSIk.', NULL, '2022-06-01 14:46:37', NULL, NULL, 'VIG', 1, 'guadalupegl', 1);
INSERT INTO `users` VALUES (38, 'Vicente Rafael Casillas Diego', 'vicentecasillas25@gmail.com', NULL, '$2y$10$lxyOPrBblyP4eApsDoRnG.72qB1C0rXOu.lRoMr6iSim0owzxSIk.', NULL, '2022-06-01 14:46:37', NULL, NULL, 'VIG', 1, 'vicentercb', 1);
INSERT INTO `users` VALUES (39, 'Jacqueline de la Cruz Fuentes', 'jacqueline@italika.com', NULL, '$2y$10$lxyOPrBblyP4eApsDoRnG.72qB1C0rXOu.lRoMr6iSim0owzxSIk.', NULL, '2022-06-01 16:09:00', NULL, NULL, 'VIG', 1, 'jacquelinecf', 1);

-- ----------------------------
-- Table structure for users_roles
-- ----------------------------
DROP TABLE IF EXISTS `users_roles`;
CREATE TABLE `users_roles`  (
  `cve_usuario_rol` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la asociación del rol al usuario',
  `cve_rol` int NOT NULL COMMENT 'Identificador del catálogo de roles',
  `cve_usuario` bigint UNSIGNED NULL DEFAULT NULL COMMENT 'Identificador del catálogo de usuarios',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_usuario_rol`) USING BTREE,
  INDEX `Ref53`(`cve_rol` ASC) USING BTREE,
  INDEX `fk_usuario_rol`(`cve_usuario` ASC) USING BTREE,
  CONSTRAINT `Refroles3` FOREIGN KEY (`cve_rol`) REFERENCES `roles` (`cve_rol`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_roles_FK` FOREIGN KEY (`cve_usuario`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Registra las asociaciones de los roles a los usuarios' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users_roles
-- ----------------------------
INSERT INTO `users_roles` VALUES (1, 1, 1, '2022-04-09 17:33:15', 'VIG');
INSERT INTO `users_roles` VALUES (2, 1, 5, '2022-04-10 18:17:12', 'VIG');
INSERT INTO `users_roles` VALUES (3, 1, 13, '2022-05-03 10:04:13', 'VIG');
INSERT INTO `users_roles` VALUES (4, 2, 4, '2022-05-03 10:04:25', 'VIG');
INSERT INTO `users_roles` VALUES (5, 3, 12, '2022-05-03 10:04:36', 'VIG');
INSERT INTO `users_roles` VALUES (6, 2, 11, '2022-05-03 17:17:51', 'VIG');
INSERT INTO `users_roles` VALUES (8, 1, 38, '2022-06-01 19:42:16', 'VIG');
INSERT INTO `users_roles` VALUES (9, 2, 14, '2022-06-01 19:42:30', 'VIG');
INSERT INTO `users_roles` VALUES (10, 2, 35, '2022-06-01 19:42:44', 'VIG');
INSERT INTO `users_roles` VALUES (11, 2, 36, '2022-06-01 19:42:50', 'VIG');
INSERT INTO `users_roles` VALUES (12, 2, 37, '2022-06-01 19:42:56', 'VIG');
INSERT INTO `users_roles` VALUES (13, 3, 39, '2022-06-06 19:06:48', 'VIG');

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `cve_usuario` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador del catálogo de usuarios',
  `cve_empresa` int NOT NULL COMMENT 'Identificador del catálogo de empresas',
  `nombre_usuario` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nombre completo del usuario',
  `correo_usuario` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Correo electrónico del usuario',
  `celular_usuario` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Número de celular del usuario',
  `usuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Clave de usuario asignada',
  `contrasenia` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Contraseña encriptada del usuario',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  PRIMARY KEY (`cve_usuario`) USING BTREE,
  INDEX `fk_empresa_usuario`(`cve_empresa` ASC) USING BTREE,
  CONSTRAINT `fk_empresa_usuario` FOREIGN KEY (`cve_empresa`) REFERENCES `empresas` (`cve_empresa`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Catálogo de usuarios' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of usuarios
-- ----------------------------

-- ----------------------------
-- Table structure for ventas
-- ----------------------------
DROP TABLE IF EXISTS `ventas`;
CREATE TABLE `ventas`  (
  `cve_venta` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro de ventas',
  `cve_sucursal` int NOT NULL COMMENT 'Identificador del catálogo de sucursales',
  `cve_cliente` int NOT NULL COMMENT 'Identificador del catálogo de clientes',
  `cve_corte_caja` int NULL DEFAULT NULL COMMENT 'Identificador del corte de caja',
  `cve_tecnico` int NULL DEFAULT NULL COMMENT 'Identificador del catálogo de técnicos',
  `nombre_cliente` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Nombre del cliente de mostrador',
  `tipo_venta` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Indica el tipo de venta: NORMAL, SERVICIO, GARANTÍA',
  `fecha_venta` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha en que se realiza la venta',
  `tipo_comprobante` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Indica el tipo de comprobante: TICKET, FACTURA, CORREO',
  `estatus_venta` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Estatus de la venta: ENCAPTURA, PORPAGAR, PAGADA, ENTREGADA, FACTURAR, CERRADA, CANCELADA',
  `folio_ticket` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Folio del ticket de venta asociado',
  `numero_transaccion` int NULL DEFAULT NULL COMMENT 'Número de transacción asociado',
  `usuario_alta` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Clave de usuario que da de alta el registro',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  `subtotal` decimal(10, 2) NULL DEFAULT NULL,
  `descuento` decimal(10, 2) NULL DEFAULT NULL,
  `total` decimal(10, 2) NULL DEFAULT NULL,
  `cambio` decimal(10, 2) NULL DEFAULT NULL,
  `letra` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `comentario` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `total_compra` decimal(10, 2) NULL DEFAULT NULL,
  `total_utilidad` decimal(10, 2) NULL DEFAULT NULL,
  `subtotal_compra` decimal(10, 2) NULL DEFAULT NULL,
  `subtotal_utilidad` decimal(10, 2) NULL DEFAULT NULL,
  `cve_vendedor` int NULL DEFAULT NULL,
  PRIMARY KEY (`cve_venta`) USING BTREE,
  INDEX `fk_tecnico_venta`(`cve_tecnico` ASC) USING BTREE,
  INDEX `fk_cliente_venta`(`cve_cliente` ASC) USING BTREE,
  INDEX `fk_corte_caja_venta`(`cve_corte_caja` ASC) USING BTREE,
  INDEX `fk_sucursal_venta`(`cve_sucursal` ASC) USING BTREE,
  CONSTRAINT `fk_cliente_venta` FOREIGN KEY (`cve_cliente`) REFERENCES `clientes` (`cve_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_corte_caja_venta` FOREIGN KEY (`cve_corte_caja`) REFERENCES `cortes_cajas` (`cve_corte_caja`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sucursal_venta` FOREIGN KEY (`cve_sucursal`) REFERENCES `sucursales` (`cve_sucursal`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tecnico_venta` FOREIGN KEY (`cve_tecnico`) REFERENCES `tecnicos` (`cve_tecnico`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Registro de las ventas' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ventas
-- ----------------------------
INSERT INTO `ventas` VALUES (1, 1, 1, NULL, NULL, 'MARIO ALBERTO CASTILLO ROJAS', 'NORMAL', '2022-06-01 19:07:11', 'TICKET', 'PAGADA', '6297B8979DAC0', 1, NULL, '2022-06-01 19:05:59', 'VIG', 577.08, 0.00, 687.00, 13.00, 'SEISCIENTOS OCHENTA Y SIETE PESOS 0/100 MNX', '', 389.00, 298.00, 326.76, 250.32, 11);
INSERT INTO `ventas` VALUES (2, 1, 1, NULL, NULL, 'DANIEL VAZQUEZ PERALTA', 'NORMAL', '2022-06-02 23:37:06', 'TICKET', 'PORPAGAR', '629949A274D54', NULL, NULL, '2022-06-02 23:37:06', 'VIG', 5172.07, 0.00, 5999.60, 0.00, 'CINCO MIL NOVECIENTOS NOVENTA Y NUEVE PESOS 60/100 MNX', '', 4000.00, 1999.60, 3448.28, 1723.79, 11);
INSERT INTO `ventas` VALUES (3, 1, 1, NULL, NULL, 'MAMA LUCHA', 'NORMAL', '2022-06-03 00:39:31', 'TICKET', 'PAGADA', '62995843C1608', 1, NULL, '2022-06-03 00:39:31', 'VIG', 398979.23, 0.00, 462815.91, 0.00, 'CUATROCIENTOS SESENTA Y DOS MIL OCHOCIENTOS QUINCE PESOS 91/100 MNX', '', 66760.00, 396055.91, 57551.72, 341427.50, 12);
INSERT INTO `ventas` VALUES (4, 1, 1, NULL, NULL, 'DON PEPE', 'NORMAL', '2022-06-03 00:41:30', 'TICKET', 'PAGADA', '629958BA18EA5', 2, NULL, '2022-06-03 00:41:30', 'VIG', 1270.82, 0.00, 1474.15, 0.00, 'UN MIL CUATROCIENTOS SETENTA Y CUATRO PESOS 15/100 MNX', NULL, 1358.40, 115.75, 1171.03, 99.78, 12);
INSERT INTO `ventas` VALUES (5, 1, 1, NULL, NULL, 'PROBANDO', 'NORMAL', '2022-06-03 00:47:51', 'TICKET', 'PAGADA', '62995A37D39CC', 3, NULL, '2022-06-03 00:47:51', 'VIG', 56.42, 0.00, 65.45, 0.00, 'SESENTA Y CINCO PESOS 45/100 MNX', NULL, 59.50, 5.95, 51.29, 5.13, 12);
INSERT INTO `ventas` VALUES (6, 1, 1, NULL, NULL, 'PRUEBA', 'NORMAL', '2022-06-03 00:48:36', 'TICKET', 'PAGADA', '62995A648498B', 4, NULL, '2022-06-03 00:48:36', 'VIG', 56.42, 0.00, 65.45, 0.00, 'SESENTA Y CINCO PESOS 45/100 MNX', NULL, 59.50, 5.95, 51.29, 5.13, 12);
INSERT INTO `ventas` VALUES (7, 1, 1, NULL, NULL, 'PROBANDO', 'NORMAL', '2022-06-03 00:51:40', 'TICKET', 'PAGADA', '62995B1C464D8', 5, NULL, '2022-06-03 00:51:40', 'VIG', 56.42, 0.00, 65.45, 0.00, 'SESENTA Y CINCO PESOS 45/100 MNX', NULL, 59.50, 5.95, 51.29, 5.13, 12);
INSERT INTO `ventas` VALUES (8, 1, 1, NULL, NULL, 'FFF', 'NORMAL', '2022-06-03 00:55:20', 'TICKET', 'PAGADA', '62995BF804779', 6, NULL, '2022-06-03 00:55:20', 'VIG', 56.42, 0.00, 65.45, 0.00, 'SESENTA Y CINCO PESOS 45/100 MNX', NULL, 59.50, 5.95, 51.29, 5.13, 12);
INSERT INTO `ventas` VALUES (9, 1, 1, NULL, NULL, 'MANUEL BLE VAZQUEZ', 'NORMAL', '2022-06-03 01:03:08', 'TICKET', 'PAGADA', '62995DCCEE79D', 7, NULL, '2022-06-03 01:03:08', 'VIG', 56.42, 0.00, 65.45, 0.00, 'SESENTA Y CINCO PESOS 45/100 MNX', '', 59.50, 5.95, 51.29, 5.13, 12);
INSERT INTO `ventas` VALUES (10, 1, 1, NULL, NULL, 'PROBANDO', 'NORMAL', '2022-06-03 01:04:23', 'TICKET', 'PAGADA', '62995E174469C', 8, NULL, '2022-06-03 01:04:23', 'VIG', 56.42, 0.00, 65.45, 0.00, 'SESENTA Y CINCO PESOS 45/100 MNX', NULL, 59.50, 5.95, 51.29, 5.13, 12);
INSERT INTO `ventas` VALUES (11, 1, 1, NULL, NULL, 'PRUEBA', 'NORMAL', '2022-06-03 01:07:57', 'TICKET', 'PAGADA', '62995EEDE2B0F', 9, NULL, '2022-06-03 01:07:57', 'VIG', 56.42, 0.00, 65.45, 0.00, 'SESENTA Y CINCO PESOS 45/100 MNX', NULL, 59.50, 5.95, 51.29, 5.13, 12);
INSERT INTO `ventas` VALUES (12, 1, 1, NULL, NULL, 'JOSEP RONALDO', 'NORMAL', '2022-06-03 18:41:01', 'TICKET', 'PAGADA', '629A55BDA2EC7', 10, NULL, '2022-06-03 18:41:01', 'VIG', 49.14, 0.00, 57.00, 43.00, 'CINCUENTA Y SIETE PESOS 0/100 MNX', '', 38.00, 19.00, 32.76, 16.38, 5);
INSERT INTO `ventas` VALUES (13, 1, 1, NULL, NULL, 'MIGUEL', 'NORMAL', '2022-06-03 18:51:45', 'TICKET', 'PAGADA', '629A5841778A3', 11, NULL, '2022-06-03 18:51:45', 'VIG', 38.79, 0.00, 45.00, 5.00, 'CUARENTA Y CINCO PESOS 0/100 MNX', '', 30.00, 15.00, 30.00, 8.79, 5);
INSERT INTO `ventas` VALUES (14, 1, 1, NULL, NULL, 'JUAN', 'NORMAL', '2022-06-03 18:55:31', 'TICKET', 'PAGADA', '629A59231F877', 12, NULL, '2022-06-03 18:55:31', 'VIG', 629.16, 0.00, 775.50, 0.00, 'SETECIENTOS SETENTA Y CINCO PESOS 50/100 MNX', '', 517.00, 258.50, 517.00, 112.16, 5);
INSERT INTO `ventas` VALUES (15, 1, 1, NULL, NULL, 'JOJO', 'NORMAL', '2022-06-03 18:59:46', 'TICKET', 'PAGADA', '629A5A220F0B6', 13, NULL, '2022-06-03 18:59:46', 'VIG', 91.56, 0.00, 109.00, 0.00, 'CIENTO NUEVE PESOS 0/100 MNX', NULL, 75.00, 34.00, 63.00, 28.56, 5);
INSERT INTO `ventas` VALUES (16, 1, 1, NULL, NULL, 'JOJO', 'NORMAL', '2022-06-03 19:01:26', 'TICKET', 'PAGADA', '629A5A869C9DE', 14, NULL, '2022-06-03 19:01:26', 'VIG', 629.16, 0.00, 775.50, 0.00, 'SETECIENTOS SETENTA Y CINCO PESOS 50/100 MNX', '', 517.00, 258.50, 517.00, 112.16, 5);
INSERT INTO `ventas` VALUES (17, 1, 1, NULL, NULL, 'JIJI', 'NORMAL', '2022-06-03 19:04:32', 'TICKET', 'PAGADA', '629A5B40531E1', 15, NULL, '2022-06-03 19:04:32', 'VIG', 10626.62, 0.00, 12326.88, 0.00, 'DOCE MIL TRESCIENTOS VEINTISEIS PESOS 88/100 MNX', '', 8257.90, 4068.98, 7119.29, 3507.33, 5);
INSERT INTO `ventas` VALUES (18, 1, 1, NULL, NULL, 'JUAN', 'NORMAL', '2022-06-06 18:40:41', 'TICKET', 'PAGADA', '629E4A29AE817', 1, NULL, '2022-06-06 18:40:41', 'VIG', 125.16, 0.00, 149.00, 0.00, 'CIENTO CUARENTA Y NUEVE PESOS 0/100 MNX', '', 103.00, 46.00, 86.52, 38.64, 5);
INSERT INTO `ventas` VALUES (19, 1, 1, NULL, NULL, 'JOSE MENDEZ MONDRAGON', 'NORMAL', '2022-06-06 18:48:38', 'TICKET', 'PAGADA', '629E4C062A2D7', 2, NULL, '2022-06-06 18:48:38', 'VIG', 629.16, 0.00, 775.50, 0.00, 'SETECIENTOS SETENTA Y CINCO PESOS 50/100 MNX', '', 517.00, 258.50, 517.00, 112.16, 5);
INSERT INTO `ventas` VALUES (20, 1, 1, NULL, NULL, 'KAREN MORALES', 'NORMAL', '2022-06-06 19:14:26', 'TICKET', 'PAGADA', '629E4DA65D21F', 1, NULL, '2022-06-06 18:55:34', 'VIG', 331.90, 0.00, 385.00, 0.00, 'TRESCIENTOS OCHENTA Y CINCO PESOS 0/100 MNX', '', 250.00, 135.00, 215.52, 116.38, 35);
INSERT INTO `ventas` VALUES (21, 1, 1, NULL, NULL, 'CHEPE', 'NORMAL', '2022-06-06 19:22:53', 'TICKET', 'PAGADA', '629E53EDD0C3C', 1, NULL, '2022-06-06 19:22:21', 'VIG', 110.04, 0.00, 131.00, 369.00, 'CIENTO TREINTA Y UN PESOS 0/100 MNX', NULL, 131.00, 0.00, 110.04, 0.00, 35);
INSERT INTO `ventas` VALUES (22, 1, 1, NULL, 1, 'CECILIA', 'SERVICIO', '2022-06-06 19:26:59', 'TICKET', 'PAGADA', '629E5491D8448', 1, NULL, '2022-06-06 19:25:05', 'VIG', 193.20, 0.00, 230.00, 0.00, 'DOSCIENTOS TREINTA PESOS 0/100 MNX', '', 184.00, 46.00, 154.56, 38.64, 36);
INSERT INTO `ventas` VALUES (23, 1, 1, NULL, 1, 'FERNANDO', 'NORMAL', '2022-06-06 19:30:43', 'TICKET', 'PAGADA', '629E55E36C06D', 3, NULL, '2022-06-06 19:30:43', 'VIG', 629.16, 0.00, 775.50, 0.00, 'SETECIENTOS SETENTA Y CINCO PESOS 50/100 MNX', NULL, 517.00, 258.50, 517.00, 112.16, 39);
INSERT INTO `ventas` VALUES (24, 1, 1, NULL, NULL, 'JAKELIN FUENTES', 'NORMAL', '2022-06-06 19:31:07', 'TICKET', 'PORPAGAR', '629E55FB8560F', NULL, NULL, '2022-06-06 19:31:07', 'VIG', 101.64, 13.10, 117.90, 0.00, 'CIENTO DIECISIETE PESOS 90/100 MNX', NULL, 131.00, -13.10, 110.04, -8.40, 35);
INSERT INTO `ventas` VALUES (25, 1, 1, NULL, NULL, 'JACKI', 'NORMAL', '2022-06-06 19:35:07', 'TICKET', 'PAGADA', '629E56EBB7B2B', 4, NULL, '2022-06-06 19:35:07', 'VIG', 91.56, 0.00, 109.00, 0.00, 'CIENTO NUEVE PESOS 0/100 MNX', '', 75.00, 34.00, 63.00, 28.56, 39);
INSERT INTO `ventas` VALUES (26, 1, 1, NULL, NULL, 'CALZON', 'NORMAL', '2022-06-06 19:37:14', 'TICKET', 'PORPAGAR', '629E576AE6CA0', NULL, NULL, '2022-06-06 19:37:14', 'VIG', 905.17, 0.00, 1050.00, 0.00, 'UN MIL CINCUENTA PESOS 0/100 MNX', '', 700.00, 350.00, 603.45, 301.72, 14);

-- ----------------------------
-- Table structure for ventas_detalles
-- ----------------------------
DROP TABLE IF EXISTS `ventas_detalles`;
CREATE TABLE `ventas_detalles`  (
  `cve_venta_detalle` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador del detalle de venta',
  `cve_venta` int NOT NULL COMMENT 'Identificador del registro de venta',
  `cve_producto_sucursal` int NULL DEFAULT NULL COMMENT 'Identificador del producto de la sucursal',
  `cantidad` decimal(11, 2) NULL DEFAULT NULL COMMENT 'Cantidad de producto o material',
  `unidad_medida` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Unidad de medida del producto o material: PIEZA, LITRO, METRO',
  `estatus_venta_detalle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Estatus del detalle de venta: CAPTURADO, CANCELADO, DEVUELTO',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp COMMENT 'Fecha de alta del registro',
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
  INDEX `fk_producto_sucursal_venta_detalle`(`cve_producto_sucursal` ASC) USING BTREE,
  INDEX `idx_venta_detalle_venta`(`cve_venta` ASC) USING BTREE,
  CONSTRAINT `fk_producto_sucursal_venta_detalle` FOREIGN KEY (`cve_producto_sucursal`) REFERENCES `productos_sucursales` (`cve_producto_sucursal`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_venta_detalle_venta` FOREIGN KEY (`cve_venta`) REFERENCES `ventas` (`cve_venta`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Registra los detalles de las ventas' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ventas_detalles
-- ----------------------------
INSERT INTO `ventas_detalles` VALUES (1, 1, 2, 1.00, 'PZA', 'CAPTURADO', '2022-06-01 19:05:59', 'VIG', 'A22006000007', 'PUÑOS ITK D7', 91.560, 109.00, 91.560, 109.00, 91.560, 109.00, 91.56, 109.00, 0.00, 0.00, 63.00, 75.00, 63.00, 0.000, 75.00, 1.00);
INSERT INTO `ventas_detalles` VALUES (2, 1, 183, 2.00, 'PZA', 'CAPTURADO', '2022-06-01 19:05:59', 'VIG', 'F09020071', 'DIRECCIONAL DEL IZQ', 120.960, 144.00, 120.960, 144.00, 241.920, 288.00, 241.92, 288.00, 0.00, 0.00, 47.88, 114.00, 95.76, 0.000, 57.00, 1.00);
INSERT INTO `ventas_detalles` VALUES (3, 1, 8, 1.00, 'PZA', 'CAPTURADO', '2022-06-01 19:05:59', 'VIG', 'ACCFILTRO5G', 'FILTRO GASOLINA PIRINOLA TRANSP 10 PZAS', 243.600, 290.00, 243.600, 290.00, 243.600, 290.00, 243.60, 290.00, 0.00, 0.00, 168.00, 200.00, 168.00, 0.000, 200.00, 1.00);
INSERT INTO `ventas_detalles` VALUES (4, 2, 421, 5.00, 'PZA', 'CAPTURADO', '2022-06-02 23:37:06', 'VIG', '7503025182414', 'LECTOR CODIGO DE BARRAS', 1034.414, 1199.92, 1034.414, 1199.92, 5172.070, 5999.60, 5172.07, 5999.60, 0.00, 0.00, 689.66, 4000.00, 3448.28, 0.160, 800.00, 1.00);
INSERT INTO `ventas_detalles` VALUES (5, 3, 427, 3.00, 'PZA', 'CAPTURADO', '2022-06-03 00:39:31', 'VIG', '862399041046072', 'CELULAR CHAFA 100 PRZIENTO NO FACE PERDON FAKE\n', 132758.619, 154000.00, 132758.619, 154000.00, 398275.857, 462000.00, 398275.86, 462000.00, 0.00, 0.00, 18965.52, 66000.00, 56896.55, 0.160, 22000.00, 1.00);
INSERT INTO `ventas_detalles` VALUES (6, 3, 425, 1.00, 'PZA', 'CAPTURADO', '2022-06-03 00:39:31', 'VIG', '887256110314', 'JUST DANCE 2021', 283.724, 329.12, 283.724, 329.12, 283.724, 329.12, 283.72, 329.12, 0.00, 0.00, 257.93, 299.20, 257.93, 0.160, 299.20, 1.00);
INSERT INTO `ventas_detalles` VALUES (7, 3, 426, 1.00, 'PZA', 'CAPTURADO', '2022-06-03 00:39:31', 'VIG', '889698498906', 'FUNKO POP CLASSIC MICKEY', 334.129, 387.59, 334.129, 387.59, 334.129, 387.59, 334.13, 387.59, 0.00, 0.00, 324.40, 376.30, 324.40, 0.160, 376.30, 1.00);
INSERT INTO `ventas_detalles` VALUES (8, 3, 422, 1.00, 'PZA', 'CAPTURADO', '2022-06-03 00:39:31', 'VIG', '7501146010388', 'TOTOPOS CHARRICOS', 29.095, 33.75, 29.095, 33.75, 29.095, 33.75, 29.10, 33.75, 0.00, 0.00, 21.55, 25.00, 21.55, 0.160, 25.00, 1.00);
INSERT INTO `ventas_detalles` VALUES (9, 3, 424, 1.00, 'PZA', 'CAPTURADO', '2022-06-03 00:39:31', 'VIG', '7501088559112', 'ANTIGRANOS', 56.422, 65.45, 56.422, 65.45, 56.422, 65.45, 56.42, 65.45, 0.00, 0.00, 51.29, 59.50, 51.29, 0.160, 59.50, 1.00);
INSERT INTO `ventas_detalles` VALUES (10, 4, 426, 1.00, 'PZA', 'CAPTURADO', '2022-06-03 00:41:30', 'VIG', '889698498906', 'FUNKO POP CLASSIC MICKEY', 334.129, 387.59, 334.129, 387.59, 334.129, 387.59, 334.13, 387.59, 0.00, 0.00, 324.40, 376.30, 324.40, 0.160, 376.30, 1.00);
INSERT INTO `ventas_detalles` VALUES (11, 4, 425, 3.00, 'PZA', 'CAPTURADO', '2022-06-03 00:41:30', 'VIG', '887256110314', 'JUST DANCE 2021', 283.724, 329.12, 283.724, 329.12, 851.172, 987.36, 851.17, 987.36, 0.00, 0.00, 257.93, 897.60, 773.79, 0.160, 299.20, 1.00);
INSERT INTO `ventas_detalles` VALUES (12, 4, 422, 1.00, 'PZA', 'CAPTURADO', '2022-06-03 00:41:30', 'VIG', '7501146010388', 'TOTOPOS CHARRICOS', 29.095, 33.75, 29.095, 33.75, 29.095, 33.75, 29.10, 33.75, 0.00, 0.00, 21.55, 25.00, 21.55, 0.160, 25.00, 1.00);
INSERT INTO `ventas_detalles` VALUES (13, 4, 424, 1.00, 'PZA', 'CAPTURADO', '2022-06-03 00:41:30', 'VIG', '7501088559112', 'ANTIGRANOS', 56.422, 65.45, 56.422, 65.45, 56.422, 65.45, 56.42, 65.45, 0.00, 0.00, 51.29, 59.50, 51.29, 0.160, 59.50, 1.00);
INSERT INTO `ventas_detalles` VALUES (14, 5, 424, 1.00, 'PZA', 'CAPTURADO', '2022-06-03 00:47:51', 'VIG', '7501088559112', 'ANTIGRANOS', 56.422, 65.45, 56.422, 65.45, 56.422, 65.45, 56.42, 65.45, 0.00, 0.00, 51.29, 59.50, 51.29, 0.160, 59.50, 1.00);
INSERT INTO `ventas_detalles` VALUES (15, 6, 424, 1.00, 'PZA', 'CAPTURADO', '2022-06-03 00:48:36', 'VIG', '7501088559112', 'ANTIGRANOS', 56.422, 65.45, 56.422, 65.45, 56.422, 65.45, 56.42, 65.45, 0.00, 0.00, 51.29, 59.50, 51.29, 0.160, 59.50, 1.00);
INSERT INTO `ventas_detalles` VALUES (16, 7, 424, 1.00, 'PZA', 'CAPTURADO', '2022-06-03 00:51:40', 'VIG', '7501088559112', 'ANTIGRANOS', 56.422, 65.45, 56.422, 65.45, 56.422, 65.45, 56.42, 65.45, 0.00, 0.00, 51.29, 59.50, 51.29, 0.160, 59.50, 1.00);
INSERT INTO `ventas_detalles` VALUES (17, 8, 424, 1.00, 'PZA', 'CAPTURADO', '2022-06-03 00:55:20', 'VIG', '7501088559112', 'ANTIGRANOS', 56.422, 65.45, 56.422, 65.45, 56.422, 65.45, 56.42, 65.45, 0.00, 0.00, 51.29, 59.50, 51.29, 0.160, 59.50, 1.00);
INSERT INTO `ventas_detalles` VALUES (18, 9, 424, 1.00, 'PZA', 'CAPTURADO', '2022-06-03 01:03:08', 'VIG', '7501088559112', 'ANTIGRANOS', 56.422, 65.45, 56.422, 65.45, 56.422, 65.45, 56.42, 65.45, 0.00, 0.00, 51.29, 59.50, 51.29, 0.160, 59.50, 1.00);
INSERT INTO `ventas_detalles` VALUES (19, 10, 424, 1.00, 'PZA', 'CAPTURADO', '2022-06-03 01:04:23', 'VIG', '7501088559112', 'ANTIGRANOS', 56.422, 65.45, 56.422, 65.45, 56.422, 65.45, 56.42, 65.45, 0.00, 0.00, 51.29, 59.50, 51.29, 0.160, 59.50, 1.00);
INSERT INTO `ventas_detalles` VALUES (20, 11, 424, 1.00, 'PZA', 'CAPTURADO', '2022-06-03 01:07:57', 'VIG', '7501088559112', 'ANTIGRANOS', 56.422, 65.45, 56.422, 65.45, 56.422, 65.45, 56.42, 65.45, 0.00, 0.00, 51.29, 59.50, 51.29, 0.160, 59.50, 1.00);
INSERT INTO `ventas_detalles` VALUES (21, 12, 428, 1.00, 'PZA', 'CAPTURADO', '2022-06-03 18:41:01', 'VIG', '096619334346', 'AGUA PURIFICADA', 3.879, 4.50, 3.879, 4.50, 3.879, 4.50, 3.88, 4.50, 0.00, 0.00, 2.59, 3.00, 2.59, 0.160, 60.00, 20.00);
INSERT INTO `ventas_detalles` VALUES (22, 12, 430, 1.00, 'PZA', 'CAPTURADO', '2022-06-03 18:41:01', 'VIG', '7508310252117', 'LIBRETA ROJA DE RAYAS', 25.861, 30.00, 25.861, 30.00, 25.861, 30.00, 25.86, 30.00, 0.00, 0.00, 17.24, 20.00, 17.24, 0.160, 20.00, 1.00);
INSERT INTO `ventas_detalles` VALUES (23, 12, 429, 1.00, 'PZA', 'CAPTURADO', '2022-06-03 18:41:01', 'VIG', '7503020089855', 'GEL ANTIBATECRIAL PATITO', 19.396, 22.50, 19.396, 22.50, 19.396, 22.50, 19.40, 22.50, 0.00, 0.00, 12.93, 15.00, 12.93, 0.160, 15.00, 1.00);
INSERT INTO `ventas_detalles` VALUES (24, 13, 428, 10.00, 'PZA', 'CAPTURADO', '2022-06-03 18:51:45', 'VIG', '096619334346', 'AGUA PURIFICADA', 3.879, 4.50, 3.879, 4.50, 38.790, 45.00, 38.79, 45.00, 0.00, 0.00, 3.00, 30.00, 30.00, 0.160, 60.00, 20.00);
INSERT INTO `ventas_detalles` VALUES (25, 14, 1, 1.00, 'PZA', 'CAPTURADO', '2022-06-03 18:55:31', 'VIG', 'A22001000002', 'CAJA ITK 26L', 629.160, 775.50, 629.160, 775.50, 629.160, 775.50, 629.16, 775.50, 0.00, 0.00, 517.00, 517.00, 517.00, 0.160, 517.00, 1.00);
INSERT INTO `ventas_detalles` VALUES (26, 15, 2, 1.00, 'PZA', 'CAPTURADO', '2022-06-03 18:59:46', 'VIG', 'A22006000007', 'PUÑOS ITK D7', 91.560, 109.00, 91.560, 109.00, 91.560, 109.00, 91.56, 109.00, 0.00, 0.00, 63.00, 75.00, 63.00, 0.160, 75.00, 1.00);
INSERT INTO `ventas_detalles` VALUES (27, 16, 1, 1.00, 'PZA', 'CAPTURADO', '2022-06-03 19:01:26', 'VIG', 'A22001000002', 'CAJA ITK 26L', 629.160, 775.50, 629.160, 775.50, 629.160, 775.50, 629.16, 775.50, 0.00, 0.00, 517.00, 517.00, 517.00, 0.160, 517.00, 1.00);
INSERT INTO `ventas_detalles` VALUES (28, 17, 428, 1.00, 'PZA', 'CAPTURADO', '2022-06-03 19:04:32', 'VIG', '096619334346', 'AGUA PURIFICADA', 3.879, 4.50, 3.879, 4.50, 3.879, 4.50, 3.88, 4.50, 0.00, 0.00, 3.00, 3.00, 3.00, 0.160, 60.00, 20.00);
INSERT INTO `ventas_detalles` VALUES (29, 17, 430, 2.00, 'PZA', 'CAPTURADO', '2022-06-03 19:04:32', 'VIG', '7508310252117', 'LIBRETA ROJA DE RAYAS', 25.861, 30.00, 25.861, 30.00, 51.722, 60.00, 51.72, 60.00, 0.00, 0.00, 17.24, 40.00, 34.48, 0.160, 20.00, 1.00);
INSERT INTO `ventas_detalles` VALUES (30, 17, 429, 1.00, 'PZA', 'CAPTURADO', '2022-06-03 19:04:32', 'VIG', '7503020089855', 'GEL ANTIBATECRIAL PATITO', 19.396, 22.50, 19.396, 22.50, 19.396, 22.50, 19.40, 22.50, 0.00, 0.00, 12.93, 15.00, 12.93, 0.160, 15.00, 1.00);
INSERT INTO `ventas_detalles` VALUES (31, 17, 423, 1.00, 'PZA', 'CAPTURADO', '2022-06-03 19:04:32', 'VIG', '2500074129433', 'PLAYERA CHIDA', 206.794, 239.88, 206.794, 239.88, 206.794, 239.88, 206.79, 239.88, 0.00, 0.00, 172.33, 199.90, 172.33, 0.160, 199.90, 1.00);
INSERT INTO `ventas_detalles` VALUES (32, 17, 431, 1.00, 'PZA', 'CAPTURADO', '2022-06-03 19:04:32', 'VIG', '7503032754512', 'LAPTOP GHIA LIBERO CORE I3 10A GEN/8 GB RAM/256 GB SSD', 10344.828, 12000.00, 10344.828, 12000.00, 10344.828, 12000.00, 10344.83, 12000.00, 0.00, 0.00, 6896.55, 8000.00, 6896.55, 0.160, 8000.00, 1.00);
INSERT INTO `ventas_detalles` VALUES (33, 18, 4, 1.00, 'PZA', 'CAPTURADO', '2022-06-06 18:40:41', 'VIG', 'A22011000005', 'DIRECCIONALES JET', 125.160, 149.00, 125.160, 149.00, 125.160, 149.00, 125.16, 149.00, 0.00, 0.00, 86.52, 103.00, 86.52, 0.160, 103.00, 1.00);
INSERT INTO `ventas_detalles` VALUES (34, 19, 1, 1.00, 'PZA', 'CAPTURADO', '2022-06-06 18:48:38', 'VIG', 'A22001000002', 'CAJA ITK 26L', 629.160, 775.50, 629.160, 775.50, 629.160, 775.50, 629.16, 775.50, 0.00, 0.00, 517.00, 517.00, 517.00, 0.160, 517.00, 1.00);
INSERT INTO `ventas_detalles` VALUES (35, 20, 432, 1.00, 'PZA', 'CAPTURADO', '2022-06-06 18:55:34', 'VIG', 'F09030093', 'LAMPARA TRA DM', 331.896, 385.00, 331.896, 385.00, 331.896, 385.00, 331.90, 385.00, 0.00, 0.00, 215.52, 250.00, 215.52, 0.160, 250.00, 1.00);
INSERT INTO `ventas_detalles` VALUES (36, 21, 344, 1.00, 'PZA', 'CAPTURADO', '2022-06-06 19:22:21', 'VIG', 'F15020273', 'ZAPATA FRENO TRAS', 110.040, 131.00, 110.040, 131.00, 110.040, 131.00, 110.04, 131.00, 0.00, 0.00, 110.04, 131.00, 110.04, 0.160, 131.00, 1.00);
INSERT INTO `ventas_detalles` VALUES (37, 22, 390, 1.00, 'SERV', 'CAPTURADO', '2022-06-06 19:25:05', 'VIG', NULL, 'CAMBIO DE LLANTA TRAS MOTO DE TRABAJO', 67.200, 80.00, 67.200, 80.00, 67.200, 80.00, 67.20, 80.00, 0.00, 0.00, 67.20, 80.00, 67.20, 0.160, 80.00, 1.00);
INSERT INTO `ventas_detalles` VALUES (38, 22, 9, 1.00, 'PZA', 'CAPTURADO', '2022-06-06 19:25:05', 'VIG', 'ACCFILTRO6G', 'FILTRO GASOLINA TRANSPARENTE 10 PZAS', 126.000, 150.00, 126.000, 150.00, 126.000, 150.00, 126.00, 150.00, 0.00, 0.00, 87.36, 104.00, 87.36, 0.160, 104.00, 1.00);
INSERT INTO `ventas_detalles` VALUES (39, 23, 1, 1.00, 'PZA', 'CAPTURADO', '2022-06-06 19:30:43', 'VIG', 'A22001000002', 'CAJA ITK 26L', 629.160, 775.50, 629.160, 775.50, 629.160, 775.50, 629.16, 775.50, 0.00, 0.00, 517.00, 517.00, 517.00, 0.160, 517.00, 1.00);
INSERT INTO `ventas_detalles` VALUES (40, 24, 344, 1.00, 'PZA', 'CAPTURADO', '2022-06-06 19:31:07', 'VIG', 'F15020273', 'ZAPATA FRENO TRAS', 110.040, 131.00, 101.638, 117.90, 110.040, 131.00, 101.64, 117.90, 10.00, 13.10, 110.04, 131.00, 110.04, 0.160, 131.00, 1.00);
INSERT INTO `ventas_detalles` VALUES (41, 25, 2, 1.00, 'PZA', 'CAPTURADO', '2022-06-06 19:35:07', 'VIG', 'A22006000007', 'PUÑOS ITK D7', 91.560, 109.00, 91.560, 109.00, 91.560, 109.00, 91.56, 109.00, 0.00, 0.00, 63.00, 75.00, 63.00, 0.160, 75.00, 1.00);
INSERT INTO `ventas_detalles` VALUES (42, 26, 435, 1.00, 'PZA', 'CAPTURADO', '2022-06-06 19:37:14', 'VIG', 'F10030107', 'ENS BOMBA DE FRENO DEL ', 905.172, 1050.00, 905.172, 1050.00, 905.172, 1050.00, 905.17, 1050.00, 0.00, 0.00, 603.45, 700.00, 603.45, 0.160, 700.00, 1.00);

-- ----------------------------
-- Table structure for ventas_pagos
-- ----------------------------
DROP TABLE IF EXISTS `ventas_pagos`;
CREATE TABLE `ventas_pagos`  (
  `cve_venta_pago` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador del pago asociado a una venta',
  `cve_venta` int NOT NULL COMMENT 'Identificador del registro de la venta',
  `medio_pago` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Medio por el cual se realiza el pago: EFECTIVO, TARJETA, VALE, CHEQUE, TRANSFERENCIA',
  `cantidad` decimal(11, 2) NOT NULL COMMENT 'Cantidad de dinero',
  `numero_comprobante` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Número de comprobante del medio de pago',
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp COMMENT 'Fecha de alta del registro',
  `estatus_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'VIG' COMMENT 'Indica si el registro esta VIG O NVG',
  `tipo_tarjeta` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cve_venta_pago`) USING BTREE,
  INDEX `fk_venta_ventas_pagos`(`cve_venta` ASC) USING BTREE,
  CONSTRAINT `fk_venta_ventas_pagos` FOREIGN KEY (`cve_venta`) REFERENCES `ventas` (`cve_venta`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Registra los pagos asociados a las ventas' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ventas_pagos
-- ----------------------------

-- ----------------------------
-- View structure for cortes_caja_vw
-- ----------------------------
DROP VIEW IF EXISTS `cortes_caja_vw`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `cortes_caja_vw` AS select `dt`.`cve_corte_caja` AS `cve_corte_caja`,`dt`.`clave` AS `clave`,`dt`.`medio` AS `medio`,sum(`dt`.`entrada`) - sum(`dt`.`salida`) AS `total` from (select `mp`.`clave` AS `clave`,`mp`.`medio` AS `medio`,`mp`.`orden` AS `orden`,case `mv`.`tipo_movimiento` when 'ENTRADA' then sum(`mv`.`importe_movimiento`) else 0 end AS `entrada`,case `mv`.`tipo_movimiento` when 'SALIDA' then sum(`mv`.`importe_movimiento`) else 0 end AS `salida`,`mv`.`cve_corte_caja` AS `cve_corte_caja` from ((select 'EF' AS `clave`,'Efectivo' AS `medio`,1 AS `orden` union select 'TA' AS `clave`,'Tarjeta' AS `medio`,2 AS `orden` union select 'CH' AS `clave`,'Cheque' AS `medio`,3 AS `orden` union select 'VA' AS `clave`,'Vale' AS `medio`,4 AS `orden` union select 'TR' AS `clave`,'Transferencia' AS `medio`,5 AS `orden`) `mp` left join `u903984016_pos`.`movimientos` `mv` on(`mv`.`medio_movimiento` = `mp`.`clave` and `mv`.`estatus_registro` = 'VIG')) group by `mp`.`clave`,`mp`.`medio`,`mp`.`orden`,`mv`.`tipo_movimiento`,`mv`.`cve_corte_caja`) `dt` group by `dt`.`cve_corte_caja`,`dt`.`clave`,`dt`.`medio` order by `dt`.`cve_corte_caja`,`dt`.`orden`;

-- ----------------------------
-- Procedure structure for pa_actualiza_inventario
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_actualiza_inventario`;
delimiter ;;
CREATE PROCEDURE `pa_actualiza_inventario`(pcve_entrada int, pcve_usuario int)
BEGIN

	DECLARE total_registros int; 
	DECLARE vcve_carga int4;
	DECLARE vcodigo VARCHAR(200);
	DECLARE vdescripcion VARCHAR(200);
	DECLARE vmarca VARCHAR(200);
	DECLARE vcategoria VARCHAR(200);
	DECLARE vcve_categoria int4;
	DECLARE vcantidad int4;
	DECLARE vprecio_compra decimal;
	DECLARE vprecio_venta  decimal;
	DECLARE vcve_producto int4;
	DECLARE vcve_empresa int4;
	DECLARE vcve_sucursal int4;
	DECLARE vusuario int4;
	DECLARE vcve_producto_sucursal int4;
	declare vprecio_venta_neto decimal;
	declare vprecio_new decimal;
	DECLARE valor_iva decimal(11,4);
	DECLARE solo_existencia VARCHAR(2);
	
	DECLARE interacion INT;
    SET interacion = 0;
	SET solo_existencia = 'no';

	-- Obtenemos 
	select s.cve_sucursal, s.cve_empresa
	  into vcve_sucursal, vcve_empresa
	  from entradas e join sucursales s on s.cve_sucursal = e.cve_sucursal
	 where e.cve_entrada = pcve_entrada;
 insert into debug(variable,valor)values('vcve_empresa',vcve_empresa);		
 insert into debug(variable,valor)values('vcve_sucursal',vcve_sucursal);		

	select count(d.cve_carga) into total_registros
  	from carga_masiva d where d.procesado = 'no'; 
	
	-- Recorremos los productores
	WHILE interacion <= total_registros DO


		-- obtenemos el registro a procesar
		 SELECT cve_carga, trim(codigo), UPPER(descripcion), marca, upper(trim(categoria)), cantidad
			  , precio_compra, precio_venta, cve_producto, cve_categoria 		  
		   INTO vcve_carga, vcodigo, vdescripcion, vmarca, vcategoria, vcantidad
			  , vprecio_compra, vprecio_venta, vcve_producto, vcve_categoria 		  
		   FROM carga_masiva
		  where procesado= 'no' order by cve_carga LIMIT 1;

		-- Verificamos la categoria 
		if (vcve_categoria is null or vcve_categoria = 0) then 
			select cve_categoria into vcve_categoria
			  from categorias where upper(trim(categoria)) = vcategoria;
			
			if (vcve_categoria = 0 or vcve_categoria is null) then 
				INSERT INTO categorias (cve_empresa,categoria) 
				values (vcve_empresa,vcategoria);
				
				SELECT LAST_INSERT_ID() into vcve_categoria;
			end if;
		end if; 
 -- insert into debug(variable,valor)values('vcve_sucursal',vcve_sucursal);		
		-- Verificamos el producto
		if (vcve_producto is null or vcve_producto = 0) then 
			-- buscamos por codigo 				
			select cve_producto into vcve_producto
			  from productos where trim(codigo_barras) = vcodigo and estatus_registro = 'VIG';
			if (vcve_producto is null or vcve_producto = 0) then 						
				insert into productos (cve_empresa,cve_categoria,producto,codigo_barras,estatus_registro
									  , cve_unidad_compra, cve_unidad_venta,factor,servicio)
							   VALUES (vcve_empresa,vcve_categoria,vdescripcion,vcodigo,'VIG', 1,1,1,0);
							   
			    SELECT LAST_INSERT_ID() into vcve_producto;
				
				-- insertamos la descripcion 
				INSERT INTO productos_descripciones(cve_producto, descripcion)
						values (vcve_producto,vdescripcion);
			end if;
		end if;	
 -- insert into debug(variable,valor)values('vcve_sucursal',vcve_sucursal);				
		-- verificamos la existencia del producto en la sucursal 	
		SELECT ps.cve_producto_sucursal, ps.precio_venta_neto INTO vcve_producto_sucursal, vprecio_venta_neto
		  FROM productos_sucursales ps 
		 WHERE ps.cve_producto = vcve_producto and ps.cve_sucursal = vcve_sucursal
		   AND ps.estatus_registro = 'VIG';

 -- insert into debug(variable,valor)values('vcve_producto_sucursal',vcve_producto_sucursal);		
	   if (vprecio_venta_neto is not null) then 
		   if vprecio_venta >= vprecio_venta_neto then 
				set vprecio_new = vprecio_venta;
		   else 
				set vprecio_new = vprecio_venta_neto;	
				set solo_existencia = 'si';
		   end if; 
	   else 
				set vprecio_new = vprecio_venta; 	  
	   end if;
			
	   -- obtenemos el valor del iva    
	   select tasa into valor_iva from impuestos where impuesto = 'IVA' and estatus_registro = 'VIG';
 -- insert into debug(variable,valor)values('valor_iva',valor_iva);			   
	
	   -- Actualizamos la existencia, sino existe se inserta 
	   if (vcve_producto_sucursal is null or vcve_producto_sucursal =0) then    
 -- insert into debug(variable,valor)values('vcve_sucursal',vcve_sucursal);		   
			insert into productos_sucursales (cve_sucursal,cve_producto,existencia,existencia_minima
				 , precio_compra, precio_compra_neto_sin, precio_compra_neto
				 , precio_venta, precio_venta_neto, neto,utilidad)
			values (vcve_sucursal,vcve_producto,vcantidad,1
				 , (vprecio_compra * (1-valor_iva)),(vprecio_compra * (1-valor_iva)), vprecio_compra
				 , (vprecio_new* (1-valor_iva)),vprecio_new,1,(vprecio_new-vprecio_compra));
			 
			  SELECT LAST_INSERT_ID() into vcve_producto_sucursal;				 
	   else 
			if (solo_existencia = 'si') then 	 			
				update productos_sucursales SET existencia = existencia + vcantidad 
				 where cve_producto_sucursal = vcve_producto_sucursal;
			 else 	 			 
				update productos_sucursales SET existencia = existencia + vcantidad 
					 , precio_compra = (vprecio_compra * (1-valor_iva))
					 , precio_compra_neto_sin = (vprecio_compra * (1-valor_iva))
					 , precio_compra_neto = vprecio_compra
				     , precio_venta = (vprecio_new* (1-valor_iva))
					 , precio_venta_neto = (vprecio_new* (1-valor_iva))
					 , utilidad = (vprecio_new-vprecio_compra)
				 where cve_producto_sucursal = vcve_producto_sucursal;			 
		    end if;
	   
	   end if;
	   
	   -- Marcamos el registro actualizado	 	   
	   update carga_masiva set procesado = 'si', cve_producto = vcve_producto 
			, cve_categoria = vcve_categoria, cve_producto_sucursal = vcve_producto_sucursal
		where cve_carga = vcve_carga;
		
		-- Reseteamos las variables 
		set interacion = interacion+1;		
		set vcve_categoria = null; 
		set vcve_producto = null;
		set vprecio_venta_neto = null;
		SET vcve_producto_sucursal = null;
		set vprecio_new = null;
		set valor_iva = null;		
	
	END WHILE;

	commit; 

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for pa_obtiene_corte_caja
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_obtiene_corte_caja`;
delimiter ;;
CREATE PROCEDURE `pa_obtiene_corte_caja`(IN pid_corte_caja int)
BEGIN
	if pid_corte_caja is not null then
		select dt.clave, dt.medio, (SUM(dt.entrada) - SUM(dt.salida))  total from (
		select mp.clave, mp.medio, mp.orden
		, case mv.tipo_movimiento when 'ENTRADA' THEN SUM(mv.importe_movimiento) else 0 end entrada  
		, case mv.tipo_movimiento when 'SALIDA' THEN SUM(mv.importe_movimiento) else 0 end salida 
		from (select  'EF' clave, 'Efectivo' medio,  1 orden union select 'TA' clave,'Tarjeta' medio, 2 orden
		union select 'CH' clave, 'Cheque' medio, 3 orden union select 'VA' clave, 'Vale' medio, 4 orden
		union select 'TR' clave, 'Transferencia' medio, 5 orden) mp left join movimientos mv on mv.medio_movimiento = mp.clave
		 and mv.cve_corte_caja = pid_corte_caja and mv.estatus_registro = 'VIG'
		group by mp.clave, mp.medio, mp.orden, mv.tipo_movimiento) dt
		group by dt.clave, dt.medio
		order by dt.orden;
	end if;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
