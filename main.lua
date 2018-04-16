-- 阴阳师
-- main.lua  

-- Create By TouchSpriteStudio on 15:19:38   
-- Copyright © TouchSpriteStudio . All rights reserved.

local ui = require("ui")

local ret = ui:showModel()

debug = true

if ret == UI_CANCEL then

	
	toast("取消运行",1)
	
	lua_exit()
	
	mSleep(0)
		
	
end


require("task")

local function main()
	
	--formatLog(os.date("main start at time:[%X]",time()))
	
	init(2)
	
	local config  =  globalConfig 
	
	local model = config.model or 1
	
	if model ==  MODEL_DRIVER then
		
		return yuhunDriver()
	
	elseif model == MODEL_PASSAGER then
 
		return yuhunPassager() 
		
	elseif model == MODEL_NORMA_BATTLE then
		
		return normalBattle(config.loopTime)
	else
		
		return dialogf("未知的运行模式:%s",model)
		
	end
	
end
 

--fix main
main()

