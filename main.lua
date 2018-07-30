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



function bestGodEnv()
	
	if setRotationLockEnable then
	
		setRotationLockEnable(true)
	
	end
	
	if setBacklightLevel then
		
		setBacklightLevel(0)
		
	end
	
end

function beforeUserExit(...)
	
	if not config.enableBestGodModel  then return end
	
	
	nLog("call back for before user exit")
	
	if setRotationLockEnable then
	
		setRotationLockEnable(false)
	
	end
	
	if setBacklightLevel then
		
		setBacklightLevel(0.5)
		
	end
	
end

local function main()
	
	
	
	if setDeviceOrient then
		
		setDeviceOrient(2)
		
	end
	
	local dlg =require("CheckDyld")
	
	dlg:sharedDlg():runModel()
	
	formatLog(os.date("服务启动于:[%X]",os.time()))
	
	formatLog(argDump())
	
	local config  =  globalConfig 
	
	if config.enableBestGodModel then
		
		nLog("开启神仙幻境")
		
		bestGodEnv()
		
	end
	
	local model = config.model or 1
	
	if model ==  MODEL_DRIVER then
		
		return yuhunDriver()
	
	elseif model == MODEL_PASSAGER then
 
		return yuhunPassager() 
		
	elseif model == MODEL_NORMA_BATTLE then
		
		return normalBattle(config.loopTime)
	
	elseif model == MODEL_SINGLE_YUHUN then
	
	
		return singleYuhunBattle(config.loopTime)
	
	elseif model == MODEL_HOME_BREAK then
	
		--local device = require("TSDevice")
		
		if (isXScreen or is6Screen or is5Screen) then
			
			return homeBreakOutWithTryAgain(config.loopTime)
	
		else
	
			dialog("目前突破只支持X和6系列分辨率设备", time)
	
		end
	
	
	
	elseif model == MODEL_TOOLS then
	
		require("userUtils")
	
		return showToolsBar()
	
	else
		
		return dialogf("未知的运行模式:%s",model)
		
	end
	
end
 

--fix main
main()


