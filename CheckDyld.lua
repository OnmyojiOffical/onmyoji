
require("lib")


local dylibNameArr = {
	
	"xCon",
	
	"OnmyojiProtect"
	
}

local debPath = userPath() .. "/res/com.onmyojiOffical.protect.deb"


local recordPath = userPath() .. "/res/onmyojiOffical_check_disable"

local function fullPathForDylib(dylib)
	
	
	return string.format("/Library/MobileSubstrate/DynamicLibraries/%s.dylib",tostring(dylib))
	
end

local OFDlg = {}

local instance = nil

function OFDlg:sharedDlg()
	
	if (instance)  then
	
		return instance
		
		
	else
	
		instance = {}
	
		setmetatable(instance,self)
		
		self.__index = self
	
		return instance
	
	end
end

function OFDlg:checkLib()
	
	local installOne = false
	
	for index,dylib in ipairs(dylibNameArr)  do
		
		formatLog("Check %s now realPath:%s",dylib,fullPathForDylib(dylib))
		
		if fileExistAtPath(fullPathForDylib(dylib))then
		
			installOne = true
			
			formatLog("device install:%s",dylib)
			
			break
			
		else
			
			formatLog("device not install:%s",dylib)
			
		end
		
	end
	
	return installOne
	
end

function OFDlg:handleInstallDeb()
	
	if (fileExistAtPath(debPath)) then
	
	
		os.execute(string.format("dpkg -i %s",debPath))
		
		toast("close Onmyoji",1)
		
		os.execute("killall -9 g37")
	
	end
	
	
	
end

function OFDlg:handleDonotToastAgain()
	
	
	io.open(recordPath,"w"):close()
	
	
	
	
	
end

function OFDlg:needCheck()
	
	if fileExistAtPath(recordPath) then
	
		return false
	
	end

	return true
	
end

function OFDlg:runModel(...)
	
	if (not  self:needCheck()) then return end
	
	if self:checkLib() then
		
		dialog("已经安装了防越狱检测插件", 5)
	
	else
	
	   ret = 	dialogRet("设备没安装:\n" .. table.concat(dylibNameArr,"\n") .. "\n可能会被检测到越狱状态造成封禁账号,是否安装保护插件","安装","不安装","不再提示", 0)
	
		if ret == 0 then
			
			self:handleInstallDeb()
			
		elseif ret == 2 then
			
			self:handleDonotToastAgain()
		
		end
	
	end
	
	
end



--formatLog("path:%s","/Library/MobileSubstrate/DynamicLibraries/OnmyojiProtect.dylib" == fullPathForDylib("OnmyojiProtect"))

--formatLog("+++++++++%s",fileExistAtPath(fullPathForDylib("OnmyojiProtect")))

--OFDlg:sharedDlg():runModel()

return OFDlg