-- 阴阳师
-- iPhone6.lua  

-- Create By TouchSpriteStudio on 22:32:53   
-- Copyright © TouchSpriteStudio . All rights reserved.

local date = {}

date.dm = {}

date.rect = {}

local dmCenter = date.dm

local rectCenter = date.rect
--金币buff标志
dmCenter.normalBegin = {
	{  943,  508, 0xf3b25e},
	{  952,  507, 0xf3b25e},
	{  969,  505, 0x4a3d2b},
	{  962,  513, 0xd59d55},
	{  970,  517, 0x6d5535},
	{  998,  504, 0xf2b15e},
	{ 1003,  501, 0xf3b25e},
	{ 1009,  501, 0xf3b25e},
	{ 1010,  513, 0xd09a53},
	{  999,  528, 0xcd9852},
}

dmCenter.battleOKDm = {
	{  157,  683, 0xe1b869},
	{  158,  697, 0xe2c770},
	{  165,  698, 0xdbab4e},
	{  171,  683, 0xdba94d},
	{  170,  679, 0xe3ca75},
	{  176,  676, 0xd39040},
	{  183,  676, 0xcb8f44},
	{  185,  685, 0xc1853f},
	{  182,  700, 0xf0d00e},
	name = "金币buff"
}

dmCenter.battleOKExpDm = {
	{  165,  680, 0x2f7bb0},
	{  165,  683, 0x629eda},
	{  165,  686, 0x497cc3},
	{  165,  690, 0x4b7bc6},
	{  165,  692, 0x78a4dc},
	{  183,  692, 0xf7e720},
	{  183,  694, 0xf7e732},
	{  183,  698, 0xf7e31f},
	{  183,  701, 0xe29803},
	name = "经验buff"

}
--悬赏
dmCenter.rewardTaskDm = {
	{  875,  433, 0x51ac5c},
	{  894,  432, 0x62bb6c},
	{  901,  429, 0x5ab665},
	{  878,  529, 0xda6856},
	{  879,  550, 0xdf6f5c},
	{  904,  531, 0xde6d5a},
	name = "悬赏封印"
}
dmCenter.rewardLowLevelDm = {
	{  594,  482, 0x40445b},
	{  593,  499, 0x42437e},
	{  606,  535, 0x1e1f25},
	{  627,  531, 0x1e1e26},
	{  631,  520, 0x1f1f2c},
	{  652,  507, 0x36386c},
	name = "低级悬赏封印"
}
dmCenter.inviteTeamAutoDm = {
	{   34,  256, 0xd96755},
	{  132,  266, 0x57b361},
	{  145,  266, 0x63bc6d},
	{  157,  263, 0x5eb969},
	{   49,  260, 0xdf705e},
	{  225,  257, 0xedc791},
	{  237,  251, 0xcda467},
	{  255,  255, 0xd2a86c},
	{  250,  279, 0x5ab665},
	name = "自动加入队伍"
}
--邀请的弹窗
dmCenter.autoInviteDlgDm = {
	{  464,  320, 0xcbb59c},
	{  508,  261, 0xcbb59c},
	{  655,  260, 0xcbb59c},
	{  797,  254, 0xc7b198},
	{  897,  282, 0xcbb59c},
	{  843,  376, 0xcbb59c},
	{  671,  494, 0xc8b299},
	{  664,  440, 0xcbb59c},
	{  489,  459, 0xdf6851},
	{  867,  449, 0xf3b25e},
	name = "自动邀请弹窗"
}
--中间的勾
dmCenter.autoInviteDefaultDm = {
	{  580,  364, 0x4b5ee9},
	{  575,  380, 0x3441a0},
	{  583,  379, 0xfcfcfd},
	{  592,  381, 0x3846af},
	{  584,  365, 0x4b5ee9},
	{  843,  376, 0xcbb59c},
	{  671,  494, 0xc8b299},
	{  664,  440, 0xcbb59c},
	{  489,  459, 0xdf6851},
	{  867,  449, 0xf3b25e},
	name = "默认要求勾选"
}

dmCenter.yuhunBeginDm = {
	{  178,  121, 0xab3f18},
	{  189,  118, 0xc4b1a5},
	{  197,  124, 0xc7bdb4},
	{  214,  129, 0xc7bdb4},
	{  227,  129, 0xc7bdb4},
	{  235,  132, 0xc7bdb4},
	{  257,  123, 0x958e86},
	{  272,  123, 0xc1b7af},
	{  286,  125, 0x837c76},
	{  302,  125, 0xc7bdb4},
	{  826,  118, 0xd0c1ae},
	{  208,  630, 0xdf6851},
	{  227,  627, 0xa05140},
	{  262,  642, 0xdf6851},
	{ 1110,  633, 0x322c23},
	{ 1026,  631, 0xf3b25e},
	{ 1098,  644, 0xf3b25e},
	{ 1151,  636, 0xf3b25e},
	{ 1098,  632, 0x3b3226},
	name = "御魂10层开始界面"
}
dmCenter.over6000Dlg = {

	{  507,  382, 0xcbb59c},
	{  588,  347, 0xcbb59c},
	{  502,  463, 0xcbb59c},
	{  620,  431, 0xf3b25e},
	{  701,  428, 0xf3b25e},
	{  650,  445, 0xb5874b},
	{  689,  441, 0xb1844a},
	{  667,  324, 0xcbb59c},
	{  660,  493, 0xc5af96},


	name = "超过6000提示"
	
}
dmCenter.realSnakeHUD = {
	{   41,  256, 0xcf8b3e},
	{   32,  266, 0xcd8a3e},
	{   43,  280, 0xcb873b},
	{  120,  302, 0xddd2c9},
	{  251,  287, 0xa2929c},
	{  317,  320, 0x927a91},
	{  351,  295, 0x947b98},
	{  427,  286, 0x111412},
	{  411,  302, 0x1a682f},
	{  432,  267, 0x1be0bc},
	
	name = "真蛇提示"
}

rectCenter.revokeRealSnakeHUDRect = {14, 250, 60, 288}

rectCenter.battleOKRect =  {1135, 164, 1200, 728}

rectCenter.rewardTaskReciveRect  = { 868, 416, 915, 461}

rectCenter.rewardTaskCancelRect = { 869, 519, 916, 562}

rectCenter.inviteTeamAutoReciveRect = {221, 238, 273, 295}

rectCenter.autoInviteDefaultActiveRect = {576, 361, 598, 386}

rectCenter.autoInviteSendRect = {714, 433, 869, 470}

rectCenter.autoInviteCancelRect = {474, 429, 628, 474}

rectCenter.beginYuhunBattleRect  = {1012, 608, 1172, 646}

rectCenter.normalBeginRect = {954, 502, 1027, 534}

rectCenter.over6000DlgRect = { 625, 423, 703, 458 }

return date