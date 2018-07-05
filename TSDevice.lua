--[[


	设备信息类 TSDevice。主要解决触动精灵提供的API混乱的问题，如tsver不返回浮点数而是不好判断的字符串，难以精确获取设备类型的问题
	
	-----------------API---------------------------------
	-----------------------------------------------------
	currentDevice() 
	
	返回TSDevoce类型的对象,包含当前设备信息
	
	例:
	
	local device = TSDevice:currentDevice()
	
	----------------------------------------------------
	
	refreshData()
	
	重新获取一遍设备信息,一般不会调用
	
	例:
	
	TSDevice:currentDevice():refreshData()
	
	------------------------------------------------------
	
	string infoString()

	获取描述这台设备信息的字符串
	
	例:
	
	dialog(TSDevice:currentDevice():infoString())
	
	
	string productString()
	
	获取描述触动产品类型的字符串
	
	例:
	
	dialog(TSDevice:currentDevice():productString())

	--------------Property------------------------------
	
	number tsProduct
	
	返回代表着触动产品类型的数字,相关可读性较强全局变量已经声明可用类型device.tsProduct == TouchSprite 来判断。详细定义在455行
	
	number TSVersion
	
	触动版本，一个浮点数类似2.42可以用大于小于进行判断
	
	number OSVersion
	
	系统版本，一个浮点数类似11.11可以用大于小于进行判断
	
	number  type 
	
	代表设备类型的数字 这个类库已经把数字与全局变量的定义导出到全局变量，可以使用类似device.type == iPhoneX这样的判断。详细定义在117行
	
	string	humanReadingDevice
	
	人可读的设备类型 比如iPhoneX

	string homePath
	
	返回触动根目录 类似"/var/mobile/Media/TouchSprite"

	string logPath
	
	返回触动日志目录 类似"/var/mobile/Media/TouchSprite/log"
	
	string luaPath 
	
	返回触动脚本目录 类似"/var/mobile/Media/TouchSprite/lua" 已经处理好帮你玩上面script的问题
	
	string resPath
	
	返回触动资源目录 类似"/var/mobile/Media/TouchSprite/res" 
	
	string pluginPath
	
	返回触动插件目录 类似"/var/mobile/Media/TouchSprite/plugin" 
	
	string  name 
	
	返回当前设备的名称 类似 XX的iPhone
	
	
	boolean  hasAuth
	
	返回true代表有触动授权 返回false代表没触动授权
	
	table screen
	
	记录屏幕宽高的表,其中width和heigh两个键代表宽高
]]



local ts = require("ts")

local device = {}

local enumIndex = 0

local function nextEnum(...)
	
	enumIndex = enumIndex + 1
	
	return enumIndex
	
end

iPhone2         = 	nextEnum()

iPhone3         = 	nextEnum()

iPhone3GS       = 	nextEnum()

iPhone4         = 	nextEnum()

iPhone4S        = 	nextEnum()

iPhone5         = 	nextEnum()

iPhone5C        = 	nextEnum()

iPhone5S        = 	nextEnum()

iPhone6         = 	nextEnum()

iPhone6Plus     = 	nextEnum()

iPhone6S        = 	nextEnum()

iPhone6SPlus    =   nextEnum()

iPhoneSE        = 	nextEnum()

iPhone7         = 	nextEnum()

iPhone7Plus     = 	nextEnum()

iPhone8         = 	nextEnum()

iPhone8Plus     = 	nextEnum()

iPhoneX         = 	nextEnum()

iPodTouch       = 	nextEnum()

iPodTouch2      = 	nextEnum()

iPodTouch3      = 	nextEnum()

iPodTouch4      = 	nextEnum()

iPodTouch5      = 	nextEnum()

iPad            = 	nextEnum()

iPad2           = 	nextEnum()

iPad3           = 	nextEnum()

iPad4           = 	nextEnum()

iPadAir         = 	nextEnum()

iPadAir2        = 	nextEnum()

iPadMini        = 	nextEnum()

iPadMini2       = 	nextEnum()

iPadMini3       = 	nextEnum()

iPadMini4       = 	nextEnum()

iPadPro         = 	nextEnum()

iPadProPlus     = 	nextEnum()

iPhoneSimulator = 	nextEnum()

unknown         = 	nextEnum()

local iPhone2 = iPhone2

local iPhone3 = iPhone3

local iPhone3GS = iPhone3GS

local iPhone4 = iPhone4

local iPhone4S = iPhone4S

local iPhone5 = iPhone5

local iPhone5C = iPhone5C

local iPhone5S = iPhone5S

local iPhone6 = iPhone6

local iPhone6Plus = iPhone6Plus

local iPhone6S = iPhone6S

local iPhone6SPlus = iPhone6SPlus

local iPhoneSE = iPhoneSE

local iPhone7 = iPhone7

local iPhone7Plus = iPhone7Plus

local iPhone8 = iPhone8

local iPhone8Plus = iPhone8Plus

local iPhoneX = iPhoneX

