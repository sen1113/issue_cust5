	.file	"issue.c"
	.section .text
	.align	4
.proc	create_str
	.global create_str
	.type	create_str, @function
create_str:
.LFB3:
	l.sw    	-8(r1),r2	 # SI store
.LCFI0:
	l.addi  	r2,r1,0
.LCFI1:
	l.sw    	-4(r1),r9	 # SI store
.LCFI2:
	l.addi	r1,r1,-12	# allocate frame
.LCFI3:
	l.addi  	r3,r0,16	 # move immediate I
	l.jal   	malloc
	l.nop			# nop delay slot
	l.ori   	r3,r11,0	 # move reg to reg
	l.sw    	-12(r2),r3	 # SI store
	l.lwz   	r3,-12(r2)	 # SI load
	l.sfeqi	r3,0
	l.bf	.L2
	l.nop			# nop delay slot
	l.lwz   	r3,-12(r2)	 # SI load
	l.addi  	r4,r0,0	 # move immediate I
	l.sw    	0(r3),r4	 # SI store
	l.lwz   	r3,-12(r2)	 # SI load
	l.addi  	r4,r0,0	 # move immediate I
	l.sw    	4(r3),r4	 # SI store
	l.lwz   	r3,-12(r2)	 # SI load
	l.addi  	r4,r0,0	 # move immediate I
	l.sw    	8(r3),r4	 # SI store
	l.lwz   	r3,-12(r2)	 # SI load
	l.addi  	r4,r0,0	 # move immediate I
	l.sw    	12(r3),r4	 # SI store
.L2:
	l.lwz   	r3,-12(r2)	 # SI load
	l.ori   	r11,r3,0	 # move reg to reg
	l.ori	r1,r2,0	# deallocate frame
	l.lwz   	r2,-8(r1)	 # SI load
	l.lwz   	r9,-4(r1)	 # SI load
	l.jr    	r9
	l.nop			# nop delay slot
.LFE3:
	.size	create_str, .-create_str
	.align	4
.proc	destroy_str
	.global destroy_str
	.type	destroy_str, @function
destroy_str:
.LFB4:
	l.sw    	-8(r1),r2	 # SI store
.LCFI4:
	l.addi  	r2,r1,0
.LCFI5:
	l.sw    	-4(r1),r9	 # SI store
.LCFI6:
	l.addi	r1,r1,-12	# allocate frame
.LCFI7:
	l.sw    	-12(r2),r3	 # SI store
	l.lwz   	r3,-12(r2)	 # SI load
	l.sfeqi	r3,0
	l.bf	.L3
	l.nop			# nop delay slot
	l.lwz   	r3,-12(r2)	 # SI load
	l.jal   	free
	l.nop			# nop delay slot
.L3:
	l.ori	r1,r2,0	# deallocate frame
	l.lwz   	r2,-8(r1)	 # SI load
	l.lwz   	r9,-4(r1)	 # SI load
	l.jr    	r9
	l.nop			# nop delay slot
.LFE4:
	.size	destroy_str, .-destroy_str
	.section	.rodata
.LC0:
	.string	"rb"
.LC1:
	.string	"Can't Open File\n"
.LC2:
	.string	"Filesize:%ld\n"
.LC3:
	.string	"%p"
.LC4:
	.string	"fp_addr:%p\n"
.LC5:
	.string	"input:%p\n"
.LC6:
	.string	"size:%d\n"
.LC7:
	.string	"buf:%s\n"
.LC8:
	.string	"contents of top_addr:%s\n"
.LC9:
	.string	"target_addr:%p\n"
.LC10:
	.string	"%d\t %08lx\n"
.LC11:
	.string	"%d\t %08lx %08lx\n"
.LC12:
	.string	"tmp1:%08lx\n"
.LC13:
	.string	"tmp2:%08lx\n"
.LC14:
	.string	"tmp3:%08lx\n"
.LC15:
	.string	"tmp4:%08lx\n"
.LC16:
	.string	"tmp5:%08lx\n"
.LC17:
	.string	"tmp6:%08lx\n"
.LC18:
	.string	"tmp7:%08lx\n"
.LC19:
	.string	"tmp8:%08lx\n"
.LC20:
	.string	"tmp9:%08lx\n"
.LC21:
	.string	"tmp10:%08lx\n"
.LC22:
	.string	"tmp11:%08lx\n"
.LC23:
	.string	"tmp12:%08lx\n"
