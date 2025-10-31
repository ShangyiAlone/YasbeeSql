-- ============================================================================
-- KYB Legal Representative（法定代表人）表
-- ============================================================================
DROP TABLE IF EXISTS `kyb_legal_representative`;
CREATE TABLE `kyb_legal_representative` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `user_id` bigint unsigned NOT NULL COMMENT '关联用户ID',
    `first_name` varchar(100) NOT NULL COMMENT '名',
    `last_name` varchar(100) NOT NULL COMMENT '姓',
    `nationality` varchar(100) NOT NULL COMMENT '国籍',
    `role` varchar(100) NOT NULL COMMENT '角色(Director/CEO等)',
    `date_of_birth` date NOT NULL COMMENT '出生日期',
    `id_card_front_path` varchar(255) NOT NULL COMMENT '身份证正面',
    `id_card_back_path` varchar(255) NOT NULL COMMENT '身份证反面',
    `passport_path` varchar(255) DEFAULT NULL COMMENT '护照',
    `proof_of_address_path` varchar(255) NOT NULL COMMENT '地址证明',
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='KYB法定代表人信息表';


-- ============================================================================
-- KYB UBO（最终受益人）表
-- ============================================================================
DROP TABLE IF EXISTS `kyb_ubo`;
CREATE TABLE `kyb_ubo` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `user_id` bigint unsigned NOT NULL COMMENT '关联用户ID',
    `first_name` varchar(100) NOT NULL COMMENT '名',
    `last_name` varchar(100) NOT NULL COMMENT '姓',
    `nationality` varchar(100) NOT NULL COMMENT '国籍',
    `role` varchar(100) DEFAULT NULL COMMENT '角色',
    `residential_address` varchar(500) DEFAULT NULL COMMENT '居住地址',
    `ownership_percentage` decimal(5,2) DEFAULT NULL COMMENT '持股比例(%)',
    `id_card_front_path` varchar(255) NOT NULL COMMENT '身份证正面',
    `id_card_back_path` varchar(255) NOT NULL COMMENT '身份证反面',
    `passport_path` varchar(255) DEFAULT NULL COMMENT '护照',
    `proof_of_address_path` varchar(255) NOT NULL COMMENT '地址证明',
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='KYB最终受益人信息表';




