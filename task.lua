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
	
elseif w == 1668 and h ==  2244 then
	
	date = require("iPdPro")
	
elseif w == 1536 and h == 2048 then
	
	date = require("iPad2")
	
else	
	dialog(string.format("尺寸为%d&%d的设备暂时不支持",w,h),0)
	
	lua_exit()

end

local function startOnmyoji(run_callback)
	
	
	runApp(onmojiBid)
	
	waitDm()
	
	
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

--[[

	重新打开阴阳师
	
	不建议处理每天第一次登陆的推送界面
	
	afterRun是在登陆后处理的函数

	

]]

function  runOnmyoji(afterRun)

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
	
--	waitDmWithCallBack(date.dm.beginGameNotifyDm,60,90,function()  toast("begin game notif",1) rectClick(date.rect.closeNotifyRect)  end)

----	while not  dmMatch(date.dm.beginGameNotifyDm) do

----		toast("loading page",1)

----		rectClick(date.rect.closeNotifyRect)


----		mSleep(300)

----	end
	
----	rectClick(date.rect.closeNotifyRect)

	
--	while  not dmMatch(date.dm.buffCenterDm) do

--		rectClick(date.rect.enterGameRect)

--		mSleep(300)


--	end

--	toast("Enter Game Success",1)

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
				
			toast("call back for toolbar appear",1)	
				
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

function inviteRecentGuy(...)
	
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
	
	mSleep(300)
	
	rectClick(date.rect.inviteGuySendRect)
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
			
			local begin_time = time()
			
			while (dmMatch(date.dm.battleOKDm,60) or  dmMatch(date.dm.battleOKExpDm,60))   do
				--for some special view
				if time() - begin_time > 5 then break end
			
				rectClick(date.rect.battleOKRect,30)
				
				lastClickTime = time()
 
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
	
	local noGuyTime = time()
	

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
		
			if  time() - lastClickTime > 120 then
				
				formatLog("60秒没有加入战斗")
				if time() - lastClickTime > 60 * 10 then
					
					lockDevice()
					
					lua_exit()
					
					while 1 do
						
						mSleep(9)
						
					end
					
				end
				else
				local offsetTime = time() - lastClickTime
				
				if   (isFrontApp(onmojiBid) ~= runingStatus) then
							
							formatLog("阴阳师不在前台运行了")
							
							runOnmyoji(makeTeam)
							
				end
				
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
			rectSnapShot(time() .. "joinTeam" .. ".png",date.rect.inviteTeamSnapshotRect)
			
			rectClick(date.rect.inviteTeamReciveRect)
			
			mSleep(300)
			
			lastClickTime = time()
			
			
		elseif dmMatch(date.dm.inviteTeamAutoDm,80) then

			formatLog("auto加入队伍")

			rectClick(date.rect.inviteTeamAutoReciveRect)

			mSleep(500)
			
			lastClickTime = time()
			
		else
		
			if  time() - lastClickTime > 120 then
				
				formatLog("60秒没有加入战斗")
				if time() - lastClickTime > 60 * 10 then
					
					lockDevice()
					
					lua_exit()
					
					while 1 do
						
						mSleep(9)
						
					end
					
				end
			else
				
				if   (isFrontApp(onmojiBid) ~= runingStatus) then
							
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

init(2)

debug = false

--mSleep(1000)

--slider(date.rect.heroChangeSliderBeginRect,450)

--mSleep(1000)

--rectToRect(date.rect.heroWillChangeForFirstRect, date.rect.heroRectForFirstRect)

--mSleep(1000)

--rectToRect(date.rect.heroWillChangeForSecondRect,date.rect.heroRectForSecondRect)

--mSleep(1000)

--rectToRect(date.rect.heroWillChangeForThirdRect,date.rect.heroRectForThirdRect)

--nLog(dmFind(date.dm.searchGhostBattleHeroBecame20,date.rect.heroCheckFirstRect,85))

--nLog(findMultiColorInRegionFuzzy( 0xf09319, "-2|7|0xf2b212,-1|16|0xfce605,5|14|0xeed008,5|10|0xfdca0c,7|7|0xefaf12,8|4|0xe99e15,10|5|0xffb114,11|6|0xeea913,12|9|0xf6bf0e", 90, 264, 202, 373, 419))

--rectDoubleClick(date.rect.heroChangeAllRect,50)

init(2)


--runOnmyoji()

--aa()
 
--makeTeam() 

--inviteRecentGuy()

--yuhunDriver()

--runOnmyoji()

--makeTeam()

--local x,y  = dmFind(date.dm.searchEnterDm,date.rect.searchEnterMayhownRect, 85)

--local wnd = debugWindos:create()


----x,y = findMultiColorInRegionFuzzy( 0xe1be90, "0|16|0xedd596,1|24|0xf4dfa0,-6|17|0xd5a574,7|37|0x0c080a,18|42|0xdaa584,30|29|0xebcb9e,15|19|0xfef3c8,11|19|0xfdf3bc,3|-6|0xdbaf87", 90, 661, 496, 722, 528)

--x,y = findMultiColorInRegionFuzzy( 0xe1be90, "0|16|0xedd596,1|24|0xf4dfa0,-6|17|0xd5a574,7|37|0x0c080a,18|42|0xdaa584,30|29|0xebcb9e,15|19|0xfef3c8,11|19|0xfdf3bc,3|-6|0xdbaf87", 90, 413, 69, 979, 238)

--if x ~= -1 then
--	wnd:showPoint(x,y)
	
--	formatLog("search enter is (%d,%d)",x,y)
	
--	click(x,y)
	
--else
--	toast("not found",1)
--end

--mSleep(3000)

--runOnmyoji()

--waitDmWithCallBack(date.dm.beginGameNotifyDm,60,90,function (...)
--		toast("1111111111111",1)
--	end)

--searchGhostPassager()

 

--closeApp(onmojiBid)

--mSleep(2000)

--runOnmyoji(makeTeam)


--makeTeam()

--inviteRecentGuy()
--mSleep(3000)

--inviteRecentGuy()