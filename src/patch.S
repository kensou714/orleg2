
#include "xxpacth_include.h"
.text
XXEXPORT_START(dumpy)

.file ".\\src\\patch\\retarget.S"
.line 1
	XXPATCH32(0x10000000)
	.extern _system_init
	//STMFD           SP!, {R4,LR}
	//BLX             sub_1002F90C
	//LDMFD           SP!, {R4,PC}
	ldr pc, =_system_init+1
	.ltorg



.file ".\\src\\patch\\hook.S"
.line 1
	XXPATCH16JMP16(0x1002F81A,hook_screen_update)

	//赠送游戏初始道具的地方

.file ".\\src\\patch\\hook.S"
.line 7
	XXPATCH16JMP16(0x1002F90C,hook_Init)
.file ".\\src\\patch\\hook.S"
.line 4
	XXPATCH16JMP16(0x10073A02,hook_GiveStartItem)

	//启动函数

.file __FILE__
.line __LINE__
XXEXPORT_END(dumpy)
.org ROM_FREE
XXEXPORT_START(ccode)
