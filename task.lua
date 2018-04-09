-- 阴阳师
-- task.lua  

-- Create By TouchSpriteStudio on 15:20:07   
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
local runingStatus = 1
require("lib")

local formatLog = formatLog

local isColor = isColor

local  click = click

local randomClick  = randomClick

local dmMatch = dmMatch

local dmFind = dmFind

local waitDm = waitDm

local rectClick = rectClick

local w,h = getScreenSize()

local date

local rewardReciveHigh = 1

local rewardReciveAll = 2

local rewardReciveNo = 3

local loopTime = 999999

local defaltConfig = {
	
	--
	rewardRecive =  rewardReciveHigh,
	
	
	loopTime = loopTime
	
	
	
	
	
}

if w == 750 and h == 1334 then
	
	date = require("iPhone6")

elseif w == 640 and h == 1136 then
	
	date = require("iPhone5")
	
elseif w == 1125 and h == 2436 then
	
	date = require("iPhoneX")
elseif w == 1668 and h =  2244 then
	
	date = require("iPdPro")
else
	
	dialog(string.format("尺寸为%d&%d的设备暂时不支持",w,h),0)
	
	lua_exit()

end



local function commonCheck()
	
	local config = globalConfig or  defaltConfig
	
	if  dmMatch(date.dm.rewardTaskDm,70) then
			
			formatLog("悬赏任务")
			
			if config.rewardReciveNo then rectClick(date.rect.rewardTaskCancelRect) else
				--悬赏封印
				if  dmMatch(date.dm.rewardLowLevelDm,60) then
					--最辣鸡悬赏，拒绝

					formatLog("低级悬赏")

					if  config.rewardRecive == rewardReciveAll then

						rectClick(date.rect.rewardTaskReciveRect)
					else
						rectClick(date.rect.rewardTaskCancelRect)
					end
					mSleep(100)
				else
					--能忍

					formatLog("中级或者高级悬赏")

					rectClick(date.rect.rewardTaskReciveRect)

					mSleep(100)

				end
			end

	elseif  dmMatch(date.dm.over6000Dlg,70) then
			
			mSleep(500)
			
			rectClick(date.rect.over6000DlgRect,30)
			
			mSleep(100)
		
	end
	
end

function normalBattle(loopMax)

	local battleRecord = 0

	local lastClickTime = time()

	while 1 do 

		if battleRecord > loopMax then  lockDevice()	lua_exit() end

		randomseed(time())

		commonCheck()

		if dmMatch(date.dm.normalBegin,70) then

			mSleep(500)

			rectClick(date.rect.normalBeginRect,30)

			mSleep(500)

			formatLog("will begin a battle")

			lastClickTime = time()

			battleRecord = battleRecord + 1

		elseif  dmMatch(date.dm.battleOKDm,70) or dmMatch(date.dm.battleOKExpDm,70)  then

			while (dmMatch(date.dm.battleOKDm,70)) do

				rectClick(date.rect.battleOKRect,30)

				lastClickTime = time()

				mSleep(200)
			end


		else
			if math.abs(lastClickTime - time()) > 60 * 5 then


				formatLog("5分钟未能结束战斗")

				snapshot(tostring(time()) .. ".png")

				lockDevice()

				lua_exit()

			end

		end

		mSleep(100)

	end


end

function yuhunDriver()
	

	
	--总共战斗场次
	local totalBattle = 0
	
	--上次点击时间
	local lastClickTime = time()
	
	--上次战斗时间
	local lastBattleTime = time()
	
	
	

	while 1 do 
		
--		local t = os.date("*t",time())
		
--		if t.hour > 6 then
			
--			lockDevice()
			
--			lua_exit()
--		end

		randomseed(time())
		
		commonCheck()
		
		if dmMatch(date.dm.autoInviteDlgDm)  then
			
			mSleep(200)
			
			if not dmMatch(date.dm.autoInviteDefaultDm,70) then
				
				rectClick(date.rect.autoInviteDefaultActiveRect)
				
				lastClickTime = time()
				
				formatLog("勾玉默认邀请队友")
				
				mSleep(500)
				
			end
			
			rectClick(date.rect.autoInviteSendRect)
			
			lastClickTime = time()
			
			mSleep(1000)

		
		elseif  dmMatch(date.dm.battleOKDm,60)  or  dmMatch(date.dm.battleOKExpDm,60)  then

			--使用金币buff图案作为结束战斗信号
	
			formatLog("结束战斗")

			--随机一个地方
			
			local begin_time = time()
			
			while (dmMatch(date.dm.battleOKDm,60) or  dmMatch(date.dm.battleOKExpDm,60))   do
				--for some special view
				if time() - begin_time > 5 then break end
			
				rectClick(date.rect.battleOKRect,30)
				
				lastClickTime = time()
 
			end
			
			if time() - lastBattleTime > 10 then
			
				totalBattle = totalBattle + 1
			
				formatLog("第%d场魂十已完成",totalBattle)
			end
	
			lastBattleTime = time()


		elseif dmMatch(date.dm.yuhunBeginDm) then
			
			mSleep(300)
			
			rectClick(date.rect.beginYuhunBattleRect)
			
			mSleep(500)
