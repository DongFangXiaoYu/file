package com.ruoyi.project.system.channel.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.project.system.channel.domain.Channel;
import com.ruoyi.project.system.channel.service.IChannelService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 通道 信息操作处理
 * 
 * @author yc
 * @date 2018-12-27
 */
@Controller
@RequestMapping("/system/channel")
public class ChannelController extends BaseController
{
    private String prefix = "system/channel";
	
	@Autowired
	private IChannelService channelService;
	
	@RequiresPermissions("system:channel:view")
	@GetMapping()
	public String channel()
	{
	    return prefix + "/channel";
	}
	
	/**
	 * 查询通道列表
	 */
	@RequiresPermissions("system:channel:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Channel channel)
	{
		startPage();
        List<Channel> list = channelService.selectChannelList(channel);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出通道列表
	 */
	@RequiresPermissions("system:channel:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Channel channel)
    {
    	List<Channel> list = channelService.selectChannelList(channel);
        ExcelUtil<Channel> util = new ExcelUtil<Channel>(Channel.class);
        return util.exportExcel(list, "channel");
    }
	
	/**
	 * 新增通道
	 */
	@GetMapping("/addfile")
	public String addfile(Long channelId, Model model)
	{
		model.addAttribute("channelId",channelId);
	    return prefix + "/addfile";
	}

	/**
	 * 新增通道
	 */
	@GetMapping("/add")
	public String add()
	{
		return prefix + "/add";
	}

	/**
	 * 新增保存通道
	 */
	@RequiresPermissions("system:channel:add")
	@Log(title = "通道", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(Channel channel)
	{		
		return toAjax(channelService.insertChannel(channel));
	}

	/**
	 * 修改通道
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Long id, ModelMap mmap)
	{
		Channel channel = channelService.selectChannelById(id);
		mmap.put("channel", channel);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存通道
	 */
	@RequiresPermissions("system:channel:edit")
	@Log(title = "通道", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(Channel channel)
	{		
		return toAjax(channelService.updateChannel(channel));
	}
	
	/**
	 * 删除通道
	 */
	@RequiresPermissions("system:channel:remove")
	@Log(title = "通道", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(channelService.deleteChannelByIds(ids));
	}


	/**
	 * 删除对应的播放文件
	 * @param ids
	 * @return
	 */
	@PostMapping( "/removeFile")
	@ResponseBody
	public AjaxResult removeFile(String ids)
	{
		return toAjax(channelService.removeFile(ids));
	}

	@PostMapping( "/saveLimit")
	@ResponseBody
	public AjaxResult saveLimit(String ids)
	{
		return toAjax(channelService.saveLimit(ids));
	}
}
