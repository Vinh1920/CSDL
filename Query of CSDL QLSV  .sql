-- Dumping database structure for quanlysinhvien
CREATE DATABASE IF NOT EXISTS `quanlysinhvien` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `quanlysinhvien`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for chuongtrinhdaotao
-- ----------------------------
DROP TABLE IF EXISTS `chuongtrinhdaotao`;
CREATE TABLE `chuongtrinhdaotao`  (
  `maChuongTrinhDaoTao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tenChuongTrinhDaoTao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `soTinChi` float NULL DEFAULT NULL,
  `namBatDauDaoTao` int NULL DEFAULT NULL,
  PRIMARY KEY (`maChuongTrinhDaoTao`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lophocphan
-- ----------------------------
DROP TABLE IF EXISTS `lophocphan`;
CREATE TABLE `lophocphan`  (
  `maLopHocPhan` int NOT NULL AUTO_INCREMENT,
  `maMonHoc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `namHoc` int NOT NULL,
  `hocKy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `maGiangVien` int NOT NULL DEFAULT 0,
  `ngonNguGiangDay` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `moTa` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gioiHanSoLuongSinhVien` int NOT NULL,
  PRIMARY KEY (`maLopHocPhan`) USING BTREE,
  INDEX `FK_lophocphan_monhoc`(`maMonHoc`) USING BTREE,
  INDEX `FK_lophocphan_nhanvien`(`maGiangVien`) USING BTREE,
  CONSTRAINT `FK_lophocphan_monhoc` FOREIGN KEY (`maMonHoc`) REFERENCES `monhoc` (`maMonHoc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_lophocphan_nhanvien` FOREIGN KEY (`maGiangVien`) REFERENCES `nhanvien` (`maNhanVien`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for monhoc
-- ----------------------------
DROP TABLE IF EXISTS `monhoc`;
CREATE TABLE `monhoc`  (
  `maMonHoc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tenMonHoc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `soTinChi` float NULL DEFAULT 0,
  `namBatDauApDung` int NULL DEFAULT 0,
  `theLoai` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `moTaTomTat` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `maTaDayDu` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `taiLieu` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `mucTieuDauRa` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `hinhThucDanhGia` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `maChuongTrinhDaoTao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`maMonHoc`) USING BTREE,
  INDEX `FK_monhoc_chuongtrinhdaotao`(`maChuongTrinhDaoTao`) USING BTREE,
  CONSTRAINT `FK_monhoc_chuongtrinhdaotao` FOREIGN KEY (`maChuongTrinhDaoTao`) REFERENCES `chuongtrinhdaotao` (`maChuongTrinhDaoTao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for nguoidung
-- ----------------------------
DROP TABLE IF EXISTS `nguoidung`;
CREATE TABLE `nguoidung`  (
  `tenNguoiDung` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `matKhau` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `theLoai` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `maNhanVien` int NULL DEFAULT NULL,
  `maSinhVien` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tenNguoiDung`) USING BTREE,
  INDEX `FK_nguoidung_nhanvien`(`maNhanVien`) USING BTREE,
  INDEX `FK_nguoidung_sinhvien`(`maSinhVien`) USING BTREE,
  CONSTRAINT `FK_nguoidung_nhanvien` FOREIGN KEY (`maNhanVien`) REFERENCES `nhanvien` (`maNhanVien`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `FK_nguoidung_sinhvien` FOREIGN KEY (`maSinhVien`) REFERENCES `sinhvien` (`maSinhVien`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for nhanvien
-- ----------------------------
DROP TABLE IF EXISTS `nhanvien`;
CREATE TABLE `nhanvien`  (
  `maNhanVien` int NOT NULL AUTO_INCREMENT,
  `hoDem` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ten` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `theLoai` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ngaySinh` date NULL DEFAULT NULL,
  `gioiTinh` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`maNhanVien`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sinhvien
-- ----------------------------
DROP TABLE IF EXISTS `sinhvien`;
CREATE TABLE `sinhvien`  (
  `maSinhVien` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hoDem` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ten` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ngaySinh` date NULL DEFAULT NULL,
  `namNhapHoc` int NULL DEFAULT 0,
  `maChuongTrinhDaoTao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `gioiTinh` tinyint NULL DEFAULT 0,
  PRIMARY KEY (`maSinhVien`) USING BTREE,
  INDEX `FK_sinhvien_chuongtrinhdaotao`(`maChuongTrinhDaoTao`) USING BTREE,
  CONSTRAINT `FK_sinhvien_chuongtrinhdaotao` FOREIGN KEY (`maChuongTrinhDaoTao`) REFERENCES `chuongtrinhdaotao` (`maChuongTrinhDaoTao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for thamgiahoc
-- ----------------------------
DROP TABLE IF EXISTS `thamgiahoc`;
CREATE TABLE `thamgiahoc`  (
  `maLopHocPhan` int NOT NULL,
  `maSinhVien` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `diemSo` float NULL DEFAULT NULL,
  `diemChu` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`maLopHocPhan`, `maSinhVien`) USING BTREE,
  INDEX `FK_thamgiahoc_sinhvien`(`maSinhVien`) USING BTREE,
  CONSTRAINT `FK_thamgiahoc_lophocphan` FOREIGN KEY (`maLopHocPhan`) REFERENCES `lophocphan` (`maLopHocPhan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_thamgiahoc_sinhvien` FOREIGN KEY (`maSinhVien`) REFERENCES `sinhvien` (`maSinhVien`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;
qquanlysinhvienuanlysinhvien
-- ----------------------------
SET FOREIGN_KEY_CHECKS = 1;