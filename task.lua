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
	
elseif w == 1668 and h ==  2244 then
	
	date = require("iPdPro")
	
elseif w == 1536 and h == 2048 then
	
	date = require("iPad2")
	
elseif  w == 1242 and h ==    2208	 then
	
	date = require("iPhone6P")

else
	dialog(string.format("尺寸为%d&%d的设备暂时不支持",w,h),0)
	
	lua_exit()

end

local dm = date.dm

local rect = date.rect

local function commonCheck(callback)
	
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
					
					break
					
				end
			
			end
	
		end
	
	
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

				rectClick(date.rect.battleOKRect,30)

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
	
	name = "萤火虫",
	
	dateBegin = {month = 7,day = 14},
	
	dateEnd = {month = 7,day = 17}, 
	
	perDayTime = {9,20},
	
	location = {113.372203,23.103197}
	
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
