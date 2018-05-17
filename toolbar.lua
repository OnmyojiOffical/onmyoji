local main_callback = {
	callBack = function()
		if global_app_exit_reason == "userExit" then
			dialog("用户退出", time)
		else
			dialog("发生未知异常", time)
		end
	end,
	errorBack = function(err)
		dialog("协程错误了:"..err,0)
	end,
	catchBack = function(exp)
		local sz = require('sz')
		local json = sz.json
		if exp.msg ~= "userExit" then
			dialog("协程异常了\n"..json.encode(exp),0)
		else
			global_app_exit_reason = "userExit"
		end
	end
}
local task_callback = {
	callBack = function()
		
	
		
	end,
	errorBack = function(err)

		dialog("协程错误了:"..err,0)
	end,
	catchBack = function(exp)
		if exp.msg == "timeout" then 
			toast("任务取消", 10)
		else
			local sz = require"sz"
			dialog(sz.json.encode(exp))
		end
	end
}
thread = require("thread")



local toolbar = {}

function  toolbar:create()
	
	local object = {}
	
	object.tools = {}
	
	object.tools_heigh = 100
	
	object.tools_width = 100
	
	object.tools_backgroundcolor = "FFDAB9"
	
	object.tools_font_size = 15
	
	object.running = {}
	
	object.event_table = {}
	
	setmetatable(object,self)
	
	self.__index = self
	
	object.wid = "toolbar_wnd_" .. os.time()
	
	return object
	
end

function toolbar:show()
	
	local tools = self.tools
	
	local tools_num = #self.tools
	
	if tools_num == 0 then 
		
		return 
		
	end
	
	fwShowWnd(self.wid,0,0,tools_num*self.tools_width,self.tools_heigh,1)
	
	local baseX = 0
	
	local baseY = 0
	
	for i = 1,tools_num do
		
		local current_tool = tools[i]
		
		fwShowButton(
			
			self.wid,
			
			current_tool.id,
			
			current_tool.label,
			
			"",
			
			current_tool.backgroundcolor or self.tools_backgroundcolor,
			
			"",
			
			current_tool.font_size or self.tools_font_size,
			
			baseX,
			
			baseY,
			
			baseX + (current_tool.width or self.tools_width),
			
			
			baseY +  (current_tool.heigh or self.tools_heigh)
			)
			baseX =  baseX + (current_tool.width or self.tools_width)
			
			
	end
	
	shared_global_self = self
	
  thread.create(self.dispatch,main_callback)
	
end

function toolbar.dispatch()
	
	nLog("dispatch begin")
	
	local self = shared_global_self
	
	
	local event_table = self.event_table
	
	while 1 do 
	
		local command = fwGetPressedButton()
	
		if command ~= "" then
			
			
			if event_table[command]  then

				if event_table[command].needNewThread then

					nLog(string.format("command for %s",command))

					if not  self.running[command] then

						nLog("will create thread with func " .. tostring(event_table[command].func))

						local tid = thread.createSubThread(event_table[command].func,task_callback)

						nLog("tid is " .. tostring(tid))

						self.running[command] = tid

					else

						nLog("cancel commnad " .. command)

						thread.setTimeout(10,self.running[command])

						self.running[command] = nil

					end
				else

					event_table[command].func()
					
				end
			
			end
		
		end
	
		mSleep(300)
	end
	
	
end

function toolbar:addTool(id,label)
	
	table.insert(self.tools,{id = id,label = label})
	
end

function  toolbar:connect(id,func,needThread)
	
	self.event_table[id] = {func = func,needNewThread = needThread}
	
end

function toolbar:close()
	
	fwCloseWnd(self.wid)
	
	for i,v in pairs(self.running) do
		
		thread.setTimeout(10,v)
		
	end
	
end

function toolbar:setToolsWidth(newWidth)

	self.tools_width = newWidth

end

function toolbar:setToolsHeigh(newHeigh)
	
	
	self.tools_heigh = newHeigh
	
end


return toolbar
