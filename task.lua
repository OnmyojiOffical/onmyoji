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
local onmyojiBid =  "com.netease.onmyoji"
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


local constManager = {}


constManager.serverStartTime = time()

--local deviceInfo = require("TSDevice")

local defaltConfig = {
	
	--
	rewardRecive =  rewardReciveHigh,
	
	
	loopTime = loopTime
	
	
	
	
	
}

if w == 750 and h == 1334 then
	
	date = require("iPhone6")
	
	is6Screen = true

elseif w == 640 and h == 1136 then
	
	date = require("iPhone5")
	
	is5Screen = true
	
elseif w == 1125 and h == 2436 then
	
	date = require("iPhoneX")
	
	isXScreen = true
	
elseif w == 1668 and h ==  2244 then
	
	date = require("iPdPro")
	
	isPadProScreen = true
	
elseif w == 1536 and h == 2048 then
	
	date = require("iPad2")
	
	isPadScreen = true
	
elseif  w == 1242 and h ==    2208	 then
	
	date = require("iPhone6P")
	
	is6PlusScreen = true

else
	dialog(string.format("尺寸为%d&%d的设备暂时不支持",w,h),0)
	
	lua_exit()

end

local dm = date.dm

local rect = date.rect

local nullEvent = 0

local rewardTaskEvent = 1

local over6000DlgEvent = 2

local lostNetworkEvent = 3


local function commonCheck(callback)
	
	local config = globalConfig or  defaltConfig
	
	if config.enableTimer then
		
		
		if time() - constManager.serverStartTime > config.timer then
			
			
			formatLog("因为定时原因结束脚本")
			
			lockDevice()
			
			lua_exit()
			
			
		end
		
		
	end
	
	
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
			
				return rewardTaskEvent
			
			end

	elseif  dmMatch(date.dm.over6000Dlg,70) then
			
			mSleep(500)
			
			rectClick(date.rect.over6000DlgRect,30)
			
			mSleep(100)
			
			return over6000DlgEvent
		
	elseif dmMatch(date.dm.tryConnectDm,70) then
	
	
		local begin_time = time()
	
		while (true) do
	
			if dmMatch(date.dm.tryConnectDm,70) then
				
				if time() - begin_time > 60 * 3 then
					
					formatLog("持续丢失网络连接")
					
					closeApp(onmyojiBid)
					
					mSleep(2000)
					
					return runOnmyoji(callback)
				end
				
				
			elseif dmMatch(date.dm.lostConnetDm,70) then
				
				
					formatLog("已经丢失网络连接")
				
				
					closeApp(onmyojiBid)
					
					mSleep(2000)
					
					runOnmyoji(callback)
				
				break
			
			elseif dmMatch(date.dm.finishBattleWhenOutlineDm) then
			
			
				formatLog("离线期间战斗已结束")
				
					closeApp(onmyojiBid)
					
					mSleep(2000)
					
					runOnmyoji(callback)
				
			
			
			else 
			
				mSleep(1000)
				
				if not (dmMatch(date.dm.tryConnectDm) or dmMatch(date.lostConnetDm)) then
					
					
					formatLog("恢复正常了")
					--恢复正常了
					
					return lostNetworkEvent
					
					
					
				end
			
			end
	
		end
	
	else
	
		return nullEvent
	
	end
	
end

--[[

	重新打开阴阳师
	
	不建议处理每天第一次登陆的推送界面
	
	afterRun是在登陆后处理的函数

	

]]

function  runOnmyoji(afterRun)


	formatLog("打开阴阳师")

	local bid = "com.netease.onmyoji"

	--closeApp(bid)


	runApp(bid)

	mSleep(3000)

	setDeviceOrient(2)


	local begin_time = time()
	
	while 1 do
		
		if dmMatch(date.dm.beginGameNotifyDm) then
			
			
			rectClick(date.rect.closeNotifyRect)
			
		elseif dmMatch(date.dm.enterGameDm) then
			
			rectClick(date.rect.enterGameRect)
			
		elseif dmMatch(date.dm.buffCenterDm) then
		
			break
		else
		
			rectClick(date.rect.enterGameRect)
		
		end
	
	
		mSleep(300)
		
		if time() - begin_time > 5 * 60 then closeApp(bid) return runOnmyoji(afterRun) end
		
	end
	

	waitDmWithCallBack(date.dm.gameInnerNotifyDm,10,90,function (...)  toast("游戏内活动",1) rectClick(date.rect.gameInnerNotifyRect) mSleep(2000) rectClick(date.rect.normalHomeRect) end)


	toast("进入游戏成功",1)
	
	
	
	if afterRun then
		
		mSleep(5 * 1000)
		
		pcall(afterRun)
		
	end

