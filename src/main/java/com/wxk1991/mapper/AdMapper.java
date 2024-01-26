package com.wxk1991.mapper;

import com.wxk1991.entity.Ad;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wxk1991.vo.AdVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author jobob
 * @since 2024-01-19
 */
public interface AdMapper extends BaseMapper<Ad> {
    /**
     * 广告列表，包含广告类型名称
     * @param adTypeId
     * @return
     */
    List<AdVo> adList(@Param("adTypeId") String adTypeId);
}
