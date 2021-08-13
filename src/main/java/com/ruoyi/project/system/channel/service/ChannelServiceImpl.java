package com.ruoyi.project.system.channel.service;

import java.util.List;

import com.ruoyi.common.exception.base.BaseException;
import com.ruoyi.project.system.files.domain.PlaysOrder;
import com.ruoyi.project.system.files.service.IPlayOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.system.channel.mapper.ChannelMapper;
import com.ruoyi.project.system.channel.domain.Channel;
import com.ruoyi.common.support.Convert;
import org.springframework.transaction.annotation.Transactional;

/**
 * 通道 服务层实现
 *
 * @author yc
 * @date 2018-12-27
 */
@Service
public class ChannelServiceImpl implements IChannelService {
    @Autowired
    private ChannelMapper channelMapper;

    @Autowired
    private IPlayOrderService playOrderService;

    /**
     * 查询通道信息
     *
     * @param id 通道ID
     * @return 通道信息
     */
    @Override
    public Channel selectChannelById(Long id) {
        return channelMapper.selectChannelById(id);
    }

    /**
     * 查询通道列表
     *
     * @param channel 通道信息
     * @return 通道集合
     */
    @Override
    public List<Channel> selectChannelList(Channel channel) {
        return channelMapper.selectChannelList(channel);
    }

    /**
     * 新增通道
     *
     * @param channel 通道信息
     * @return 结果
     */
    @Override
    public int insertChannel(Channel channel) {
        return channelMapper.insertChannel(channel);
    }

    /**
     * 修改通道
     *
     * @param channel 通道信息
     * @return 结果
     */
    @Override
    public int updateChannel(Channel channel) {
        return channelMapper.updateChannel(channel);
    }

    /**
     * 删除通道对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteChannelByIds(String ids) {
        return channelMapper.deleteChannelByIds(Convert.toStrArray(ids));
    }

    @Transactional
    @Override
    public int removeFile(String ids) {
        int rtn = 0;
        String[] idArr = ids.split(",");
        Long id =Long.valueOf(idArr[0]);
        PlaysOrder playOrder = playOrderService.selectOrderById(id);
        if (playOrder == null){
            throw new BaseException("文件已被删除，请刷新后重试！" );
        }
        rtn = playOrderService.deleteOrderByIds(ids);
        if (rtn > 0) {
            playOrderService.updateOrderLimit(playOrder.getChannelId(),rtn,playOrder.getOrderBy());
        }else {
            throw new BaseException("文件删除失败！" );
        }
        return rtn;
    }

    @Override
    public int saveLimit(String ids) {
        String[] idArr = ids.split(",");
        Long id = 0l;
        for (int i = 0 ; i < idArr.length ; i ++){
            id = Long.valueOf(idArr[i]);
            PlaysOrder order = playOrderService.selectOrderById(id);
            if (order == null) continue;;

            order.setOrderBy(i+1);
            playOrderService.updateOrder(order);
        }

        return 1;
    }

}
