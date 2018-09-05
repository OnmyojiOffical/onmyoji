-- 阴阳师
-- ui.lua  

-- Create By TouchSpriteStudio on 14:23:19   
-- Copyright © TouchSpriteStudio . All rights reserved.
local  ui = {}

local json

--global flag xxassist 

if not xxassist then

	local sz = require("sz")

	json = sz.json

else

	local bb = require("badboy")
	
	 json = bb.getJSON()

end

local w,h = getScreenSize();



local ui_data = {
	["style"]  = "default",             
	["rettype"] = "table",                
	["width"] = h,            
	["height"] = w,             
	["config"] = "onmyoji.dat", 
	["timer"] = 99,           
	["orient"] = 2,               
	["pagetype"]= "multi",                    
	["title"] = "御魂师",
	["titles"] = "第一页,第二页,第三页", 
	["cancelname"] = "取消",      
	["okname"] = "开始",          
	["selpage"] = 1,             
	["btnbkcolor"] = "255,255,255",            
	["bgcolor"] = "255,255,255", 
	["pagenumtype "] = "number",
	pages   = {


		--第一页
		{


			{
				["type"] = "Label",
				["text"] = "模式",
				["size"] = 20,
				["width"] = 100,
				["nowrap"] = 1,
				["align"] = "left",
				["color"] = "0,0,0",
			},
			{
				["type"] = "ComboBox",                                                                      
				["list"] = "司机,乘客,单刷(非魂十),单刷魂十,协作奖励,结界突破,小工具",
				["width"] = 500,
				["select"] = "0",
				["id"] = "model"
			},

			{
				["type"] = "Label",
				["text"] = "单刷场次",
				["size"] = 20,
				["width"] = 200,
				["nowrap"] = 1,
				["align"] = "left",
				["color"] = "0,0,0",
			},
			{
				["type"] = "Edit",
				["size"] = 20,
				["align"] = "left",
				["width"] = 300,
				["color"] = "0,0,0",
				["kbtype"] = "number",
				["id"] = "loop"
			},
			{
				["type"] = "Label",
				["text"] = "更多设置向右滑动-_-!",
				["size"] = 20,
				["align"] = "left",
				["color"] = "0,0,0",
			},

		},
		--第二页
		{


			{
				["type"] = "Label",
				["text"] = "悬赏设置",
				["size"] = 20,
				["width"] = 200,
				["align"] = "left",
				["color"] = "0,0,0",
				["nowrap"] = 1,
			},
			{
				["type"] = "ComboBox",                                                                      
				["list"] = "接高级,都接,不接",
				["width"] = 400,
				["id"] = "reward",
				["select"] = "0",                                    
			},
			{
				["type"] = "Label",
				["text"] = "日志设置",
				["size"] = 20,
				["align"] = "left",
				["color"] = "0,0,0",
				["nowrap"] = 1,
				["width"] = 200,
			},
			{

				["type"] = "RadioGroup",
				["list"] = "每次新建日志,每次继续写入,开发调试日志",
				["id"] = "log",
				["select"] = "0",

			},
			{
				["type"] = "Label",
				["text"] = "定时设置",
				["size"] = 20,
				["align"] = "left",
				["width"] = 200,
				["color"] = "0,0,0",
				["nowrap"] = 1,
			},
			{

				["type"] = "ComboBox",
				["list"] = "开启定时,不开启定时",
				["id"] = "timerEnable",
				["width"] = 300,
				["select"] = "1",
				["nowrap"] = 1,

			},

			{
				["type"] = "Edit",
				["size"] = 20,
				["align"] = "left",
				["color"] = "0,0,0",
				["kbtype"] = "number",
				["text"] = "10",
				["prompt"] = "运行时长(分钟)",
				["width"] = h-100-300 - 200,
				["id"] = "timer"
			},
			{
				["type"] = "Label",
				["text"] = "突破尝试",
				["size"] = 20,
				["width"] = 250,
				["nowrap"] = 1,
				["align"] = "left",
				["color"] = "0,0,0",
			},
			{
				["type"] = "Edit",
				["size"] = 20,
				["text"] = "0",
				["align"] = "left",
				["width"] = 300,
				["color"] = "0,0,0",
				["kbtype"] = "number",
				["id"] = "retryTime"
			},
			{
				["type"] = "Label",
				["text"] = "环境设置",
				["size"] = 20,
				["width"] = 200,
				["align"] = "left",
				["color"] = "0,0,0",
				["nowrap"] = 1,
			},
			{
				["type"] = "ComboBox",                                                                      
				["list"] = "开启最优环境,不开启最优环境",
				["width"] = 600,
				["id"] = "bestModeSwitch",
				["select"] = "1",                                    
			},
		}

	},

}

	
ui.json = json.encode(ui_data)


ui.data = ui_data


local function enumBuilder(base)

	local baseEnum = base or 0
	
	return function ()
		
		baseEnum = baseEnum + 1
		
		return baseEnum
		
	end


end

UI_CANCEL = 0

UI_OK = 1

local modelEnum = enumBuilder(0)

MODEL_DRIVER = modelEnum()

MODEL_PASSAGER = modelEnum()

MODEL_NORMA_BATTLE = modelEnum()

MODEL_SINGLE_YUHUN = modelEnum()

MODEL_BORROW_HERO = modelEnum()

MODEL_HOME_BREAK = modelEnum()

MODEL_TOOLS = modelEnum()

LOG_NEW = 1

LOG_APPENDING = 2

LOG_DISABLE = 3


local function parserTimer(timeStr)
	
	if globalConfig.enableTimer == false then return 0 end
	
	local timer = tonumber(timeStr)
	
	if not timer  then
		
		dialog("定时设置时间错误")
		
		lua_exit()
		
	end
	
	timer = timer * 60
	
	return timer
	
	
end



function serialize(obj)
    local lua = ""
    local t = type(obj)
    if t == "number" then
        lua = lua .. obj
    elseif t == "boolean" then
        lua = lua .. tostring(obj)
    elseif t == "string" then
        lua = lua .. string.format("%q", obj)
    elseif t == "table" then
        lua = lua .. "{\n"
    for k, v in pairs(obj) do
        lua = lua .. "[" .. serialize(k) .. "]=" .. serialize(v) .. ",\n"
    end
    local metatable = getmetatable(obj)
        if metatable ~= nil and type(metatable.__index) == "table" then
        for k, v in pairs(metatable.__index) do
            lua = lua .. "[" .. serialize(k) .. "]=" .. serialize(v) .. ",\n"
        end
    end
        lua = lua .. "}"
    elseif t == "nil" then
        return nil
    else
        error("can not serialize a " .. t .. " type.")
    end
    return lua
end

function ui:showModel()
	
	
	local ret,argv = showUI(self.json)
	
	if ret == UI_OK then
	
		globalConfig = {}
	
		globalConfig.model = tonumber(argv.model) + 1
	
		globalConfig.rewardRecive = tonumber(argv.reward) + 1
	
		globalConfig.loopTime = tonumber(argv.loop) or 9999
		
		globalConfig.LogServer = tonumber(argv.log) + 1
		
		globalConfig.enableTimer = (tonumber(argv.timerEnable) == 0) and true or false
		
		globalConfig.timer = parserTimer(argv.timer)

		globalConfig.retryTime = tonumber(argv.retryTime) or 0

		nLog("globalConfig:" .. serialize(globalConfig))
		
		globalConfig.enableBestGodModel = (tonumber(argv.bestModeSwitch) == 0) and true or false
 
	end
	return ret
end

--ui:showModel()

return ui