end

TEAM_TYPE_YUHUN = 1

TEAM_TYPE_JUEXING = 2

local hashForTeam = {date.rect.searchToolBarYuhunRect,date.rect.searchToolBarJuexingRect}

local hashForView = {date.dm.yuhunMainViewDm}
--[[

	重建队伍
	
	分为御魂和觉醒 不过应该没人跑去刷觉醒

	应该没有刷魂8的需求。默认魂十咯。

]]


function makeTeam(teamType)


	formatLog("创建队伍:%s",teamType == TEAM_TYPE_YUHUN and "御魂" or "觉醒")

	teamType = teamType or TEAM_TYPE_YUHUN

--	local x,y  = dmFind(date.dm.searchEnterDm,date.rect.searchEnterMayhownRect, 85)
	
--	local begin_time = time()
	
--	while x ~= -1 do
		
--		x,y  = dmFind(date.dm.searchEnterDm,date.rect.searchEnterMayhownRect, 85)
		
--		mSleep(100)
		
--		if time() - begin_time > 5 then break end
--	end
	
	
--	if x ~= -1 then
		
		rectClick(date.rect.searchEnterRect)
		
		mSleep(2000)
		
		waitDmWithCallBack(date.dm.searchToolBarDm,30,90,function()  
				
			formatLog("探索工具栏出现")	
				
			mSleep(3000)	
				
			rectClick(hashForTeam[teamType])
				
			mSleep(300)
			
			waitDmWithCallBack(hashForView[teamType],30,90,function()
					
					toast("call back for snake view",1)
					
					if teamType == TEAM_TYPE_YUHUN then
					
						rectClick(date.rect.yuhunSnakeEnterRect)
						
						mSleep(1000)
						
						rectClick(date.rect.yuhunTeamRect)
						
						mSleep(2000)
						
						rectClick(date.rect.yuhunMakeTeamRect)
						
						mSleep(1000)
						
						rectClick(date.rect.yuhunTeamConfigPrivateRect)
						
						mSleep(500)
						
						rectClick(date.rect.yuhunTeamCreateRect)
						
					else
						
					end
				end)
			
		end)
--	else	
		
--		toast("not found  search view",1)
		
--	end

end

--[[

	找到并邀请上次的队友


]]

function inviteRecentGuy(...)
	
	
	formatLog("邀请最近队友")
	
	mSleep(1000)
	
	rectClick(date.rect.inviteFirstTeamGuyRect)
	
	while dmMatch(date.dm.inviteGuyRefreshViewDm) do
		
		mSleep(500)
		
	end
	
	mSleep(1000)
	
	rectClick(date.rect.inviteGuyRecentRect)
	
	while dmMatch(date.dm.inviteGuyRefreshViewDm) do
		
		mSleep(500)
		
	end
	
	mSleep(500)
	
	rectClick(date.rect.firstGuyRect)
	
	mSleep(1000)
	
	rectClick(date.rect.inviteGuySendRect)
end


--[[


	--单人御魂功能
	
	--为某个憨憨添加的功能.并不建议使用



]]

function goYuhunView()
	
	rectClick(date.rect.searchEnterRect)
		
		mSleep(2000)
		
		waitDmWithCallBack(date.dm.searchToolBarDm,30,90,function()  
				
			formatLog("探索工具栏出现")	
				
			mSleep(3000)	
				
			rectClick(hashForTeam[teamType])
				
			mSleep(300)
			
			waitDmWithCallBack(hashForView[TEAM_TYPE_YUHUN],30,90,function()
					
					toast("御魂主界面出现",1)
					
					rectClick(date.rect.yuhunSnakeEnterRect)
						
					mSleep(1000)

				end)
			
		end)
	
end