local iPodTouch = iPodTouch

local iPodTouch2 = iPodTouch2

local iPodTouch3 = iPodTouch3

local iPodTouch4 = iPodTouch4

local iPodTouch5 = iPodTouch5

local iPad = iPad

local iPad2 = iPad2

local iPad3 = iPad3

local iPad4 = iPad4

local iPadAir = iPadAir

local iPadAir2 = iPadAir2

local iPadMini = iPadMini

local iPadMini2 = iPadMini2

local iPadMini3 = iPadMini3

local iPadMini4 = iPadMini4

local iPadPro = iPadPro

local iPadProPlus = iPadProPlus

local iPhoneSimulator = iPhoneSimulator

local unknown = unknown


local modelTypeMap = {
	
["iPhone1,1"] = iPhone2,
["iPhone1,2"] = iPhone3,
["iPhone2,1"] = iPhone3S,
["iPhone3,1"] = iPhone4,
["iPhone3,2"] = iPhone4,
["iPhone3,3"] = iPhone4,
["iPhone4,1"] = iPhone4S,
["iPhone5,1"] = iPhone5,
["iPhone5,2"] = iPhone5,
["iPhone5,3"] = iPhone5C,
["iPhone5,4"] = iPhone5C,
["iPhone6,1"] = iPhone5S,
["iPhone6,2"] = iPhone5S,
["iPhone7,1"] = iPhone6Plus,
["iPhone7,2"] = iPhone6,
["iPhone8,1"] = iPhone6S,
["iPhone8,2"] = iPhone6SPlus,
["iPhone8,4"] = iPhoneSE,
["iPhone9,1"] = iPhone7,
["iPhone9,3"] = iPhone7,
["iPhone9,2"] = iPhone7Plus,
["iPhone9,4"] = iPhone7Plus,


--[[
([platform isEqualToString:@"iPhone10,1"]) return@"iPhone 8";

if([platform isEqualToString:@"iPhone10,4"]) return@"iPhone 8";

if([platform isEqualToString:@"iPhone10,2"]) return@"iPhone 8 Plus";

if([platform isEqualToString:@"iPhone10,5"]) return@"iPhone 8 Plus";

if([platform isEqualToString:@"iPhone10,3"]) return@"iPhone X";

if([platform isEqualToString:@"iPhone10,6"]) return@"iPhone X";


]]

["iPhone10,1"] = iPhone8,
["iPhone10,4"] = iPhone8,
["iPhone10,2"] = iPhone8Plus,
["iPhone10,5"] = iPhone8Plus,
["iPhone10,3"] = iPhoneX,
["iPhone10,6"] = iPhoneX,
["iPod1,1"] = iPodTouch,
["iPod2,1"] = iPodTouch2,
["iPod3,1"] = iPodTouch3,
["iPod4,1"] = iPodTouch4,
["iPod5,1"] = iPodTouch5,
["iPad1,1"] = iPad,
["iPad2,1"] = iPad2,
["iPad2,2"] = iPad2,
["iPad2,3"] = iPad2,
["iPad2,4"] = iPad2,
["iPad2,5"] = iPadMini,
["iPad2,6"] = iPadMini,
["iPad2,7"] = iPadMini,
["iPad3,1"] = iPad3,
["iPad3,2"] = iPad3,
["iPad3,3"] = iPad3,
["iPad3,4"] = iPad4,
["iPad3,5"] = iPad4,
["iPad3,6"] = iPad4,
["iPad4,1"] = iPadAir,
["iPad4,2"] = iPadAir,
["iPad4,3"] = iPadAir,
["iPad4,4"] = iPadMini2,
["iPad4,5"] = iPadMini2,
["iPad4,6"] = iPadMini2,
["iPad4,7"] = iPadMini3,
["iPad4,8"] = iPadMini3,
["iPad4,9"] = iPadMini3,
["iPad5,1"] = iPadMini4,
["iPad5,2"] = iPadMini4,
["iPad5,3"] = iPadAir2,
["iPad5,4"] = iPadAir2,
["iPad6,3"] = iPadPro,
["iPad6,4"] = iPadPro,
["iPad6,7"] = iPadProPlus,
["iPad6,8"] = iPadProPlus,
["i386"] = iPhoneSimulator,
	
}

