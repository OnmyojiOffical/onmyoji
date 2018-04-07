-- 阴阳师
-- lib.lua  

-- Create By TouchSpriteStudio on 22:17:31   
-- Copyright © TouchSpriteStudio . All rights reserved.
local string = require("string")
local math = require("math")
local os = require("os")
local format = string.format
local randomseed = math.randomseed
local random = math.random
local time = os.time
local getColor = getColor
local getColorRGB = getColorRGB
local date = os.date
local nLog = nLog
local onmojiBid =  "com.netease.onmyoji"
local sz = require("sz")
local wifiaddr = sz.system.localwifiaddr()
local localIp
for i,v in ipairs(wifiaddr) do
	
	if v[1] == "en0" then
		
		localIp = v[2]
		
	end
	
	--mSleep(2000)
end
local runingStatus = 1
--[[

	产生随机种子的算法
	
	


]]
local  function  newSeed()
	
	--暂时只用时间作为依据
	return time()
	
end


--[[
	格式化日志输出

	@param 
	
		fmt  string型  格式串

		...  id型  要格式化的内容
	@return
	
		void

]]
local prefixFormat = "DeviceLog(" .. tostring(localIp) ..   ") [%X] "
function formatLog(fmt,...)
	
	local logContent 
	
	if  select("#",...) == 0 then
		logContent = fmt
	else
		logContent	= format(fmt,...)
	end
	local prefix =  date(prefixFormat,time())
	
	nLog(prefix .. logContent)
	
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
	
	randomseed(newSeed())
	
	local x = random(rect[1],rect[3])
	
	local y = random(rect[2],rect[4])
	
	local t = t or 30
	
	return click(x,y,y)
	
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
	
	for _,v in ipairs(dm) do
		
		if debug then
			formatLog("(%d,%d) color is %#x",v[1],v[2],getColor(v[1], v[2]))
		end
		if isColor(v[1],v[2],v[3],v[4] or 85) then
			
			matched = matched + 1
			
		end
		
	end
	
	local result = (( matched / total ) * 100)
	
	--nLog(string.format("total:%s,match:%s,result:%s",total,matched,result))
	
	keepScreen(false)
	
	
	
	if result > degree  then 
		if debug then
			formatLog("%s view match success",dm.name or "unknown")
		end
		return true
	else
		if debug then
			formatLog("%s view match failed",dm.name or "unknown")
		end
		return false
	end
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

function dialogf(fmt,...)
	
	
	dialog(format(fmt,...),0)
	
end

function toastf(fmt,...)
	
	
	toast(format(fmt,...),3)
	
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
