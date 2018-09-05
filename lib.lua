-- 阴阳师
-- lib.lua  

-- Create By TouchSpriteStudio on 22:17:31   
-- Copyright © TouchSpriteStudio . All rights reserved.
local string = require("string")
local math = require("math")
local os = require("os")
local fileLog = require("FileLog")
local format = string.format
local randomseed = math.randomseed
local random = math.random
local time = os.time
local getColor = getColor
local getColorRGB = getColorRGB
local date = os.date
local nLog = nLog
local onmojiBid =  "com.netease.onmyoji"
local logFilePath 

if xxassist then
	logFilePath = "/var/mobile/Media/onmyoji.log"
else
	logFilePath =  userPath() .. "/log/onmyoji.log"
end
local logServer 

--[[
local sz = require("sz")
local wifiaddr = sz.system.localwifiaddr()
local localIp
for i,v in ipairs(wifiaddr) do
	
	if v[1] == "en0" then
		
		localIp = v[2]
		
	end
	
	--mSleep(2000)
end
]]

local getDeviceName = getDeviceName or function()  return "unknown" end

local localizedName = getDeviceName()
local runingStatus = 1


function fileExistAtPath(path)

	if not path  then return false end

	local f,err = io.open(path)

	local result = false

	if f then
		
		result = true
		
		f:close()
	end
	
	
	
	return  result
end

--[[

	产生随机种子的算法
	
	


]]
local  function  newSeed()
	
	local devID = getDeviceID()
	
	local devSeed = 0
	
	for index,char in utf8.codes(devID) do
		
		if index % 2 == 0 then
		
			devSeed = devSeed + char * index
		
		end
		
	end
	
	return time() +  devSeed
	
end


--[[
	格式化日志输出

	@param 
	
		fmt  string型  格式串

		...  id型  要格式化的内容
	@return
	
		void

]]
local prefixFormat = "DeviceLog(" .. tostring(localizedName) ..   ") [%X] "
function ideFormatLog(fmt,...)
	
	local logContent 
	
	if  select("#",...) == 0 then
		logContent = fmt
	else
		logContent	= format(fmt,...)
	end
	local prefix =  date(prefixFormat,time())
	
	nLog(prefix .. logContent)
	
end

function fileFormatLog(fmt,...)

	logServer:logf(fmt,...)

end


if globalConfig  then
	
	if globalConfig.LogServer == LOG_NEW then
	
		logServer =  fileLog:logWithPath(logFilePath,false)
		
		formatLog = fileFormatLog
	
	elseif globalConfig.LogServer == LOG_APPENDING then
	
	
		logServer = fileLog:logWithPath(logFilePath,true)
		
		formatLog = fileFormatLog
	
	else
		
		formatLog = ideFormatLog
	
	end
	
	
else
	
	formatLog = ideFormatLog
	
end
	
--[[


	--模糊判断某点颜色
	
	@param
	
		
		x  int型  要判断的屏幕逻辑x位置
		
		y  int型  要判断的屏幕逻辑y位置
		
		c  int型  需要的颜色  0x000000 - 0xffffff
		
		s  int型  相似度  0-100 


]]
function isColor(x,y,c,s)
	if not c then error("111",3) end
    local fl,abs = math.floor,math.abs
    s = fl(0xff*(100-s)*0.01)
    local r,g,b = fl(c/0x10000),fl(c%0x10000/0x100),fl(c%0x100)
    local rr,gg,bb = getColorRGB(x,y)
    if abs(r-rr)<s and abs(g-gg)<s and abs(b-bb)<s then
        return true
    end
end
--[[

	--模拟点击
	
	@param
	
		x  int型  要点击的屏幕逻辑x位置
		
		y  int型  要点击的屏幕逻辑y位置
		
		time  int型  按下与抬起的间隔 默认30
	
	@return 
	
		void


]]

function click(x,y,t) 
	
	touchDown(0, x, y)
	
	mSleep(t or 30)
	
	touchUp(0, x, y)
	
