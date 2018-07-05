-- 阴阳师
-- main.lua  

-- Create By TouchSpriteStudio on 15:19:38   
-- Copyright © TouchSpriteStudio . All rights reserved.

debug = true

init(2)

local ui = require("ui")

local ret = ui:showModel()

 
if ret == UI_CANCEL then

	
	toast("取消运行",1)
	
	lua_exit()
	
	mSleep(0)
		
	
end


require("task")

local modelDescription = {
	
	"司机",
	
	"乘客",
	
	"单刷",
	
	"小工具"
	
}

local function argDump()
	
	local config = globalConfig
	
	return string.format("模式:%s",modelDescription[config.model or 1] or "未知运行模式")
	
	
end


local function main()
	
	local dlg =require("CheckDyld")
	
	dlg:sharedDlg():runModel()
	
	formatLog(os.date("服务启动于:[%X]",os.time()))
	
	formatLog(argDump())
	
	local config  =  globalConfig 
	
	local model = config.model or 1
	
	if model ==  MODEL_DRIVER then
		
		return yuhunDriver()
	
	elseif model == MODEL_PASSAGER then
 
		return yuhunPassager() 
		
	elseif model == MODEL_NORMA_BATTLE then
		
		return normalBattle(config.loopTime)
	
	elseif model == MODEL_SINGLE_YUHUN then
	
	
		return singleYuhunBattle(config.loopTime)
	
	elseif model == MODEL_TOOLS then
	
		require("userUtils")
	
		return showToolsBar()
	
	else
		
		return dialogf("未知的运行模式:%s",model)
		
	end
	
end
 

--fix main
main()


