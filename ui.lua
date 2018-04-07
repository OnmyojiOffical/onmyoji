-- 阴阳师
-- ui.lua  

-- Create By TouchSpriteStudio on 14:23:19   
-- Copyright © TouchSpriteStudio . All rights reserved.
local  ui = {}
local sz = require("sz")
local cjson = sz.json
local w,h = getScreenSize();
local ui_data = {
	["style"]  = "default",               --  选填，默认样式，控件排列类型
	["rettype"] = "default",                
	--  选填，旧版，shoui返回值格式
	["width"] = h,            
	--  选填，安卓默认全屏,iOS默认，showui宽度
	["height"] = w,                --  选填，安卓默认全屏，iOS 默认，shoWUI 高度
	["config"] = "onmyoji.dat",  --  选填，无，配置文件保存文件
	["timer"] = 99,                    --  选填，无，自动执行倒计时
	["orient"] = 2,                    --  选填，竖屏，显示方向(仅支持 iOS)
	["pagetype"]= "multi",                    
	--  选填，单页，单页/多页 (多页显示时必填,否则无法正确显示 showUI)
	["title"] = "御魂师",--  选填，脚本配置，showUI 标题
	["titles"] = "第一页,第二页,第三页", 
	--  选填，无，多页howui标题(尽在多页下有效)
	["cancelname"] = "取消",        --  选填，取消，左下角按钮名称
	["okname"] = "开始",            --  选填，确认，右下角按钮名称
	["selpage"] = 1,              --  选填，无，多页模式下指定默认停留的页面
	["btnbkcolor"] = "255,255,255",            
	["bgcolor"] = "255,255,255",  --  选填，255,255,255，界面背景色(仅支持 iOS)
	["pagenumtype "] = "number",  --  选填，无，分页指示样式    
	pages   = {
			
		{


			{
				["type"] = "Label",
				["text"] = "模式",
				["size"] = 20,
				["align"] = "center",
				["color"] = "0,0,0",
			},
			{
				["type"] = "ComboBox",                                                                      
				["list"] = "司机,乘客,单刷",
				["select"] = "0",                                    
			},
			{
				["type"] = "Label",
				["text"] = "悬赏设置",
				["size"] = 20,
				["align"] = "center",
				["color"] = "0,0,0",
			},
			{
				["type"] = "ComboBox",                                                                      
				["list"] = "接高级,都接,不接",
				["select"] = "0",                                    
			},
			{
				["type"] = "Label",
				["text"] = "单刷场次设置",
				["size"] = 20,
				["align"] = "center",
				["color"] = "0,0,0",
			},
			{
				["type"] = "Edit",
				["size"] = 20,
				["align"] = "left",
				["color"] = "0,0,0",
				["kbtype"] = "number",
			},


		}
			
	},

}

ui.data = ui_data

UI_CANCEL = 0

UI_OK = 1

MODEL_DRIVER = 1

MODEL_PASSAGER = 2

MODEL_NORMA_BATTLE = 3

function ui:showModel()
	
	
	local ret,model,reward,loop = showUI(cjson.encode(self.data))
	
	if ret == UI_OK then
	
		globalConfig = {}
	
		globalConfig.model = tonumber(model) + 1
	
		globalConfig.rewardRecive = tonumber(reward) + 1
	
		globalConfig.loopTime = tonumber(loop) or 9999

	end
	return ret
end

--ui:showModel()

return ui