.LC24:
	.string	"tmp13:%08lx\n"
.LC25:
	.string	"tmp14:%08lx\n"
.LC26:
	.string	"tmp15:%08lx\n"
.LC27:
	.string	"tmp16:%08lx\n"
.LC28:
	.string	"----------------------------------"
.LC29:
	.string	"SHA-3:KECCAK input"
.LC30:
	.string	"%d:%08lx\n"
.LC31:
	.string	"%d:%s\n"
.LC32:
	.string	"SHA-3:KECCAK output 512bit hash..."
.LC33:
	.string	"%d:\t%p  %08lx\n"
	.section .text
	.align	4
.proc	main
	.global main
	.type	main, @function
main:
.LFB5:
	l.sw    	-8(r1),r2	 # SI store
.LCFI8:
	l.addi  	r2,r1,0
.LCFI9:
	l.sw    	-4(r1),r9	 # SI store
.LCFI10:
	l.sw    	-44(r1),r14	 # SI store
.LCFI11:
	l.sw    	-40(r1),r16	 # SI store
.LCFI12:
	l.sw    	-36(r1),r18	 # SI store
.LCFI13:
	l.sw    	-32(r1),r20	 # SI store
.LCFI14:
	l.sw    	-28(r1),r22	 # SI store
.LCFI15:
	l.sw    	-24(r1),r24	 # SI store
.LCFI16:
	l.sw    	-20(r1),r26	 # SI store
.LCFI17:
	l.sw    	-16(r1),r28	 # SI store
.LCFI18:
	l.sw    	-12(r1),r30	 # SI store
.LCFI19:
	l.addi	r1,r1,-236	# allocate frame
.LCFI20:
	l.sw    	-188(r2),r3	 # SI store
	l.sw    	-192(r2),r4	 # SI store
	l.addi  	r3,r0,64	 # move immediate I
	l.sw    	-52(r2),r3	 # SI store
	l.lwz   	r3,-192(r2)	 # SI load
	l.addi  	r3,r3,4
	l.lwz   	r3,0(r3)	 # SI load
	l.jal   	strlen
	l.nop			# nop delay slot
	l.ori   	r3,r11,0	 # move reg to reg
	l.addi  	r3,r3,1
	l.jal   	malloc
	l.nop			# nop delay slot
	l.ori   	r3,r11,0	 # move reg to reg
	l.sw    	-56(r2),r3	 # SI store
	l.lwz   	r3,-192(r2)	 # SI load
	l.addi  	r3,r3,4
	l.lwz   	r3,0(r3)	 # SI load
	l.ori   	r14,r3,0	 # move reg to reg
	l.lwz   	r3,-192(r2)	 # SI load
	l.addi  	r3,r3,4
	l.lwz   	r3,0(r3)	 # SI load
	l.jal   	strlen
	l.nop			# nop delay slot
	l.ori   	r3,r11,0	 # move reg to reg
	l.addi  	r5,r3,1
	l.lwz   	r3,-56(r2)	 # SI load
	l.ori   	r4,r14,0	 # move reg to reg
	l.jal   	strncpy
	l.nop			# nop delay slot
	l.lwz   	r3,-56(r2)	 # SI load
	l.movhi  	r4,hi(.LC0)
	l.ori   	r4,r4,lo(.LC0)
	l.jal   	fopen
	l.nop			# nop delay slot
	l.sw    	-60(r2),r11	 # SI store
	l.lwz   	r3,-60(r2)	 # SI load
	l.sfnei	r3,0
	l.bf	.L6
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC1)
	l.ori   	r3,r3,lo(.LC1)
	l.movhi  	r4,hi(stderr)
	l.ori   	r4,r4,lo(stderr)
	l.lwz   	r6,0(r4)	 # SI load
	l.addi  	r4,r0,1	 # move immediate I
	l.addi  	r5,r0,16	 # move immediate I
	l.jal   	fwrite
	l.nop			# nop delay slot
	l.addi  	r3,r0,2	 # move immediate I
	l.jal   	exit
	l.nop			# nop delay slot
