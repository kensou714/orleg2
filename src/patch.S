
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
.file ".\\src\\patch\\patch_Exp_Table.S"
.line 9
	XXPATCH16PTR32(0x1005C810, ExpTableCN)


.file ".\\src\\patch\\patch_Exp_Table.S"
.line 11
	XXPATCH16PTR32(0x1005CBF0, ExpTableCN)


.file ".\\src\\patch\\patch_Exp_Table.S"
.line 13
	XXPATCH16PTR32(0x1005D0A8, ExpTableCN)


.file ".\\src\\patch\\patch_Exp_Table.S"
.line 15
	XXPATCH16PTR32(0x10064FBC, ExpTableCN)


.file ".\\src\\patch\\patch_Exp_Table.S"
.line 17
	XXPATCH16PTR32(0x10065438, ExpTableCN)


.file ".\\src\\patch\\hook.S"
.line 4
	XXPATCH16JMP16(0x10073A02,hook_GiveStartItem)

	//启动函数

.file __FILE__
.line __LINE__
XXEXPORT_END(dumpy)
.org ROM_FREE
XXEXPORT_START(ccode)
