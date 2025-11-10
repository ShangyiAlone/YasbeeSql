DROP TABLE IF EXISTS `role`;
CREATE TABLE role (
      id BIGINT PRIMARY KEY AUTO_INCREMENT,
      username VARCHAR(100) ,
      email VARCHAR(255) UNIQUE,
      password VARCHAR(255) ,

      role_name VARCHAR(50) DEFAULT 'USER' COMMENT '角色标识，如 USER、ADMIN、SUPER_ADMIN',
      role_note VARCHAR(255) DEFAULT NULL COMMENT '角色说明或备注',

      status TINYINT DEFAULT 1 COMMENT '角色状态：1=启用，0=禁用',

      permission TEXT DEFAULT NULL COMMENT '认证等级，如 Full Verified, ID Verified',

      verificationLevel TEXT DEFAULT NULL COMMENT '认证等级，如 Full Verified, ID Verified',

      lastLoginAt DATETIME DEFAULT NULL COMMENT '最后登录时间',

      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色表';


