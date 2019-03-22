﻿-- Script was generated by Devart dbForge Studio for MySQL, Version 6.0.315.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 2018/3/8 17:21:21
-- Server version: 5.5.28
-- Client version: 4.1

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

-- 
-- Set default database
--
USE company_business_goods;

--
-- Definition for table business_goods_category
--

CREATE TABLE business_goods_category (
  id VARCHAR(64) NOT NULL COMMENT 'ID',
  parent_opt_id INT(11) DEFAULT NULL COMMENT '拼多多字段',
  level INT(11) DEFAULT NULL COMMENT '拼多多字段',
  order_id INT(11) DEFAULT NULL COMMENT '分类排序',
  opt_name VARCHAR(50) DEFAULT NULL COMMENT '拼多多字段',
  opt_id INT(11) DEFAULT NULL COMMENT '拼多多字段',
  PRIMARY KEY (id)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 2048
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci
COMMENT = '商品分类表';

--
-- Definition for table business_goods_category_sub
--

CREATE TABLE business_goods_category_sub (
  id VARCHAR(64) NOT NULL COMMENT 'ID',
  parent_opt_id INT(11) DEFAULT NULL COMMENT '拼多多字段',
  level INT(11) DEFAULT NULL COMMENT '拼多多字段',
  icon VARCHAR(255) DEFAULT NULL COMMENT '拼多多分类图片地址',
  order_id INT(11) DEFAULT NULL COMMENT '分类排序',
  opt_name VARCHAR(50) DEFAULT NULL COMMENT '拼多多字段',
  opt_id INT(11) DEFAULT NULL COMMENT '拼多多字段',
  PRIMARY KEY (id)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 2048
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci
COMMENT = '商品二级分类表';

--
-- Definition for table business_goods_collect
--

CREATE TABLE business_goods_collect (
  id VARCHAR(64) NOT NULL COMMENT '主键',
  coupon_id VARCHAR(255) DEFAULT NULL COMMENT '优惠券id',
  user_name VARCHAR(64) DEFAULT NULL COMMENT '用户的微信openId',
  collect_time DATETIME DEFAULT NULL COMMENT '领取时间',
  status VARCHAR(255) DEFAULT NULL COMMENT '当前的状态',
  del_flag CHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  remarks VARCHAR(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (id)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '用户收藏表'
ROW_FORMAT = DYNAMIC;

--
-- Definition for table business_goods_commission_config
--

CREATE TABLE business_goods_commission_config (
  id VARCHAR(64) NOT NULL DEFAULT '' COMMENT '主键',
  commission_money DECIMAL(10, 2) DEFAULT 0.00 COMMENT '提现金额',
  status TINYINT(1) DEFAULT 1 COMMENT '是否可用0-不能1能',
  count_times INT(9) DEFAULT NULL COMMENT '第几次',
  tips VARCHAR(150) DEFAULT NULL COMMENT '提示信息',
  create_by VARCHAR(64) DEFAULT 'NULL' COMMENT '创建者',
  create_id VARCHAR(64) DEFAULT 'NULL' COMMENT '创建人ID',
  create_date DATETIME DEFAULT NULL COMMENT '创建时间',
  update_by VARCHAR(64) DEFAULT 'NULL' COMMENT '更新者',
  update_id VARCHAR(64) DEFAULT 'NULL' COMMENT '最后操作人ID',
  update_date DATETIME DEFAULT NULL COMMENT '更新时间',
  del_flag CHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  remarks VARCHAR(255) DEFAULT 'NULL' COMMENT '备注信息',
  PRIMARY KEY (id)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 2048
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '用户佣金提现配置表';

--
-- Definition for table business_goods_commission_daily
--

CREATE TABLE business_goods_commission_daily (
  id VARCHAR(64) NOT NULL DEFAULT '' COMMENT '主键',
  commission_money DECIMAL(10, 2) DEFAULT NULL COMMENT '提现金额',
  commission_date DATETIME DEFAULT NULL COMMENT '提现时间',
  commission_times TINYINT(4) DEFAULT 0 COMMENT '用户每日提现次数',
  user_name VARCHAR(64) DEFAULT NULL COMMENT 'openid',
  del_flag CHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  remarks VARCHAR(255) DEFAULT 'NULL' COMMENT '备注信息',
  PRIMARY KEY (id)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '用户每日提现表';

--
-- Definition for table business_goods_commission_tip_config
--

CREATE TABLE business_goods_commission_tip_config (
  id VARCHAR(64) NOT NULL DEFAULT '' COMMENT '主键',
  status TINYINT(1) DEFAULT 1 COMMENT '是否可用0-不能1能',
  day_count_times INT(9) DEFAULT 1 COMMENT '每天提现次数',
  commission_money_max INT(9) DEFAULT 500 COMMENT '最多提现金额',
  create_by VARCHAR(64) DEFAULT 'NULL' COMMENT '创建者',
  create_id VARCHAR(64) DEFAULT 'NULL' COMMENT '创建人ID',
  create_date DATETIME DEFAULT NULL COMMENT '创建时间',
  update_by VARCHAR(64) DEFAULT 'NULL' COMMENT '更新者',
  update_id VARCHAR(64) DEFAULT 'NULL' COMMENT '最后操作人ID',
  update_date DATETIME DEFAULT NULL COMMENT '更新时间',
  del_flag CHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  remarks VARCHAR(255) DEFAULT 'NULL' COMMENT '备注信息',
  PRIMARY KEY (id)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 2048
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '用户提现提示配置表';

--
-- Definition for table business_goods_commission_user
--

CREATE TABLE business_goods_commission_user (
  id VARCHAR(64) NOT NULL DEFAULT '' COMMENT '主键',
  commission_money DECIMAL(10, 2) DEFAULT NULL COMMENT '提现金额',
  arrival_money DECIMAL(10, 2) DEFAULT NULL COMMENT '到账金额',
  commission_date DATETIME DEFAULT NULL COMMENT '提现时间',
  status TINYINT(4) DEFAULT 0 COMMENT '提现状态0-审核中1-已完成2-审核失败',
  commission_order VARCHAR(64) DEFAULT NULL COMMENT '提现订单号',
  user_name VARCHAR(64) DEFAULT NULL COMMENT 'openid',
  del_flag CHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  reason VARCHAR(255) DEFAULT NULL COMMENT '如提现申请被拒绝，需要说明原因',
  remarks VARCHAR(255) DEFAULT 'NULL' COMMENT '备注信息',
  PRIMARY KEY (id)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '用户提现表';

--
-- Definition for table business_goods_coupon
--

CREATE TABLE business_goods_coupon (
  id VARCHAR(64) NOT NULL COMMENT '主键',
  coupon_id VARCHAR(255) DEFAULT NULL COMMENT '优惠券id',
  user_name VARCHAR(64) DEFAULT NULL COMMENT '用户的微信openId',
  receive_time DATETIME DEFAULT NULL COMMENT '领取时间',
  status VARCHAR(255) DEFAULT NULL COMMENT '当前的状态',
  del_flag CHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  remarks VARCHAR(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (id)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '用户优惠券表'
ROW_FORMAT = DYNAMIC;

--
-- Definition for table business_goods_hardware
--

CREATE TABLE business_goods_hardware (
  id VARCHAR(64) NOT NULL COMMENT '主键',
  user_name VARCHAR(64) DEFAULT NULL COMMENT '用户名-微信openId',
  brand VARCHAR(64) DEFAULT NULL COMMENT '设备品牌',
  model VARCHAR(64) DEFAULT NULL COMMENT '设型号',
  version VARCHAR(64) DEFAULT NULL COMMENT '微信版本号',
  system VARCHAR(64) DEFAULT NULL COMMENT '操作系统及版本',
  platform VARCHAR(64) DEFAULT NULL COMMENT '客户端平台',
  phone_info TEXT DEFAULT NULL COMMENT '手机信息',
  del_flag CHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  remarks VARCHAR(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (id)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '用户硬件表'
ROW_FORMAT = DYNAMIC;

--
-- Definition for table business_goods_icon_config
--

CREATE TABLE business_goods_icon_config (
  id VARCHAR(64) NOT NULL COMMENT 'ID',
  icon_mark VARCHAR(255) DEFAULT NULL COMMENT '要显示或者隐藏的icon标示',
  page_info VARCHAR(255) DEFAULT NULL COMMENT '哪个页面',
  status TINYINT(4) DEFAULT 0 COMMENT '是否可用',
  remark VARCHAR(255) DEFAULT NULL COMMENT '备注',
  create_by VARCHAR(20) DEFAULT '' COMMENT '创建人',
  create_id VARCHAR(64) DEFAULT NULL COMMENT '创建人ID',
  create_date DATETIME DEFAULT NULL COMMENT '创建时间',
  update_by VARCHAR(20) DEFAULT '' COMMENT '最近操作人',
  update_id VARCHAR(64) DEFAULT NULL COMMENT '最后操作人ID',
  update_date DATETIME DEFAULT NULL COMMENT '更新时间',
  del_flag CHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (id)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 2048
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci
COMMENT = '前端控制页面显示表';

--
-- Definition for table business_goods_inviter_property_log
--

CREATE TABLE business_goods_inviter_property_log (
  id VARCHAR(64) NOT NULL DEFAULT '' COMMENT '主键',
  commission_money DECIMAL(10, 2) DEFAULT NULL COMMENT '用户自身此次收益金额',
  inviter_user VARCHAR(64) DEFAULT NULL COMMENT '邀请者openId',
  commission_date DATETIME DEFAULT NULL COMMENT '成团时间',
  order_no VARCHAR(255) DEFAULT NULL COMMENT '拼多多的订单号',
  user_name VARCHAR(64) DEFAULT NULL COMMENT 'openid',
  type TINYINT(4) DEFAULT 1 COMMENT '1-增加，0-减少',
  status TINYINT(4) DEFAULT 0 COMMENT '拼多多的订单进程：已成团、确认收货、已审核',
  del_flag CHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  remarks VARCHAR(255) DEFAULT 'NULL' COMMENT '备注信息',
  PRIMARY KEY (id)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '用户邀请者资产日志表';

--
-- Definition for table business_goods_order
--

CREATE TABLE business_goods_order (
  order_sn VARCHAR(64) NOT NULL DEFAULT '' COMMENT '推广订单编号',
  first_order TINYINT(4) DEFAULT 0 COMMENT '0-非第一单，1-第一单',
  goods_id VARCHAR(64) DEFAULT NULL COMMENT '商品id',
  user_name VARCHAR(64) DEFAULT NULL COMMENT '用户ID,查询到username',
  goods_name VARCHAR(255) DEFAULT NULL COMMENT '商品名称',
  goods_thumbnail_url VARCHAR(255) DEFAULT NULL COMMENT '商品缩略图',
  goods_quantity INT(11) DEFAULT 1 COMMENT '商品数量',
  goods_price DECIMAL(20, 2) DEFAULT 0.00 COMMENT '商品价格',
  order_amount DECIMAL(20, 2) DEFAULT 0.00 COMMENT '实际支付金额',
  p_id VARCHAR(64) DEFAULT NULL COMMENT '推广位id',
  promotion_rate DECIMAL(20, 2) DEFAULT 0.00 COMMENT '佣金比例',
  promotion_amount DECIMAL(20, 2) DEFAULT 0.00 COMMENT '佣金金额',
  order_status INT(10) DEFAULT -1 COMMENT '订单状态： -1 未支付; 0-已支付；1-已成团；2-确认收货；3-审核成功；4-审核失败（不可提现）；5-已经结算；8-非多多进宝商品（无佣金订单）',
  order_status_desc VARCHAR(100) DEFAULT NULL COMMENT '订单描述',
  order_create_date VARCHAR(10) DEFAULT NULL COMMENT '订单创建时间',
  order_payment_time VARCHAR(10) DEFAULT NULL COMMENT '订单支付时间',
  order_group_success_time VARCHAR(10) DEFAULT NULL COMMENT '成团时间',
  order_verify_time VARCHAR(10) DEFAULT NULL COMMENT '审核时间',
  order_modify_at VARCHAR(10) DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (order_sn)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 1024
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '订单表';

--
-- Definition for table business_goods_packet_commission_config
--

CREATE TABLE business_goods_packet_commission_config (
  id VARCHAR(64) NOT NULL DEFAULT '' COMMENT '主键',
  rate INT(11) DEFAULT NULL COMMENT '佣金比例，小于等于100',
  lower_fans INT(11) DEFAULT NULL COMMENT '下限金额',
  upper_fans INT(11) DEFAULT NULL COMMENT '用户单次可获得的上限金额',
  order_num INT(11) NOT NULL AUTO_INCREMENT,
  status TINYINT(1) DEFAULT 1 COMMENT '是否可用0-不能1能',
  create_by VARCHAR(64) DEFAULT 'NULL' COMMENT '创建者',
  create_id VARCHAR(64) DEFAULT 'NULL' COMMENT '创建人ID',
  create_date DATETIME DEFAULT NULL COMMENT '创建时间',
  update_by VARCHAR(64) DEFAULT 'NULL' COMMENT '更新者',
  update_id VARCHAR(64) DEFAULT 'NULL' COMMENT '最后操作人ID',
  update_date DATETIME DEFAULT NULL COMMENT '更新时间',
  del_flag CHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  remarks VARCHAR(255) DEFAULT 'NULL' COMMENT '备注信息',
  PRIMARY KEY (id),
  INDEX order_num (order_num)
)
ENGINE = INNODB
AUTO_INCREMENT = 5
AVG_ROW_LENGTH = 2048
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '用户邀请佣金配置表';

--
-- Definition for table business_goods_packet_counts_config
--

CREATE TABLE business_goods_packet_counts_config (
  id VARCHAR(64) NOT NULL DEFAULT '' COMMENT '主键',
  random_amounts DECIMAL(10, 2) DEFAULT NULL COMMENT '配置的随机金额',
  order_num INT(11) NOT NULL AUTO_INCREMENT COMMENT '排序',
  status TINYINT(1) DEFAULT 1 COMMENT '是否可用0-不能1能',
  create_by VARCHAR(64) DEFAULT 'NULL' COMMENT '创建者',
  create_id VARCHAR(64) DEFAULT 'NULL' COMMENT '创建人ID',
  create_date DATETIME DEFAULT NULL COMMENT '创建时间',
  update_by VARCHAR(64) DEFAULT 'NULL' COMMENT '更新者',
  update_id VARCHAR(64) DEFAULT 'NULL' COMMENT '最后操作人ID',
  update_date DATETIME DEFAULT NULL COMMENT '更新时间',
  del_flag CHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  remarks VARCHAR(255) DEFAULT 'NULL' COMMENT '备注信息',
  PRIMARY KEY (id),
  INDEX order_num (order_num)
)
ENGINE = INNODB
AUTO_INCREMENT = 7
AVG_ROW_LENGTH = 2048
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '红包领取次数产生金额表';

--
-- Definition for table business_goods_packet_limit_config
--

CREATE TABLE business_goods_packet_limit_config (
  id VARCHAR(64) NOT NULL DEFAULT '' COMMENT '主键',
  total_accruing_amounts DECIMAL(10, 2) DEFAULT 19.95 COMMENT '用户红包累计金额限制',
  status TINYINT(1) DEFAULT 1 COMMENT '是否可用0-不能1能',
  create_by VARCHAR(64) DEFAULT 'NULL' COMMENT '创建者',
  create_id VARCHAR(64) DEFAULT 'NULL' COMMENT '创建人ID',
  create_date DATETIME DEFAULT NULL COMMENT '创建时间',
  update_by VARCHAR(64) DEFAULT 'NULL' COMMENT '更新者',
  update_id VARCHAR(64) DEFAULT 'NULL' COMMENT '最后操作人ID',
  update_date DATETIME DEFAULT NULL COMMENT '更新时间',
  del_flag CHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  remarks VARCHAR(255) DEFAULT 'NULL' COMMENT '备注信息',
  PRIMARY KEY (id)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 2048
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '红包领取总额限制表';

--
-- Definition for table business_goods_packet_rule_config
--

CREATE TABLE business_goods_packet_rule_config (
  id VARCHAR(64) NOT NULL DEFAULT '' COMMENT '主键',
  accruing_amounts DECIMAL(10, 2) DEFAULT NULL COMMENT '用户红包累计获取金额',
  lower_limit_amounts DECIMAL(10, 2) DEFAULT NULL COMMENT '下限金额',
  upper_limit_amounts DECIMAL(10, 2) DEFAULT NULL COMMENT '用户单次可获得的上限金额',
  order_num INT(11) NOT NULL AUTO_INCREMENT,
  status TINYINT(1) DEFAULT 1 COMMENT '是否可用0-不能1能',
  create_by VARCHAR(64) DEFAULT 'NULL' COMMENT '创建者',
  create_id VARCHAR(64) DEFAULT 'NULL' COMMENT '创建人ID',
  create_date DATETIME DEFAULT NULL COMMENT '创建时间',
  update_by VARCHAR(64) DEFAULT 'NULL' COMMENT '更新者',
  update_id VARCHAR(64) DEFAULT 'NULL' COMMENT '最后操作人ID',
  update_date DATETIME DEFAULT NULL COMMENT '更新时间',
  del_flag CHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  remarks VARCHAR(255) DEFAULT 'NULL' COMMENT '备注信息',
  PRIMARY KEY (id),
  INDEX order_num (order_num)
)
ENGINE = INNODB
AUTO_INCREMENT = 6
AVG_ROW_LENGTH = 2048
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '红包规则表';

--
-- Definition for table business_goods_packet_sale_config
--

CREATE TABLE business_goods_packet_sale_config (
  id VARCHAR(64) NOT NULL DEFAULT '' COMMENT '主键',
  rate INT(11) DEFAULT NULL COMMENT '佣金比例，小于等于100',
  lower_limit_amounts DECIMAL(10, 2) DEFAULT NULL COMMENT '下限金额',
  upper_limit_amounts DECIMAL(10, 2) DEFAULT NULL COMMENT '用户单次可获得的上限金额',
  order_num INT(11) NOT NULL AUTO_INCREMENT,
  status TINYINT(1) DEFAULT 1 COMMENT '是否可用0-不能1能',
  create_by VARCHAR(64) DEFAULT 'NULL' COMMENT '创建者',
  create_id VARCHAR(64) DEFAULT 'NULL' COMMENT '创建人ID',
  create_date DATETIME DEFAULT NULL COMMENT '创建时间',
  update_by VARCHAR(64) DEFAULT 'NULL' COMMENT '更新者',
  update_id VARCHAR(64) DEFAULT 'NULL' COMMENT '最后操作人ID',
  update_date DATETIME DEFAULT NULL COMMENT '更新时间',
  del_flag CHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  remarks VARCHAR(255) DEFAULT 'NULL' COMMENT '备注信息',
  PRIMARY KEY (id),
  INDEX order_num (order_num)
)
ENGINE = INNODB
AUTO_INCREMENT = 4
AVG_ROW_LENGTH = 2048
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '用户自买佣金配置表';

--
-- Definition for table business_goods_packet_user
--

CREATE TABLE business_goods_packet_user (
  id VARCHAR(64) NOT NULL DEFAULT '' COMMENT '主键',
  packet_amounts DECIMAL(20, 2) DEFAULT 0.00 COMMENT '用户红包余额--用户的红包数额不超过20',
  packet_times INT(11) DEFAULT 0 COMMENT '领取红包总次数',
  packet_first_date DATETIME DEFAULT NULL COMMENT '30天内第一次领取红包的时间',
  packet_recent_date DATETIME DEFAULT NULL COMMENT '最近领取红包时间',
  user_name VARCHAR(64) DEFAULT NULL COMMENT '用户的openId',
  del_flag CHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  remarks VARCHAR(255) DEFAULT 'NULL' COMMENT '备注信息',
  PRIMARY KEY (id)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 2048
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '用户红包金额表';

--
-- Definition for table business_goods_packet_user_buy_table
--

CREATE TABLE business_goods_packet_user_buy_table (
  id VARCHAR(64) NOT NULL DEFAULT '' COMMENT '主键',
  buy_amounts DECIMAL(20, 2) DEFAULT 0.00 COMMENT '购买的总金额',
  buy_times INT(11) DEFAULT 0 COMMENT '购买的次数',
  first_date DATETIME DEFAULT NULL COMMENT '用户的首次购买时间',
  recent_date DATETIME DEFAULT NULL COMMENT '最近购买时间',
  user_name VARCHAR(64) DEFAULT NULL COMMENT '用户的openId',
  del_flag CHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  remarks VARCHAR(255) DEFAULT 'NULL' COMMENT '备注信息',
  PRIMARY KEY (id)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 2048
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '用户购买表';

--
-- Definition for table business_goods_packet_user_invited_log
--

CREATE TABLE business_goods_packet_user_invited_log (
  id VARCHAR(64) NOT NULL DEFAULT '' COMMENT '主键',
  invite_user VARCHAR(64) DEFAULT NULL COMMENT '邀请者openId',
  invited_user VARCHAR(64) DEFAULT NULL COMMENT '被邀请者openId',
  packet_money DECIMAL(20, 3) DEFAULT NULL COMMENT '红包产生金额',
  invite_date DATETIME DEFAULT NULL COMMENT '产生关系时间',
  del_flag CHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  remarks VARCHAR(255) DEFAULT 'NULL' COMMENT '备注信息',
  PRIMARY KEY (id)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 2048
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '邀请红包被邀者与邀请者关系表';

--
-- Definition for table business_goods_qrcode
--

CREATE TABLE business_goods_qrcode (
  id VARCHAR(64) NOT NULL COMMENT 'ID',
  wx_qrcode_img VARCHAR(255) DEFAULT NULL COMMENT '微信号',
  wx_account VARCHAR(255) DEFAULT NULL COMMENT '二维码的微信账号',
  show_counts INT(11) DEFAULT 0 COMMENT '当天显示次数，服务后台不使用',
  upload_date DATETIME DEFAULT NULL COMMENT '二维码上传时间',
  status TINYINT(4) DEFAULT 1 COMMENT '0-不可用，1-可用',
  remark VARCHAR(255) DEFAULT NULL COMMENT '预留字段',
  create_by VARCHAR(20) DEFAULT '' COMMENT '创建人',
  create_id VARCHAR(64) DEFAULT NULL COMMENT '创建人ID',
  create_date DATETIME DEFAULT NULL COMMENT '创建时间',
  update_by VARCHAR(20) DEFAULT '' COMMENT '最近操作人',
  update_id VARCHAR(64) DEFAULT NULL COMMENT '最后操作人ID',
  update_date DATETIME DEFAULT NULL COMMENT '更新时间',
  del_flag CHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (id)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 2048
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci
COMMENT = '二维码配置表';

--
-- Definition for table business_goods_rate_config
--

CREATE TABLE business_goods_rate_config (
  id VARCHAR(64) NOT NULL DEFAULT '' COMMENT '主键',
  normal_buy_rate DECIMAL(10, 2) DEFAULT 5.00 COMMENT '正常购买佣金比例',
  first_buy_rate DECIMAL(10, 2) DEFAULT 10.00 COMMENT '用户第一次购买佣金比例',
  invite_first_buy_rate DECIMAL(10, 2) DEFAULT 15.00 COMMENT '邀请多少用户第一次购买佣金比例',
  invite_user_promote INT(11) DEFAULT 20 COMMENT '邀请多少用户第一次购买佣金提升',
  invite_user_return INT(11) DEFAULT 10 COMMENT '邀请多少用户自己购买也能获得佣金比例',
  invite_user_return_rate DECIMAL(10, 2) DEFAULT 5.00 COMMENT '邀请用户自己购买也能获得佣金比例',
  status TINYINT(1) DEFAULT 1 COMMENT '是否可用0-不能1能',
  create_by VARCHAR(64) DEFAULT 'NULL' COMMENT '创建者',
  create_id VARCHAR(64) DEFAULT 'NULL' COMMENT '创建人ID',
  create_date DATETIME DEFAULT NULL COMMENT '创建时间',
  update_by VARCHAR(64) DEFAULT 'NULL' COMMENT '更新者',
  update_id VARCHAR(64) DEFAULT 'NULL' COMMENT '最后操作人ID',
  update_date DATETIME DEFAULT NULL COMMENT '更新时间',
  del_flag CHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  remarks VARCHAR(255) DEFAULT 'NULL' COMMENT '备注信息',
  PRIMARY KEY (id)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 2048
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '佣金比例配置表';

--
-- Definition for table business_goods_search_statistics
--

CREATE TABLE business_goods_search_statistics (
  id VARCHAR(64) NOT NULL COMMENT '主键',
  user_name VARCHAR(64) NOT NULL COMMENT '用户名-微信openId',
  search_count INT(11) DEFAULT 0 COMMENT '搜索次数',
  key_word VARCHAR(100) DEFAULT NULL COMMENT '搜索时的关键词',
  search_update_time DATETIME DEFAULT NULL COMMENT '搜索时间节点',
  PRIMARY KEY (id)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '用户统计表'
ROW_FORMAT = DYNAMIC;

--
-- Definition for table business_goods_statistics
--

CREATE TABLE business_goods_statistics (
  id VARCHAR(64) NOT NULL COMMENT '主键',
  user_name VARCHAR(64) NOT NULL COMMENT '用户名-微信openId',
  description TEXT DEFAULT NULL COMMENT '前端传入的当前页面描述事件，json',
  type TINYINT(4) DEFAULT 0 COMMENT '类别',
  visit_count INT(11) DEFAULT 0 COMMENT '页面访问次数',
  product_id VARCHAR(100) DEFAULT NULL COMMENT '浏览的商品id',
  view_product_time DATE DEFAULT NULL COMMENT '浏览商品时间',
  view_product_stay_time DATE DEFAULT NULL COMMENT '浏览商品停留时间',
  operation_time DATETIME DEFAULT NULL COMMENT '用户点击操作时的时间节点',
  log_update_time DATETIME DEFAULT NULL COMMENT '日志上传时间',
  PRIMARY KEY (id)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '用户统计表'
ROW_FORMAT = DYNAMIC;

--
-- Definition for table business_goods_subject_config
--

CREATE TABLE business_goods_subject_config (
  id VARCHAR(64) NOT NULL DEFAULT '' COMMENT '主键',
  subject_name VARCHAR(150) DEFAULT NULL COMMENT '主题名称',
  subject_weight INT(11) DEFAULT 0 COMMENT '主题权重，0-100',
  subject_start_date DATETIME DEFAULT NULL COMMENT '主题开始时间',
  subject_end_date DATETIME DEFAULT NULL COMMENT '主题结束时间',
  subject_product_id MEDIUMTEXT DEFAULT NULL COMMENT '主题商品id',
  subject_channel_id MEDIUMTEXT DEFAULT NULL COMMENT '主题频道id',
  subject_channel_name VARCHAR(128) DEFAULT NULL COMMENT '主题频道名称-不使用',
  status TINYINT(1) DEFAULT 1 COMMENT '是否可用0-不能1能',
  tips VARCHAR(150) DEFAULT NULL COMMENT '提示信息',
  create_by VARCHAR(64) DEFAULT 'NULL' COMMENT '创建者',
  create_id VARCHAR(64) DEFAULT 'NULL' COMMENT '创建人ID',
  create_date DATETIME DEFAULT NULL COMMENT '创建时间',
  update_by VARCHAR(64) DEFAULT 'NULL' COMMENT '更新者',
  update_id VARCHAR(64) DEFAULT 'NULL' COMMENT '最后操作人ID',
  update_date DATETIME DEFAULT NULL COMMENT '更新时间',
  del_flag CHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  remarks VARCHAR(255) DEFAULT 'NULL' COMMENT '备注信息',
  PRIMARY KEY (id)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 2048
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '主题活动配置表';

--
-- Definition for table business_goods_user
--

CREATE TABLE business_goods_user (
  id VARCHAR(64) NOT NULL COMMENT '主键',
  address VARCHAR(100) DEFAULT NULL COMMENT '用户区域',
  gender VARCHAR(1) DEFAULT NULL COMMENT '性别',
  avatar VARCHAR(255) DEFAULT NULL COMMENT '头像链接',
  exit_time DATETIME DEFAULT NULL COMMENT '用户退出时间',
  nick_name VARCHAR(255) DEFAULT NULL COMMENT '昵称',
  new_user TINYINT(4) DEFAULT 1 COMMENT '是否是新用户1：是',
  username VARCHAR(64) NOT NULL COMMENT '用户名-微信openId',
  lately_login_date DATETIME DEFAULT NULL COMMENT '最近登录时间',
  register_date DATETIME DEFAULT NULL COMMENT '注册时间',
  source INT(11) DEFAULT 0 COMMENT '当前用户来源0：默认1：好友邀请',
  password VARCHAR(500) DEFAULT NULL COMMENT '密码',
  status VARCHAR(255) DEFAULT NULL COMMENT '用户的状态',
  del_flag CHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  remarks VARCHAR(255) DEFAULT NULL COMMENT '备注信息',
  invite_user VARCHAR(64) DEFAULT NULL COMMENT '邀请者openId',
  PRIMARY KEY (id)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci
COMMENT = '用户表'
ROW_FORMAT = DYNAMIC;

--
-- Definition for table business_goods_user_property
--

CREATE TABLE business_goods_user_property (
  id VARCHAR(64) NOT NULL DEFAULT '' COMMENT '主键',
  commission_money_able DECIMAL(10, 2) DEFAULT NULL COMMENT '可提现金额',
  commission_money_back DECIMAL(10, 2) DEFAULT NULL COMMENT '待返现金额',
  user_name VARCHAR(64) DEFAULT NULL COMMENT 'openid',
  del_flag CHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  remarks VARCHAR(255) DEFAULT 'NULL' COMMENT '备注信息',
  PRIMARY KEY (id)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '用户资产表';

--
-- Definition for table business_goods_user_property_log
--

CREATE TABLE business_goods_user_property_log (
  id VARCHAR(64) NOT NULL DEFAULT '' COMMENT '主键',
  commission_money DECIMAL(10, 2) DEFAULT NULL COMMENT '用户自身此次收益金额',
  commission_date DATETIME DEFAULT NULL COMMENT '成团时间',
  inviter_user VARCHAR(64) DEFAULT NULL COMMENT '邀请者openId',
  user_name VARCHAR(64) DEFAULT NULL COMMENT 'openid',
  type TINYINT(4) DEFAULT 1 COMMENT '1-增加，0-减少',
  del_flag CHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  remarks VARCHAR(255) DEFAULT 'NULL' COMMENT '备注信息',
  order_no VARCHAR(255) DEFAULT NULL COMMENT '拼多多的订单号',
  status TINYINT(4) DEFAULT 0 COMMENT '拼多多的订单进程：已成团、确认收货、已审核',
  PRIMARY KEY (id)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '用户资产表';

-- 
-- Dumping data for table business_goods_category
--
INSERT INTO business_goods_category VALUES
('1087912783439011842', 0, 1, 1, '女装', 14),
('1087917443642142721', 0, 1, 11, '男装', 743);

-- 
-- Dumping data for table business_goods_category_sub
--


-- 
-- Dumping data for table business_goods_collect
--


-- 
-- Dumping data for table business_goods_commission_config
--


-- 
-- Dumping data for table business_goods_commission_daily
--

-- 
-- Dumping data for table business_goods_commission_tip_config
--

-- 
-- Dumping data for table business_goods_commission_user
--


-- 
-- Dumping data for table business_goods_coupon
--


-- 
-- Dumping data for table business_goods_hardware
--


-- 
-- Dumping data for table business_goods_icon_config
--


-- 
-- Dumping data for table business_goods_inviter_property_log
--

-- Table company_business_goods.business_goods_inviter_property_log does not contain any data (it is empty)

-- 
-- Dumping data for table business_goods_order
--

-- 
-- Dumping data for table business_goods_packet_commission_config
--


-- 
-- Dumping data for table business_goods_packet_counts_config
--


-- 
-- Dumping data for table business_goods_packet_limit_config
--


-- 
-- Dumping data for table business_goods_packet_rule_config
--


-- 
-- Dumping data for table business_goods_packet_sale_config
--


-- 
-- Dumping data for table business_goods_packet_user
--

-- Table company_business_goods.business_goods_packet_user does not contain any data (it is empty)

-- 
-- Dumping data for table business_goods_packet_user_buy_table
--


-- 
-- Dumping data for table business_goods_packet_user_invited_log
--

-- Table company_business_goods.business_goods_packet_user_invited_log does not contain any data (it is empty)

-- 
-- Dumping data for table business_goods_qrcode
--


-- 
-- Dumping data for table business_goods_rate_config
--


-- 
-- Dumping data for table business_goods_search_statistics
--


-- 
-- Dumping data for table business_goods_statistics
--


-- 
-- Dumping data for table business_goods_subject_config
--


-- 
-- Dumping data for table business_goods_user
--

-- Table company_business_goods.business_goods_user does not contain any data (it is empty)

-- 
-- Dumping data for table business_goods_user_property
--


-- 
-- Dumping data for table business_goods_user_property_log
--

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;