end
--[[

	--偏移点击

	@param
		
		x int型  屏幕的逻辑横坐标
		
		y int型  屏幕的逻辑纵坐标
		
		time  int型  按下与抬起的间隔时间,毫秒级
		
		offset  int型  点击(x,y)点是偏移的像素
	
	@return
		
		void
]]
function  randomClick(x,y,t,offset)


	offset = offset or 10
	
	offset = offset > 0 and offset or - offset

	randomseed(newSeed())

	local offsetX = random(-offset,offset)
	
	local offsetY = random(-offset,offset)
	
	t = t or 30
	
	local offsetTime = random(-offset,offset)
	
	click(x+offsetX,y+offsetY,t+offsetTime)
	
	
end



--[[

	区域点击
	
	@param 
	
		rect  table型  要点击的矩形 类型为{x1,y1,x2,y2}  指的是左上角为(x1,y1) 右下角为(x2,y2)的矩形区域

		t　int型  按下与抬去的时间间隔

]]
function rectClick(rect,t)
	
	if type(rect) ~= "table" then
		
	
		error(string.format("rectClick need rect for #1 but got %s",type(rect)),3)
	
	
	end
	
	
	randomseed(newSeed())
	
	local minx = (rect[1] > rect[3]) and rect[3] or rect[1]
	
	local maxx = (rect[1] > rect[3]) and rect[1] or rect[3]
	
	local miny = (rect[2] > rect[4]) and rect[4] or rect[2]
	
	local maxy = (rect[2] > rect[4]) and rect[2] or rect[4]
	
	local x = random(minx,maxx)
	
	local y = random(miny,maxy)
	
	local t = t or 30
	
	return click(x,y,t)
	
end