function singleYuhunBattle(loopMax)

	local battleRecord = 0

	local lastClickTime = time()

	while 1  do

		if battleRecord > loopMax then 


			formatLog("已经完成了:%s场，任务结束")

			lockDevice()	

			lua_exit()

		end

		randomseed(time())

		commonCheck()

		if dmMatch(date.dm.normalBegin,70) then

			mSleep(500)

			rectClick(date.rect.normalBeginRect,30)

			mSleep(500)

			formatLog("即将开始战斗")

			lastClickTime = time()

			battleRecord = battleRecord + 1

		elseif  dmMatch(date.dm.battleOKDm,70) or dmMatch(date.dm.battleOKExpDm,70)  then

			local begin_time = time()

			while (dmMatch(date.dm.battleOKDm,60) or  dmMatch(date.dm.battleOKExpDm,60)) and not dmMatch(date.dm.over6000Dlg)  do
				--for some special view

				formatLog("战斗结束")

				if time() - begin_time > 5 then break end

				rectClick(date.rect.battleOKRect,30)

				lastClickTime = time()

			end


		else
			if  time() - lastClickTime > 120 then

				formatLog("60秒没有匹配到任何视图")

				if time() - lastClickTime > 60 * 10 then


					formatLog("10分钟没有任何行为,结束脚本")

					snapshot("error_unknow_view_" .. tostring(os.time()) .. ".png" )


					lockDevice()

					lua_exit()

					while 1 do

						mSleep(9)

					end

				end
			else
				local offsetTime = time() - lastClickTime

				if   (isFrontApp(onmyojiBid) ~= runingStatus) then

					formatLog("阴阳师不在前台运行了")
					
					runOnmyoji(goYuhunView)

				end

			end

		end

	end
end


function normalBattle(loopMax)

	local battleRecord = 0

	local lastClickTime = time()

	while 1 do 

		if battleRecord > loopMax then 
			
			
			formatLog("已经完成了:%s场，任务结束")
			
			lockDevice()	
			
			lua_exit()
			
		end

		randomseed(time())

		commonCheck()

		if dmMatch(date.dm.normalBegin,70) then

			mSleep(500)

			rectClick(date.rect.normalBeginRect,30)

			mSleep(500)

			formatLog("即将开始战斗")

			lastClickTime = time()

			battleRecord = battleRecord + 1

		elseif  dmMatch(date.dm.battleOKDm,70) or dmMatch(date.dm.battleOKExpDm,70)  then
			
			local begin_time = time()
			
			while (dmMatch(date.dm.battleOKDm,60) or  dmMatch(date.dm.battleOKExpDm,60))   do
				--for some special view
				
				formatLog("战斗结束")
				
				if time() - begin_time > 5 then break end
			
				rectClick(date.rect.battleOKRect,30)
				
				lastClickTime = time()
 
			end


		else
			if math.abs(lastClickTime - time()) > 60 * 5 then


				formatLog("5分钟未能结束战斗")

				snapshot("error_unknown_view:" .. tostring(time()) .. ".png")

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

	local noGuyTime = time()


	while 1 do 
		
		

		

--		local t = os.date("*t",time())

--		if t.hour > 6 then

--			lockDevice()

--			lua_exit()
--		end

		randomseed(time())

		commonCheck(makeTeam)

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

			while ((dmMatch(date.dm.battleOKDm,60) or  dmMatch(date.dm.battleOKExpDm,60)) )  and (not dmMatch(date.dm.over6000Dlg)) do
				--for some special view
				if time() - begin_time > 5 then break end

				rectClickEx(date.rect.battleOKRectSet,30)

				mSleep(500)

				lastClickTime = time()

			end

			if time() - lastBattleTime > 10 then

				totalBattle = totalBattle + 1

				formatLog("第%d场魂十已完成",totalBattle)
			end

			lastBattleTime = time()

			noGuyTime = time()

		elseif dmMatch(date.dm.yuhunBeginWithOutGuyDm) then

			formatLog("无队友开始界面")

			if time() - noGuyTime > 60 then

				formatLog("60秒无队友")

				inviteRecentGuy()

				noGuyTime = time()
			end

			mSleep(300)

		elseif dmMatch(date.dm.yuhunBeginDm) then

			mSleep(300)

			rectClick(date.rect.beginYuhunBattleRect)

			mSleep(500)
		else

			if  time() - lastClickTime > 120 then

				formatLog("60秒没有加入战斗")

				if time() - lastClickTime > 60 * 10 then


					formatLog("10分钟没有任何行为,结束脚本")

					snapshot("error_unknow_view_" .. tostring(os.time()) .. ".png" )


					lockDevice()

					lua_exit()

					while 1 do

						mSleep(9)

					end

				end
			else
				local offsetTime = time() - lastClickTime

				if   (isFrontApp(onmyojiBid) ~= runingStatus) then

					formatLog("阴阳师不在前台运行了")

					runOnmyoji(makeTeam)

				end

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
	
	local isPad =  (2 == getDeviceType())
	

	while 1 do 
		
--		local t = os.date("*t",time())
		
--		if t.hour > 6 then
			
