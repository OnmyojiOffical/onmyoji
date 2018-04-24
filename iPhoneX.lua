-- 阴阳师
-- iPhoneX.lua  

-- Create By TouchSpriteStudio on 15:20:29   
-- Copyright © TouchSpriteStudio . All rights reserved.
local date = {}

local dm = {} 

date.dm = dm

dm.battleOKExpDm = {
	{  243, 1014, 0xd1e7f6},
	{  242, 1038, 0x5b8cd2},
	{  242, 1049, 0x5e89c8},
	{  257, 1034, 0xc0dcf4},
	{  261, 1025, 0x90b7e3},
	{  267, 1022, 0x80aade},
	{  273, 1039, 0xf7e73e},
	{  274, 1046, 0xf7e31f},
	{  274, 1050, 0xf0d00e},
	
	name = "经验buff"
}

dm.inviteTeamAutoDm = {
	{  190,  392, 0xde6e5c},
	{  332,  404, 0x61ba6b},
	{  467,  378, 0xedc893},
	{  503,  374, 0xedc792},
	{  488,  391, 0xedc791},
	{  492,  416, 0x55b360},
	{  513,  413, 0x57b262},
	
	name = "自动加入队伍"
}

dm.rewardLowLevelDm = {
	{ 1102,  720, 0x3d4050},
	{ 1115,  723, 0x404461},
	{ 1119,  721, 0x414471},
	{ 1101,  744, 0x3e4068},
	{ 1190,  755, 0x4745a8},
	
	name = "辣鸡悬赏"

}
dm.inviteTeamDm = {
	{  181,  387, 0xdf6e5b},
	{  197,  403, 0xdc715f},
	{  331,  401, 0x59b564},
	{  358,  395, 0x5bb766},
	{  449,  385, 0x634122},
	{  467,  368, 0x4a2d12},
	{  447,  415, 0xe5d7c3},
	{  445,  439, 0xece2d4},
	{  448,  447, 0xeadfcf},
	{  447,  349, 0x533418},

	name = "正常加入队伍"
}
dm.yuhunBeginDm = {
	{  484,  182, 0xb05634},
	{  590,  182, 0x4b4741},
	{  692,  182, 0x59544e},

	{ 1606,  940, 0xff5f29},
	{ 1734,  954, 0xf3b25e},
	{ 1774,  960, 0xf2b15e},
	{ 1841,  961, 0xf3b25e},
	{ 1796,  190, 0xd3c4b3},
	{ 1597,  210, 0xd0c0ad},
	
	name = "御魂10层开始"

}

dm.rewardTaskDm = {
	{ 1528,  647, 0x5fba6a},
	{ 1545,  663, 0x56b260},
	{ 1567,  646, 0x5bb766},
	{ 1536,  787, 0xdf6e5b},
	{ 1554,  805, 0xde7261},
	{ 1572,  819, 0xe17461},
	{ 1535,  827, 0xdf6e5c},
	{ 1572,  794, 0xdb6a57},
	{ 1133,  217, 0xb39276},
	{ 1112,  334, 0xa17f63},

	name = "悬赏任务"
}

dm.battleOKDm = {
	
	
	{  242, 1019, 0xcc9c51},
	{  255, 1011, 0xd0bd6e},
	{  265, 1007, 0xe2c56b},
	{  283, 1007, 0xe6cca4},
	{  251, 1049, 0xdcaf59},
	{  272, 1043, 0xf7e528},

	name = "金币buff"

}

dm.autoInviteDlgDm = {
	--以下文字描述
	{  968,  464, 0xa2917d},

	{ 1335,  468, 0xcbb59c},
	{ 1139,  559, 0x4f473e},
	{ 1192,  564, 0x312d28},
	{ 1199,  567, 0x867868},
	--以下取消按钮
	{  960,  667, 0xdf6851},
	{ 1151,  638, 0x842549},
	{  993,  667, 0x2a2521},

	{ 1159,  711, 0x862749},
	{  916,  711, 0x923049},
	{  902,  637, 0x892645},
	{ 1160,  639, 0x862749},
	--以下确定按钮
	{ 1275,  641, 0x94372c},
	{ 1276,  711, 0x983d2e},

	{ 1425,  654, 0x312b23},
	{ 1426,  670, 0x362e24},
	{ 1438,  691, 0x483b2a},

	name = "自动邀请弹窗"

}

dm.normalBegin = {
	{ 1615,  740, 0x973c2d},
	{ 1625,  740, 0xaa5437},
	{ 1630,  757, 0xf3b25e},
	{ 1655,  772, 0xf3b25e},
	{ 1669,  770, 0x362e24},
	{ 1682,  773, 0x695234},
	{ 1689,  773, 0x8a693e},
	{ 1727,  773, 0xe7aa5a},
	{ 1736,  772, 0x282420},
	{ 1765,  770, 0xf3b25e},
	
	name = "挑战"
	
}

dm.over6000Dlg = {
	{  933,  422, 0x2f2b26},
	{  990,  432, 0x4a433a},
	{ 1033,  440, 0x463f38},
	{ 1095,  442, 0x50483f},
	{ 1215,  450, 0xcbb59c},
	{ 1201,  465, 0xcbb59c},
	{ 1266,  514, 0xcbb59c},
	{ 1317,  498, 0x292622},
	{ 1323,  484, 0x948573},
	{ 1342,  486, 0x3e3831},
	{  981,  666, 0xcbb59c},
	{ 1048,  665, 0xcbb59c},
	{ 1178,  587, 0xcbb59c},
	{ 1363,  587, 0xcbb59c},
	{ 1401,  651, 0xcbb59c},
	{ 1147,  657, 0xf3b25e},
	{ 1178,  662, 0x3a3126},
	{ 1190,  662, 0x493c2a},
	{ 1188,  662, 0x4e3f2c},
	{ 1231,  660, 0x2f2922},
	
	name = "超过6000提示"
}

dm.autoInviteDefaultDm = {
	{ 1083,  546, 0x4b5ee9},
	{ 1090,  546, 0x4b5ee9},
	{ 1090,  556, 0x495be2},
	{ 1085,  563, 0xf4f5f8},
	{ 1090,  566, 0x868ab3},
	{ 1104,  560, 0xdfe1ed},
	{ 1106,  563, 0x3644a9},
	{ 1079,  570, 0x3745a9},

	name = "勾选默认邀请"
}




local rect = {}  

date.rect = rect

rect.autoInviteCancelRect = { 938, 649, 1133, 706}

rect.over6000DlgRect = { 1147, 633, 1284, 689}

rect.rewardTaskReciveRect = {1540,650,1560,670}

rect.inviteTeamAutoReciveRect = {463, 372, 516, 423}

rect.beginYuhunBattleRect = {1749, 912, 1952, 962}

rect.rewardTaskCancelRect = {1540,801,1560,821}

rect.autoInviteSendRect = {1300, 647, 1496, 700}

rect.normalBeginRect = {1618, 742, 1798, 813}

rect.battleOKRect = {2000,300,2050,700}

rect.autoInviteDefaultActiveRect = {1078, 547, 1110, 575}

rect.inviteTeamReciveRect = {309, 369, 367, 431}

rect.inviteTeamSnapshotRect = { 403, 335, 693, 399}
return date
