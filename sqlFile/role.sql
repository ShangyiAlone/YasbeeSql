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


ALTER TABLE role
    ADD COLUMN last_login_at DATETIME DEFAULT NULL COMMENT 'FIRST, SECOND, 标记用户是第几次审核';

ALTER TABLE role
    ADD COLUMN last_login_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后登录时间';

ALTER TABLE role
    ADD COLUMN verification_level TEXT COMMENT '验证等级：Full Verified, ID Verified, 可扩展';


DROP TABLE IF EXISTS `verification_cases`;
CREATE TABLE `verification_cases` (
    `id` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    `case_id` VARCHAR(50) NOT NULL UNIQUE COMMENT '案件编号，如 CASE-7842',
    `user_id` BIGINT NOT NULL COMMENT '关联用户ID',

    -- 客户信息
    `customer_first_name` VARCHAR(50) NOT NULL COMMENT '客户名字',
    `customer_last_name` VARCHAR(50) NOT NULL COMMENT '客户姓氏',
    `customer_email` VARCHAR(100) NOT NULL COMMENT '客户邮箱',
    `customer_type` VARCHAR(20) NOT NULL COMMENT '客户类型: Personal, Business',

    -- 案件信息
    `case_type` VARCHAR(20) NOT NULL COMMENT '案件类型: KYC, KYB',
    `passport_id_number` VARCHAR(100) COMMENT '护照/ID号码',

    -- 状态信息
    `status` VARCHAR(50) NOT NULL COMMENT '审核状态: New Submission, First Review, Second Review, Completed, Rejected',
    `kyc_status` VARCHAR(50) COMMENT 'KYC状态',

    -- 分配信息
    `assigned_to` VARCHAR(100) COMMENT '分配给的审核人员',
    `assignee_id` BIGINT COMMENT '审核人员ID',

    -- 时间信息
    `submitted_date` DATETIME NOT NULL COMMENT '提交时间',
    `last_activity` DATETIME NOT NULL COMMENT '最后活动时间',
    `completed_date` DATETIME COMMENT '完成时间',

    -- 审核备注
    `review_notes` TEXT COMMENT '审核备注',
    `rejection_reason` TEXT COMMENT '拒绝原因',

    -- 系统字段
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

    -- 索引
    INDEX `idx_case_id` (`case_id`),
    INDEX `idx_user_id` (`user_id`),
    INDEX `idx_status` (`status`),
    INDEX `idx_customer_type` (`customer_type`),
    INDEX `idx_assigned_to` (`assignee_id`),
    INDEX `idx_submitted_date` (`submitted_date`),
    INDEX `idx_last_activity` (`last_activity`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='审核案件管理表';




