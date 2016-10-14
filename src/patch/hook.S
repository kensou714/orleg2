	//这个是HOOK了屏幕刷新函数，在里面增加了屏幕文字显示测试
	XXPATCH16JMP16(0x1002F81A,hook_screen_update)