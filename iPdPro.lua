-- 阴阳师
-- iPdPro.lua  

-- Create By TouchSpriteStudio on 23:18:21   
-- Copyright © TouchSpriteStudio . All rights reserved.
	local date = {}

local dm = {}  

date.dm = dm

dm.rewardLowLevelDm = {
	{  907,  925, 0x414352},
	{  907,  940, 0x404259},
	{  907,  958, 0x424276},
	{  909,  975, 0x42445b},
	{  912,  958, 0x474487},
	{  997,  951, 0x41427b},
	{  918,  913, 0x363a53},
	{  939,  927, 0x1f1f21},
	
	name = "辣鸡悬赏"
}

dm.battleOKDm = {
	{  234, 1444, 0xb28858},
	{  244, 1430, 0xf0d795},
	{  279, 1461, 0xd7a534},
	{  257, 1444, 0x4e3e27},
	{  267, 1415, 0xe0bc7e},
	{  280, 1414, 0xceb16d},
	{  283, 1449, 0xefea5a},
	{  283, 1461, 0xdcb442},
	{  282, 1452, 0xf1e458},
	
	name = "金币buff"
}

dm.inviteTeamAutoDm = {
	{   56,  393, 0xcc6d5b},
	{   69,  407, 0xcf7664},
	{   85,  426, 0xd57e6b},
	{   51,  425, 0xd37865},
	{  206,  406, 0x6eb46e},
	{  221,  419, 0x6eb068},
	{  239,  406, 0x73b671},
	{  349,  398, 0xe1c391},
	{  374,  381, 0xe8ca98},
	{  401,  392, 0xe7c794},
	--御魂十层字样，防止有人捣乱
	
	{  524,  422, 0x9a5f57},
	{  525,  432, 0xcd9d91},
	{  525,  440, 0xa97067},
	{  545,  438, 0xa77769},
	{  566,  438, 0xaa796a},
	{  581,  438, 0xb68275},
	{  609,  425, 0xbd8f82},
	{  624,  425, 0xa26b64},
	{  662,  421, 0xc19789},
	{  674,  418, 0x8c433c},

	name = "自动接收组队"
}

dm.over6000Dlg = {}

dm.yuhunBeginDm = {}

dm.autoInviteDlgDm = {}

dm.autoInviteDefaultDm = {}

dm.rewardTaskDm = {
	{  920,  412, 0xae927a},
	{ 1006,  411, 0xae927a},
	{ 1101,  409, 0xae927a},
	{ 1038,  535, 0x9a7e66},
	{ 1344,  849, 0x6cae67},
	{ 1367,  856, 0x6fb16a},
	{ 1381,  847, 0x75b770},
	{ 1359, 1003, 0xd17463},
	{ 1381, 1019, 0xd1725e},
	
	name = "悬赏任务"
	
}

dm.inviteTeamDm = {
	{   63,  395, 0xd17560},
	{   75,  408, 0xc96e5c},
	{  207,  409, 0x69af69},
	{  241,  409, 0x6eb46c},
	{  314,  419, 0xe3dac9},
	{  338,  428, 0xe4dbcc},
	{  319,  436, 0xe6ddce},
	{  311,  422, 0xe6ddce},
	{  355,  407, 0xe4d9c7},
	{  366,  408, 0xe3d7c7},
	
	name = "正常加入队伍"
}

dm.normalBegin = {}

dm.battleOKExpDm = {
	{  255, 1425, 0x38679b},
	{  257, 1439, 0x7da0d8},
	{  256, 1451, 0x7192c8},
	{  243, 1452, 0x8da4ce},
	{  259, 1436, 0x7391cf},
	{  265, 1436, 0x8299b8},
	{  266, 1449, 0xf1e85d},
	{  267, 1460, 0xe5c848},

	name = "经验buff"
}

local rect = {}  date.rect = rect

rect.rewardTaskCancelRect = {1338, 989, 1396, 1036}

rect.battleOKRect = { 1730, 268, 1898, 1182}

rect.inviteTeamAutoReciveRect = {356, 381, 401, 444}

rect.inviteTeamReciveRect = {}

rect.autoInviteCancelRect = {}

rect.autoInviteDefaultActiveRect = {}

rect.beginYuhunBattleRect = {}

rect.over6000DlgRect = {}

rect.normalBeginRect = {}

rect.autoInviteSendRect = {}

rect.rewardTaskReciveRect = {1340, 815, 1397, 875}


return date