--			lockDevice()
			
--			lua_exit()
--		end

		randomseed(time())
		
		
		--mofidy for ipad over6000Dlg
		
		local event =  commonCheck()

		if isPad then

			--提前处理结束事件,continue掉循环

			if event == over6000DlgEvent then

				--使用金币buff图案作为结束战斗信号

				formatLog("结束战斗")

				local begin_time = time()

				while ((dmMatch(date.dm.battleOKDm,60) or  dmMatch(date.dm.battleOKExpDm,60)) )  and (not dmMatch(date.dm.over6000Dlg)) do
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

			end
		end

		if dmMatch(date.dm.realSnakeHUD,70) then
			
			mSleep(500)
			
			rectClick(date.rect.revokeRealSnakeHUDRect,30)
			
			mSleep(500)
			
		elseif  dmMatch(date.dm.battleOKDm,60)  or dmMatch(date.dm.battleOKExpDm,60) then

			if isPad then
				
				
				
				local event = commonCheck()
				
				formatLog("iPad调用了通用检测")
				
				
			end
			--使用金币buff图案作为结束战斗信号
	
			formatLog("结束战斗")

			local begin_time = time()
			
			while ((dmMatch(date.dm.battleOKDm,60) or  dmMatch(date.dm.battleOKExpDm,60)) )  and (not dmMatch(date.dm.over6000Dlg)) do
				--for some special view
				if time() - begin_time > 5 then break end
			
				rectClickEx(date.rect.battleOKRectSet,30)
				
				mSleep(500)
				
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
			rectSnapShot(time() .. "joinTeam" .. ".png",date.rect.inviteTeamSnapshotRect)
			
			rectClick(date.rect.inviteTeamReciveRect)
			
			mSleep(300)
			
			lastClickTime = time()
		elseif dmMatch(date.dm.inviteTeamAutoDmNew,70) then
			
			formatLog("超鬼王时集结")
			
			mSleep(500)
			
			rectClick(date.rect.inviteTeamReciveRectNew)
			
			mSleep(300)
			
		elseif dmMatch(date.dm.inviteTeamAutoDm,80) then

			formatLog("auto加入队伍")

			rectClick(date.rect.inviteTeamAutoReciveRect)

			mSleep(500)
			
			lastClickTime = time()
		
	elseif dmMatch(date.dm.inviteTeamAutoDmNew,80) then
		
			formatLog("超鬼王出现时auto加入队伍")

			rectClick(date.rect.inviteTeamAutoReciveRectNew)

			mSleep(500)
			
			lastClickTime = time()
		
		else
		
			if  time() - lastClickTime > 120 then
				
				formatLog("60秒没有加入战斗")
				
				if time() - lastClickTime > 60 * 10 then
					
					snapshot("error_unknow_view_" .. tostring(os.time()) .. ".png" )
					
					lockDevice()
					
					
					lua_exit()
					
					while 1 do
						
						mSleep(9)
						
					end
					
				end
			else
				
				if   (isFrontApp(onmyojiBid) ~= runingStatus) then
							
					formatLog("阴阳师不在前台运行了")
							
					runOnmyoji()
					
					lastClickTime = time()
							
				end
				
				local offsetTime = time() - lastClickTime

			end
		end

		mSleep(200)

	end

end
--探索乘客模式
--[[

	基本思路是按照头像框的显示级数区域确定两个人是不是在如果不在退出副本
	
	


]]

local function checkHero(dm,rect,degre)
	
	local x,y = dmFind(dm,rect,degre)
	
	--formatLog("check hero (%d,%d)",x,y)
	
	if x ~=  -1 then
		
		
		
		return true
	
	else	
	
		return false
	end
	
end


