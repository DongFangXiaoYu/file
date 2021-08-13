package com.ruoyi.project.system.channel.service;

import com.ruoyi.project.system.channel.domain.Channel;
import java.util.List;

/**
 * 通道 服务层
 * 
 * @author yc
 * @date 2018-12-27
 */
public interface IChannelService 
{
	/**
     * 查询通道信息
     * 
     * @param id 通道ID
     * @return 通道信息
     */
	public Channel selectChannelById(Long id);
	
	/**
     * 查询通道列表
     * 
     * @param channel 通道信息
     * @return 通道集合
     */
	public List<Channel> selectChannelList(Channel channel);
	
	/**
     * 新增通道
     * 
     * @param channel 通道信息
     * @return 结果
     */
	public int insertChannel(Channel channel);
	
	/**
     * 修改通道
     * 
     * @param channel 通道信息
     * @return 结果
     */
	public int updateChannel(Channel channel);
		
	/**
     * 删除通道信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteChannelByIds(String ids);

    int removeFile(String ids);

    int saveLimit(String ids);
}
