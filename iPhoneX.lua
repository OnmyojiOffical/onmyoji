-- 阴阳师
-- iPhoneX.lua  

-- Create By TouchSpriteStudio on 15:20:29   
-- Copyright © TouchSpriteStudio . All rights reserved.
local date = {}

local dm = {} 

date.dm = dm


dm.beginGameNotifyDm = {
	{ 1992,  126, 0xdb7189},
	{ 2008,  104, 0xd8849d},
	{ 2024,  108, 0xe8cbc8},
	{ 2014,  138, 0xdf618b},
	{ 1978,  586, 0xd0c7c0},
	{ 2000,  750, 0xd0c7bf},
	{  424,  586, 0xcfc5bd},
	{  408,  418, 0xcec3bb},
	{  436,  308, 0xd1c7c0},
	{  734,   98, 0xcec6bc},

	name = "游戏开始公告"
}

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

dm.enterGameDm = {
	{  956,  316, 0x428ec6},
	{  930,  458, 0x2d7ec6},
	{ 1020,  706, 0x2b62a4},
	{ 1152,  744, 0x2d67a8},
	{ 1196,  432, 0x3689c8},
	{ 1454,  386, 0x428cc5},
	{ 1500,  664, 0x2d6cb0},
	{ 1460,  816, 0x3062a4},
	{ 1202,  824, 0x2a5897},
	{ 1082,  784, 0x2a5897},

	{ 1268,  166, 0x343225},
	{ 1272,  214, 0x262219},
	{ 1276,  250, 0x2c281e},
	{ 1224,  302, 0x28241b},
	{ 1342,  172, 0x2c281e},
	{ 1370,  342, 0x242219},
	{ 1324,  622, 0x0d0907},
	{  172,  262, 0x5b544d},
	{  170,  272, 0xb29477},
	{  192,  332, 0xac8d6f},


	name = "进入游戏"

}

dm.gameInnerNotifyDm = {
	{  984,   75, 0xc8921a},
	{ 1066,   83, 0xb7821a},
	{ 1126,   83, 0xf1dda9},
	{ 1168,   82, 0xf8e8b7},
	{ 1174,  107, 0xe9d099},
	{ 1281,  112, 0xb47b19},
	{ 1356,  114, 0xbc8c1b},
	{ 1478,  128, 0xb29870},
	{ 1492,  138, 0xd1a41b},
	{ 1636,  144, 0xd2c9c2},


	{ 1979,  127, 0xdf7f94},
	{ 1998,  111, 0xe8d4cf},
	{ 2037,  112, 0xcd6ba3},
	{ 2034,  126, 0xd26fb4},
	{ 2013,  132, 0xe8d0cc},
	{ 2003,  129, 0xe8d4cf},
	{ 2028,  135, 0xe796ad},
	{ 2014,  141, 0xd56996},

	name = "游戏内公告"

}