local deviceNameMap = {
	
[iPhone2] = "iPhone2",
[iPhone3] = "iPhone3",
[iPhone3GS] = "iPhone3GS",
[iPhone4] = "iPhone4",
[iPhone4] = "iPhone4",
[iPhone4] = "iPhone4",
[iPhone4S] = "iPhone4S",
[iPhone5] = "iPhone5",
[iPhone5] = "iPhone5",
[iPhone5C] = "iPhone5C",
[iPhone5C] = "iPhone5C",
[iPhone5S] = "iPhone5S",
[iPhone5S] = "iPhone5S",
[iPhone6Plus] = "iPhone6Plus",
[iPhone6] = "iPhone6",
[iPhone6S] = "iPhone6S",
[iPhone6SPlus] = "iPhone6SPlus",
[iPhoneSE] = "iPhoneSE",
[iPhone7] = "iPhone7",
[iPhone7] = "iPhone7",
[iPhone7Plus] = "iPhone7Plus",
[iPhone7Plus] = "iPhone7Plus",
--[[
	
	for iPhone8 && iPhone8Plus && iPhoneX


	
]]
[iPhone8] = "iPhone8",
[iPhone8Plus] = "iPhone8Plus",
[iPhoneX] = "iPhoneX",
[iPodTouch] = "iPodTouch",
[iPodTouch2] = "iPodTouch2",
[iPodTouch3] = "iPodTouch3",
[iPodTouch4] = "iPodTouch4",
[iPodTouch5] = "iPodTouch5",
[iPad] = "iPad",
[iPad2] = "iPad2",
[iPad2] = "iPad2",
[iPad2] = "iPad2",
[iPadMini] = "iPadMini",
[iPadMini] = "iPadMini",
[iPadMini] = "iPadMini",
[iPad3] = "iPad3",
[iPad3] = "iPad3",
[iPad3] = "iPad3",
[iPad4] = "iPad4",
[iPad4] = "iPad4",
[iPad4] = "iPad4",
[iPadAir] = "iPadAir",
[iPadAir] = "iPadAir",
[iPadAir] = "iPadAir",
[iPadMini2] = "iPadMini2",
[iPadMini2] = "iPadMini2",
[iPadMini2] = "iPadMini2",
[iPadMini3] = "iPadMini3",
[iPadMini3] = "iPadMini3",
[iPadMini3] = "iPadMini3",
[iPadMini4] = "iPadMini4",
[iPadMini4] = "iPadMini4",
[iPadAir2] = "iPadAir2",
[iPadAir2] = "iPadAir2",
[iPadPro] = "iPadPro",
[iPadPro] = "iPadPro",
[iPadProPlus] = "iPadProPlus",
[iPadProPlus] = "iPadProPlus",
[iPhoneSimulator] = "iPhoneSimulator",	
	
	
}

local instance = nil

function device:currentDevice()
	
	if instance then
		
		return instance
		
	else
		
		instance = {}
		
		setmetatable(instance,self)
		
		self.__index = self
		
		
		instance:refreshData()
		
		
		--toast(instance.model,1)
		
		return instance
	end
	
end

TouchSprite = 0

Play4u = 1

TouchSpriteEE = 2

TouchSpriteElf = 3

local productStringMap = {
	
[TouchSprite] = "TouchSprite",

[Play4u] = "Play4u",
	
[TouchSpriteEE] = "TouchSpriteEE",

[TouchSpriteElf] = "TouchSpriteElf",
	
}


function device:procudtString()
	
	local procudt = self.tsProduct
	
	return productStringMap[procudt] or "unknownProcudt"
	
end


function device:refreshData()
	
	local instance = self
	
	instance.model = ts.system.devicetype()
		
		instance.type = modelTypeMap[instance.model] or unknown
		
		instance.humanReadingDevice = deviceNameMap[instance.type] or "unknow"
		
		instance.screen = {}
		
		local w,h = getScreenSize()
		
		instance.screen.width = w
		
		instance.screen.heigh = h
		
		instance.deviceID = getDeviceID and getDeviceID() or ""
		
		local tsver = getTSVer()
		
		local tsverNumberStr,count = string.gsub(tsver,"%.","")
		
		local versPower = math.pow(10,count or 1)
		
		instance.TSVersion = (tonumber(tsverNumberStr) or 100) / versPower
		
		local osver = getOSVer()
		
		local osverNumberStr,count = string.gsub(osver,"%.","")
		
		local versPower = math.pow(10,count or 1)
		
		instance.OSVersion = (tonumber(osverNumberStr) or 100) / versPower
		
		instance.name = getDeviceName and getDeviceName() or instance.humanReadingDevice
		
		instance.hasAuth = deviceIsAuth and (deviceIsAuth() == 0 and false or true)  or false
	
		instance.tsProduct = whoAmI and whoAmI() or 0
	
		instance.homePath = userPath()
		
		instance.logPath = userPath() .. "/log"
	
		instance.luaPath = userPath() .. (instance.tsProduct == Play4u and "/script" or "/lua"  )
		
		instance.resPath = userPath() .. "/res"
		
		instance.pluginPath = userPath() .. "/plugin"
end


function device:infoString()
	
	return string.format("设备类型:%s\n触动版本:%.2f\n系统版本:%.2f\n授权情况:%s\n设备名:%s\n触动产品类型:%s\n屏幕大小:{%d,%d},",
		
											self.humanReadingDevice,
											
											self.TSVersion,
											
											self.OSVersion,
											
											self.hasAuth,
											
											self.name,
											
											self:procudtString(),
											
											self.screen.width,
											
											self.screen.heigh
											)
	
	
end

return device

--dialog(device:currentDevice():infoString())

