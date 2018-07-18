
local fileLog = {}

local string = require("string")

local format = string.format

local os = require("os")

local date = os.date

local time = os.time

function fileLog:logWithPath(path,isAppending)
	
	local instance = {}
	
	setmetatable(instance,self)
	
	self.__index = self
	
	local mode 
	
	if isAppending then 
		
		nLog("appending")
		
		mode = "a+"
		
	else
		
		nLog("overwrite")
		
		mode = "w+"
	end
	
	local f,err = io.open(path,mode)
	
	if not f then
		
		error("Can not create a fileLog instance:" .. tostring(err),2)
		
	end
	
	
	instance.handle = f
	
	instance.path = path
	
	return instance
	
end

function fileLog:logf(fmt,...)
	
	local logContent
	
	if  select("#",...) == 0 then
		logContent = fmt
	else
		logContent	= format(fmt,...)
	end
	
	self:writeLog(logContent)

end

function fileLog:getPrefix()
	
	
	return  date("[%Y-%m-%d %X]",time())
	
	
end


function fileLog:writeLog(content)
	
	if self.handle then
	
		self.handle:write(self:getPrefix() .. tostring(content) .. "\n")
	
	end
end

function fileLog:close()
	
	
	if self.handle then
		
		
		self.handle:close()
		
		self.handle = nil
		
	end
	
	
end

function fileLog:open()
	
	if not self.handle and self.path then
	
	
		local f,err = io.open(path,"w")
	
		if not f then
		
			error("Can not open Log File:" .. tostring(path) ..  ".Reason:" .. tostring(err),2)
		
		end
	
		self.handle = f
	
	end

end


return fileLog