USE dragondb;

CREATE TABLE IF NOT EXISTS mst_user (
 id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
 user_name VARCHAR(32) NOT NULL UNIQUE,
 password VARCHAR(16) NOT NULL,
 family_name VARCHAR(255) NOT NULL,
 first_name VARCHAR(255) NOT NULL,
 family_name_kana VARCHAR(255) NOT NULL,
 first_name_kana VARCHAR(255) NOT NULL,
 gender TINYINT(1) DEFAULT 0,
 created_at DateTime NOT NULL default now(),
 updated_at DateTime NOT NULL default now()
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS mst_category (
 id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
 category_name VARCHAR(255) NOT NULL,
 category_description VARCHAR(255),
 created_at DateTime NOT NULL default now(),
 updated_at DateTime NOT NULL default now()
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS mst_product (
 id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
 product_name VARCHAR(255) NOT NULL UNIQUE,
 product_name_kana VARCHAR(255) NOT NULL UNIQUE,
 product_description VARCHAR(255),
 category_id INT(11) NOT NULL,
 price INT(11) NOT NULL,
 image_full_path VARCHAR(255) NOT NULL,
 release_date VARCHAR(10),
 release_company VARCHAR(255),
 created_at DateTime NOT NULL default now(),
 updated_at DateTime NOT NULL default now(),
 FOREIGN KEY(category_id) REFERENCES mst_category(id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS mst_destination (
 id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
 user_id INT(11) NOT NULL,
 family_name VARCHAR(255) NOT NULL,
 first_name VARCHAR(255) NOT NULL,
 tel_number VARCHAR(13) NOT NULL,
 address VARCHAR(255) NOT NULL,
 status TINYINT(1) NOT NULL DEFAULT 1,
 created_at DateTime NOT NULL default now(),
 updated_at DateTime NOT NULL default now(),
 FOREIGN KEY(user_id) REFERENCES mst_user(id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS tbl_cart (
 id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
 user_id INT(11) NOT NULL,
 product_id INT(11) NOT NULL,
 product_count INT(11) NOT NULL,
 created_at DateTime NOT NULL default now(),
 updated_at DateTime NOT NULL default now(),
 FOREIGN KEY(product_id) REFERENCES mst_product(id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS tbl_purchase_history (
 id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
 user_id INT(11) NOT NULL,
 product_id INT(11) NOT NULL,
 product_count INT(11) NOT NULL,
 price INT(11) NOT NULL,
 destination_id INT(11) NOT NULL,
 status TINYINT(1) NOT NULL DEFAULT 1,
 purchased_at DateTime NOT NULL default now(),
 created_at DateTime NOT NULL default now(),
 updated_at DateTime NOT NULL default now(),
 FOREIGN KEY(user_id) REFERENCES mst_user(id),
 FOREIGN KEY(product_id) REFERENCES mst_product(id),
 FOREIGN KEY(destination_id) REFERENCES mst_destination(id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
