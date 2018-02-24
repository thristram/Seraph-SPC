   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
 317                     	switch	.ubsct
 318  0000               _action_flag:
 319  0000 00            	ds.b	1
 320                     	xdef	_action_flag
 321  0001               _last_ch3_status:
 322  0001 00            	ds.b	1
 323                     	xdef	_last_ch3_status
 324  0002               _last_ch2_status:
 325  0002 00            	ds.b	1
 326                     	xdef	_last_ch2_status
 327  0003               _last_ch1_status:
 328  0003 00            	ds.b	1
 329                     	xdef	_last_ch1_status
 330  0004               _channel:
 331  0004 00            	ds.b	1
 332                     	xdef	_channel
 333  0005               _spc:
 334  0005 000000000000  	ds.b	33
 335                     	xdef	_spc
 355                     	end