.L6:
	l.lwz   	r3,-60(r2)	 # SI load
	l.addi  	r4,r0,0	 # move immediate I
	l.addi  	r5,r0,2	 # move immediate I
	l.jal   	fseek
	l.nop			# nop delay slot
	l.lwz   	r3,-60(r2)	 # SI load
	l.jal   	ftell
	l.nop			# nop delay slot
	l.ori   	r3,r11,0	 # move reg to reg
	l.sw    	-64(r2),r3	 # SI store
	l.movhi  	r3,hi(.LC2)
	l.ori   	r3,r3,lo(.LC2)
	l.lwz   	r4,-64(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.lwz   	r3,-60(r2)	 # SI load
	l.addi  	r4,r0,0	 # move immediate I
	l.addi  	r5,r0,0	 # move immediate I
	l.jal   	fseek
	l.nop			# nop delay slot
	l.lwz   	r3,-64(r2)	 # SI load
	l.jal   	malloc
	l.nop			# nop delay slot
	l.ori   	r3,r11,0	 # move reg to reg
	l.sw    	-68(r2),r3	 # SI store
	l.lwz   	r3,-68(r2)	 # SI load
	l.addi  	r4,r0,1	 # move immediate I
	l.lwz   	r5,-64(r2)	 # SI load
	l.lwz   	r6,-60(r2)	 # SI load
	l.jal   	fread
	l.nop			# nop delay slot
	l.sw    	-72(r2),r11	 # SI store
	l.lwz   	r3,-52(r2)	 # SI load
	l.jal   	malloc
	l.nop			# nop delay slot
	l.ori   	r3,r11,0	 # move reg to reg
	l.sw    	-76(r2),r3	 # SI store
	l.jal   	create_str
	l.nop			# nop delay slot
	l.sw    	-80(r2),r11	 # SI store
	l.movhi  	r4,hi(.LC3)
	l.ori   	r4,r4,lo(.LC3)
	l.addi  	r3,r2,-184
	l.lwz   	r5,-68(r2)	 # SI load
	l.sw    	0(r1),r5	 # SI store
	l.jal   	sprintf
	l.nop			# nop delay slot
	l.addi  	r3,r2,-184
	l.addi  	r4,r0,0	 # move immediate I
	l.addi  	r5,r0,16	 # move immediate I
	l.jal   	strtoul
	l.nop			# nop delay slot
	l.ori   	r4,r11,0	 # move reg to reg
	l.lwz   	r3,-80(r2)	 # SI load
	l.sw    	0(r3),r4	 # SI store
	l.movhi  	r4,hi(.LC3)
	l.ori   	r4,r4,lo(.LC3)
	l.addi  	r3,r2,-184
	l.lwz   	r5,-76(r2)	 # SI load
	l.sw    	0(r1),r5	 # SI store
	l.jal   	sprintf
	l.nop			# nop delay slot
	l.addi  	r3,r2,-184
	l.addi  	r4,r0,0	 # move immediate I
	l.addi  	r5,r0,16	 # move immediate I
	l.jal   	strtoul
	l.nop			# nop delay slot
	l.ori   	r4,r11,0	 # move reg to reg
	l.lwz   	r3,-80(r2)	 # SI load
	l.sw    	12(r3),r4	 # SI store
	l.lwz   	r3,-80(r2)	 # SI load
	l.lwz   	r4,-72(r2)	 # SI load
	l.sw    	4(r3),r4	 # SI store
	l.movhi  	r3,hi(.LC4)
	l.ori   	r3,r3,lo(.LC4)
	l.lwz   	r4,-60(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC5)
	l.ori   	r3,r3,lo(.LC5)
	l.lwz   	r4,-68(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC6)
	l.ori   	r3,r3,lo(.LC6)
	l.lwz   	r4,-72(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC7)
	l.ori   	r3,r3,lo(.LC7)
	l.addi  	r4,r2,-184
	l.sw    	0(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC8)
	l.ori   	r3,r3,lo(.LC8)
	l.lwz   	r4,-80(r2)	 # SI load
	l.lwz   	r4,0(r4)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC9)
	l.ori   	r3,r3,lo(.LC9)
	l.lwz   	r4,-76(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.addi  	r3,r0,0	 # move immediate I
	l.sw    	-48(r2),r3	 # SI store
	l.lwz   	r3,-72(r2)	 # SI load
	l.srai  	r4,r3,31
	l.andi  	r4,r4,3
	l.add   	r3,r4,r3
	l.srai  	r3,r3,2
	l.sw    	-84(r2),r3	 # SI store
	l.addi  	r6,r0,0	 # move immediate I
	l.sw    	-88(r2),r6	 # SI store
	l.addi  	r7,r0,0	 # move immediate I
	l.sw    	-92(r2),r7	 # SI store
	l.addi  	r8,r0,0	 # move immediate I
	l.sw    	-96(r2),r8	 # SI store
	l.addi  	r11,r0,0	 # move immediate I
	l.sw    	-100(r2),r11	 # SI store
	l.addi  	r12,r0,0	 # move immediate I
	l.sw    	-104(r2),r12	 # SI store
	l.addi  	r13,r0,0	 # move immediate I
	l.sw    	-108(r2),r13	 # SI store
	l.addi  	r15,r0,0	 # move immediate I
	l.sw    	-112(r2),r15	 # SI store
	l.addi  	r17,r0,0	 # move immediate I
	l.sw    	-116(r2),r17	 # SI store
	l.addi  	r3,r0,0	 # move immediate I
	l.sw    	-120(r2),r3	 # SI store
	l.addi  	r6,r0,0	 # move immediate I
	l.sw    	-124(r2),r6	 # SI store
	l.addi  	r7,r0,0	 # move immediate I
	l.sw    	-128(r2),r7	 # SI store
	l.addi  	r8,r0,0	 # move immediate I
	l.sw    	-132(r2),r8	 # SI store
	l.addi  	r11,r0,0	 # move immediate I
	l.sw    	-136(r2),r11	 # SI store
	l.addi  	r12,r0,0	 # move immediate I
	l.sw    	-140(r2),r12	 # SI store
	l.addi  	r13,r0,0	 # move immediate I
	l.sw    	-144(r2),r13	 # SI store
	l.addi  	r15,r0,0	 # move immediate I
	l.sw    	-148(r2),r15	 # SI store
	l.addi  	r17,r0,0	 # move immediate I
	l.sw    	-152(r2),r17	 # SI store
	l.addi  	r3,r0,0	 # move immediate I
	l.sw    	-156(r2),r3	 # SI store
	l.addi  	r6,r0,0	 # move immediate I
	l.sw    	-160(r2),r6	 # SI store
	l.addi  	r7,r0,0	 # move immediate I
	l.sw    	-164(r2),r7	 # SI store
	l.addi  	r8,r0,0	 # move immediate I
	l.sw    	-168(r2),r8	 # SI store
	l.addi  	r11,r0,0	 # move immediate I
	l.sw    	-48(r2),r11	 # SI store
	l.j     	.L7
	l.nop			# nop delay slot
.L11:
	l.lwz   	r3,-80(r2)	 # SI load
	l.lwz   	r4,0(r3)	 # SI load
	l.lwz   	r3,-48(r2)	 # SI load
	l.slli  	r3,r3,2
	l.add   	r3,r4,r3
	l.sw    	-172(r2),r3	 # SI store
	l.lwz   	r3,-48(r2)	 # SI load
	l.sfnei	r3,0
	l.bf	.L8
	l.nop			# nop delay slot
	l.lwz   	r3,-172(r2)	 # SI load
	l.lwz   	r4,-100(r2)	 # SI load
	l.lwz   	r5,-104(r2)	 # SI load
#APP
# 120 "issue.c" 1
	l.lwz r14,0(r3)
	l.cust5 r4,r14,r5,0,4
	
# 0 "" 2
#NO_APP
	l.sw    	-96(r2),r14	 # SI store
	l.movhi  	r3,hi(.LC10)
	l.ori   	r3,r3,lo(.LC10)
	l.lwz   	r4,-48(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.lwz   	r4,-96(r2)	 # SI load
	l.sw    	4(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.j     	.L9
	l.nop			# nop delay slot
.L8:
	l.lwz   	r3,-84(r2)	 # SI load
	l.addi  	r4,r3,-1
	l.lwz   	r3,-48(r2)	 # SI load
	l.sfles 	r4,r3
	l.bf	.L10
	l.nop			# nop delay slot
	l.lwz   	r3,-172(r2)	 # SI load
	l.lwz   	r4,-100(r2)	 # SI load
	l.lwz   	r5,-104(r2)	 # SI load
#APP
# 129 "issue.c" 1
	l.lwz r14,0(r3)
	l.cust5 r4,r14,r5,0,2
	
# 0 "" 2
#NO_APP
	l.sw    	-96(r2),r14	 # SI store
	l.movhi  	r3,hi(.LC10)
	l.ori   	r3,r3,lo(.LC10)
	l.lwz   	r4,-48(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.lwz   	r4,-96(r2)	 # SI load
	l.sw    	4(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.j     	.L9
	l.nop			# nop delay slot
.L10:
	l.lwz   	r3,-84(r2)	 # SI load
	l.addi  	r4,r3,-1
	l.lwz   	r3,-48(r2)	 # SI load
	l.sfne 	r4,r3
	l.bf	.L9
	l.nop			# nop delay slot
	l.lwz   	r3,-172(r2)	 # SI load
	l.lwz   	r4,-100(r2)	 # SI load
	l.lwz   	r5,-104(r2)	 # SI load
#APP
# 138 "issue.c" 1
	l.lwz r16,0(r3)
	l.cust5 r4,r16,r5,0,1
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.cust5 r14,r4,r4, 15,8
	
# 0 "" 2
#NO_APP
	l.sw    	-96(r2),r16	 # SI store
	l.sw    	-108(r2),r14	 # SI store
	l.movhi  	r3,hi(.LC11)
	l.ori   	r3,r3,lo(.LC11)
	l.lwz   	r4,-48(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.lwz   	r4,-96(r2)	 # SI load
	l.sw    	4(r1),r4	 # SI store
	l.lwz   	r4,-108(r2)	 # SI load
	l.sw    	8(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
.L9:
	l.lwz   	r3,-48(r2)	 # SI load
	l.addi  	r3,r3,1
	l.sw    	-48(r2),r3	 # SI store
.L7:
	l.lwz   	r3,-84(r2)	 # SI load
	l.addi  	r4,r3,-1
	l.lwz   	r3,-48(r2)	 # SI load
	l.sfges 	r4,r3
	l.bf	.L11
	l.nop			# nop delay slot
	l.lwz   	r3,-76(r2)	 # SI load
	l.lwz   	r4,-100(r2)	 # SI load
	l.lwz   	r5,-104(r2)	 # SI load
#APP
# 168 "issue.c" 1
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.cust5 r15,r4,r4, 14,8
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.cust5 r17,r4,r4, 13,8
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.cust5 r6,r4,r4, 12,8
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.cust5 r7,r4,r4, 11,8
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.cust5 r8,r4,r4, 10,8
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.cust5 r11,r4,r4, 9,8
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.cust5 r30,r4,r4, 8,8
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.cust5 r28,r4,r4, 7,8
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.cust5 r26,r4,r4, 6,8
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.cust5 r24,r4,r4, 5,8
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.cust5 r22,r4,r4, 4,8
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.cust5 r20,r4,r4, 3,8
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.cust5 r18,r4,r4, 2,8
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.cust5 r16,r4,r4, 1,8
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.nop 
	l.cust5 r14,r4,r4, 0,8
	l.sw 0(r3),r13
	l.sw 4(r3),r15
	l.sw 8(r3),r17
	l.sw 12(r3),r6
	l.sw 16(r3),r7
	l.sw 20(r3),r8
	l.sw 24(r3),r11
	l.sw 28(r3),r30
	l.sw 32(r3),r28
	l.sw 36(r3),r26
	l.sw 40(r3),r24
	l.sw 44(r3),r22
	l.sw 48(r3),r20
	l.sw 52(r3),r18
	l.sw 56(r3),r16
	l.sw 60(r3),r14
	
# 0 "" 2
#NO_APP
	l.sw    	-224(r2),r11	 # SI store
	l.sw    	-220(r2),r8	 # SI store
	l.sw    	-216(r2),r7	 # SI store
	l.sw    	-212(r2),r6	 # SI store
	l.sw    	-208(r2),r17	 # SI store
	l.sw    	-204(r2),r15	 # SI store
	l.sw    	-200(r2),r13	 # SI store
	l.sw    	-196(r2),r12	 # SI store
	l.lwz   	r12,-196(r2)	 # SI load
	l.sw    	-92(r2),r12	 # SI store
	l.lwz   	r13,-200(r2)	 # SI load
	l.sw    	-108(r2),r13	 # SI store
	l.lwz   	r15,-204(r2)	 # SI load
	l.sw    	-112(r2),r15	 # SI store
	l.lwz   	r17,-208(r2)	 # SI load
	l.sw    	-116(r2),r17	 # SI store
	l.lwz   	r3,-212(r2)	 # SI load
	l.sw    	-120(r2),r3	 # SI store
	l.lwz   	r6,-216(r2)	 # SI load
	l.sw    	-124(r2),r6	 # SI store
	l.lwz   	r7,-220(r2)	 # SI load
	l.sw    	-128(r2),r7	 # SI store
	l.lwz   	r8,-224(r2)	 # SI load
	l.sw    	-132(r2),r8	 # SI store
	l.sw    	-136(r2),r30	 # SI store
	l.sw    	-140(r2),r28	 # SI store
	l.sw    	-144(r2),r26	 # SI store
	l.sw    	-148(r2),r24	 # SI store
	l.sw    	-152(r2),r22	 # SI store
	l.sw    	-156(r2),r20	 # SI store
	l.sw    	-160(r2),r18	 # SI store
	l.sw    	-164(r2),r16	 # SI store
	l.sw    	-168(r2),r14	 # SI store
	l.movhi  	r3,hi(.LC12)
	l.ori   	r3,r3,lo(.LC12)
	l.lwz   	r4,-108(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC13)
	l.ori   	r3,r3,lo(.LC13)
	l.lwz   	r4,-112(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC14)
	l.ori   	r3,r3,lo(.LC14)
	l.lwz   	r4,-116(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC15)
	l.ori   	r3,r3,lo(.LC15)
	l.lwz   	r4,-120(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC16)
	l.ori   	r3,r3,lo(.LC16)
	l.lwz   	r4,-124(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC17)
	l.ori   	r3,r3,lo(.LC17)
	l.lwz   	r4,-128(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC18)
	l.ori   	r3,r3,lo(.LC18)
	l.lwz   	r4,-132(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC19)
	l.ori   	r3,r3,lo(.LC19)
	l.lwz   	r4,-136(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC20)
	l.ori   	r3,r3,lo(.LC20)
	l.lwz   	r4,-140(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC21)
	l.ori   	r3,r3,lo(.LC21)
	l.lwz   	r4,-144(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC22)
	l.ori   	r3,r3,lo(.LC22)
	l.lwz   	r4,-148(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC23)
	l.ori   	r3,r3,lo(.LC23)
	l.lwz   	r4,-152(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC24)
	l.ori   	r3,r3,lo(.LC24)
	l.lwz   	r4,-156(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC25)
	l.ori   	r3,r3,lo(.LC25)
	l.lwz   	r4,-160(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC26)
	l.ori   	r3,r3,lo(.LC26)
	l.lwz   	r4,-164(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC27)
	l.ori   	r3,r3,lo(.LC27)
	l.lwz   	r4,-168(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.lwz   	r3,-80(r2)	 # SI load
	l.lwz   	r3,0(r3)	 # SI load
	l.sw    	-172(r2),r3	 # SI store
	l.movhi  	r3,hi(.LC28)
	l.ori   	r3,r3,lo(.LC28)
	l.jal   	puts
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC29)
	l.ori   	r3,r3,lo(.LC29)
	l.jal   	puts
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC28)
	l.ori   	r3,r3,lo(.LC28)
	l.jal   	puts
	l.nop			# nop delay slot
	l.addi  	r11,r0,0	 # move immediate I
	l.sw    	-48(r2),r11	 # SI store
	l.j     	.L12
	l.nop			# nop delay slot
.L13:
	l.movhi  	r3,hi(.LC30)
	l.ori   	r3,r3,lo(.LC30)
	l.lwz   	r4,-48(r2)	 # SI load
	l.slli  	r4,r4,2
	l.ori   	r5,r4,0	 # move reg to reg
	l.lwz   	r4,-172(r2)	 # SI load
	l.add   	r4,r5,r4
	l.lwz   	r5,-48(r2)	 # SI load
	l.sw    	0(r1),r5	 # SI store
	l.sw    	4(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC31)
	l.ori   	r3,r3,lo(.LC31)
	l.lwz   	r4,-48(r2)	 # SI load
	l.slli  	r4,r4,2
	l.ori   	r5,r4,0	 # move reg to reg
	l.lwz   	r4,-172(r2)	 # SI load
	l.add   	r4,r5,r4
	l.lwz   	r5,-48(r2)	 # SI load
	l.sw    	0(r1),r5	 # SI store
	l.sw    	4(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.lwz   	r3,-48(r2)	 # SI load
	l.addi  	r3,r3,1
	l.sw    	-48(r2),r3	 # SI store
.L12:
	l.lwz   	r4,-48(r2)	 # SI load
	l.lwz   	r3,-72(r2)	 # SI load
	l.srli  	r3,r3,2
	l.sfltu 	r4,r3
	l.bf	.L13
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC28)
	l.ori   	r3,r3,lo(.LC28)
	l.jal   	puts
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC32)
	l.ori   	r3,r3,lo(.LC32)
	l.jal   	puts
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC28)
	l.ori   	r3,r3,lo(.LC28)
	l.jal   	puts
	l.nop			# nop delay slot
	l.addi  	r12,r0,0	 # move immediate I
	l.sw    	-48(r2),r12	 # SI store
	l.j     	.L14
	l.nop			# nop delay slot
.L15:
	l.movhi  	r3,hi(.LC33)
	l.ori   	r3,r3,lo(.LC33)
	l.lwz   	r4,-48(r2)	 # SI load
	l.slli  	r4,r4,2
	l.lwz   	r5,-76(r2)	 # SI load
	l.add   	r5,r5,r4
	l.lwz   	r4,-48(r2)	 # SI load
	l.slli  	r4,r4,2
	l.lwz   	r6,-76(r2)	 # SI load
	l.add   	r4,r6,r4
	l.lwz   	r4,0(r4)	 # SI load
	l.lwz   	r6,-48(r2)	 # SI load
	l.sw    	0(r1),r6	 # SI store
	l.sw    	4(r1),r5	 # SI store
	l.sw    	8(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.lwz   	r3,-48(r2)	 # SI load
	l.addi  	r3,r3,1
	l.sw    	-48(r2),r3	 # SI store
.L14:
	l.lwz   	r3,-48(r2)	 # SI load
	l.sflesi	r3,15
	l.bf	.L15
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC28)
	l.ori   	r3,r3,lo(.LC28)
	l.jal   	puts
	l.nop			# nop delay slot
	l.lwz   	r3,-60(r2)	 # SI load
	l.jal   	fclose
	l.nop			# nop delay slot
	l.lwz   	r3,-68(r2)	 # SI load
	l.jal   	free
	l.nop			# nop delay slot
	l.lwz   	r3,-76(r2)	 # SI load
	l.jal   	free
	l.nop			# nop delay slot
	l.lwz   	r3,-80(r2)	 # SI load
	l.jal   	destroy_str
	l.nop			# nop delay slot
	l.ori   	r11,r3,0	 # move reg to reg
	l.ori	r1,r2,0	# deallocate frame
	l.lwz   	r2,-8(r1)	 # SI load
	l.lwz   	r9,-4(r1)	 # SI load
	l.lwz   	r14,-44(r1)	 # SI load
	l.lwz   	r16,-40(r1)	 # SI load
	l.lwz   	r18,-36(r1)	 # SI load
	l.lwz   	r20,-32(r1)	 # SI load
	l.lwz   	r22,-28(r1)	 # SI load
	l.lwz   	r24,-24(r1)	 # SI load
	l.lwz   	r26,-20(r1)	 # SI load
	l.lwz   	r28,-16(r1)	 # SI load
	l.lwz   	r30,-12(r1)	 # SI load
	l.jr    	r9
	l.nop			# nop delay slot
.LFE5:
	.size	main, .-main
	.section	.debug_frame,"",@progbits
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x1
	.string	""
	.uleb128 0x1
	.sleb128 -4
	.byte	0x9
	.byte	0xc
	.uleb128 0x1
	.uleb128 0x0
	.align	4
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI0-.LFB3
	.byte	0x82
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xd
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI3-.LCFI1
	.byte	0x89
	.uleb128 0x1
	.align	4
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x4
	.4byte	.LCFI4-.LFB4
	.byte	0x82
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0xd
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI7-.LCFI5
	.byte	0x89
	.uleb128 0x1
	.align	4
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI8-.LFB5
	.byte	0x82
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI9-.LCFI8
	.byte	0xd
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI20-.LCFI9
	.byte	0x9e
	.uleb128 0x3
	.byte	0x9c
	.uleb128 0x4
	.byte	0x9a
	.uleb128 0x5
	.byte	0x98
	.uleb128 0x6
	.byte	0x96
	.uleb128 0x7
	.byte	0x94
	.uleb128 0x8
	.byte	0x92
	.uleb128 0x9
	.byte	0x90
	.uleb128 0xa
	.byte	0x8e
	.uleb128 0xb
	.byte	0x89
	.uleb128 0x1
	.align	4
.LEFDE4:
	.ident	"GCC: (OpenRISC 32-bit toolchain for or32-linux (built 20111017)) 4.5.1-or32-1.0rc4"
