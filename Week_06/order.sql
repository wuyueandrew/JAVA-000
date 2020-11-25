-- account
CREATE TABLE `xx_account` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `user_name` VARCHAR(50) NOT NULL COMMENT '用户名',
    `type` TINYINT(2) NOT NULL COMMENT '1普通用户 2商家',
    `login_name` VARCHAR(50) NOT NULL COMMENT '登陆名',
    `password` VARCHAR(50) NOT NULL COMMENT '密码',
    `address` VARCHAR(100) NOT NULL COMMENT '地址',
    `telephone` VARCHAR(11) NOT NULL COMMENT '电话',
    `create_time` DATETIME NOT NULL COMMENT '创建时间',
    `update_time` DATETIME NOT NULL COMMENT '更新时间',
    `deleted` TINYINT(1) NOT NULL COMMENT '是否删除',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账户表';

-- product
CREATE TABLE `xx_product` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `product_name` VARCHAR(50) NOT NULL COMMENT '商品名',
    `price` BIGINT(20) NOT NULL COMMENT '价格',
    `stock` BIGINT(20) NOT NULL COMMENT '库存',
    `seller_id` BIGINT(20) NOT NULL COMMENT '卖家id',
    `create_time` DATETIME NOT NULL COMMENT '创建时间',
    `update_time` DATETIME NOT NULL COMMENT '更新时间',
    `deleted` TINYINT(1) NOT NULL COMMENT '是否删除',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';

-- order
CREATE TABLE `xx_order` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `user_id` BIGINT(20) NOT NULL COMMENT '买家id',
    `status` TINYINT(2) NOT NULL COMMENT '1未付款 2已付款 3已发货 4已确认 5订单失败',
    `total_cost` BIGINT(20) NOT NULL COMMENT '订单价格',
    `pay_time` DATETIME NULL COMMENT '付款时间',
    `transfer_time` DATETIME NULL COMMENT '发货时间',
    `confirm_time` DATETIME NULL COMMENT '确认时间',
    `create_time` DATETIME NOT NULL COMMENT '创建时间',
    `update_time` DATETIME NOT NULL COMMENT '更新时间',
    `deleted` TINYINT(1) NOT NULL COMMENT '是否删除',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- order_item
CREATE TABLE `xx_order_item` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `order_id` BIGINT(20) NOT NULL COMMENT '订单ID',
    `product_id` BIGINT(20) NOT NULL COMMENT '商品ID',
    `product_name` VARCHAR(50) NOT NULL COMMENT '商品名',
    `price` BIGINT(20) NOT NULL COMMENT '商品价格',
    `cnt` BIGINT(20) NOT NULL COMMENT '商品数量',
    `cost` BIGINT(20) NOT NULL COMMENT '明细总价',
    `create_time` DATETIME NOT NULL COMMENT '创建时间',
    `update_time` DATETIME NOT NULL COMMENT '更新时间',
    `deleted` TINYINT(1) NOT NULL COMMENT '是否删除',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单明细表';

-- 分为账户，商品，订单，订单明细表
-- 本来想单独设计一张卖家表，但是没有明确需求出于简单设计为一张账户表
-- 订单分为两张：订单和订单明细表，订单表存放总价，状态和付款，发货时间等字段
-- 明细表存放具体的订单商品，商品价格和商品名称都冗余进明细表里，以防商家删除商品后数据不一致