function rectClickEx(rectSet,t)
	
	randomseed(newSeed())
	
	local index =  random(1,#rectSet)
	
	return rectClick(rectSet[index],t)
end

function rectDoubleClick(rect,t,delay)

	randomseed(newSeed())
	
	local x = random(rect[1],rect[3])
	
	local y = random(rect[2],rect[4])
	
	local t = t or 30
	
	click(x,y,t)
	
	mSleep(delay or 30)
	
	click(x,y,t)

end
--[[

	区域截图
	
	@param
	
		name  string型  截图的名字 
		
		rect  table型  要点击的矩形 类型为{x1,y1,x2,y2}  指的是左上角为(x1,y1) 右下角为(x2,y2)的矩形区域


]]
function rectSnapShot(name,rect)
	
	if rect[1] and  rect[2]  and rect[3] and rect[4] then
	
		snapshot(tostring(name), rect[1], rect[2], rect[3],rect[4])
	else
		
		snapshot(tostring(name))
	end
end
--[[
	
	点阵匹配识别
	
	@param　
	
		dm table型 由抓色器生成的点阵
		
		degree int型  0-100 表示相似度
		
	@return 
	
		true 如果匹配  除此之外任何情况返回false

]]
function dmMatch(dm,degree)
	
	if  type(dm) ~= "table" then
		return false
	end
	
	if type(degree) ~= "number" then
		degree = 85
	end
	--fix for touchsprite v2.24   do not update screen buffer
	keepScreen(false)
	getColor(0, 0)
	keepScreen(true)
	  
	local matched = 0
	
	local total = #dm
	
	for k,v in ipairs(dm) do
		
		--if debug then
		--	formatLog("(%d,%d) color is %#x",v[1],v[2],getColor(v[1], v[2]))
		--end
	
		if isColor(v[1],v[2],v[3],v[4] or 85) then
			
			matched = matched + 1
			
		end
		
	end
	
	local result = (( matched / total ) * 100)
	
	
	
	keepScreen(false)
	
	
	
	if result > degree  then 
		if debug and  seeAllLog  then
			
			formatLog("%s view match success,result:%s",dm.name or "unknown",result)
		end
		return true
	else
		if debug and seeAllLog  then
			formatLog("%s view match failed,result:%s",dm.name or "unknown",result)
		end
		return false
	end
end

function dmDynamicMatch(relativrDm,basePoint,degree)

	local temp = deepCopy(relativrDm)
	
	for i,v in ipairs(temp) do
	
		v[1] = v[1] + basePoint.x
	
		v[2] = v[2] + basePoint.y
	
	end

	return dmMatch(temp,degree)

end
--[[

	点阵寻找
	
	@param　
	
		dm table型 由抓色器生成的点阵
		
		rect table型  查找范围
		
		degree int型  0-100 表示相似度
		
	@return 
	
		返回逻辑位置x,y  如果没有找到或者异常返回-1,-1

]]
function dmFind(dm,rect,degree)

	if  type(dm) ~= "table" then
		
		error(string.format("dmFind need dm for #1 bug got %s ",type(dm)),2)
		
		return -1,-1
	end
	
	if type(rect) ~= "table" then
		
		local w,h = getScreenSize()
		
		rect = {0,0,h,w}
		
	end
	if type(degree) ~= "number" then
		degree = 85
	end
	
	keepScreen(false)
	--强制触动刷新屏幕缓存
	getColor(0, 0)
	
	keepScreen(true)
	
	local  needPoint = dm[1]


	local mutliStrTemp= {}
	
	
	for i = 2,#dm do
		
		local point = dm[i]
		
		table.insert(mutliStrTemp,format("%s|%s|%#x",point[1] - needPoint[1],point[2]-needPoint[2],point[3]))
		
	end

	local mutliStr = table.concat(mutliStrTemp,",")
	
	local x, y = findMultiColorInRegionFuzzy(needPoint[3],mutliStr,degree, rect[1], rect[2], rect[3], rect[4])
	
	--formatLog(mutliStr)
	
	keepScreen(false)
	
	--formatLog("will using command to find dm:%s",format("findColorInRegionFuzzy(%#x,%s,%s,%d,%d,%d,%d)",needPoint[3],mutliStr,degree,rect[1],rect[2],rect[3],rect[4]))

	return x,y
end
--[[

	等待点阵出现
	
	@param　
	
		dm table型 由抓色器生成的点阵
		
		t  int型  等待时间
		
		degree int型  0-100 表示相似度
		
	@return 
	
		status  boolean值   true代表成功等待到  否则false
		
		info   int型 | string型   如果status为true返回等待的时间  否则 为信息




]]

function waitDm(dm,t,degree)
	
	if  type(dm) ~= "table" then
		
		error("need  dm",2)
		
		return false
	end
	
	if type(t) ~= "number" then

		t = 5
		
	end
	if type(degree) ~= "number" then
		degree = 85
	end
	
	local startTIme = time()
	
	
	
	while 1 do
	
		if time() - startTIme > t then return false,"TimeOut" end
	
		if dmMatch(dm,degree) then return true ,time() - startTIme  end
	end
	
end
--[[

	有回调的等待

]]


function deepCopy(object)    
	local lookup_table = {}
	local function _copy(object)
		if type(object) ~= "table" then
			return object
		elseif lookup_table[object] then
			return lookup_table[object]
		end  -- if        
		local new_table = {}
		lookup_table[object] = new_table
		for index, value in pairs(object) do
			new_table[_copy(index)] = _copy(value)
		end  -- for        
		return setmetatable(new_table, getmetatable(object))    
	end  -- function _copy    
	return _copy(object)

end
function waitDmWithCallBack(dm,t,degree,callback)


	local ststus = waitDm(dm,dgree,t)
		
	if ststus then
		
		if callback then
			
			pcall(callback)

		end
	end
end
--[[

	滑动滑块

	可能会废弃
]]

function slider(rect,lengh)
	
	randomseed(newSeed())
	
	local x = random(rect[1],rect[3])
	
	local y = random(rect[2],rect[4])
	
	touchDown(1, x, y)
	
	local begin_x = x
	
	for i = 1,math.floor(lengh/50) do
		
		touchMove(1, begin_x + 50, y)
		
		begin_x = begin_x + 50
		
		mSleep(30)
		
	end
	
	touchMove(1,x+lengh, y)
	
	touchUp(1, x+lengh, y)
	
end

local function moveTo(x1,y1,x2,y2,step)
	
	step = step or 30
	
	local x_distance = math.abs( x2 - x1 )
	
	local y_distance = math.abs(y2 - y1)
	
	local begin_y = y1
	
	touchDown(1, x1, y1)
	
	for i = 1,math.floor(y_distance/step) do
		
		if (y1 > y2 ) then
			
			begin_y = begin_y - step
		else
			begin_y = begin_y + step
			
		end
		
		touchMove(1, x1, begin_y)
		
	end
	
	touchMove(1, x1, y2)
	
	mSleep(1000)
	
	local begin_x = x1
	
	for i = 1,math.floor(x_distance/step) do
		
		if (x1 > x2) then
			
			begin_x = begin_x - step
		
		else
			
			begin_x = begin_x + step
		
		end
		
		touchDown(1,begin_x, y2)
		
		
		mSleep(30)
		
	end
	
	touchMove(1, x2, y2)
	
	touchUp(1, x2, y2)
	
end


function rectToRect(rect1,rect2)
	
	randomseed(newSeed())
	
	local x1 = random(rect1[1],rect1[3])
	
	local y1 = random(rect1[2],rect1[4])
	
	local x2 = random(rect2[1],rect2[3])
	
	local y2 = random(rect2[2],rect2[4])
	
	--formatLog("p1(%d,%d) p2(%d,%d)",x1,y1,x2,y2)
	
	moveTo(x1,y1,x2,y2)
	
end

function dialogf(fmt,...)
	
	
	dialog(format(fmt,...),0)
	
end

function toastf(fmt,...)
	
	
	toast(format(fmt,...),3)
	
end

debugWindos = {}

local debugWindos = debugWindos

WND_CANDRAG = 1

WND_CANNOT_DARG = 0

local w,h = getScreenSize()

if GLOBAL_INIT_ORIENT == 0 then

	
	
else
	
	w,h = h,w
	
end

SCREEN_RECT = {0,0,w,h}

POS_VIEW = 1

local POS_VIEW = POS_VIEW

function debugWindos:create(rect,canDrag)
	
	local wnd_object = {}
	
	setmetatable(wnd_object,self)
	
	self.__index = self
	
	if not rect then rect = SCREEN_RECT end
	
	if not canDrag then canDrag = WND_CANDRAG end
	
	wnd_object.wid = "WND_ID_" .. tostring(time())
	
	fwShowWnd(wnd_object.wid,rect[1],rect[2],rect[3],rect[4],canDrag)
	
	formatLog("create windows at {%d,%d,%d,%d} with id %s",rect[1],rect[2],rect[3],rect[4],wnd_object.wid)
	
	wnd_object.views = {}
	
	wnd_object.isOK = true
	
	return wnd_object
end

function debugWindos:addView(id,view)
	
	table.insert(self.views,view)
	
end

function debugWindos:showPoint(x,y,color)
	
	
	if self.wid and self.isOK then
	
		local viewLen = 20
	
		formatLog("a point view")
		
		local left = x - viewLen
		
		if left < 0 then left = 0 end
		
		local top = y - viewLen
		
		if top <0 then top = 0 end
		
		local right = x + viewLen
		
		if right > w then right = w end
		
		local bottom = y + viewLen
		
		if bottom > h then right = h end
		
		local id = "POS_ID_" .. format("(%d,%d)",x,y)
		
		self:addView(id,{type = POS_VIEW,pos = {x,y} })
		
		fwShowTextView(self.wid,id,"H","center",color or "FF0000","",15,1,left,top,right,bottom,1)
		
		formatLog("draw point view in %s {%d,%d,%d,%d}",self.wid,left,top,right,bottom)
		
	end
end

--[[
local formatLog = formatLog

local isColor = isColor

local  click = click

local randomClick  = randomClick

local dmMatch = dmMatch

local dmFind = dmFind

local waitDm = waitDm

local dialogf = dialogf

local toastf = toastf 
]]
