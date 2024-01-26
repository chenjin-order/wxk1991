package com.wxk1991.service.impl;

import com.wxk1991.entity.Ad;
import com.wxk1991.mapper.AdMapper;
import com.wxk1991.service.IAdService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wxk1991.vo.AdVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author jobob
 * @since 2024-01-19
 */
@Service
public class AdServiceImpl extends ServiceImpl<AdMapper, Ad> implements IAdService {

    @Autowired
    private AdMapper adMapper;
    /**
     * 广告列表，包含广告类型名称
     * @param adTypeId
     * @return
     */
    @Override
    public List<AdVo> adList(String adTypeId) {
        return adMapper.adList(adTypeId);
    }
}