function searchGhostPassager()

	--战斗完成数量
	local battleRecord = 0

	--上次点击时间
	local lastClickTime =0
	
	local lastBattleTime = time()

	--等待时间
	local waitTime = 0

	local config = globalConfig or  {heroCheckFirst = true,heroCheckSecond =true,heroCheckThird = true}


	while 1 do


		commonCheck()

		mSleep(200)


		if dmMatch(date.dm.searchGhostInvite25Dm,80) then

			mSleep(100)

			rectClick(date.rect.searchGhostInvite25ReciveRect)

			mSleep(200)

		elseif  dmMatch(date.dm.searchGhostWaitBattleDm,80) then

			waitTime = waitTime + 1

		elseif dmMatch(date.dm.searchGhostBattlePrepareDm,80) then

			toast("准备战斗",1)

			formatLog("准备战斗")

			local  firstNeedChange = false

			local secondNeedChange = false

			local thirdNeedChange = false

			if config.heroCheckFirst then

				firstNeedChange =  checkHero(date.dm.searchGhostBattleHeroBecame20,date.rect.heroCheckFirstRect)

				formatLog("1位需要换狗粮:%s",tostring(firstNeedChange))
			end

			if config.heroCheckSecond then

				secondNeedChange = checkHero(date.dm.searchGhostBattleHeroBecame20,date.rect.heroCheckSecondRect)
	
				formatLog("2位需要换狗粮:%s",tostring(secondNeedChange))
			end

			if config.heroCheckThird then

				thirdNeedChange = checkHero(date.dm.searchGhostBattleHeroBecame20,date.rect.heroCheckThirdRect)

				formatLog("3位需要换狗粮:%s",tostring(thirdNeedChange))
			end
			--更换式神逻辑
			if firstNeedChange or secondNeedChange or thirdNeedChange then

				formatLog("logic begin")

				rectDoubleClick(date.rect.heroChangeAllRect,50)
	
				formatLog("wait all dm:%s",waitDm(date.dm.changeHeroAll,2,99))

				mSleep(1000)

				toast("will click all")

				rectClick(date.rect.heroChangeAllRect,60)

				mSleep(500)

				--waitDm(date.dm.changeHeroNCard,2)

				rectClick(date.rect.heroChangeNRect)

				mSleep(1000)

				slider(date.rect.heroChangeSliderBeginRect,450)
				
				mSleep(1000)

				if firstNeedChange then

					rectToRect(date.rect.heroWillChangeForFirstRect, date.rect.heroRectForFirstRect)

					mSleep(500)

				end

				if secondNeedChange then

					rectToRect(date.rect.heroWillChangeForSecondRect,date.rect.heroRectForSecondRect)

					mSleep(500)
				end

				if thirdNeedChange then

					rectToRect(date.rect.heroWillChangeForThirdRect,date.rect.heroRectForThirdRect)

					mSleep(500)
				end



			end

			mSleep(300)

			rectClick(date.rect.prepareBattleRect)
		
		
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
			
			if time() - lastBattleTime > 5 then
			
				battleRecord = battleRecord + 1
			
				formatLog("第%d场狗粮已完成",battleRecord)
			end
	
			lastBattleTime = time()
		end
	
	
	
	end -- end for while


end



--[[

	userUtils Model
	
	
	fakeGps available user goto LBS ghost 


]]

local locations = {
	
	{ name = "北京" ,39.26,115.25,41.03,117.30 },
	
	{ name = "上海" ,30.40,120,51,31.53,122.12},
	
	{ name = "深圳" ,22.32,113.46,22.52,114.37}
	
}

local currentLBSGhost = {
	
	name = "BML&BW",
	
	dateBegin = {month = 7,day = 20},
	
	dateEnd = {month = 7,day = 22}, 
	
	perDayTime = {9,23},
	
	location = {121.496502,31.188396}
	
}


function godWalkToLBS()
	
	
	--local t = os.date("*t")
	
	local seed = os.time() % math.random(100) + string.byte(getDeviceID(),1,10)
	
	math.randomseed(seed)
	
	local offset = math.random(10,80)
	
	local location = currentLBSGhost.location
	
	local gps_x = location[1] + offset/1000000
	
	local gps_y = location[2] + offset/1000000
	
	toast(format("当前LBS:%s\n时间:%d月%d号-%d月%d号 每天:(%d-%d)\n这次前往坐标:(%f N,%f E)",
			
			currentLBSGhost.name,
			
			currentLBSGhost.dateBegin.month,
			
			currentLBSGhost.dateBegin.day,
			
			currentLBSGhost.dateEnd.month,
			
			currentLBSGhost.dateEnd.day,
			
			currentLBSGhost.perDayTime[1],
			
			currentLBSGhost.perDayTime[2],
			
			gps_x,
			
			gps_y),3)

	fakeGPS(gps_x,gps_y)	
	
end

