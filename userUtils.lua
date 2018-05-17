local toolbar = require("toolbar")

local mytoolbar = toolbar:create()

local godWalkID = "godWork"

local godWalkLabel = "自由行"

local drawBrokenCardID = "drawBrokenCard"

local drawBrokenCardLabel = "抽厕纸"

local easyUpLevelID = "easyUpLevel"

local easyUpLevelLabel = "升狗粮"

local  tools = {
	
	{godWalkID,godWalkLabel},
	
	{drawBrokenCardID,drawBrokenCardLabel},
	
	{easyUpLevelID,easyUpLevelLabel}
}

for i,v in ipairs(tools) do

	mytoolbar:addTool(v[1],v[2])

end


local function handleDrawBrokenCard()
	
	
	local num = tonumber(dialogInput("抽多少张","0或任意输入为全抽", "Go")) or 0
	
	return drawBrokenCard(num)
	
	
end


local function handleEasyUpLevel()
	
	
	toast("暂未支持")
	
end

mytoolbar:setToolsWidth(200)

mytoolbar:connect(godWalkID,godWalk,true)

mytoolbar:connect(drawBrokenCardID,handleDrawBrokenCard,true)

mytoolbar:connect(easyUpLevelID,handleDrawBrokenCard,true)

function showToolsBar()

	mytoolbar:show()

	thread.waitAllThreadExit()
	
end