dm.buffCenterDm = {
	{  790,   46, 0xfad07a},
	{  778,   81, 0xf8ad69},
	{  793,   84, 0xfcd481},
	{  824,   81, 0xfbc776},
	{  829,   91, 0xfaba6d},
	{  818,  114, 0x9e6c48},
	{  807,  114, 0x614d36},
	{  808,  109, 0x745d3e},
	{  807,   95, 0x756544},
	{  811,   66, 0x60543b},

	name = "游戏内buff"
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

rect.closeNotifyRect = { 1990, 102, 2062, 152}

rect.enterGameRect = { 1096, 866, 1368, 940}

rect.gameInnerNotifyRect = {1987, 106, 2031, 142}

rect.normalHomeRect = { 2202, 188, 2368, 576}



--userUitl drawBrokenCard 

dm.brokenCardOneDm = {
	
	{  656,  326, 0xd9dcda},
	{  694,  318, 0xffffff},
	{  724,  336, 0xdbdddc},
	{  688,  374, 0xd7d9d8},
	{  700,  410, 0xd7d9d8},
	{  730,  482, 0xb5b7b6},
	{  704,  506, 0x999b9a},
	{  650,  484, 0xb6b7b6},
	{  718,  442, 0xe1e2e2},

	name = "第一张厕纸"
}

dm.brokenCardTwoDm = {
	{  920,  328, 0xd8dbd9},
	{  968,  318, 0xeeefee},
	{  986,  372, 0xd6d8d7},
	{  942,  434, 0xf7f7f7},
	{  934,  486, 0xb6b8b7},
	{ 1002,  470, 0xcfd0cf},
	{  986,  432, 0xf0f1f0},
	{  948,  406, 0xffffff},
	{  952,  468, 0xc1c3c2},
	{  998,  508, 0xa7a9a8},

	name = "第二张厕纸"
}

dm.brokenCardThreeDm = {
	{ 1184,  322, 0xdddedd},
	{ 1206,  326, 0xdbdddc},
	{ 1242,  362, 0xd6d8d7},
	{ 1212,  530, 0x7d7f7e},
	{ 1256,  498, 0xb4b5b4},
	{ 1198,  526, 0xa3a5a4},
	{ 1176,  484, 0xb3b4b3},
	{ 1170,  422, 0xd9dbd9},
	{ 1250,  426, 0xdbdddb},
	{ 1256,  468, 0xc1c2c1},

	name = "第三张厕纸"
}

dm.brokenCardFourDm = {
	{ 1440,  334, 0xdadcda},
	{ 1464,  394, 0xd9dbda},
	{ 1468,  494, 0xb6b8b7},
	{ 1488,  510, 0x9b9d9c},
	{ 1472,  500, 0xafb0af},
	{ 1510,  492, 0xa9aaa9},
	{ 1496,  408, 0xd8dad9},
	{ 1484,  394, 0xf4f4f4},
	{ 1530,  352, 0xd8dad8},
	{ 1490,  434, 0xf5f5f5},

	name = "第四张厕纸"
}

dm.brokenCardFiveDm = {
	
	{ 1700,  336, 0xd9dcda},
	{ 1750,  312, 0xffffff},
	{ 1770,  312, 0xd9dcda},
	{ 1722,  484, 0xbbbcbb},
	{ 1784,  498, 0xb4b5b4},
	{ 1790,  522, 0x999b9a},
	{ 1728,  528, 0xa3a4a3},
	{ 1714,  520, 0xa9aaa9},
	{ 1784,  420, 0xe7e8e7},
	{ 1786,  392, 0xd6d9d7},

	name = "第五张厕纸"
}

dm.cancelDrawDm = {
	{  898,  998, 0xf3b25e},
	{  925,  990, 0xf3b25e},
	{  964,  994, 0xf3b25e},
	{  977, 1015, 0x654f33},
	{ 1037, 1024, 0xdaa156},
	{ 1085, 1025, 0xf3b25e},
	{ 1091, 1020, 0xf3b25e},
	{ 1099, 1015, 0xf3b25e},
	{ 1088,  996, 0xf3b25e},
	{ 1132,  973, 0x973c2e},

	name = "确定"
}

dm.continueDrawDm = {
	{ 1304, 1001, 0xf3b25e},
	{ 1322, 1020, 0xf3b25e},
	{ 1446, 1017, 0xa37a46},
	{ 1521, 1004, 0xf3b25e},
	{ 1366,  993, 0x51412d},
	{ 1338,  993, 0xf3b25e},
	{ 1504, 1020, 0x2d2822},
	{ 1534, 1027, 0xf3b25e},
	{ 1466, 1033, 0xf3b25e},
	{ 1347, 1018, 0x7e603a},
	
	name = "再次召唤"
	
}

dm.goDrawnDm = {
	
	
	{  583,  865, 0xb9bab9},
	{  603,  909, 0xf2f2f1},
	{  615,  945, 0x42a6a8},
	{  620,  924, 0x7b918c},
	{  589,  910, 0x3a7a7c},
	{  573,  937, 0xd9d1bf},
	{  648,  976, 0x6f7875},
	{  677,  935, 0x8e9280},
	{  679,  916, 0x347c7f},
	{  673,  883, 0xa5a6a6},

	name = "普通召唤"
}

rect.goDrawnRect = {598, 884, 652, 958}

rect.brokenCardOneRect = {650, 330, 746, 514}

rect.brokenCardTwoRect = {922, 332, 996, 512}

rect.brokenCardThreeRect = {1180, 334, 1276, 518}

rect.brokenCardFourRect = {1446, 342, 1542, 504}

rect.brokenCardFiveRect = {1702, 326, 1812, 520}

rect.cancelDrawRect = { 927, 987, 1096, 1032}

rect.continueDrawRect = {1336, 987, 1537, 1030}


--司机组队部分按钮位置
rect.yuhunTeamCreateRect = {1530, 898, 1656, 947} 

rect.yuhunTeamRect = {1167, 750, 1305, 806} 

rect.yuhunMakeTeamRect = {1759, 952, 1960, 1001} 

rect.yuhunSnakeEnterRect = {660, 379, 1027, 816} 

rect.yuhunTeamConfigPrivateRect = {1397, 792, 1423, 822} 

rect.inviteGuyRecentRect = {997, 185, 1086, 228} 

rect.inviteGuySendRect = { 1357, 872, 1507, 920} 

rect.firstGuyRect = { 902, 317, 1179, 404} 

rect.searchEnterRect = { 1253, 195, 1305, 301} 

rect.inviteFirstTeamGuyRect = {1304, 724, 1366, 774} 

rect.searchToolBarYulingRect = { 620, 965, 693, 1052} 

rect.searchToolBarHomeBrokenRect = {470, 961, 528, 1048} 

rect.searchToolBarYuhunRect = {276, 961, 358, 1032} 

rect.searchEnterMayhownRect = { 902, 56, 1741, 491} 

rect.searchToolBarJuexingRect = {118, 960, 196, 1056} 

dm.inviteGuyRefreshViewDm = {

	{ 1184,  533, 0xfffff4},
	{ 1179,  540, 0xfffeec},
	{ 1174,  554, 0xefe8d6},
	{ 1220,  563, 0xffffff},
	{ 1206,  563, 0xfffffb},
	{ 1201,  563, 0xc3ad6e},
	{ 1221,  569, 0xffffff},
	{ 1228,  575, 0xffffff},
	{ 1232,  562, 0xffffff},
	{ 1227,  551, 0xffffff},


 
 name = "刷新转菊花"

} 

dm.searchToolBarDm = {

 	
	{  133,  975, 0x89368b},
	{  118, 1000, 0x5c2262},
	{  167, 1032, 0xddcfa7},
	{  161,  986, 0x792808},
	{  151,  969, 0xb15aad},
	{  319,  981, 0xfbea8f},
	{  306, 1009, 0x846a33},
	{  290, 1022, 0xad2020},
	{  350, 1025, 0x8e1b1b},
	{  328,  988, 0xc8a11f},

	{  470,  977, 0x9a5917},
	{  473, 1004, 0xad6e1f},
	{  496,  981, 0x861413},
	{  477, 1030, 0xd0c4b3},
	{  604, 1012, 0x55366b},
	{  660,  992, 0xc0baac},
	{  657,  978, 0xba4f5d},
	{  678, 1022, 0x7c545a},

	
	
	name = "探索界面工具栏"

} 

dm.lostConnetDm = {
	
	
	{ 1128,  591, 0x963a2e},
	{  917,  495, 0x766a5c},
	{ 1129,  598, 0x9e4431},
	{ 1134,  590, 0xaa502f},
	{ 1140,  591, 0x963a2e},
	{  913,  495, 0x837566},
	{  913,  495, 0x837566},
	{  924,  494, 0x38332d},
	{  926,  495, 0x322e29},
	{  928,  499, 0x2e2a25},

	

 	name = "丢失网络连接"

} 



dm.yuhunBeginWithOutGuyDm = {


	{  478,  921, 0xdf6851},
	{  461,  912, 0xdf6851},
	{  456,  905, 0xea7154},
	{  663,  908, 0xdf6851},
	{  690,  903, 0xcf604c},
	{  698,  939, 0xdf6851},
	{  579,  953, 0xdf6851},
	{  528,  953, 0xdf6851},
	{ 1719,  903, 0x675d5c},
	{ 1727,  974, 0x6b6160},
	{ 1722,  975, 0x685e5d},
	{ 1894,  955, 0xb0a9a1},
	{ 1943,  965, 0xb0a9a1},
	{ 1975,  968, 0x675d5c},
	{ 1971,  914, 0xaca59d},
	{ 1971,  901, 0x645b5a},
	{ 1858,  925, 0x3e3b36},
	{ 1817,  928, 0xb0a9a1},

 	name = "无队友魂十开始界面"

} 

dm.yuhunMainViewDm = {


	{  661,  483, 0x6b6f5e},
	{  702,  668, 0x8d705c},
	{  846,  628, 0x95819a},
	{  866,  598, 0xc9a1b3},
	{  866,  574, 0x7c8397},
	{  866,  574, 0x7c8397},
	{  866,  573, 0x9e9da3},
	{  866,  573, 0x9e9da3},
	{  866,  570, 0xcca9c2},
	{  866,  570, 0xcca9c2},



 	name = "御魂界面"

} 

dm.tryConnectDm = {

	
	{ 1028,  542, 0xf8e096},
	{ 1031,  547, 0xdbba47},
	{ 1071,  567, 0xedc6e4},
	{ 1053,  578, 0xeed3ed},
	{ 1043,  571, 0xf1b2dc},
	{ 1122,  580, 0xf2bddf},
	{ 1094,  602, 0xe4a3ca},
	{ 1069,  584, 0xe0b262},
	{ 1050,  570, 0xf2c2e2},
	{ 1041,  567, 0xf19bcf},

	
	

 	name = "正在连接"

} 

dm.finishBattleWhenOutlineDm = {
	{ 1124,  623, 0x983d2e},
	{ 1123,  629, 0x953a2e},
	{ 1137,  620, 0x95392e},
	{ 1128,  620, 0x95392e},
	{  934,  453, 0xcbb59c},
	{  941,  453, 0x3e3831},
	{  950,  454, 0x3b352f},
	{  952,  454, 0x3e3831},
	{  954,  454, 0x413b34},
	{  955,  453, 0x2d2925},
	
	name = "离线期间战斗已结束"

}


dm.searchEnterDm = {



	{ 1255,  238, 0xfff2aa},
	{ 1255,  279, 0xf9cc9f},
	{ 1303,  218, 0xf1ce96},
	{ 1267,  203, 0x0f0a09},
	{ 1265,  243, 0xffffc4},
	{ 1304,  251, 0xf5d39d},
	{ 1280,  300, 0xe3c1a5},
	{ 1261,  288, 0xe8b189},


 	name = "探索"

} 

return date