function godWalkToSuperCity()
	
	
	local cityIndex = random(1,#locations)
	
	local city = locations[cityIndex]
	
	local offset = math.random(10,80)
	
	local latitude = random(city[1],city[3]) + offset/1000000
	
	local longitude = random(city[2],city[4]) + offset/1000000
	
	toastf("Go to %s ,Current gps is (%f N,%f E)",city.name or "未知城市",latitude,longitude)
	
	fakeGPS(longitude,latitude)
	
	
	
end


function godWalk()


	local ret = dialogRet("去哪里呢?","哪也不去", "当前漫展地点", "任意大城市",0)

	if ret == 0 then return end
	
	if ret == 1 then godWalkToLBS() end
	
	if ret == 2 then godWalkToSuperCity() end
	

end

--[[

	抽取厕纸


]]



function  drawBrokenCard(num)
	
	num = num or 0
	
	if num == 0 then num = 9999 end
	
	local currentDrawn = 0
	
	local lastGoDrawnTime = time()
	
	local mayNoCard = 0
	
	while 1 do
		
		commonCheck()
		
		if dmMatch(dm.goDrawnDm) then
	
	
			if ( time() - lastGoDrawnTime < 2 )then
					
				mayNoCard = mayNoCard + 1
				
			else
				
				lastGoDrawnTime = time()
				
				mayNoCard = 0
				
			end
	
			if mayNoCard > 10 then 
				
				toast("可能无卡可抽了",1)
				
				return
			end
			
			rectClick(rect.goDrawnRect)
			
			mSleep(1000)
	
		elseif dmMatch(dm.brokenCardOneDm) then
			
			rectClick(rect.brokenCardOneRect)
	
			mSleep(300)
			
			currentDrawn = currentDrawn + 1
			
		elseif dmMatch(dm.brokenCardTwoDm) then
			
			rectClick(rect.brokenCardTwoRect)
			
			mSleep(300)
			
			currentDrawn = currentDrawn + 1
			
		elseif dmMatch(dm.brokenCardThreeDm) then
			
			rectClick(rect.brokenCardThreeRect)
			
			mSleep(300)
			
			currentDrawn = currentDrawn + 1
			
		elseif dmMatch(dm.brokenCardFourDm) then
			
			rectClick(rect.brokenCardFourRect)
			
			mSleep(300)
			
			currentDrawn = currentDrawn + 1
			
			
		elseif dmMatch(dm.brokenCardFiveDm) then
			
			rectClick(rect.brokenCardFiveRect)
			
			mSleep(300)
			
			currentDrawn = currentDrawn + 1
			
		
		elseif dmMatch(dm.continueDrawDm) and (currentDrawn < num) then
		
			rectClick(rect.continueDrawRect)
			
			mSleep(1000)
		
		
		elseif dmMatch(dm.cancelDrawDm) and ((currentDrawn > num)  or  (not dmMatch(dm.continueDrawDm)))  then
		

			rectClick(rect.cancelDrawRect)

			mSleep(500)

		end
		
	
		
	end
	
end

--[[

	升级狗粮


]]



function upLevelCard(count)
	
	count = count or 50
	
	
	confirm_send = false
	
	while 1 do
	
	if count == 0 then
		
		toast("完成",1)
		
		vibrator()
		
		return 
		
	end
	
	if dmMatch(date.dm.continueButtonDm) then
		
		if confirm_send then
			
			count = count - 1 
			
			confirm_send = false
			
		end
		
		formatLog("继续")
		
		mSleep(500)
		
		rectClick(date.rect.continueButtonRect)
		
	elseif dmMatch(date.dm.confirmButtonDm) then
		
		confirm_send = true
		
		formatLog("确认")
		
		mSleep(500)
		
		
		rectClick(date.rect.confirmButtonRect)
	
		
		mSleep(500)
	
	elseif dmMatch(skillUpDm) then
	
		formatLog("技能提升")
	
		mSleep(500)
	
		rectClick(date.rect.skillUpRect)
	
	
	end
	
	mSleep(300)
	
	
end
	
	
	
end


--[[

	结界突破功能
	
	@uiinterface 
	
		unsigned char   config.homeBreakOutFaileRetryTime  战斗失败后再尝试的次数
		
		enum  homeBreakOutMode  
		
		ThreeRefreshModel  打三个刷新等cd
		
		NextIfFailAutomatic    打不过刷新
		
		NextIfRetryOut    尝试很多遍都打不过的孤儿，记录一下孤儿阵容
		
		enum homeBreakOutTeam
		
		AlawayCurrentTeam 永远是当前的队伍
		 
		ChangeWithRetryTime  每次尝试从预设换人
		
		unsigned char  config.homeBreakOutTime  打多少张卷
		
		
		


]]

--[[

	1  2  3 
	
	4  5  6

	7  8  9
	
	
	识别方法
	
	先判定是不是被攻破了 如果是的话跳过这个 否则进入如下判断
	
	
	反序读取勋章。直至有勋章为止，得知其勋章数量，进行决策
	
	每一个缩略图都是可以从顶点计算出来的
	
	定义数据  
	
	homeBreakOutViewBasePoint (int x, int y) 结界突破视图第一个格的左上角坐标
	
	homeBreakOutViewThumbnailFrame (int width,int heigh) 结界突破每个所旅途大小
	
	homeBreakOutViewModelFrame(int x,int y ,int width,int heigh) 勋章界面相对于父视图的框架大小
	
	homeBreakOutZoomViewBattleButtonFrame(int x,int,y,int width,int heigh) 放大视图中挑战按钮的位置
	
	homeBreakOutViewRreshButton 刷新按钮
	
	homeBrekaOutViewStatusBrokenDm 已经打通过的结界
	
	homeBreakOutViewStatusFailedDm  被弟弟锤了
	
	homeBreakOutViewStatusViewNormalDm  没挑战过
	
]]

local breakOutViewData = {
	
	subviews = {},
	
	currentBattleIndex  = 1
	
	
}

local homeBreakOutStatusNormal = 1

local homeBreakOutStatusFailed = 2

local homeBreakOutStatusBroken = 3

local homeBreakOutStatusUnknown = 4

local statusHumanReadableStringMap = {
	
	"未挑战过",
	
	"挑战失败",
	
	"已经突破",
	
	"未知"
	

}

local function realDmMaker(dm,point)
	
	local temp = {}
	
	for i,v in ipairs(dm) do
		
		temp[i] = {v[1] + point.x ,v[2]+ point.y,v[3]}
		
	end
	
	temp.name = dm.name
	
	return temp
end


local function realRectMaker(rect,point)

	return  {rect[1] + point.x,rect[2]+point.y,rect[3]+point.x,rect[4]+point.y}

end
function refreshData()
	
	
	
	if dmMatch(date.dm.homeBreakOutViewDm) then
		
		
		local basePoint = date.point.homeBreakOutViewBasePoint
		
		--local frame = date.frame.homeBreakOutViewThumbnailFrame
		
		--local modelFrame = date.frame.homeBreakOutViewModelFrame
		
		local offsetX = date.const.homeBreakOutCardOffsetX
		
		local offsetY = date.const.homeBreakOutCardOffsetY
		
		local modelBasePoint = date.point.modelBasePoint
		
		--build subviews
		
		local index = 1
		
		for row = 1,3 do
			
			for col = 1,3 do
		
				local viewBasePoint = {x = basePoint.x + (col -1 )* offsetX,y=basePoint.y + (row - 1)* offsetY}
		
				breakOutViewData.subviews[index] = {}
				
				local view = breakOutViewData.subviews[index]
				
				--从右往左扫描
				
				local currentModelNum = 0
				
				local status 
				
				for i = 5,1,-1 do
					
					local x = modelBasePoint.x + viewBasePoint.x + (i-1)* date.const.modelOffsetX
					
					local y = modelBasePoint.y + viewBasePoint.y 
					
					if  isColor(x,y,modelBasePoint.color,90) then
						
						--ideFormatLog("(%d,%d)个结界的第%d为勋章",row,col,i)
						
						currentModelNum = i
						
						break
					else
					
						--ideFormatLog("%d,%d,%#x",x,y,getColor(x, y))
					
						--ideFormatLog("(%d,%d)个结界的第%d不为勋章",row,col,i)
					end
					
				end
				
				if dmDynamicMatch(date.dm.homeBreakOutViewStatusViewNormalDm,viewBasePoint,70) then
					
					--ideFormatLog("(%d,%d)个结界未挑战过",row,col)
					
					status = homeBreakOutStatusNormal
					
				elseif dmDynamicMatch(date.dm.homeBreakOutViewStatusFailedDm,viewBasePoint,70) then
				
					--ideFormatLog("(%d,%d)个结界挑战失败状态",row,col)
				
					status = homeBreakOutStatusFailed
				
				elseif dmDynamicMatch(date.dm.homeBrekaOutViewStatusBrokenDm,viewBasePoint,70) then
			
					--ideFormatLog("(%d,%d)个结界已经突破",row,col)
			
					status = homeBreakOutStatusBroken
			
				else
		
					--ideFormatLog("(%d,%d)个结界状态未知",row,col)
		
					status = homeBreakOutStatusUnknown
		
				end
		
				view.status = status
		
				view.modelNum = currentModelNum
				
				view.zoomRect = realRectMaker(date.rect.baseZoomRect,viewBasePoint)
				
				view.challengeButtonRect = realRectMaker(date.rect.baseChallengeButtonRect,viewBasePoint)
				
				view.challengeButtonDm = realDmMaker(date.dm.baseChallengeButtonDm,viewBasePoint)
				
				formatLog("(%d,%d)个结界.勋章数:%d 当前状态:%s",row,col,currentModelNum,statusHumanReadableStringMap[status])
		
				--local challengeButtonRect = view.challengeButtonRect
		
				--formatLog("(%d,%d)个结界.挑战按钮:{%d,%d,%d,%d}",row,col,challengeButtonRect[1],challengeButtonRect[2],challengeButtonRect[3],challengeButtonRect[4])
		
				index = index + 1
			end
		
		end
	
	else
	
	
		toast("当前不是突破视图",3)
	
		formatLog("不是结界突破视图")
		
		
	
	end
	
	
	
end

function exitBattle()
	
	rectClick(date.rect.exitBattleButtonRect)
	
	
	waitDm(date.dm.exitBattleDlgDm,3)
	
	
	rectClick(date.rect.exitBattleConfirmRect)
	
	
end


 function homeBreakOutWithTryAgain(count)

	::newBreakPage::
	
	ideFormatLog("++++++++++")
	
	refreshData()
	


	for i = 1,9 do
		
		if count <=0 then break end

		local currentCard = breakOutViewData.subviews[i]

		--如果没挑战过
		if (currentCard.status == homeBreakOutStatusNormal ) then
			
			local retryTime = globalConfig.homeBreakOutFaileRetryTime or 0
			
			::battleBegin::

			rectClick(currentCard.zoomRect)

			mSleep(1000)
			
			while not  dmMatch(currentCard.challengeButtonDm) do
	
				rectClick(currentCard.zoomRect)
	
				mSleep(500)
	
				commonCheck()
	
			end
			
			rectClick(currentCard.challengeButtonRect)
			
			local enterBattleTime = time()
			
			
			
			while 1 do
			
				if (time() - enterBattleTime > 60 * 3) then
				 
					exitBattle()
				
					formatLog("3分钟没打过，退出得了")
				
				end
			
				commonCheck()
				
				if dmMatch(date.dm.battleOKDm) or dmMatch(date.dm.battleOKExpDm) then
					
					
					
					if dmMatch(date.dm.homeBreakOutFailDm) then
						
						formatLog("突破失败")
						
						mSleep(1000)
						
						currentCard.status = homeBreakOutStatusFailed
						
						rectClick(date.rect.battleOKRect)
						
						waitDm(date.dm.homeBreakOutViewDm,5)
						
						if retryTime > 0 then
						
						
							retryTime = retryTime -1  
							
							formatLog("还有尝试次数,继续挑战一次")
							
							goto battleBegin
						else
							
							break
						
						end
					elseif dmMatch(date.dm.homeBreakOutSuccessDm) then
						
						formatLog("突破成功")
						
						count = count - 1
						
						currentCard.status = homeBreakOutStatusBroken
						
						rectClick(date.rect.battleOKRect)
						
						mSleep(2000)
						
						break
						
					end
					
					
					
				end
				
			
			end
		else

			formatLog("%s个突破不是未挑战过得状态,跳过",i)

		end
	
		--mSleep(1000)
		
		local begin_time = time()
		
		while not dmMatch(date.dm.homeBreakOutViewLightDm) do
	
			rectClick(date.rect.receiveHomeBreakOutNormalReward)
			
			mSleep(200)
			
			commonCheck()
	
		end
	
	end
	
	local thisPageBrokenCount = 0
	
	for i,v in ipairs(breakOutViewData.subviews) do
		
		if v.stauts == homeBreakOutStatusBroken then
			
			thisPageBrokenCount = thisPageBrokenCount + 1
		
		end
	end
	
	formatLog("本页面突破成功:%d次,需要刷新:%s,还剩余:%d次",thisPageBrokenCount,tostring(thisPageBrokenCount ~= 9), count)
	
	if thisPageBrokenCount ~= 9 then
		
		rectClick(date.rect.refreshHomeBreakOutViewButtonRect)
		
		waitDm(date.dm.refreshHomeBreakOutViewDlgDm)
		
		rectClick(date.rect.refreshHomeBreakOutViewButtonConfirmButtonRect)
		
		mSleep(2000)
		
	end
	
	if count > 0 then 
		
		formatLog("尝试跳跃至刷新")
		
		goto newBreakPage 
		
	end

end
local function homeBreakOut(count,model)
	
	
	
end