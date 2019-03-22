package com.company.business.goods.moudle.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import com.company.manerger.sys.common.base.mvc.entity.AbstractEntity;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
@TableName("tomato_promotion_commission_user")
public class CommissionEntity extends AbstractEntity<String> {
    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    @TableField(value = "commission_money")
    private BigDecimal commission_money;
    @TableField(value = "commission_date")
    private Date commission_date;

    @TableField(value = "commission_order")
    private String commission_order;

    @TableField(value = "user_name")
    private String user_name;

    @TableField(value = "status")
    private Integer status;
    @TableField(value = "arrival_money")
    private BigDecimal arrival_money;
}

