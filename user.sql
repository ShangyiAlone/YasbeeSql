DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `firstname` varchar(100) DEFAULT NULL,
  `secondname` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  `password_hash` varchar(255) NOT NULL COMMENT '加密后的密码（哈希值）',
  `status` tinyint DEFAULT '1' COMMENT '用户状态：1=正常，0=禁用',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `account_type` varchar(50) DEFAULT 'PERSONAL' COMMENT 'Account type: PERSONAL (individual), ENTERPRISE (business)',
  `member_level` varchar(50) DEFAULT 'STANDARD' COMMENT 'Membership level: STANDARD, VIP, PREMIUM',
  `kyc_completed` tinyint(1) DEFAULT '0' COMMENT 'Whether KYC (Know Your Customer) is completed',
  `kyb_completed` tinyint(1) DEFAULT '0' COMMENT 'Whether KYB (Know Your Business) is completed',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户基础信息表';

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
    -- KYC 个人基础信息
    `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
    `username` varchar(50) NOT NULL COMMENT '用户名',
    `firstname` varchar(100) DEFAULT NULL,
    `secondname` varchar(100) DEFAULT NULL,
    `email` varchar(100) NOT NULL COMMENT '邮箱',
    `password_hash` varchar(255) NOT NULL COMMENT '加密后的密码（哈希值）',
    `status` tinyint DEFAULT '1' COMMENT '用户状态：1=正常，0=禁用',
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `account_type` varchar(50) DEFAULT 'PERSONAL' COMMENT 'Account type: PERSONAL (individual), ENTERPRISE (business)',
    `member_level` varchar(50) DEFAULT 'STANDARD' COMMENT 'Membership level: STANDARD, VIP, PREMIUM',
    `kyc_completed` tinyint(1) DEFAULT '0' COMMENT 'Whether KYC (Know Your Customer) is completed',
    `kyb_completed` tinyint(1) DEFAULT '0' COMMENT 'Whether KYB (Know Your Business) is completed',

    -- KYC 个人信息验证字段
    `kyc_date_of_birth` date DEFAULT NULL COMMENT 'KYC验证：出生日期',
    `kyc_country_of_birth` varchar(100) DEFAULT NULL COMMENT 'KYC验证：出生国家',
    `kyc_nationality` varchar(100) DEFAULT NULL COMMENT 'KYC验证：国籍',
    `kyc_tax_residency` varchar(100) DEFAULT NULL COMMENT 'KYC验证：税务居住国',
    `kyc_passport_number` varchar(100) DEFAULT NULL COMMENT 'KYC验证：护照/证件号码',
    `kyc_passport_document_path` varchar(255) DEFAULT NULL COMMENT 'KYC验证：护照/证件上传文件路径',

    -- KYC 地址信息验证字段
    `kyc_address_unit_number` varchar(50) DEFAULT NULL COMMENT 'KYC验证：单元号',
    `kyc_address_block_number` varchar(50) DEFAULT NULL COMMENT 'KYC验证：楼栋号',
    `kyc_address_street` varchar(255) DEFAULT NULL COMMENT 'KYC验证：街道地址（必填）',
    `kyc_address_city` varchar(100) DEFAULT NULL COMMENT 'KYC验证：城市（必填）',
    `kyc_address_state_province` varchar(100) DEFAULT NULL COMMENT 'KYC验证：州/省（必填）',
    `kyc_address_country` varchar(100) DEFAULT NULL COMMENT 'KYC验证：国家（必填）',
    `kyc_address_postal_code` varchar(20) DEFAULT NULL COMMENT 'KYC验证：邮政编码（必填）',
    `kyc_address_proof_document_path` varchar(255) DEFAULT NULL COMMENT 'KYC验证：地址证明文件路径（需上传最近3个月的银行对账单、水电账单等）',

    -- KYC 提交和审核信息
    `kyc_submitted_at` timestamp NULL COMMENT 'KYC提交时间',
    `kyc_verified_at` timestamp NULL COMMENT 'KYC验证通过时间',
    `kyc_verification_status` varchar(50) DEFAULT 'PENDING' COMMENT 'KYC验证状态：PENDING(待审核), APPROVED(已批准), REJECTED(已拒绝)',
    `kyc_verification_notes` text DEFAULT NULL COMMENT 'KYC验证备注/拒绝原因',

    -- KYC 就业信息验证字段
    `kyc_employment_current_employer` varchar(255) DEFAULT NULL COMMENT 'KYC验证：当前雇主（必填）',
    `kyc_employment_designation` varchar(100) DEFAULT NULL COMMENT 'KYC验证：职位/头衔（必填）',
    `kyc_employment_industry` varchar(100) DEFAULT NULL COMMENT 'KYC验证：雇主行业（必填）',
    `kyc_employment_occupation_description` text DEFAULT NULL COMMENT 'KYC验证：职位简要描述（必填）',

    -- KYC 政治信息验证字段
    `kyc_political_is_pep` tinyint(1) DEFAULT '0' COMMENT 'KYC验证：是否为政治公众人物(PEP)：0=否，1=是',
    `kyc_political_pep_category` varchar(100) DEFAULT NULL COMMENT 'KYC验证：PEP类别（必填）：I am a PEP(我是PEP), I am a Family Member of PEP(我是PEP的家庭成员), I am a Related Close Associate of PEF(我是PEF的相关密切关联人), I am a Former PEP(我是前PEP)',

    -- KYC 背景信息验证字段
    `kyc_background_yasb_account_purpose` varchar(100) DEFAULT NULL COMMENT 'KYC验证：YASB账户目的（必填）：On ramp(入金), Off ramp(出金)',
    `kyc_background_monthly_trading_volume` varchar(50) DEFAULT NULL COMMENT 'KYC验证：预期月交易量(USD)（必填）：Select range',
    `kyc_background_expected_trades_per_month` varchar(50) DEFAULT NULL COMMENT 'KYC验证：预期月交易笔数（必填）：Select range',
    `kyc_background_source_of_funds_type` varchar(100) DEFAULT NULL COMMENT 'KYC验证：资金来源类型（必填）：Employment Income(就业收入), Investment or Trading(投资或交易)',
    `kyc_background_proof_of_funds_document_path` varchar(255) DEFAULT NULL COMMENT 'KYC验证：资金证明文件路径（必填）',
    `kyc_background_funds_source_same_as_wealth` tinyint(1) DEFAULT '1' COMMENT 'KYC验证：资金来源是否与财富来源相同：0=否，1=是',
    `kyc_background_wealth_sources` varchar(500) DEFAULT NULL COMMENT 'KYC验证：财富来源（可多选）：Employment Income(就业收入), Investment or Trading(投资或交易), Cryptocurrency Mining(加密货币挖矿), Sales of Assets(资产出售), Inheritance(继承), Others(其他)',

    PRIMARY KEY (`id`),
    UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户基础信息表';


