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

	{  141,  579, 0x2f7cb6},
	{  136,  590, 0x8cb3e2},
	{  136,  591, 0x8cb3e2},
	{  141,  591, 0x9ab9e1},
	{  156,  572, 0xc8e3f3},
	{  153,  582, 0x6a95cf},
	{  158,  595, 0xf7e31f},
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
dmCenter.yuhunBeginWithOutGuyDm = {
	{  782,  528, 0xffb953},
	{  785,  529, 0xff9732},
	{  794,  529, 0xf6812b},
	{  787,  521, 0xd23924},
	{  786,  534, 0xffbd57},
	{  778,  539, 0x0c0d0a},
	{  781,  542, 0x0e110c},
	{  793,  544, 0x0f150e},
	
	{  863,  518, 0xb0a9a1},
	{  867,  529, 0xb0a9a1},
	{  869,  542, 0xb0a9a1},
	{  901,  548, 0xb0a9a1},
	{  897,  516, 0xb0a9a1},
	{  922,  514, 0xb0a9a1},
	{  951,  518, 0xb0a9a1},
	{  988,  530, 0xb0a9a1},
	{  983,  546, 0xb0a9a1},
	
	
	{  143,  525, 0xdf6851},
	{  142,  536, 0xdf6851},
	{  184,  542, 0x2b2521},
	{  194,  519, 0xdf6851},
	{  227,  518, 0xdf6851},
	{  267,  520, 0xdf6851},
	{  262,  548, 0xdf6851},


	name = "无队友魂十开始界面"
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
dmCenter.beginGameNotifyDm = {

	{  120,  182, 0xd0c6be},
	{  589,   73, 0xe0bc7c},
	{  609,   79, 0x9b8f88},
	{  664,   70, 0x695649},
	{ 1008,   70, 0xdb7389},
	{ 1025,   61, 0xe78ba2},
	{ 1030,   75, 0xda789d},
	{ 1022,   83, 0xd6769d},
	{  126,  290, 0xd1c8c0},
	{  120,  299, 0xd0c6be},

	
	name = "游戏公告"
}

dmCenter.enterGameDm = {


	{  206,  227, 0xffffff},
	{  237,  263, 0xffffff},
	{  220,  264, 0xffffff},
	{  232,  232, 0xf2b5ff},
	{  208,  223, 0xffffff},
	{  780,  248, 0x4e83fc},
	{  768,  211, 0x2444d7},
	{  783,  284, 0xacfdff},
	{  796,  305, 0xeaeffe},
	{  803,  242, 0x85faff},


	{  536,  187, 0x222018},
	{  566,   94, 0x2f2c20},
	{  603,  130, 0x2e2a1f},
	{  635,  311, 0xe2e3db},
	{  626,  332, 0x100d0a},
	{  606,  336, 0xc2d3dd},
	{  547,  246, 0x656ca9},
	{  579,  181, 0x27241b},
	{  605,  357, 0x0c0806},
	{  587,  263, 0x1f1d1a},

	name = "进入游戏"
}

dmCenter.buffCenterDm = {
	{  388,   25, 0xfac876},
	{  386,   32, 0x524733},
	{  385,   35, 0xa58c59},
	{  380,   47, 0xfbcc7a},
	{  384,   45, 0x6e6042},
	{  389,   56, 0x4f4431},
	{  389,   57, 0x736140},
	{  394,   65, 0x2e2822},
	{  394,   66, 0x946444},
	{  391,   68, 0xf59060},
	
	name = "加成"
}
dmCenter.gameInnerNotifyDm = {
	{ 1006,   72, 0xdd788f},
	{ 1012,   66, 0xe8cac8},
	{ 1015,   80, 0xdb8390},
	{ 1014,   79, 0xe5bdbb},
	{ 1017,   79, 0xe4638b},
	{ 1014,   67, 0xe8d2ce},
	{ 1014,   68, 0xe8cecb},
	{ 1014,   68, 0xe8cecb},
	{ 1015,   73, 0xe8d4cf},
	{ 1015,   77, 0xe8d3cf},
	
	name = "游戏内活动界面"
}

dmCenter.searchEnterDm = {

	{  585,  120, 0xe2bc92},
	{  588,  137, 0xfae096},
	{  609,  135, 0xffffc9},
	{  619,  125, 0xefce94},
	{  618,  158, 0xefbf8c},
	{  610,  171, 0xd4ad8d},
	{  610,  160, 0xf7b87a},
	{  613,  146, 0xffeca0},
	{  602,  173, 0xcfa687},


	name = "探索"
}

dmCenter.searchToolBarDm = {
	{   71,  587, 0x581d5f},
	{   91,  600, 0xe0d1a8},
	{  101,  592, 0xe4d8af},
	{  175,  580, 0xc4991d},
	{  186,  599, 0x7d231d},
	{  190,  582, 0xd9ba39},
	{  269,  595, 0x67261b},
	{  282,  584, 0x701916},
	{  288,  603, 0x907862},
	{  370,  593, 0x25133e},

	name = "探索界面工具栏"
}

dmCenter.yuhunMainViewDm = {
	{  241,  276, 0x606658},
	{  204,  356, 0x5b5346},
	{  521,  352, 0x555c4f},
	{  490,  232, 0x545f4b},
	{  465,  193, 0xba9f59},
	{  406,  455, 0x523768},
	{  378,  465, 0x2f241f},
	{  501,  420, 0x625b4d},
	{  522,  312, 0x5e7f6e},
	{  987,  259, 0x527262},
	
	name = "御魂界面"
}

dmCenter.inviteGuyRefreshViewDm = {
	{  567,  319, 0xffffff},
	{  564,  323, 0xffffff},
	{  564,  324, 0xfffff3},
	{  571,  321, 0xffffe3},
	{  573,  318, 0xffffff},
	{  578,  305, 0x51483e},
	{  586,  318, 0x51483e},
	{  564,  323, 0xffffff},
	{  559,  311, 0x5f5443},
	{  555,  331, 0x51483e},

	name = "刷新转菊花"
}

dmCenter.inviteTeamDm = {
	{   22,  225, 0x81664e},
	{   39,  222, 0xde705d},
	{   39,  228, 0xd86856},
	{   38,  248, 0x846a53},
	{   43,  235, 0xdf6e5b},
	{   63,  226, 0x846c56},
	{   36,  207, 0x846a54},
	{  116,  226, 0x58b563},
	{  124,  228, 0x59b363},
	{  130,  222, 0x61ba6b},
	
	
	{  188,  234, 0xe2d3be},
	{  186,  220, 0x573718},
	{  178,  242, 0xe9ddcd},
	{  186,  235, 0xe6d9c6},
	{  186,  218, 0x51351b},
	{  185,  201, 0x55381c},
	{  176,  231, 0xe6d8c5},
	{  184,  231, 0xe3d4bf},
	{  190,  242, 0xece2d4},
	{  222,  241, 0xb97468},


	name = "御魂组队邀请"
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

--左上角
rectCenter.closeNotifyRect = {1006, 61, 1035, 92}

rectCenter.enterGameRect = {466, 506, 590, 543}

rectCenter.gameInnerNotifyRect = {998, 61, 1024, 87}

rectCenter.normalHomeRect = { 965, 227, 1079, 456 }

rectCenter.searchEnterMayhownRect = {336, 26, 929, 236}

rectCenter.searchToolBarYuhunRect = {159, 564, 201, 618}

rectCenter.searchToolBarJuexingRect = {63, 563, 100, 609}

rectCenter.searchToolBarHomeBrokenRect = {259, 575, 294, 610}

rectCenter.searchToolBarYulingRect = {356, 574, 396, 613}

rectCenter.yuhunSnakeEnterRect = { 249, 228, 488, 418}

rectCenter.yuhunTeamRect = {536, 423, 621, 456}

rectCenter.yuhunMakeTeamRect = {868, 539, 995, 572}

rectCenter.yuhunTeamConfigPrivateRect = {672, 452, 683, 469}

rectCenter.yuhunTeamCreateRect = {746, 511, 817, 542}

rectCenter.inviteFirstTeamGuyRect = {593, 388, 679, 475}

rectCenter.inviteGuyRecentRect = {430, 97, 493, 131}

--邀请第一个人

rectCenter.firstGuyRect = { 338, 177, 540, 227}

rectCenter.inviteGuySendRect = { 661, 496, 722, 528}

rectCenter.searchEnterRect = {585, 108, 618, 178}


rectCenter.inviteTeamReciveRect = {105, 207, 145, 247}

rectCenter.inviteTeamSnapshotRect = {161, 193, 377, 229}


--NetWorkError

dmCenter.tryConnectDm = {
	{  455,  300, 0xc6acc3},
	{  462,  322, 0xf57fb2},
	{  462,  313, 0xb2922d},
	{  480,  324, 0xe7b8d7},
	{  495,  330, 0x8b692a},
	{  511,  335, 0xf0bde1},
	{  508,  342, 0xf3cdeb},
	{  527,  337, 0xf373b0},
	{  611,  337, 0xd5ccbc},
	{  696,  330, 0xb4a697},
	
	name = "正在连接"
	
}

dmCenter.lostConnetDm = {
	
	
	{  389,  409, 0x5f4032},
	{  404,  409, 0x624133},
	{  432,  409, 0x674534},
	{  472,  413, 0x523528},
	{  493,  411, 0x6b4837},
	{  516,  381, 0x973c2e},
	{  519,  333, 0xd88230},
	{  624,  337, 0x9b402e},
	{  621,  377, 0xa74f36},
	{  688,  365, 0xcbb59c},

	
	{  576,  365, 0x2c2721},
	{  577,  365, 0x7c5f3a},
	{  579,  365, 0xecad5c},
	{  580,  365, 0xba8a4d},
	{  581,  365, 0x81633b},
	{  582,  365, 0x4e3f2c},
	{  583,  365, 0x292621},
	{  584,  365, 0x624d32},
	{  585,  365, 0x9d7644},
	{  586,  365, 0xbd8d4e},

	{  518,  380, 0x983d2e},
	{  519,  336, 0x963a2e},
	{  624,  338, 0x9b402e},
	{  620,  380, 0x973c2e},

	name = "丢失网络连接"
}

--[[

	升级狗粮

]]


local rect = date.rect

local dm = date.dm

rect.continueButtonRect = {848, 577, 913, 608} 

rect.skillUpRect = {569, 552, 690, 612} 

rect.confirmButtonRect = {848, 577, 913, 608} 

dm.continueButtonDm = {


	{  624,  528, 0x973c2e},
	{  616,  565, 0x95392d},
	{  662,  556, 0xf3b25e},
	{  669,  555, 0xe4a759},
	{  675,  556, 0xf2b15e},
	{  673,  557, 0x675133},
	{  691,  547, 0x755b38},
	{  698,  547, 0x2d2822},
	{  726,  558, 0x302a23},



 	name = "继续升星"

} 

dm.skillUpDm = {
	

	{  771,  331, 0x8f6b41},
	{  772,  356, 0x8f6b41},
	{  764,  356, 0x7c5a32},
	{  364,  342, 0x8a663d},
	{  363,  353, 0x87633b},
	{  375,  364, 0x7d5b33},
	{  363,  371, 0x87633b},
	{  372,  382, 0x87643b},


 	name = "技能升级"

} 

dm.confirmButtonDm = {


	{  831,  574, 0xa34b34},
	{  828,  611, 0x973c2e},
	{  848,  611, 0xf3b25e},
	{  876,  593, 0x86663d},
	{  874,  602, 0xf3b25e},
	{  876,  602, 0x9e7744},
	{  878,  603, 0x6d5535},
	{  891,  605, 0x685134},
	{  892,  602, 0x493c2a},
	{  903,  602, 0x272420},



 	name = "确认按钮"

} 


--结界突破

date.const = {}

date.point = {}

local const = date.const

local point = date.point

const.homeBreakOutCardOffsetX = 305

const.homeBreakOutCardOffsetY = 120

const.modelOffsetX = 35

point.modelBasePoint = {x =  107, y = 82, color = 0x837e77}

point.homeBreakOutViewBasePoint = { x = 116 ,y =  82 ,color =  0x0  }



rect.exitBattleConfirmRect = { 626, 360, 690, 392} 

rect.exitBattleButtonRect = { 22, 21, 44, 37} 

rect.refreshHomeBreakOutViewButtonConfirmButtonRect = { 632, 369, 728, 396} 

rect.baseChallengeButtonRect = { 189, 206 ,251 ,233}

rect.baseZoomRect = { 218, 20 ,281 ,50} 

rect.refreshHomeBreakOutViewButtonRect = {894, 466, 967, 495} 

rect.receiveHomeBreakOutNormalReward = { 809, 533, 881, 566} 


dm.homeBreakOutViewStatusFailedDm = {


{ 269 ,19 ,0xd9b964 },
{ 272 ,18 ,0xa38856 },
{ 283 ,6 ,0xa93636 },
{ 286 ,6 ,0xac3636 },
{ 291 ,12 ,0xb33b3b },
{ 286 ,19 ,0x2a0804 },
{ 287 ,14 ,0xb13737 },
{ 292 ,25 ,0x310905 },
{ 290 ,18 ,0x571d1b },



 	name = "突破挑战失败基础点阵"

} 

dm.finishBattleWhenOutlineDm = {

 	name = "离线期间战斗已结束"

} 

dm.homeBreakOutViewStatusViewNormalDm = {
	
	
	{ 263 ,13 ,0xcebdaa },
{ 256 ,20 ,0xd1c2b0 },
{ 271 ,20 ,0xcfc0ad },
{ 276 ,18 ,0xcdbca8 },
{ 270 ,32 ,0xd3c5b3 },
{ 258 ,33 ,0xd5c8b7 },
{ 253 ,33 ,0xd5c8b7 },
{ 259 ,33 ,0xd5c8b7 },


 	name = "突破未挑战基础点阵"

} 



dm.exitBattleDlgDm = {
	
	
	{  518,  373, 0xdf6851},
	{  591,  312, 0xcbb59c},
	{  667,  347, 0x5e5448},
	{  638,  364, 0xf3b25e},
	{  698,  365, 0xf3b25e},
	{  438,  363, 0xdf6851},
	{  440,  357, 0xdf6851},


 	name = "退出战斗弹窗"

} 

dm.homeBreakOutViewLightDm = {
	
	
	{  834,  552, 0xd6c9b9},
	{  850,  533, 0xd6c9b9},
	{  856,  542, 0xd6c9b9},
	{  811,  575, 0xd6c9b9},
	{  846,  547, 0xd6c9b9},
	{  876,  526, 0xd6c9b9},
	{  829,  524, 0xd6c9b9},
	{  821,  536, 0xd6c9b9},
	{  817,  546, 0xd6c9b9},


 	name = "颜色比较浅的突破界面"

} 

dm.homeBreakOutViewDarkenDm = {
	
	
	{  814,  550, 0x58534c},
	{  827,  532, 0x58534c},
	{  825,  559, 0x58534c},
	{  815,  553, 0x58534c},
	{  870,  559, 0x58534c},
	{  828,  557, 0x58534c},
	{  819,  538, 0x58534c},
	{  860,  550, 0x58534c},


 	name = "颜色比较深的突破界面"

} 



dm.homeBreakOutSuccessDm = {
	
	
	{  482,  437, 0x4a96d0},
	{  472,  444, 0x4585c8},
	{  473,  459, 0x3b84ca},
	{  483,  466, 0x3fbee8},
	{  523,  457, 0x73bbe5},
	{  532,  439, 0x79b5e1},
	{  552,  464, 0x442213},
	{  561,  464, 0x2e1a15},
	{  586,  476, 0x2c1813},
	{  602,  472, 0xb83822},


 	name = "战斗胜利"

} 

dm.baseChallengeButtonDm = {
	
	
	{ 186 ,209 ,0xf3b25e },
{ 219 ,198 ,0xf3b25e },
{ 248 ,206 ,0xf3b25e },
{ 234 ,215 ,0x614d32 },
{ 222 ,217 ,0xf3b25e },
{ 223 ,228 ,0xf3b25e },
{ 249 ,224 ,0xf3b25e },
{ 262 ,222 ,0xf3b25e },
{ 193 ,229 ,0xf3b25e },


 	name = "进攻"

} 

dm.homeBreakOutFailDm = {
	
	
	
	{  344,  446, 0xbaaca0},
	{  336,  451, 0x371f22},
	{  354,  447, 0xfbfcf9},
	{  389,  451, 0xd23b18},
	{  584,  441, 0xb8302f},
	{  556,  448, 0x271f22},
	{  745,  472, 0x211c29},
	{  785,  433, 0xe8e5e0},
	{  738,  412, 0x69101f},
	{  786,  466, 0xf68638},


 	name = "战斗失败"

} 

dm.refreshHomeBreakOutViewDlgDm = {
	
	
	{  409,  390, 0xdf6851},
	{  491,  326, 0xcbb59c},
	{  612,  321, 0xcbb59c},
	{  620,  376, 0xf3b25e},
	{  713,  377, 0xf3b25e},
	{  687,  320, 0xcbb59c},
	{  493,  384, 0xdf6851},
	{  403,  382, 0xdf6851},


 	name = "刷新后攻破记录进度将会重置"

} 

dm.homeBreakOutViewDm = {
	
	
	{  341,  546, 0x1d4662},
	{  339,  555, 0x1d415b},
	{  339,  558, 0xeedbcd},
	{  342,  545, 0x103f63},
	{  745,  553, 0x330f1a},
	{  736,  553, 0x8c6f56},
	{  746,  550, 0xc08050},
	{  748,  535, 0x77404f},
	{  249,  561, 0xf3b25e},
	{  240,  559, 0xf2b15e},

 	name = "结界突破视图"

} 

dm.homeBrekaOutViewStatusBrokenDm = {
	
	
	{ 246 ,43 ,0x4e101a },
{ 246 ,45 ,0x53131d },
{ 246 ,47 ,0x58131f },
{ 248 ,50 ,0x621a27 },
{ 260 ,48 ,0x482325 },
{ 263 ,50 ,0x491f23 },
{ 267 ,53 ,0x651725 },
{ 269 ,55 ,0x6b1929 },
{ 271 ,56 ,0x6d1a2a },

 	name = "突破已经攻破基础急诊"

} 




--抽厕纸

rect.brokenCardFiveRect = {} 

rect.cancelDrawRect = {} 

rect.continueDrawRect = {} 

rect.goDrawnRect = {} 

rect.brokenCardTwoRect = {} 

rect.brokenCardFourRect = {} 

rect.brokenCardThreeRect = {} 

rect.brokenCardOneRect = {} 


dm.cancelDrawDm = {

 	name = "确定"

} 

dm.brokenCardOneDm = {

 	name = "第一张厕纸"

} 

dm.brokenCardFiveDm = {

 	name = "第五张厕纸"

} 

dm.continueDrawDm = {

 	name = "再次召唤"

} 

dm.brokenCardFourDm = {

 	name = "第四张厕纸"

} 

dm.brokenCardThreeDm = {

 	name = "第三张厕纸"

} 

dm.brokenCardTwoDm = {

 	name = "第二张厕纸"

} 

dm.goDrawnDm = {

 	name = "普通召唤"

} 


rect.battleOKRectSet = {
	
	{ 26, 101, 158, 497},
	
	{301, 30, 722, 105},
	
	{989, 109, 1091, 498},
	
	{ 753, 485, 1101, 532}
}
return date