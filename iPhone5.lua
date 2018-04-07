-- 阴阳师
-- iPhone5.lua  

-- Create By TouchSpriteStudio on 22:31:35   
-- Copyright © TouchSpriteStudio . All rights reserved.
	local date = {}

date.dm = {}

date.rect = {}

local dmCenter = date.dm

local rectCenter = date.rect
--御灵、业原火、开始按钮
dmCenter.normalBegin = {
	{  800,  433, 0xf3b25e},
	{  828,  440, 0xcd9853},
	{  845,  440, 0xf3b25e},
	{  853,  440, 0x4b3d2b},
	{  859,  440, 0x675133},
	{  846,  426, 0xf3b25e},
	{  864,  450, 0xf3b25e},
	{  811,  439, 0xf3b25e},
	name = "挑战"
}
--金币buff标志
dmCenter.battleOKDm = {

	{  131,  586, 0xe6cd95},
	{  133,  596, 0xb68042},
	{  143,  596, 0xc78c49},
	{  144,  592, 0xdcba63},
	{  153,  592, 0xfaf325},
	{  158,  585, 0xc89c5b},
	{  159,  575, 0xd0a560},
	{  148,  571, 0xcea25c},
	{  131,  589, 0xe0af51},
	{  132,  595, 0xe5cd72},

	name = "金币buff"
}
--add for some poor  squatters!!!
dmCenter.battleOKExpDm = {
	{  139,  580, 0x3181b5},
	{  139,  583, 0x629eda},
	{  139,  587, 0x3b6fc4},
	{  139,  588, 0x7ba2d4},
	{  151,  587, 0x6c99d4},
	{  155,  587, 0xfaf179},
	{  155,  589, 0xf0dc1f},
	{  155,  590, 0xfbf434},
	{  155,  593, 0xf7e62c},
	{  155,  595, 0xf7e31f},

	name = "经验buff"

}
--悬赏
dmCenter.rewardTaskDm = {

	{  747,  371, 0x56b361},
	{  757,  377, 0x52ae5c},
	{  764,  365, 0x5eb869},
	{  770,  387, 0x301f1e},
	{  737,  457, 0x2f1f1d},
	{  755,  462, 0xdd715f},
	{  778,  458, 0x2b1c1b},
	{  755,  481, 0x2f1f1e},

	name = "悬赏封印"
}
dmCenter.rewardLowLevelDm = {

	{  506,  409, 0x424553},
	{  503,  421, 0x40435e},
	{  503,  433, 0x434292},
	{  549,  426, 0x4a4190},
	{  512,  455, 0x1e1e23},
	{  532,  455, 0x1f1f29},
	{  528,  435, 0xf8f3e0},

	name = "低级悬赏封印"
}
dmCenter.inviteTeamAutoDm = {

	{   32,  219, 0xdd6c59},
	{   47,  231, 0xdd6c5a},
	{  122,  230, 0x50ac5b},
	{  127,  225, 0x62bb6d},
	{  199,  222, 0xd3a964},
	{  211,  237, 0x57b462},
	{  221,  237, 0x57b363},
	{  141,  234, 0x856c56},
	{  226,  242, 0x796753},

	name = "自动加入队伍"
}
--邀请的弹窗
dmCenter.autoInviteDlgDm = {

	{  391,  254, 0xcbb59c},
	{  387,  274, 0xcbb59c},
	{  409,  330, 0xcbb59c},
	{  416,  379, 0xdf6851},
	{  511,  381, 0xdf6851},
	{  630,  380, 0xf3b25e},
	{  727,  382, 0xf3b25e},
	{  730,  312, 0xcbb59c},
	{  569,  388, 0xcbb59c},

	name = "自动邀请弹窗"
}
--中间的勾
dmCenter.autoInviteDefaultDm = {

	{  493,  312, 0x4b5ee9},
	{  491,  317, 0x3f4ec1},
	{  488,  321, 0x3e4bad},
	{  501,  321, 0xf3f3f8},
	{  502,  318, 0xfafafc},
	{  498,  318, 0x606aae},
	{  504,  313, 0xa8aed6},
	{  494,  313, 0x4b5ee9},

	name = "默认要求勾选"
}

dmCenter.yuhunBeginDm = {

	{  150,  107, 0xab3e17},
	{  209,  548, 0xdf6851},
	{  862,  524, 0xf3b25e},
	{  927,  520, 0xf3b25e},
	{  925,  544, 0xf3b25e},
	{  570,  555, 0xc5bbb2},
	{  697,  108, 0xd3c4b3},
	{  784,  109, 0xd2c4b2},
	{  899,  107, 0xd3c5b3},

	name = "御魂10层开始界面"
}
dmCenter.over6000Dlg = {
	{  424,  264, 0xcbb59c},
	{  446,  254, 0x474038},
	{  558,  251, 0x272420},
	{  575,  267, 0xcbb59c},
	{  590,  283, 0xcbb59c},
	{  531,  319, 0x2a2622},
	{  523,  357, 0xf5b55f},
	{  596,  366, 0xf3b25e},
	{  579,  384, 0x282520},
	{  713,  373, 0xcbb59c},

	name = "超过6000提示"
	
}
rectCenter.battleOKRect = {980, 269, 1058, 553}

rectCenter.rewardTaskReciveRect  = {742, 357, 775, 387}

rectCenter.rewardTaskCancelRect = {  741, 445, 768, 473}

rectCenter.inviteTeamAutoReciveRect = {195, 213, 233, 247}

rectCenter.autoInviteDefaultActiveRect = {492, 311, 505, 327}

rectCenter.autoInviteSendRect = {616, 369, 734, 397}

rectCenter.autoInviteCancelRect = {401, 366, 531, 403}

rectCenter.beginYuhunBattleRect  = {860, 514, 995, 548}

rectCenter.normalBeginRect = {816, 424, 889, 457}

rectCenter.over6000DlgRect = {530, 356, 612, 392}

return date