--		elseif	dmMatch(inviteTeam,70) and dmFind(bearInvite,inviteRect,70) ~= -1 then
			
--			mSleep(1000)

--			formatLog("加入bear的队伍")

--			randomClick(332,405)

--			lastClickTime = time()

--	    elseif dmMatch(prepareBattle,70) then
		
--			formatLog("准备战斗")

--			local clickX = random(2056,2221)

--			local clickY = random(804,947)

--			randomClick(clickX,clickY)


--			lastClickTime = time()
--		elseif dmMatch(revokeRealSnaake,70) then
			
--			formatLog("废物真蛇提示")
			
--			randomClick(168,403)
			
--			lastClickTime = time()
			
		else
		
			if  time() - lastClickTime > 80 then
				
				formatLog("60秒没有加入战斗")
				if time() - lastClickTime > 60 * 10 then
					
					lua_exit()
					
					lockDevice()
					
					while 1 do
						
						mSleep(9)
						
					end
					
				end
				
				local offsetTime = time() - lastClickTime
				--[[
				if offsetTime < 60 * 10 then
					
					formatLog("等待组队邀请")
					
					local startTime = time()

					while time() - startTime  < 5 do

						if   (isFrontApp(onmojiBid) ~= runingStatus) then
							
							formatLog("阴阳师不在前台运行了")
							
							runOnmoji()
							
						end

						if dmMatch(inviteTeamAuto,70) then

							formatLog("auto加入bear的队伍")

							randomClick(498,423)

							lastClickTime = time()

						elseif	dmMatch(inviteTeam,70) and dmFind(bearInvite,inviteRect,70) ~= -1 then

							formatLog("加入bear的队伍")

							randomClick(332,405)

							lastClickTime = time()

						end
					end	
				elseif offsetTime > 60 * 10 then
				
					snapshot("get_color_error_" .. tostring(os.time()) .. ".png" )
				
					formatLog("似乎取色异常了")
					
					lockDevice()
 
					lua_exit()
				end
			]]
			end
		end

		mSleep(200)

	end

end
	

--乘客模式
--循环检测是否战斗结束,战斗结束
--#define expForBattle 1806
function yuhunPassager()	
	
	--总共战斗场次
	local totalBattle = 0
	
	--上次点击时间
	local lastClickTime = time()
	
	--上次战斗时间
	local lastBattleTime = time()
	
	
	

	while 1 do 
		
--		local t = os.date("*t",time())
		
--		if t.hour > 6 then
			
--			lockDevice()
			
--			lua_exit()
--		end

		randomseed(time())
		
		commonCheck()
		

		if dmMatch(date.dm.realSnakeHUD,70) then
			
			mSleep(500)
			
			rectClick(date.rect.revokeRealSnakeHUDRect,30)
			
			mSleep(500)
			
		elseif  dmMatch(date.dm.battleOKDm,60)  or dmMatch(date.dm.battleOKExpDm,60) then

			--使用金币buff图案作为结束战斗信号
	
			formatLog("结束战斗")

			--随机一个地方
			while (dmMatch(date.dm.battleOKDm,60) or  dmMatch(date.dm.battleOKExpDm,60)) do
			
				rectClick(date.rect.battleOKRect,30)
				
				lastClickTime = time()
 
			end
			
			if time() - lastBattleTime > 10 then
			
				totalBattle = totalBattle + 1
			
				formatLog("第%d场魂十已完成",totalBattle)
			end
	
			lastBattleTime = time()
		elseif dmMatch(date.dm.inviteTeamDm,80) then
			
			formatLog("加入队伍")
			
			mSleep(500)
			
			--截图留念，知道该拉黑谁
			snapshot(time() .. "joinTeam" .. ".png",356, 381, 401, 444)
			
			rectClick(date.rect.inviteTeamReciveRect)
			
			mSleep(300)
			
			lastClickTime = time()
			
			
		elseif dmMatch(date.dm.inviteTeamAutoDm,80) then

			formatLog("auto加入队伍")

			rectClick(date.rect.inviteTeamAutoReciveRect)

			mSleep(500)
			
			lastClickTime = time()
			
		else
		
			if  time() - lastClickTime > 80 then
				
				formatLog("60秒没有加入战斗")
				if time() - lastClickTime > 60 * 10 then
					
					lua_exit()
					
					lockDevice()
					
					while 1 do
						
						mSleep(9)
						
					end
					
				end
				
				local offsetTime = time() - lastClickTime

			end
		end

		mSleep(200)

	end

end