-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        8.0.34 - MySQL Community Server - GPL
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- sprint1 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `sprint1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sprint1`;

-- 테이블 sprint1.cart 구조 내보내기
CREATE TABLE IF NOT EXISTS `cart` (
  `cart_seq` int NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL,
  `seq` int NOT NULL,
  `qty` int NOT NULL,
  PRIMARY KEY (`cart_seq`),
  KEY `fk_cart_id` (`id`),
  KEY `fk_cart_seq` (`seq`),
  CONSTRAINT `fk_cart_id` FOREIGN KEY (`id`) REFERENCES `user_list` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cart_seq` FOREIGN KEY (`seq`) REFERENCES `tire_list` (`seq`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 sprint1.cart:~0 rows (대략적) 내보내기

-- 테이블 sprint1.purchase_history 구조 내보내기
CREATE TABLE IF NOT EXISTS `purchase_history` (
  `purchase_seq` int NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL,
  `seq` int NOT NULL,
  `purchase_qty` int NOT NULL,
  `purchase_date` date NOT NULL,
  PRIMARY KEY (`purchase_seq`),
  KEY `fk_purchase_id` (`id`),
  KEY `fk_purchase_seq` (`seq`),
  CONSTRAINT `fk_purchase_id` FOREIGN KEY (`id`) REFERENCES `user_list` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_purchase_seq` FOREIGN KEY (`seq`) REFERENCES `tire_list` (`seq`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 sprint1.purchase_history:~0 rows (대략적) 내보내기

-- 테이블 sprint1.review 구조 내보내기
CREATE TABLE IF NOT EXISTS `review` (
  `review_seq` int NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL,
  `seq` int NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`review_seq`),
  KEY `fk_review_id` (`id`),
  KEY `fk_review_seq` (`seq`),
  CONSTRAINT `fk_review_id` FOREIGN KEY (`id`) REFERENCES `user_list` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_review_seq` FOREIGN KEY (`seq`) REFERENCES `tire_list` (`seq`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 sprint1.review:~0 rows (대략적) 내보내기

-- 테이블 sprint1.search_history 구조 내보내기
CREATE TABLE IF NOT EXISTS `search_history` (
  `search_seq` int NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL,
  `seq` int NOT NULL,
  PRIMARY KEY (`search_seq`),
  KEY `fk_search_id` (`id`),
  KEY `fk_search_seq` (`seq`),
  CONSTRAINT `fk_search_id` FOREIGN KEY (`id`) REFERENCES `user_list` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_search_seq` FOREIGN KEY (`seq`) REFERENCES `tire_list` (`seq`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 sprint1.search_history:~0 rows (대략적) 내보내기

-- 테이블 sprint1.tire_list 구조 내보내기
CREATE TABLE IF NOT EXISTS `tire_list` (
  `product_name` text,
  `product_image` text,
  `product_price` text,
  `car_type` text,
  `season` text,
  `tire_type` text,
  `low_noise` text,
  `alpine` text,
  `width` text,
  `aspect_ratio` text,
  `wheel_diameter` text,
  `energy_efficiency_rating` text,
  `wet_road_braking_power` text,
  `utqg_treadwear` text,
  `utqg_braking_power` text,
  `utqg_heat_resistance` text,
  `recommend` text,
  `seq` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 sprint1.tire_list:~194 rows (대략적) 내보내기
INSERT IGNORE INTO `tire_list` (`product_name`, `product_image`, `product_price`, `car_type`, `season`, `tire_type`, `low_noise`, `alpine`, `width`, `aspect_ratio`, `wheel_diameter`, `energy_efficiency_rating`, `wet_road_braking_power`, `utqg_treadwear`, `utqg_braking_power`, `utqg_heat_resistance`, `recommend`, `seq`) VALUES
	('한국타이어 아이온 윈터 SUV IW01A 사일런트 235/55R19', 'https://img.danawa.com/prod_img/500000/543/164/img/13164543_1.jpg?shrink=330:*&_v=20221004084749', '163,000', 'SUV, RV용', '겨울용', '컴포트형', '저소음', '알파인', '235mm', '55%', '19인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 1),
	('한국타이어 아이온 에보 AS SUV IH01A 255/45R20', 'https://img.danawa.com/prod_img/500000/359/144/img/13144359_1.jpg?shrink=330:*&_v=20220929091143', '207,250', 'SUV, RV용', '올시즌', '컴포트형', NULL, NULL, '255mm', '45%', '20인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 아이오닉5, 기아 EV6', 2),
	('한국타이어 아이온 에보 AS SUV IH01A 사일런트 235/55R19', 'https://img.danawa.com/prod_img/500000/691/462/img/28462691_1.jpg?shrink=330:*&_v=20230925125708', '171,810', 'SUV, RV용', '올시즌', '컴포트형', '저소음', NULL, '235mm', '55%', '19인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 아이오닉5, 기아 EV6', 3),
	('한국타이어 아이온 윈터 SUV IW01A 255/35R21', 'https://img.danawa.com/prod_img/500000/252/336/img/29336252_1.jpg?shrink=330:*&_v=20231025111258', '265,440', 'SUV, RV용', '겨울용', '컴포트형', NULL, '알파인', '255mm', '35%', '21인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 4),
	('한국타이어 아이온 에보 AS IH01 사일런트 265/35R21', 'https://img.danawa.com/prod_img/500000/012/874/img/19874012_1.jpg?shrink=330:*&_v=20230420172900', '319,550', '승용차용', '올시즌', '컴포트형', '저소음', NULL, '265mm', '35%', '21인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 넥쏘, 테슬라 모델S', 5),
	('한국타이어 아이온 에보 AS SUV IH01A 255/45R19', 'https://img.danawa.com/prod_img/500000/353/144/img/13144353_1.jpg?shrink=330:*&_v=20220929091128', '212,660', 'SUV, RV용', '올시즌', '컴포트형', NULL, NULL, '255mm', '45%', '19인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 아이오닉5, 기아 EV6', 6),
	('한국타이어 아이온 윈터 SUV IW01A 255/45R19', 'https://img.danawa.com/prod_img/500000/321/336/img/29336321_1.jpg?shrink=330:*&_v=20231025111432', '186,400', 'SUV, RV용', '겨울용', '컴포트형', NULL, '알파인', '255mm', '45%', '19인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 7),
	('한국타이어 아이온 윈터 SUV IW01A 245/40R21', 'https://img.danawa.com/prod_img/500000/118/828/img/28828118_1.jpg?shrink=330:*&_v=20231018105820', '209,270', 'SUV, RV용', '겨울용', '컴포트형', NULL, '알파인', '245mm', '40%', '21인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 8),
	('한국타이어 아이온 에보 AS SUV IH01A 235/55R19', 'https://img.danawa.com/prod_img/500000/247/968/img/17968247_1.jpg?shrink=330:*&_v=20221011161423', '178,280', 'SUV, RV용', '올시즌', '컴포트형', NULL, NULL, '235mm', '55%', '19인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 아이오닉5, 기아 EV6', 9),
	('한국타이어 벤투스 S1 에보3 K127E 255/45R19', 'https://img.danawa.com/prod_img/500000/870/421/img/16421870_1.jpg?shrink=330:*&_v=20220217125518', '232,430', '승용차용', '여름용', '스포츠형', NULL, NULL, '255mm', '45%', '19인치', '4등급', '1등급', NULL, NULL, NULL, NULL, 10),
	('한국타이어 아이온 윈터 SUV IW01A 235/55R19', 'https://img.danawa.com/prod_img/500000/443/318/img/18318443_1.jpg?shrink=330:*&_v=20221118081815', '166,460', 'SUV, RV용', '겨울용', '컴포트형', NULL, '알파인', '235mm', '55%', '19인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 11),
	('한국타이어 벤투스 S1 에보3 K127E 275/45R19', 'https://img.danawa.com/prod_img/500000/349/944/img/11944349_1.jpg?shrink=330:*&_v=20201021131836', '216,030', '승용차용', '여름용', '스포츠형', NULL, NULL, '275mm', '45%', '19인치', '4등급', '1등급', NULL, NULL, NULL, NULL, 12),
	('한국타이어 아이온 윈터 SUV IW01A 255/45R20', 'https://img.danawa.com/prod_img/500000/446/144/img/13144446_1.jpg?shrink=330:*&_v=20231103162249', '226,580', 'SUV, RV용', '겨울용', '컴포트형', NULL, '알파인', '255mm', '45%', '20인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 13),
	('한국타이어 키너지 AS X EV EH01A 235/55R19', 'https://img.danawa.com/prod_img/500000/399/202/img/19202399_1.jpg?shrink=330:*&_v=20230303093210', '129,850', 'SUV, RV용', '올시즌', '컴포트형', NULL, NULL, '235mm', '55%', '19인치', '3등급', '2등급', '500(3등급)', 'A', 'A', NULL, 14),
	('한국타이어 벤투스 S1 에보3 K127E 225/55R19', 'https://img.danawa.com/prod_img/500000/136/944/img/11944136_1.jpg?shrink=330:*&_v=20201021131836', '194,180', '승용차용', '여름용', '스포츠형', NULL, NULL, '225mm', '55%', '19인치', '4등급', '1등급', NULL, NULL, NULL, NULL, 15),
	('한국타이어 아이온 윈터 SUV IW01A 275/40R20', 'https://img.danawa.com/prod_img/500000/405/336/img/29336405_1.jpg?shrink=330:*&_v=20231025111752', '257,650', 'SUV, RV용', '겨울용', '컴포트형', NULL, '알파인', '275mm', '40%', '20인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 16),
	('한국타이어 아이온 에보 AS IH01 235/40R19 4P', 'https://img.danawa.com/prod_img/500000/697/240/img/19240697_1.jpg?shrink=330:*&_v=20230307105904', '253,000', '승용차용', '올시즌', '컴포트형', NULL, NULL, '235mm', '40%', '19인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 넥쏘, 테슬라 모델S', 17),
	('한국타이어 벤투스 S1 에보3 K127E 285/35R22 4P', 'https://img.danawa.com/prod_img/500000/021/202/img/19202021_1.jpg?shrink=330:*&_v=20230303084735', '481,850', '승용차용', '여름용', '스포츠형', NULL, NULL, '285mm', '35%', '22인치', '4등급', '1등급', NULL, NULL, NULL, NULL, 18),
	('한국타이어 아이온 에보 AS IH01 사일런트 235/40R19', 'https://img.danawa.com/prod_img/500000/135/874/img/19874135_1.jpg?shrink=330:*&_v=20230420173206', '195,050', '승용차용', '올시즌', '컴포트형', '저소음', NULL, '235mm', '40%', '19인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 넥쏘, 테슬라 모델S', 19),
	('한국타이어 벤투스 S1 에보3 K127E 275/45R19 4P', 'https://img.danawa.com/prod_img/500000/012/202/img/19202012_1.jpg?shrink=330:*&_v=20230303084612', '284,140', '승용차용', '여름용', '스포츠형', NULL, NULL, '275mm', '45%', '19인치', '4등급', '1등급', NULL, NULL, NULL, NULL, 20),
	('한국타이어 벤투스 S1 에보3 K127E 265/40R22 4P', 'https://img.danawa.com/prod_img/500000/997/201/img/19201997_1.jpg?shrink=330:*&_v=20230303084414', '429,990', '승용차용', '여름용', '스포츠형', NULL, NULL, '265mm', '40%', '22인치', '4등급', '1등급', NULL, NULL, NULL, NULL, 21),
	('한국타이어 아이온 에보 AS SUV IH01A 사일런트 255/45R20', 'https://img.danawa.com/prod_img/500000/331/462/img/28462331_1.jpg?shrink=330:*&_v=20230925123947', '218,290', 'SUV, RV용', '올시즌', '컴포트형', '저소음', NULL, '255mm', '45%', '20인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 아이오닉5, 기아 EV6', 22),
	('한국타이어 아이온 윈터 IW01 사일런트 245/40R20', 'https://img.danawa.com/prod_img/500000/625/771/img/28771625_1.jpg?shrink=330:*&_v=20231016130835', '219,000', '승용차용', '겨울용', '컴포트형', '저소음', '알파인', '245mm', '40%', '20인치', NULL, NULL, NULL, NULL, NULL, NULL, 23),
	('넥센타이어 로디안 GTX EV 235/55R19', 'https://img.danawa.com/prod_img/500000/224/530/img/28530224_1.jpg?shrink=330:*&_v=20231005083621', '110,000', 'SUV, RV용', '올시즌', NULL, NULL, NULL, '235mm', '55%', '19인치', '4등급', '4등급', '680(1등급)', 'A', 'A', NULL, 24),
	('한국타이어 아이온 에보 AS IH01 245/35R21', 'https://img.danawa.com/prod_img/500000/281/144/img/13144281_1.jpg?shrink=330:*&_v=20220929085852', '324,830', '승용차용', '올시즌', '컴포트형', NULL, NULL, '245mm', '35%', '21인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 넥쏘, 테슬라 모델S', 25),
	('한국타이어 아이온 에보 AS SUV IH01A 사일런트 275/50R20', 'https://img.danawa.com/prod_img/500000/466/462/img/28462466_1.jpg?shrink=330:*&_v=20230925124702', '247,140', 'SUV, RV용', '올시즌', '컴포트형', '저소음', NULL, '275mm', '50%', '20인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 아이오닉5, 기아 EV6', 26),
	('한국타이어 아이온 에보 AS SUV IH01A 255/35R21', 'https://img.danawa.com/prod_img/500000/378/963/img/17963378_1.jpg?shrink=330:*&_v=20221011124856', '335,540', 'SUV, RV용', '올시즌', '컴포트형', NULL, NULL, '255mm', '35%', '21인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 아이오닉5, 기아 EV6', 27),
	('한국타이어 아이온 에보 AS SUV IH01A 사일런트 255/60R19', 'https://img.danawa.com/prod_img/500000/385/462/img/28462385_1.jpg?shrink=330:*&_v=20230925124225', '195,880', 'SUV, RV용', '올시즌', '컴포트형', '저소음', NULL, '255mm', '60%', '19인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 아이오닉5, 기아 EV6', 28),
	('한국타이어 아이온 윈터 IW01 245/45R19', 'https://img.danawa.com/prod_img/500000/919/828/img/28828919_1.jpg?shrink=330:*&_v=20231018123518', '190,580', '승용차용', '겨울용', '컴포트형', NULL, '알파인', '245mm', '45%', '19인치', NULL, NULL, NULL, NULL, NULL, NULL, 29),
	('한국타이어 아이온 윈터 SUV IW01A 255/40R21', 'https://img.danawa.com/prod_img/500000/592/828/img/28828592_1.jpg?shrink=330:*&_v=20231018111446', '283,570', 'SUV, RV용', '겨울용', '컴포트형', NULL, '알파인', '255mm', '40%', '21인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 30),
	('금호타이어 크루젠 HP71 EV 255/50R20', 'https://img.danawa.com/prod_img/500000/382/425/img/20425382_1.jpg?shrink=330:*&_v=20230605145133', '178,790', 'SUV, RV용', '올시즌', '컴포트형', NULL, NULL, '255mm', '50%', '20인치', '1등급', '3등급', '640(2등급)', 'A', 'A', NULL, 31),
	('한국타이어 아이온 에보 AS SUV IH01A 285/45R21', 'https://img.danawa.com/prod_img/500000/544/462/img/28462544_1.jpg?shrink=330:*&_v=20230925125030', '275,560', 'SUV, RV용', '올시즌', '컴포트형', NULL, NULL, '285mm', '45%', '21인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 아이오닉5, 기아 EV6', 32),
	('금호타이어 크루젠 HP71 EV 225/60R17', 'https://img.danawa.com/prod_img/500000/064/425/img/20425064_1.jpg?shrink=330:*&_v=20230605144052', '148,340', 'SUV, RV용', '올시즌', '컴포트형', NULL, NULL, '225mm', '60%', '17인치', '1등급', '3등급', '640(2등급)', 'A', 'A', NULL, 33),
	('금호타이어 마제스티9 솔루스 TA91 EV 245/45R18', 'https://img.danawa.com/prod_img/500000/186/495/img/17495186_1.jpg?shrink=330:*&_v=20220720100014', '174,000', '승용차용', '올시즌', '컴포트형', NULL, NULL, '245mm', '45%', '18인치', '2등급', '3등급', '560(2등급)', 'AA', 'A', NULL, 34),
	('한국타이어 벤투스 S1 에보3 K127E 225/55R19 4P', 'https://img.danawa.com/prod_img/500000/967/201/img/19201967_1.jpg?shrink=330:*&_v=20230303083839', '256,450', '승용차용', '여름용', '스포츠형', NULL, NULL, '225mm', '55%', '19인치', '4등급', '1등급', NULL, NULL, NULL, NULL, 35),
	('한국타이어 아이온 윈터 IW01 225/55R18', 'https://img.danawa.com/prod_img/500000/347/622/img/29622347_1.jpg?shrink=330:*&_v=20231031141928', '145,240', '승용차용', '겨울용', '컴포트형', NULL, '알파인', '225mm', '55%', '18인치', NULL, NULL, NULL, NULL, NULL, NULL, 36),
	('한국타이어 아이온 에보 AS IH01 사일런트 235/45R18', 'https://img.danawa.com/prod_img/500000/770/461/img/28461770_1.jpg?shrink=330:*&_v=20230925104138', '195,800', '승용차용', '올시즌', '컴포트형', '저소음', NULL, '235mm', '45%', '18인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 넥쏘, 테슬라 모델S', 37),
	('한국타이어 아이온 윈터 SUV IW01A 사일런트 235/45R20', 'https://img.danawa.com/prod_img/500000/632/923/img/28923632_1.jpg?shrink=330:*&_v=20231023133112', '일시 품절', 'SUV, RV용', '겨울용', '컴포트형', '저소음', '알파인', '235mm', '45%', '20인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 38),
	('한국타이어 아이온 에보 SUV IK01A 275/35R21', 'https://img.danawa.com/prod_img/500000/710/655/img/20655710_1.jpg?shrink=330:*&_v=20230623084124', '378,000', 'SUV, RV용', NULL, '스포츠형', NULL, NULL, '275mm', '35%', '21인치', NULL, NULL, '320(4등급)', 'AA', 'A', '아우디 A7', 39),
	('한국타이어 아이온 에보 AS SUV IH01A 사일런트 235/45R20', 'https://img.danawa.com/prod_img/500000/060/975/img/29975060_1.jpg?shrink=330:*&_v=20231115091552', '248,620', 'SUV, RV용', '올시즌', '컴포트형', '저소음', NULL, '235mm', '45%', '20인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 아이오닉5, 기아 EV6', 40),
	('금호타이어 크루젠 HP71 EV 235/55R19', 'https://img.danawa.com/prod_img/500000/970/494/img/17494970_1.jpg?shrink=330:*&_v=20220720094459', '153,000', 'SUV, RV용', '올시즌', '컴포트형', NULL, NULL, '235mm', '55%', '19인치', '1등급', '3등급', '640(2등급)', 'A', 'A', NULL, 41),
	('한국타이어 아이온 에보 IK01 275/35R21', 'https://img.danawa.com/prod_img/500000/501/542/img/21542501_1.jpg?shrink=330:*&_v=20230714125555', '410,130', '승용차용', NULL, '스포츠형', NULL, NULL, '275mm', '35%', '21인치', NULL, NULL, '320(4등급)', 'AA', 'A', '테슬라 모델S, 아우디 e-트론 GT', 42),
	('금호타이어 크루젠 HP71 EV 255/45R20', 'https://img.danawa.com/prod_img/500000/810/560/img/18560810_1.jpg?shrink=330:*&_v=20221221135730', '173,710', 'SUV, RV용', '올시즌', '컴포트형', NULL, NULL, '255mm', '45%', '20인치', '1등급', '3등급', '640(2등급)', 'A', 'A', NULL, 43),
	('한국타이어 벤투스 S1 에보3 K127E 285/35R22', 'https://img.danawa.com/prod_img/500000/515/245/img/19245515_1.jpg?shrink=330:*&_v=20230307145728', '389,850', '승용차용', '여름용', '스포츠형', NULL, NULL, '285mm', '35%', '22인치', '4등급', '1등급', NULL, NULL, NULL, NULL, 44),
	('금호타이어 크루젠 HP71 EV 255/45R19', 'https://img.danawa.com/prod_img/500000/556/425/img/20425556_1.jpg?shrink=330:*&_v=20230605145722', '189,100', 'SUV, RV용', '올시즌', '컴포트형', NULL, NULL, '255mm', '45%', '19인치', '1등급', '3등급', '640(2등급)', 'A', 'A', NULL, 45),
	('한국타이어 벤투스 S1 에보3 K127E 265/40R22', 'https://img.danawa.com/prod_img/500000/672/241/img/19241672_1.jpg?shrink=330:*&_v=20230307124527', '319,040', '승용차용', '여름용', '스포츠형', NULL, NULL, '265mm', '40%', '22인치', '4등급', '1등급', NULL, NULL, NULL, NULL, 46),
	('한국타이어 아이온 에보 AS IH01 245/45R19', 'https://img.danawa.com/prod_img/500000/138/960/img/17960138_1.jpg?shrink=330:*&_v=20221007165050', '199,470', '승용차용', '올시즌', '컴포트형', NULL, NULL, '245mm', '45%', '19인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 넥쏘, 테슬라 모델S', 47),
	('미쉐린타이어 파일럿 스포츠 EV 235/50R20', 'https://img.danawa.com/prod_img/500000/288/333/img/29333288_1.jpg?shrink=330:*&_v=20231025091547', '632,510', '승용차용', '여름용', NULL, NULL, NULL, '235mm', '50%', '20인치', '1등급', '2등급', '320(4등급)', 'AA', 'A', NULL, 48),
	('금호타이어 마제스티9 솔루스 TA91 EV 235/45R19', 'https://img.danawa.com/prod_img/500000/286/798/img/28798286_1.jpg?shrink=330:*&_v=20231017085538', '일시 품절', '승용차용', '올시즌', '컴포트형', NULL, NULL, '235mm', '45%', '19인치', '2등급', '3등급', '560(2등급)', 'AA', 'A', NULL, 49),
	('금호타이어 크루젠 HP71 EV 235/55R18', 'https://img.danawa.com/prod_img/500000/172/425/img/20425172_1.jpg?shrink=330:*&_v=20230605144440', '148,660', 'SUV, RV용', '올시즌', '컴포트형', NULL, NULL, '235mm', '55%', '18인치', '1등급', '3등급', '640(2등급)', 'A', 'A', NULL, 50),
	('한국타이어 아이온 에보 IK01 305/30R21', 'https://img.danawa.com/prod_img/500000/543/542/img/21542543_1.jpg?shrink=330:*&_v=20230714125633', '474,910', '승용차용', NULL, '스포츠형', NULL, NULL, '305mm', '30%', '21인치', NULL, NULL, '320(4등급)', 'AA', 'A', '테슬라 모델S, 아우디 e-트론 GT', 51),
	('한국타이어 아이온 에보 IK01 235/35R20', 'https://img.danawa.com/prod_img/500000/730/541/img/21541730_1.jpg?shrink=330:*&_v=20230714123834', '365,090', '승용차용', NULL, '스포츠형', NULL, NULL, '235mm', '35%', '20인치', NULL, NULL, '320(4등급)', 'AA', 'A', '테슬라 모델S, 아우디 e-트론 GT', 52),
	('미쉐린타이어 파일럿 스포츠 EV 265/45R20', 'https://img.danawa.com/prod_img/500000/128/719/img/19719128_1.jpg?shrink=330:*&_v=20230411090630', '520,000', '승용차용', '여름용', NULL, NULL, NULL, '265mm', '45%', '20인치', '1등급', '2등급', '320(4등급)', 'AA', 'A', NULL, 53),
	('금호타이어 마제스티9 솔루스 TA91 EV 235/40R19', 'https://img.danawa.com/prod_img/500000/180/495/img/17495180_1.jpg?shrink=330:*&_v=20220720095919', '194,000', '승용차용', '올시즌', '컴포트형', NULL, NULL, '235mm', '40%', '19인치', '2등급', '3등급', '560(2등급)', 'AA', 'A', NULL, 54),
	('한국타이어 아이온 윈터 IW01 265/40R21', 'https://img.danawa.com/prod_img/500000/187/335/img/29335187_1.jpg?shrink=330:*&_v=20231025104254', '276,690', '승용차용', '겨울용', '컴포트형', NULL, '알파인', '265mm', '40%', '21인치', NULL, NULL, NULL, NULL, NULL, NULL, 55),
	('한국타이어 아이온 에보 AS IH01 235/35R20', 'https://img.danawa.com/prod_img/500000/257/144/img/13144257_1.jpg?shrink=330:*&_v=20220929085541', '332,250', '승용차용', '올시즌', '컴포트형', NULL, NULL, '235mm', '35%', '20인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 넥쏘, 테슬라 모델S', 56),
	('한국타이어 키너지 AS EV EH01 215/55R17', 'https://img.danawa.com/prod_img/500000/113/027/img/15027113_1.jpg?shrink=330:*&_v=20210818154149', '114,990', '승용차용', '올시즌', '컴포트형', NULL, NULL, '215mm', '55%', '17인치', '3등급', '2등급', '500(3등급)', 'A', 'A', '현대 쏘나타, 현대 코나', 57),
	('한국타이어 키너지 AS X EV EH01A 215/55R17', 'https://img.danawa.com/prod_img/500000/375/882/img/29882375_1.jpg?shrink=330:*&_v=20231109133923', '119,400', 'SUV, RV용', '올시즌', '컴포트형', NULL, NULL, '215mm', '55%', '17인치', '3등급', '2등급', '500(3등급)', 'A', 'A', NULL, 58),
	('한국타이어 아이온 윈터 IW01 245/35R21', 'https://img.danawa.com/prod_img/500000/107/521/img/28521107_1.jpg?shrink=330:*&_v=20231004165020', '226,170', '승용차용', '겨울용', '컴포트형', NULL, '알파인', '245mm', '35%', '21인치', NULL, NULL, NULL, NULL, NULL, NULL, 59),
	('한국타이어 아이온 에보 IK01 265/35R21', 'https://img.danawa.com/prod_img/500000/910/541/img/21541910_1.jpg?shrink=330:*&_v=20230714124410', '412,660', '승용차용', NULL, '스포츠형', NULL, NULL, '265mm', '35%', '21인치', NULL, NULL, '320(4등급)', 'AA', 'A', '테슬라 모델S, 아우디 e-트론 GT', 60),
	('한국타이어 아이온 윈터 IW01 사일런트 245/45R20', 'https://img.danawa.com/prod_img/500000/874/858/img/28858874_1.jpg?shrink=330:*&_v=20231019130313', '225,240', '승용차용', '겨울용', '컴포트형', '저소음', '알파인', '245mm', '45%', '20인치', NULL, NULL, NULL, NULL, NULL, NULL, 61),
	('한국타이어 아이온 에보 AS IH01 사일런트 275/40R19', 'https://img.danawa.com/prod_img/500000/910/974/img/29974910_1.jpg?shrink=330:*&_v=20231115090226', '208,560', '승용차용', '올시즌', '컴포트형', '저소음', NULL, '275mm', '40%', '19인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 넥쏘, 테슬라 모델S', 62),
	('한국타이어 아이온 에보 IK01 사일런트 245/45R19', 'https://img.danawa.com/prod_img/500000/625/805/img/27805625_1.jpg?shrink=330:*&_v=20230828095557', '228,910', '승용차용', NULL, '스포츠형', '저소음', NULL, '245mm', '45%', '19인치', NULL, NULL, '320(4등급)', 'AA', 'A', '테슬라 모델S, 아우디 e-트론 GT', 63),
	('한국타이어 아이온 윈터 SUV IW01A 275/35R21', 'https://img.danawa.com/prod_img/500000/387/336/img/29336387_1.jpg?shrink=330:*&_v=20231025111712', '275,280', 'SUV, RV용', '겨울용', '컴포트형', NULL, '알파인', '275mm', '35%', '21인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 64),
	('금호타이어 마제스티9 솔루스 TA91 EV 225/55R18', 'https://img.danawa.com/prod_img/500000/280/798/img/28798280_1.jpg?shrink=330:*&_v=20231017085451', '일시 품절', '승용차용', '올시즌', '컴포트형', NULL, NULL, '225mm', '55%', '18인치', '2등급', '3등급', '560(2등급)', 'AA', 'A', NULL, 65),
	('한국타이어 아이온 윈터 SUV IW01A 255/50R20', 'https://img.danawa.com/prod_img/500000/351/336/img/29336351_1.jpg?shrink=330:*&_v=20231025111548', '205,340', 'SUV, RV용', '겨울용', '컴포트형', NULL, '알파인', '255mm', '50%', '20인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 66),
	('한국타이어 아이온 에보 AS SUV IH01A 사일런트 255/35R21', 'https://img.danawa.com/prod_img/500000/270/725/img/18725270_1.jpg?shrink=330:*&_v=20230111092109', '291,090', 'SUV, RV용', '올시즌', '컴포트형', '저소음', NULL, '255mm', '35%', '21인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 아이오닉5, 기아 EV6', 67),
	('미쉐린타이어 파일럿 스포츠 EV 235/55R20', 'https://img.danawa.com/prod_img/500000/096/800/img/18800096_1.jpg?shrink=330:*&_v=20230119101955', '420,000', '승용차용', '여름용', NULL, NULL, NULL, '235mm', '55%', '20인치', '1등급', '2등급', '320(4등급)', 'AA', 'A', NULL, 68),
	('한국타이어 아이온 에보 AS SUV IH01A 사일런트 255/45R19', 'https://img.danawa.com/prod_img/500000/310/462/img/28462310_1.jpg?shrink=330:*&_v=20230925123843', '219,370', 'SUV, RV용', '올시즌', '컴포트형', '저소음', NULL, '255mm', '45%', '19인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 아이오닉5, 기아 EV6', 69),
	('한국타이어 아이온 윈터 IW01 235/40R19', 'https://img.danawa.com/prod_img/500000/632/622/img/29622632_1.jpg?shrink=330:*&_v=20231031142905', '175,480', '승용차용', '겨울용', '컴포트형', NULL, '알파인', '235mm', '40%', '19인치', NULL, NULL, NULL, NULL, NULL, NULL, 70),
	('한국타이어 아이온 윈터 SUV IW01A 265/45R21', 'https://img.danawa.com/prod_img/500000/461/318/img/18318461_1.jpg?shrink=330:*&_v=20221118082227', '267,080', 'SUV, RV용', '겨울용', '컴포트형', NULL, '알파인', '265mm', '45%', '21인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 71),
	('한국타이어 아이온 윈터 SUV IW01A 사일런트 275/45R20', 'https://img.danawa.com/prod_img/500000/187/924/img/28924187_1.jpg?shrink=330:*&_v=20231023134728', '325,510', 'SUV, RV용', '겨울용', '컴포트형', '저소음', '알파인', '275mm', '45%', '20인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 72),
	('한국타이어 아이온 에보 AS IH01 사일런트 245/45R19', 'https://img.danawa.com/prod_img/500000/567/465/img/20465567_1.jpg?shrink=330:*&_v=20230608133201', '171,560', '승용차용', '올시즌', '컴포트형', '저소음', NULL, '245mm', '45%', '19인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 넥쏘, 테슬라 모델S', 73),
	('한국타이어 아이온 윈터 SUV IW01A 사일런트 255/50R19', 'https://img.danawa.com/prod_img/500000/845/923/img/28923845_1.jpg?shrink=330:*&_v=20231023133628', '212,660', 'SUV, RV용', '겨울용', '컴포트형', '저소음', '알파인', '255mm', '50%', '19인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 74),
	('한국타이어 아이온 에보 AS SUV IH01A 255/40R20', 'https://img.danawa.com/prod_img/500000/384/963/img/17963384_1.jpg?shrink=330:*&_v=20221011124919', '274,240', 'SUV, RV용', '올시즌', '컴포트형', NULL, NULL, '255mm', '40%', '20인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 아이오닉5, 기아 EV6', 75),
	('한국타이어 키너지 AS EV EH01 사일런트 205/55R16', 'https://img.danawa.com/prod_img/500000/150/421/img/16421150_1.jpg?shrink=330:*&_v=20220217112636', '128,270', '승용차용', '올시즌', '컴포트형', '저소음', NULL, '205mm', '55%', '16인치', '3등급', '2등급', '500(3등급)', 'A', 'A', '현대 쏘나타, 현대 코나', 76),
	('한국타이어 아이온 윈터 SUV IW01A 사일런트 245/40R21', 'https://img.danawa.com/prod_img/500000/680/923/img/28923680_1.jpg?shrink=330:*&_v=20231023133221', '278,480', 'SUV, RV용', '겨울용', '컴포트형', '저소음', '알파인', '245mm', '40%', '21인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 77),
	('한국타이어 아이온 윈터 IW01 사일런트 245/40R19', 'https://img.danawa.com/prod_img/500000/565/771/img/28771565_1.jpg?shrink=330:*&_v=20231016130621', '187,000', '승용차용', '겨울용', '컴포트형', '저소음', '알파인', '245mm', '40%', '19인치', NULL, NULL, NULL, NULL, NULL, NULL, 78),
	('미쉐린타이어 파일럿 스포츠 EV 275/35R21', 'https://img.danawa.com/prod_img/500000/142/153/img/28153142_1.jpg?shrink=330:*&_v=20230911083618', '729,600', '승용차용', '여름용', NULL, NULL, NULL, '275mm', '35%', '21인치', '1등급', '2등급', '320(4등급)', 'AA', 'A', NULL, 79),
	('한국타이어 아이온 에보 AS IH01 235/45R18', 'https://img.danawa.com/prod_img/500000/664/980/img/17980664_1.jpg?shrink=330:*&_v=20221012165127', '185,600', '승용차용', '올시즌', '컴포트형', NULL, NULL, '235mm', '45%', '18인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 넥쏘, 테슬라 모델S', 80),
	('미쉐린타이어 파일럿 스포츠 EV 235/45R20', 'https://img.danawa.com/prod_img/500000/062/719/img/19719062_1.jpg?shrink=330:*&_v=20230411090135', '573,000', '승용차용', '여름용', NULL, NULL, NULL, '235mm', '45%', '20인치', '1등급', '2등급', '320(4등급)', 'AA', 'A', NULL, 81),
	('금호타이어 솔루스 TA31 EV 205/60R16', 'https://img.danawa.com/prod_img/500000/796/425/img/20425796_1.jpg?shrink=330:*&_v=20230605150304', '145,000', '승용차용', '올시즌', '컴포트형', NULL, NULL, '205mm', '60%', '16인치', '3등급', '3등급', '500(3등급)', 'A', 'A', NULL, 82),
	('한국타이어 키너지 AS X EV EH01A 255/50R19', 'https://img.danawa.com/prod_img/500000/411/202/img/19202411_1.jpg?shrink=330:*&_v=20230303093235', '134,630', 'SUV, RV용', '올시즌', '컴포트형', NULL, NULL, '255mm', '50%', '19인치', '3등급', '2등급', '500(3등급)', 'A', 'A', NULL, 83),
	('한국타이어 아이온 윈터 SUV IW01A 사일런트 265/45R21', 'https://img.danawa.com/prod_img/500000/552/164/img/13164552_1.jpg?shrink=330:*&_v=20221004084910', '246,000', 'SUV, RV용', '겨울용', '컴포트형', '저소음', '알파인', '265mm', '45%', '21인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 84),
	('한국타이어 아이온 에보 AS SUV IH01A 255/40R21', 'https://img.danawa.com/prod_img/500000/390/963/img/17963390_1.jpg?shrink=330:*&_v=20221011124930', '233,060', 'SUV, RV용', '올시즌', '컴포트형', NULL, NULL, '255mm', '40%', '21인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 아이오닉5, 기아 EV6', 85),
	('한국타이어 아이온 에보 AS SUV IH01A 사일런트 275/35R21', 'https://img.danawa.com/prod_img/500000/447/725/img/18725447_1.jpg?shrink=330:*&_v=20230111093334', '299,150', 'SUV, RV용', '올시즌', '컴포트형', '저소음', NULL, '275mm', '35%', '21인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 아이오닉5, 기아 EV6', 86),
	('한국타이어 아이온 에보 AS SUV IH01A 사일런트 285/45R21', 'https://img.danawa.com/prod_img/500000/568/462/img/28462568_1.jpg?shrink=330:*&_v=20230925125143', '270,870', 'SUV, RV용', '올시즌', '컴포트형', '저소음', NULL, '285mm', '45%', '21인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 아이오닉5, 기아 EV6', 87),
	('한국타이어 아이온 윈터 IW01 사일런트 265/35R22', 'https://img.danawa.com/prod_img/500000/858/654/img/29654858_1.jpg?shrink=330:*&_v=20231101091829', '일시 품절', '승용차용', '겨울용', '컴포트형', '저소음', '알파인', '265mm', '35%', '22인치', NULL, NULL, NULL, NULL, NULL, NULL, 88),
	('한국타이어 아이온 윈터 SUV IW01A 275/45R20', 'https://img.danawa.com/prod_img/500000/949/335/img/29335949_1.jpg?shrink=330:*&_v=20231025110323', '271,180', 'SUV, RV용', '겨울용', '컴포트형', NULL, '알파인', '275mm', '45%', '20인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 89),
	('한국타이어 아이온 윈터 SUV IW01A 사일런트 255/45R19', 'https://img.danawa.com/prod_img/500000/818/923/img/28923818_1.jpg?shrink=330:*&_v=20231023133550', '222,540', 'SUV, RV용', '겨울용', '컴포트형', '저소음', '알파인', '255mm', '45%', '19인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 90),
	('한국타이어 아이온 윈터 SUV IW01A 사일런트 275/40R20', 'https://img.danawa.com/prod_img/500000/166/924/img/28924166_1.jpg?shrink=330:*&_v=20231023134648', '310,560', 'SUV, RV용', '겨울용', '컴포트형', '저소음', '알파인', '275mm', '40%', '20인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 91),
	('한국타이어 아이온 윈터 SUV IW01A 사일런트 255/60R19', 'https://img.danawa.com/prod_img/500000/896/923/img/28923896_1.jpg?shrink=330:*&_v=20231023133822', '일시 품절', 'SUV, RV용', '겨울용', '컴포트형', '저소음', '알파인', '255mm', '60%', '19인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 92),
	('미쉐린타이어 파일럿 스포츠 EV 255/35R21', 'https://img.danawa.com/prod_img/500000/074/719/img/19719074_1.jpg?shrink=330:*&_v=20230411090235', '713,000', '승용차용', '여름용', NULL, NULL, NULL, '255mm', '35%', '21인치', '1등급', '2등급', '320(4등급)', 'AA', 'A', NULL, 93),
	('한국타이어 아이온 윈터 SUV IW01A 255/40R20', 'https://img.danawa.com/prod_img/500000/957/520/img/28520957_1.jpg?shrink=330:*&_v=20231004164440', '194,840', 'SUV, RV용', '겨울용', '컴포트형', NULL, '알파인', '255mm', '40%', '20인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 94),
	('한국타이어 키너지 AS EV EH01 235/45R18', 'https://img.danawa.com/prod_img/500000/074/027/img/15027074_1.jpg?shrink=330:*&_v=20210818154044', '275,290', '승용차용', '올시즌', '컴포트형', NULL, NULL, '235mm', '45%', '18인치', '3등급', '2등급', '500(3등급)', 'A', 'A', '현대 쏘나타, 현대 코나', 95),
	('금호타이어 솔루스 TA31 EV 215/55R17', 'https://img.danawa.com/prod_img/500000/679/425/img/20425679_1.jpg?shrink=330:*&_v=20230605150022', '110,000', '승용차용', '올시즌', '컴포트형', NULL, NULL, '215mm', '55%', '17인치', '4등급', '3등급', '500(3등급)', 'A', 'A', NULL, 96),
	('미쉐린타이어 파일럿 스포츠 EV 275/40R22', 'https://img.danawa.com/prod_img/500000/306/800/img/18800306_1.jpg?shrink=330:*&_v=20230119103116', '665,660', '승용차용', '여름용', NULL, NULL, NULL, '275mm', '40%', '22인치', '1등급', '2등급', '320(4등급)', 'AA', 'A', NULL, 97),
	('한국타이어 아이온 에보 AS IH01 235/40R19', 'https://img.danawa.com/prod_img/500000/278/144/img/13144278_1.jpg?shrink=330:*&_v=20220929085804', '217,320', '승용차용', '올시즌', '컴포트형', NULL, NULL, '235mm', '40%', '19인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 넥쏘, 테슬라 모델S', 98),
	('한국타이어 키너지 AS EV EH01 사일런트 235/45R18', 'https://img.danawa.com/prod_img/500000/189/421/img/16421189_1.jpg?shrink=330:*&_v=20220217112821', '229,550', '승용차용', '올시즌', '컴포트형', '저소음', NULL, '235mm', '45%', '18인치', '3등급', '2등급', '500(3등급)', 'A', 'A', '현대 쏘나타, 현대 코나', 99),
	('한국타이어 아이온 윈터 IW01 245/40R20', 'https://img.danawa.com/prod_img/500000/449/622/img/29622449_1.jpg?shrink=330:*&_v=20231031142302', '235,120', '승용차용', '겨울용', '컴포트형', NULL, '알파인', '245mm', '40%', '20인치', NULL, NULL, NULL, NULL, NULL, NULL, 100),
	('한국타이어 아이온 윈터 IW01 245/45R20', 'https://img.danawa.com/prod_img/500000/479/622/img/29622479_1.jpg?shrink=330:*&_v=20231031142355', '212,610', '승용차용', '겨울용', '컴포트형', NULL, '알파인', '245mm', '45%', '20인치', NULL, NULL, NULL, NULL, NULL, NULL, 101),
	('한국타이어 키너지 AS EV EH01 205/55R16', 'https://img.danawa.com/prod_img/500000/918/716/img/10716918_1.jpg?shrink=330:*&_v=20201027173744', '156,850', '승용차용', '올시즌', '컴포트형', NULL, NULL, '205mm', '55%', '16인치', '3등급', '2등급', '500(3등급)', 'A', 'A', '현대 쏘나타, 현대 코나', 102),
	('한국타이어 아이온 윈터 SUV IW01A 사일런트 275/35R21', 'https://img.danawa.com/prod_img/500000/118/924/img/28924118_1.jpg?shrink=330:*&_v=20231023134520', '331,650', 'SUV, RV용', '겨울용', '컴포트형', '저소음', '알파인', '275mm', '35%', '21인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 103),
	('한국타이어 아이온 윈터 SUV IW01A 275/40R22', 'https://img.danawa.com/prod_img/500000/931/335/img/29335931_1.jpg?shrink=330:*&_v=20231025110255', '307,450', 'SUV, RV용', '겨울용', '컴포트형', NULL, '알파인', '275mm', '40%', '22인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 104),
	('미쉐린타이어 파일럿 스포츠 EV 255/45R19', 'https://img.danawa.com/prod_img/500000/068/719/img/19719068_1.jpg?shrink=330:*&_v=20230411090206', '409,350', '승용차용', '여름용', NULL, NULL, NULL, '255mm', '45%', '19인치', '1등급', '2등급', '320(4등급)', 'AA', 'A', NULL, 105),
	('한국타이어 아이온 윈터 SUV IW01A 255/60R19', 'https://img.danawa.com/prod_img/500000/541/335/img/29335541_1.jpg?shrink=330:*&_v=20231025105234', '190,900', 'SUV, RV용', '겨울용', '컴포트형', NULL, '알파인', '255mm', '60%', '19인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 106),
	('한국타이어 아이온 에보 AS IH01 사일런트 225/55R18', 'https://img.danawa.com/prod_img/500000/844/974/img/29974844_1.jpg?shrink=330:*&_v=20231115085715', '164,770', '승용차용', '올시즌', '컴포트형', '저소음', NULL, '225mm', '55%', '18인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 넥쏘, 테슬라 모델S', 107),
	('금호타이어 솔루스 TA31 EV 215/50R17', 'https://img.danawa.com/prod_img/500000/934/425/img/20425934_1.jpg?shrink=330:*&_v=20230605150845', '134,800', '승용차용', '올시즌', '컴포트형', NULL, NULL, '215mm', '50%', '17인치', '3등급', '4등급', '500(3등급)', 'A', 'A', NULL, 108),
	('한국타이어 아이온 윈터 IW01 265/35R22', 'https://img.danawa.com/prod_img/500000/154/335/img/29335154_1.jpg?shrink=330:*&_v=20231025104157', '321,750', '승용차용', '겨울용', '컴포트형', NULL, '알파인', '265mm', '35%', '22인치', NULL, NULL, NULL, NULL, NULL, NULL, 109),
	('한국타이어 아이온 윈터 IW01 사일런트 265/40R21', 'https://img.danawa.com/prod_img/500000/724/771/img/28771724_1.jpg?shrink=330:*&_v=20231016131202', '264,000', '승용차용', '겨울용', '컴포트형', '저소음', '알파인', '265mm', '40%', '21인치', NULL, NULL, NULL, NULL, NULL, NULL, 110),
	('한국타이어 아이온 윈터 SUV IW01A 사일런트 255/40R20', 'https://img.danawa.com/prod_img/500000/755/923/img/28923755_1.jpg?shrink=330:*&_v=20231023133451', '258,910', 'SUV, RV용', '겨울용', '컴포트형', '저소음', '알파인', '255mm', '40%', '20인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 111),
	('한국타이어 아이온 에보 AS SUV IH01A 275/35R21 4P', 'https://img.danawa.com/prod_img/500000/497/239/img/19239497_1.jpg?shrink=330:*&_v=20230307095747', '388,370', 'SUV, RV용', '올시즌', '컴포트형', NULL, NULL, '275mm', '35%', '21인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 아이오닉5, 기아 EV6', 112),
	('한국타이어 아이온 윈터 IW01 사일런트 235/45R18', 'https://img.danawa.com/prod_img/500000/358/771/img/28771358_1.jpg?shrink=330:*&_v=20231016125755', '160,000', '승용차용', '겨울용', '컴포트형', '저소음', '알파인', '235mm', '45%', '18인치', NULL, NULL, NULL, NULL, NULL, NULL, 113),
	('한국타이어 아이온 윈터 SUV IW01A 285/45R21', 'https://img.danawa.com/prod_img/500000/003/336/img/29336003_1.jpg?shrink=330:*&_v=20231025110439', '318,160', 'SUV, RV용', '겨울용', '컴포트형', NULL, '알파인', '285mm', '45%', '21인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 114),
	('한국타이어 아이온 윈터 SUV IW01A 255/50R19', 'https://img.danawa.com/prod_img/500000/320/337/img/29337320_1.jpg?shrink=330:*&_v=20231025125449', '193,860', 'SUV, RV용', '겨울용', '컴포트형', NULL, '알파인', '255mm', '50%', '19인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 115),
	('한국타이어 아이온 윈터 IW01 사일런트 235/40R19', 'https://img.danawa.com/prod_img/500000/343/771/img/28771343_1.jpg?shrink=330:*&_v=20231016125732', '179,000', '승용차용', '겨울용', '컴포트형', '저소음', '알파인', '235mm', '40%', '19인치', NULL, NULL, NULL, NULL, NULL, NULL, 116),
	('한국타이어 아이온 에보 IK01 사일런트 265/35R21', 'https://img.danawa.com/prod_img/500000/640/805/img/27805640_1.jpg?shrink=330:*&_v=20230828095629', '388,190', '승용차용', NULL, '스포츠형', '저소음', NULL, '265mm', '35%', '21인치', NULL, NULL, '320(4등급)', 'AA', 'A', '테슬라 모델S, 아우디 e-트론 GT', 117),
	('한국타이어 아이온 에보 IK01 245/45R19', 'https://img.danawa.com/prod_img/500000/766/541/img/21541766_1.jpg?shrink=330:*&_v=20230714123921', '241,700', '승용차용', NULL, '스포츠형', NULL, NULL, '245mm', '45%', '19인치', NULL, NULL, '320(4등급)', 'AA', 'A', '테슬라 모델S, 아우디 e-트론 GT', 118),
	('한국타이어 아이온 에보 SUV IK01A 255/40R20', 'https://img.danawa.com/prod_img/500000/707/655/img/20655707_1.jpg?shrink=330:*&_v=20230623084058', '294,000', 'SUV, RV용', NULL, '스포츠형', NULL, NULL, '255mm', '40%', '20인치', NULL, NULL, '320(4등급)', 'AA', 'A', '아우디 A7', 119),
	('한국타이어 아이온 에보 IK01 사일런트 305/30R21', 'https://img.danawa.com/prod_img/500000/643/805/img/27805643_1.jpg?shrink=330:*&_v=20230828095653', '446,420', '승용차용', NULL, '스포츠형', '저소음', NULL, '305mm', '30%', '21인치', NULL, NULL, '320(4등급)', 'AA', 'A', '테슬라 모델S, 아우디 e-트론 GT', 120),
	('한국타이어 아이온 에보 SUV IK01A 255/35R21', 'https://img.danawa.com/prod_img/500000/701/655/img/20655701_1.jpg?shrink=330:*&_v=20230623084036', '364,000', 'SUV, RV용', NULL, '스포츠형', NULL, NULL, '255mm', '35%', '21인치', NULL, NULL, '320(4등급)', 'AA', 'A', '아우디 A7', 121),
	('한국타이어 아이온 윈터 IW01 245/40R19', 'https://img.danawa.com/prod_img/500000/125/521/img/28521125_1.jpg?shrink=330:*&_v=20231004165049', '187,470', '승용차용', '겨울용', '컴포트형', NULL, '알파인', '245mm', '40%', '19인치', NULL, NULL, NULL, NULL, NULL, NULL, 122),
	('한국타이어 아이온 윈터 IW01 사일런트 265/35R21', 'https://img.danawa.com/prod_img/500000/031/172/img/13172031_1.jpg?shrink=330:*&_v=20221004170318', '277,000', '승용차용', '겨울용', '컴포트형', '저소음', '알파인', '265mm', '35%', '21인치', NULL, NULL, NULL, NULL, NULL, NULL, 123),
	('한국타이어 아이온 에보 AS SUV IH01A 235/50R20', 'https://img.danawa.com/prod_img/500000/177/874/img/19874177_1.jpg?shrink=330:*&_v=20230420173406', '254,470', 'SUV, RV용', '올시즌', '컴포트형', NULL, NULL, '235mm', '50%', '20인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 아이오닉5, 기아 EV6', 124),
	('한국타이어 아이온 에보 IK01 사일런트 235/35R20', 'https://img.danawa.com/prod_img/500000/616/805/img/27805616_1.jpg?shrink=330:*&_v=20230828095527', '321,130', '승용차용', NULL, '스포츠형', '저소음', NULL, '235mm', '35%', '20인치', NULL, NULL, '320(4등급)', 'AA', 'A', '테슬라 모델S, 아우디 e-트론 GT', 125),
	('한국타이어 아이온 윈터 SUV IW01A 사일런트 255/45R20', 'https://img.danawa.com/prod_img/500000/537/164/img/13164537_1.jpg?shrink=330:*&_v=20231103161602', '212,000', 'SUV, RV용', '겨울용', '컴포트형', '저소음', '알파인', '255mm', '45%', '20인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 126),
	('한국타이어 아이온 에보 IK01 255/40R20', 'https://img.danawa.com/prod_img/500000/883/541/img/21541883_1.jpg?shrink=330:*&_v=20230714124337', '318,990', '승용차용', NULL, '스포츠형', NULL, NULL, '255mm', '40%', '20인치', NULL, NULL, '320(4등급)', 'AA', 'A', '테슬라 모델S, 아우디 e-트론 GT', 127),
	('한국타이어 아이온 에보 AS SUV IH01A 사일런트 265/45R21', 'https://img.danawa.com/prod_img/500000/069/975/img/29975069_1.jpg?shrink=330:*&_v=20231115091657', '273,610', 'SUV, RV용', '올시즌', '컴포트형', '저소음', NULL, '265mm', '45%', '21인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 아이오닉5, 기아 EV6', 128),
	('한국타이어 아이온 윈터 SUV IW01A 사일런트 275/40R22', 'https://img.danawa.com/prod_img/500000/803/770/img/28770803_1.jpg?shrink=330:*&_v=20231016123117', '293,000', 'SUV, RV용', '겨울용', '컴포트형', '저소음', '알파인', '275mm', '40%', '22인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 129),
	('한국타이어 아이온 에보 AS IH01 235/45R18 4P', 'https://img.danawa.com/prod_img/500000/286/354/img/19354286_1.jpg?shrink=330:*&_v=20230314160430', '234,600', '승용차용', '올시즌', '컴포트형', NULL, NULL, '235mm', '45%', '18인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 넥쏘, 테슬라 모델S', 130),
	('한국타이어 아이온 에보 AS IH01 사일런트 245/40R20', 'https://img.danawa.com/prod_img/500000/865/974/img/29974865_1.jpg?shrink=330:*&_v=20231115085825', '243,610', '승용차용', '올시즌', '컴포트형', '저소음', NULL, '245mm', '40%', '20인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 넥쏘, 테슬라 모델S', 131),
	('한국타이어 아이온 에보 IK01 255/35R21', 'https://img.danawa.com/prod_img/500000/808/541/img/21541808_1.jpg?shrink=330:*&_v=20230714124030', '394,090', '승용차용', NULL, '스포츠형', NULL, NULL, '255mm', '35%', '21인치', NULL, NULL, '320(4등급)', 'AA', 'A', '테슬라 모델S, 아우디 e-트론 GT', 132),
	('한국타이어 아이온 윈터 IW01 235/45R18', 'https://img.danawa.com/prod_img/500000/398/622/img/29622398_1.jpg?shrink=330:*&_v=20231031142112', '170,360', '승용차용', '겨울용', '컴포트형', NULL, '알파인', '235mm', '45%', '18인치', NULL, NULL, NULL, NULL, NULL, NULL, 133),
	('미쉐린타이어 파일럿 스포츠 EV 255/50R21', 'https://img.danawa.com/prod_img/500000/231/800/img/18800231_1.jpg?shrink=330:*&_v=20230119102708', '538,840', '승용차용', '여름용', NULL, NULL, NULL, '255mm', '50%', '21인치', '1등급', '2등급', '320(4등급)', 'AA', 'A', NULL, 134),
	('한국타이어 아이온 윈터 IW01 사일런트 245/45R19', 'https://img.danawa.com/prod_img/500000/640/771/img/28771640_1.jpg?shrink=330:*&_v=20231016130902', '180,000', '승용차용', '겨울용', '컴포트형', '저소음', '알파인', '245mm', '45%', '19인치', NULL, NULL, NULL, NULL, NULL, NULL, 135),
	('한국타이어 아이온 에보 AS SUV IH01A 사일런트 255/40R20', 'https://img.danawa.com/prod_img/500000/249/874/img/19874249_1.jpg?shrink=330:*&_v=20230420174000', '258,880', 'SUV, RV용', '올시즌', '컴포트형', '저소음', NULL, '255mm', '40%', '20인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 아이오닉5, 기아 EV6', 136),
	('미쉐린타이어 파일럿 스포츠 EV 235/55R19', 'https://img.danawa.com/prod_img/500000/078/800/img/18800078_1.jpg?shrink=330:*&_v=20230119101942', '322,510', '승용차용', '여름용', NULL, NULL, NULL, '235mm', '55%', '19인치', '1등급', '2등급', '320(4등급)', 'AA', 'A', NULL, 137),
	('미쉐린타이어 파일럿 스포츠 EV 275/35R22', 'https://img.danawa.com/prod_img/500000/624/004/img/19004624_1.jpg?shrink=330:*&_v=20230213083711', '610,480', '승용차용', '여름용', NULL, NULL, NULL, '275mm', '35%', '22인치', '1등급', '2등급', '320(4등급)', 'AA', 'A', NULL, 138),
	('미쉐린타이어 파일럿 스포츠 EV 235/45R21', 'https://img.danawa.com/prod_img/500000/066/800/img/18800066_1.jpg?shrink=330:*&_v=20230119101905', '524,270', '승용차용', '여름용', NULL, NULL, NULL, '235mm', '45%', '21인치', '1등급', '2등급', '320(4등급)', 'AA', 'A', NULL, 139),
	('미쉐린타이어 파일럿 스포츠 EV 255/40R20', 'https://img.danawa.com/prod_img/500000/092/719/img/19719092_1.jpg?shrink=330:*&_v=20230411090320', '523,870', '승용차용', '여름용', NULL, NULL, NULL, '255mm', '40%', '20인치', '1등급', '2등급', '320(4등급)', 'AA', 'A', NULL, 140),
	('한국타이어 벤투스 S1 에보3 K127E 사일런트 285/35R22', 'https://img.danawa.com/prod_img/500000/638/713/img/16713638_1.jpg?shrink=330:*&_v=20220330145147', '404,000', '승용차용', '여름용', '스포츠형', '저소음', NULL, '285mm', '35%', '22인치', '4등급', '1등급', NULL, NULL, NULL, NULL, 141),
	('한국타이어 아이온 에보 AS IH01 265/35R21 4P', 'https://img.danawa.com/prod_img/500000/938/239/img/19239938_1.jpg?shrink=330:*&_v=20230307102206', '408,580', '승용차용', '올시즌', '컴포트형', NULL, NULL, '265mm', '35%', '21인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 넥쏘, 테슬라 모델S', 142),
	('한국타이어 벤투스 S1 에보3 K127E 사일런트 265/40R22', 'https://img.danawa.com/prod_img/500000/975/421/img/16421975_1.jpg?shrink=330:*&_v=20220217125945', '359,000', '승용차용', '여름용', '스포츠형', '저소음', NULL, '265mm', '40%', '22인치', '4등급', '1등급', NULL, NULL, NULL, NULL, 143),
	('한국타이어 아이온 에보 AS IH01 245/35R21 4P', 'https://img.danawa.com/prod_img/500000/887/239/img/19239887_1.jpg?shrink=330:*&_v=20230307101926', '377,190', '승용차용', '올시즌', '컴포트형', NULL, NULL, '245mm', '35%', '21인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 넥쏘, 테슬라 모델S', 144),
	('한국타이어 아이온 윈터 SUV IW01A 235/50R20', 'https://img.danawa.com/prod_img/500000/431/318/img/18318431_1.jpg?shrink=330:*&_v=20221118081448', '171,380', 'SUV, RV용', '겨울용', '컴포트형', NULL, '알파인', '235mm', '50%', '20인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 145),
	('한국타이어 키너지 AS EV EH01 사일런트 235/40R19', 'https://img.danawa.com/prod_img/500000/180/421/img/16421180_1.jpg?shrink=330:*&_v=20220217112805', '242,200', '승용차용', '올시즌', '컴포트형', '저소음', NULL, '235mm', '40%', '19인치', '3등급', '2등급', '500(3등급)', 'A', 'A', '현대 쏘나타, 현대 코나', 146),
	('한국타이어 아이온 에보 AS IH01 235/35R20 4P', 'https://img.danawa.com/prod_img/500000/803/239/img/19239803_1.jpg?shrink=330:*&_v=20230307101454', '380,200', '승용차용', '올시즌', '컴포트형', NULL, NULL, '235mm', '35%', '20인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 넥쏘, 테슬라 모델S', 147),
	('한국타이어 키너지 AS EV EH01 사일런트 215/55R17', 'https://img.danawa.com/prod_img/500000/171/421/img/16421171_1.jpg?shrink=330:*&_v=20220217112744', '134,180', '승용차용', '올시즌', '컴포트형', '저소음', NULL, '215mm', '55%', '17인치', '3등급', '2등급', '500(3등급)', 'A', 'A', '현대 쏘나타, 현대 코나', 148),
	('한국타이어 아이온 에보 AS SUV IH01A 255/40R21 4P', 'https://img.danawa.com/prod_img/500000/308/239/img/19239308_1.jpg?shrink=330:*&_v=20230307094932', '255,930', 'SUV, RV용', '올시즌', '컴포트형', NULL, NULL, '255mm', '40%', '21인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 아이오닉5, 기아 EV6', 149),
	('한국타이어 아이온 윈터 IW01 255/50R19', 'https://img.danawa.com/prod_img/500000/266/622/img/29622266_1.jpg?shrink=330:*&_v=20231031141626', '211,375', '승용차용', '겨울용', '컴포트형', NULL, '알파인', '255mm', '50%', '19인치', NULL, NULL, NULL, NULL, NULL, NULL, 150),
	('한국타이어 아이온 에보 AS IH01 245/45R19 4P', 'https://img.danawa.com/prod_img/500000/923/239/img/19239923_1.jpg?shrink=330:*&_v=20230307102119', '217,830', '승용차용', '올시즌', '컴포트형', NULL, NULL, '245mm', '45%', '19인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 넥쏘, 테슬라 모델S', 151),
	('한국타이어 아이온 윈터 IW01 사일런트 305/30R21', 'https://img.danawa.com/prod_img/500000/745/771/img/28771745_1.jpg?shrink=330:*&_v=20231016131237', '318,000', '승용차용', '겨울용', '컴포트형', '저소음', '알파인', '305mm', '30%', '21인치', NULL, NULL, NULL, NULL, NULL, NULL, 152),
	('한국타이어 아이온 윈터 IW01 265/35R21', 'https://img.danawa.com/prod_img/500000/485/318/img/18318485_1.jpg?shrink=330:*&_v=20221118082512', '290,780', '승용차용', '겨울용', '컴포트형', NULL, '알파인', '265mm', '35%', '21인치', NULL, NULL, NULL, NULL, NULL, NULL, 153),
	('한국타이어 아이온 에보 AS SUV IH01A 255/40R20 4P', 'https://img.danawa.com/prod_img/500000/302/239/img/19239302_1.jpg?shrink=330:*&_v=20230307094921', '297,980', 'SUV, RV용', '올시즌', '컴포트형', NULL, NULL, '255mm', '40%', '20인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 아이오닉5, 기아 EV6', 154),
	('한국타이어 아이온 윈터 IW01 사일런트 245/35R21', 'https://img.danawa.com/prod_img/500000/544/771/img/28771544_1.jpg?shrink=330:*&_v=20231016130550', '224,000', '승용차용', '겨울용', '컴포트형', '저소음', '알파인', '245mm', '35%', '21인치', NULL, NULL, NULL, NULL, NULL, NULL, 155),
	('한국타이어 아이온 에보 SUV IK01A 사일런트 255/40R20', 'https://img.danawa.com/prod_img/500000/682/805/img/27805682_1.jpg?shrink=330:*&_v=20230828095935', '295,060', 'SUV, RV용', NULL, '스포츠형', '저소음', NULL, '255mm', '40%', '20인치', NULL, NULL, '320(4등급)', 'AA', 'A', '아우디 A7', 156),
	('한국타이어 아이온 에보 AS SUV IH01A 사일런트 255/40R21', 'https://img.danawa.com/prod_img/500000/988/458/img/20458988_1.jpg?shrink=330:*&_v=20230608091539', '199,020', 'SUV, RV용', '올시즌', '컴포트형', '저소음', NULL, '255mm', '40%', '21인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 아이오닉5, 기아 EV6', 157),
	('한국타이어 아이온 에보 AS SUV IH01A 255/35R21 4P', 'https://img.danawa.com/prod_img/500000/212/239/img/19239212_1.jpg?shrink=330:*&_v=20230307094528', '374,180', 'SUV, RV용', '올시즌', '컴포트형', NULL, NULL, '255mm', '35%', '21인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 아이오닉5, 기아 EV6', 158),
	('한국타이어 아이온 에보 SUV IK01A 사일런트 255/35R21', 'https://img.danawa.com/prod_img/500000/676/805/img/27805676_1.jpg?shrink=330:*&_v=20230828095916', '368,850', 'SUV, RV용', NULL, '스포츠형', '저소음', NULL, '255mm', '35%', '21인치', NULL, NULL, '320(4등급)', 'AA', 'A', '아우디 A7', 159),
	('한국타이어 아이온 윈터 SUV IW01A 235/45R20', 'https://img.danawa.com/prod_img/500000/271/335/img/29335271_1.jpg?shrink=330:*&_v=20231025104551', '195,910', 'SUV, RV용', '겨울용', '컴포트형', NULL, '알파인', '235mm', '45%', '20인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 160),
	('한국타이어 아이온 에보 AS SUV IH01A 235/50R20 4P', 'https://img.danawa.com/prod_img/500000/197/239/img/19239197_1.jpg?shrink=330:*&_v=20230307094451', '294,200', 'SUV, RV용', '올시즌', '컴포트형', NULL, NULL, '235mm', '50%', '20인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 아이오닉5, 기아 EV6', 161),
	('한국타이어 아이온 윈터 IW01 255/40R19', 'https://img.danawa.com/prod_img/500000/500/622/img/29622500_1.jpg?shrink=330:*&_v=20231031142430', '209,670', '승용차용', '겨울용', '컴포트형', NULL, '알파인', '255mm', '40%', '19인치', NULL, NULL, NULL, NULL, NULL, NULL, 162),
	('한국타이어 아이온 윈터 IW01 305/30R21', 'https://img.danawa.com/prod_img/500000/491/318/img/18318491_1.jpg?shrink=330:*&_v=20221118082652', '331,200', '승용차용', '겨울용', '컴포트형', NULL, '알파인', '305mm', '30%', '21인치', NULL, NULL, NULL, NULL, NULL, NULL, 163),
	('금호타이어 솔루스 TA31 EV 205/55R16', 'https://img.danawa.com/prod_img/500000/727/425/img/20425727_1.jpg?shrink=330:*&_v=20230605150130', '123,670', '승용차용', '올시즌', '컴포트형', NULL, NULL, '205mm', '55%', '16인치', '3등급', '3등급', '500(3등급)', 'A', 'A', NULL, 164),
	('한국타이어 아이온 윈터 SUV IW01A 275/50R20', 'https://img.danawa.com/prod_img/500000/472/828/img/28828472_1.jpg?shrink=330:*&_v=20231018111008', '212,310', 'SUV, RV용', '겨울용', '컴포트형', NULL, '알파인', '275mm', '50%', '20인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 165),
	('한국타이어 아이온 윈터 SUV IW01A 265/45R20', 'https://img.danawa.com/prod_img/500000/366/336/img/29336366_1.jpg?shrink=330:*&_v=20231025111627', '223,040', 'SUV, RV용', '겨울용', '컴포트형', NULL, '알파인', '265mm', '45%', '20인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 166),
	('한국타이어 아이온 에보 AS SUV IH01A 사일런트 235/50R20', 'https://img.danawa.com/prod_img/500000/676/462/img/28462676_1.jpg?shrink=330:*&_v=20230925125604', '263,860', 'SUV, RV용', '올시즌', '컴포트형', '저소음', NULL, '235mm', '50%', '20인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 아이오닉5, 기아 EV6', 167),
	('한국타이어 아이온 윈터 SUV IW01A 사일런트 255/35R21', 'https://img.danawa.com/prod_img/500000/282/769/img/28769282_1.jpg?shrink=330:*&_v=20231016092541', '273,000', 'SUV, RV용', '겨울용', '컴포트형', '저소음', '알파인', '255mm', '35%', '21인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 168),
	('한국타이어 아이온 윈터 IW01 사일런트 225/55R18', 'https://img.danawa.com/prod_img/500000/292/771/img/28771292_1.jpg?shrink=330:*&_v=20231103162459', '149,000', '승용차용', '겨울용', '컴포트형', '저소음', '알파인', '225mm', '55%', '18인치', NULL, NULL, NULL, NULL, NULL, NULL, 169),
	('한국타이어 아이온 윈터 IW01 사일런트 255/40R19', 'https://img.danawa.com/prod_img/500000/706/771/img/28771706_1.jpg?shrink=330:*&_v=20231016131107', '197,000', '승용차용', '겨울용', '컴포트형', '저소음', '알파인', '255mm', '40%', '19인치', NULL, NULL, NULL, NULL, NULL, NULL, 170),
	('한국타이어 키너지 AS EV EH01 215/50R17', 'https://img.danawa.com/prod_img/500000/599/541/img/6541599_1.jpg?shrink=330:*&_v=20201027172817', '192,630', '승용차용', '올시즌', '컴포트형', NULL, NULL, '215mm', '50%', '17인치', '3등급', '2등급', '500(3등급)', 'A', 'A', '현대 쏘나타, 현대 코나', 171),
	('한국타이어 아이온 윈터 SUV IW01A 사일런트 285/45R21', 'https://img.danawa.com/prod_img/500000/007/771/img/28771007_1.jpg?shrink=330:*&_v=20231016124226', '303,000', 'SUV, RV용', '겨울용', '컴포트형', '저소음', '알파인', '285mm', '45%', '21인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 172),
	('한국타이어 아이온 윈터 SUV IW01A 사일런트 265/45R20', 'https://img.danawa.com/prod_img/500000/671/770/img/28770671_1.jpg?shrink=330:*&_v=20231016111852', '229,000', 'SUV, RV용', '겨울용', '컴포트형', '저소음', '알파인', '265mm', '45%', '20인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 173),
	('한국타이어 아이온 에보 AS IH01 사일런트 265/40R21', 'https://img.danawa.com/prod_img/500000/907/974/img/29974907_1.jpg?shrink=330:*&_v=20231115090152', '314,640', '승용차용', '올시즌', '컴포트형', '저소음', NULL, '265mm', '40%', '21인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 넥쏘, 테슬라 모델S', 174),
	('금호타이어 마제스티9 솔루스 TA91 EV 275/40R18', 'https://img.danawa.com/prod_img/500000/192/495/img/17495192_1.jpg?shrink=330:*&_v=20220720100009', '213,000', '승용차용', '올시즌', '컴포트형', NULL, NULL, '275mm', '40%', '18인치', '2등급', '3등급', '560(2등급)', 'AA', 'A', NULL, 175),
	('한국타이어 키너지 AS EV EH01 235/40R19', 'https://img.danawa.com/prod_img/500000/164/027/img/15027164_1.jpg?shrink=330:*&_v=20210818154313', '280,690', '승용차용', '올시즌', '컴포트형', NULL, NULL, '235mm', '40%', '19인치', '3등급', '2등급', '500(3등급)', 'A', 'A', '현대 쏘나타, 현대 코나', 176),
	('미쉐린타이어 파일럿 스포츠 EV 265/40R21', 'https://img.danawa.com/prod_img/500000/297/333/img/29333297_1.jpg?shrink=330:*&_v=20231025091642', '839,100', '승용차용', '여름용', NULL, NULL, NULL, '265mm', '40%', '21인치', '1등급', '2등급', '320(4등급)', 'AA', 'A', NULL, 177),
	('한국타이어 아이온 윈터 SUV IW01A 사일런트 235/50R20', 'https://img.danawa.com/prod_img/500000/540/164/img/13164540_1.jpg?shrink=330:*&_v=20231103161632', '172,000', 'SUV, RV용', '겨울용', '컴포트형', '저소음', '알파인', '235mm', '50%', '20인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 178),
	('콘티넨탈타이어 콘티 E 콘택트 125/80R13', 'https://img.danawa.com/prod_img/500000/657/486/img/6486657_1.jpg?shrink=330:*&_v=20210106141145', '78,000', '승용차용', '여름용', NULL, NULL, NULL, '125mm', '80%', '13인치', NULL, NULL, NULL, NULL, NULL, NULL, 179),
	('한국타이어 아이온 에보 AS SUV IH01A 275/35R21', 'https://img.danawa.com/prod_img/500000/509/318/img/18318509_1.jpg?shrink=330:*&_v=20221118082949', '354,910', 'SUV, RV용', '올시즌', '컴포트형', NULL, NULL, '275mm', '35%', '21인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 아이오닉5, 기아 EV6', 180),
	('한국타이어 아이온 윈터 IW01 사일런트 235/35R20', 'https://img.danawa.com/prod_img/500000/301/771/img/28771301_1.jpg?shrink=330:*&_v=20231016125515', '204,000', '승용차용', '겨울용', '컴포트형', '저소음', '알파인', '235mm', '35%', '20인치', NULL, NULL, NULL, NULL, NULL, NULL, 181),
	('한국타이어 아이온 에보 SUV IK01A 사일런트 275/35R21', 'https://img.danawa.com/prod_img/500000/691/805/img/27805691_1.jpg?shrink=330:*&_v=20230828100005', '384,810', 'SUV, RV용', NULL, '스포츠형', '저소음', NULL, '275mm', '35%', '21인치', NULL, NULL, '320(4등급)', 'AA', 'A', '아우디 A7', 182),
	('한국타이어 아이온 윈터 SUV IW01A 사일런트 255/50R20', 'https://img.danawa.com/prod_img/500000/791/770/img/28770791_1.jpg?shrink=330:*&_v=20231016123004', '211,000', 'SUV, RV용', '겨울용', '컴포트형', '저소음', '알파인', '255mm', '50%', '20인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 183),
	('한국타이어 아이온 윈터 SUV IW01A 사일런트 255/40R21', 'https://img.danawa.com/prod_img/500000/420/769/img/28769420_1.jpg?shrink=330:*&_v=20231016093505', '270,000', 'SUV, RV용', '겨울용', '컴포트형', '저소음', '알파인', '255mm', '40%', '21인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 184),
	('한국타이어 아이온 윈터 SUV IW01A 사일런트 275/50R20', 'https://img.danawa.com/prod_img/500000/190/924/img/28924190_1.jpg?shrink=330:*&_v=20231023134744', '281,870', 'SUV, RV용', '겨울용', '컴포트형', '저소음', '알파인', '275mm', '50%', '20인치', NULL, NULL, NULL, NULL, NULL, '기아 EV6, 테슬라 모델Y', 185),
	('한국타이어 벤투스 S1 에보3 K127E 255/45R19 4P', 'https://img.danawa.com/prod_img/500000/976/201/img/19201976_1.jpg?shrink=330:*&_v=20230303084137', '273,220', '승용차용', '여름용', '스포츠형', NULL, NULL, '255mm', '45%', '19인치', '4등급', '1등급', NULL, NULL, NULL, NULL, 186),
	('한국타이어 아이온 에보 AS SUV IH01A 255/45R20 4P', 'https://img.danawa.com/prod_img/500000/978/889/img/19889978_1.jpg?shrink=330:*&_v=20230421171831', '241,820', 'SUV, RV용', '올시즌', '컴포트형', NULL, NULL, '255mm', '45%', '20인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 아이오닉5, 기아 EV6', 187),
	('미쉐린타이어 파일럿 스포츠 EV 255/50R20', 'https://img.danawa.com/prod_img/500000/225/800/img/18800225_1.jpg?shrink=330:*&_v=20230119102653', '459,610', '승용차용', '여름용', NULL, NULL, NULL, '255mm', '50%', '20인치', '1등급', '2등급', '320(4등급)', 'AA', 'A', NULL, 188),
	('한국타이어 아이온 윈터 IW01 235/35R20', 'https://img.danawa.com/prod_img/500000/131/622/img/29622131_1.jpg?shrink=330:*&_v=20231031141146', '199,840', '승용차용', '겨울용', '컴포트형', NULL, '알파인', '235mm', '35%', '20인치', NULL, NULL, NULL, NULL, NULL, NULL, 189),
	('한국타이어 아이온 에보 AS IH01 사일런트 245/35R21', 'https://img.danawa.com/prod_img/500000/061/056/img/20056061_1.jpg?shrink=330:*&_v=20230508145447', '293,490', '승용차용', '올시즌', '컴포트형', '저소음', NULL, '235mm', '35%', '21인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 넥쏘, 테슬라 모델S', 190),
	('금호타이어 마제스티9 솔루스 TA91 EV 255/45R19', 'https://img.danawa.com/prod_img/500000/289/798/img/28798289_1.jpg?shrink=330:*&_v=20231017085602', '일시 품절', '승용차용', '올시즌', '컴포트형', NULL, NULL, '255mm', '45%', '19인치', '2등급', '3등급', '560(2등급)', 'AA', 'A', NULL, 191),
	('한국타이어 아이온 에보 AS SUV IH01A 255/45R19 4P', 'https://img.danawa.com/prod_img/500000/746/239/img/19239746_1.jpg?shrink=330:*&_v=20230307101034', '257,370', 'SUV, RV용', '올시즌', '컴포트형', NULL, NULL, '255mm', '45%', '19인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 아이오닉5, 기아 EV6', 192),
	('한국타이어 아이온 에보 AS IH01 사일런트 235/35R20', 'https://img.danawa.com/prod_img/500000/284/463/img/20463284_1.jpg?shrink=330:*&_v=20230608123133', '307,160', '승용차용', '올시즌', '컴포트형', '저소음', NULL, '235mm', '35%', '20인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 넥쏘, 테슬라 모델S', 193),
	('한국타이어 아이온 에보 AS IH01 265/35R21', 'https://img.danawa.com/prod_img/500000/284/144/img/13144284_1.jpg?shrink=330:*&_v=20220929085910', '353,290', '승용차용', '올시즌', '컴포트형', NULL, NULL, '265mm', '35%', '21인치', '2등급', '3등급', '600(2등급)', 'A', 'A', '현대 넥쏘, 테슬라 모델S', 194);

-- 테이블 sprint1.user_list 구조 내보내기
CREATE TABLE IF NOT EXISTS `user_list` (
  `id` varchar(20) NOT NULL,
  `password` varchar(64) NOT NULL,
  `name` varchar(20) NOT NULL,
  `phonenumber` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 sprint1.user_list:~0 rows (대략적) 내보내기

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
