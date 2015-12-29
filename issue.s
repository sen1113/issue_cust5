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
	.string	"hash32:%08lx\n"
.LC12:
	.string	"----------------------------------"
.LC13:
	.string	"SHA-3:KECCAK input"
.LC14:
	.string	"%d:%08lx\n"
.LC15:
	.string	"%d:%s\n"
.LC16:
	.string	"SHA-3:KECCAK output 512bit hash..."
.LC17:
	.string	"%d:%p\n"
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
	l.sw    	-12(r1),r14	 # SI store
.LCFI11:
	l.addi	r1,r1,-100	# allocate frame
.LCFI12:
	l.sw    	-88(r2),r3	 # SI store
	l.sw    	-92(r2),r4	 # SI store
	l.addi  	r3,r0,64	 # move immediate I
	l.sw    	-24(r2),r3	 # SI store
	l.lwz   	r3,-92(r2)	 # SI load
	l.addi  	r3,r3,4
	l.lwz   	r3,0(r3)	 # SI load
	l.jal   	strlen
	l.nop			# nop delay slot
	l.ori   	r3,r11,0	 # move reg to reg
	l.addi  	r3,r3,1
	l.jal   	malloc
	l.nop			# nop delay slot
	l.ori   	r3,r11,0	 # move reg to reg
	l.sw    	-28(r2),r3	 # SI store
	l.lwz   	r3,-92(r2)	 # SI load
	l.addi  	r3,r3,4
	l.lwz   	r3,0(r3)	 # SI load
	l.ori   	r14,r3,0	 # move reg to reg
	l.lwz   	r3,-92(r2)	 # SI load
	l.addi  	r3,r3,4
	l.lwz   	r3,0(r3)	 # SI load
	l.jal   	strlen
	l.nop			# nop delay slot
	l.ori   	r3,r11,0	 # move reg to reg
	l.addi  	r5,r3,1
	l.lwz   	r3,-28(r2)	 # SI load
	l.ori   	r4,r14,0	 # move reg to reg
	l.jal   	strncpy
	l.nop			# nop delay slot
	l.lwz   	r3,-28(r2)	 # SI load
	l.movhi  	r4,hi(.LC0)
	l.ori   	r4,r4,lo(.LC0)
	l.jal   	fopen
	l.nop			# nop delay slot
	l.sw    	-32(r2),r11	 # SI store
	l.lwz   	r3,-32(r2)	 # SI load
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
	l.lwz   	r3,-32(r2)	 # SI load
	l.addi  	r4,r0,0	 # move immediate I
	l.addi  	r5,r0,2	 # move immediate I
	l.jal   	fseek
	l.nop			# nop delay slot
	l.lwz   	r3,-32(r2)	 # SI load
	l.jal   	ftell
	l.nop			# nop delay slot
	l.ori   	r3,r11,0	 # move reg to reg
	l.sw    	-36(r2),r3	 # SI store
	l.movhi  	r3,hi(.LC2)
	l.ori   	r3,r3,lo(.LC2)
	l.lwz   	r4,-36(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.lwz   	r3,-32(r2)	 # SI load
	l.addi  	r4,r0,0	 # move immediate I
	l.addi  	r5,r0,0	 # move immediate I
	l.jal   	fseek
	l.nop			# nop delay slot
	l.lwz   	r3,-36(r2)	 # SI load
	l.jal   	malloc
	l.nop			# nop delay slot
	l.ori   	r3,r11,0	 # move reg to reg
	l.sw    	-40(r2),r3	 # SI store
	l.lwz   	r3,-40(r2)	 # SI load
	l.addi  	r4,r0,1	 # move immediate I
	l.lwz   	r5,-36(r2)	 # SI load
	l.lwz   	r6,-32(r2)	 # SI load
	l.jal   	fread
	l.nop			# nop delay slot
	l.sw    	-44(r2),r11	 # SI store
	l.lwz   	r3,-24(r2)	 # SI load
	l.jal   	malloc
	l.nop			# nop delay slot
	l.ori   	r3,r11,0	 # move reg to reg
	l.sw    	-48(r2),r3	 # SI store
	l.jal   	create_str
	l.nop			# nop delay slot
	l.sw    	-52(r2),r11	 # SI store
	l.movhi  	r4,hi(.LC3)
	l.ori   	r4,r4,lo(.LC3)
	l.addi  	r3,r2,-84
	l.lwz   	r5,-40(r2)	 # SI load
	l.sw    	0(r1),r5	 # SI store
	l.jal   	sprintf
	l.nop			# nop delay slot
	l.addi  	r3,r2,-84
	l.addi  	r4,r0,0	 # move immediate I
	l.addi  	r5,r0,16	 # move immediate I
	l.jal   	strtoul
	l.nop			# nop delay slot
	l.ori   	r4,r11,0	 # move reg to reg
	l.lwz   	r3,-52(r2)	 # SI load
	l.sw    	0(r3),r4	 # SI store
	l.movhi  	r4,hi(.LC3)
	l.ori   	r4,r4,lo(.LC3)
	l.addi  	r3,r2,-84
	l.lwz   	r5,-48(r2)	 # SI load
	l.sw    	0(r1),r5	 # SI store
	l.jal   	sprintf
	l.nop			# nop delay slot
	l.addi  	r3,r2,-84
	l.addi  	r4,r0,0	 # move immediate I
	l.addi  	r5,r0,16	 # move immediate I
	l.jal   	strtoul
	l.nop			# nop delay slot
	l.ori   	r4,r11,0	 # move reg to reg
	l.lwz   	r3,-52(r2)	 # SI load
	l.sw    	12(r3),r4	 # SI store
	l.lwz   	r3,-52(r2)	 # SI load
	l.lwz   	r4,-44(r2)	 # SI load
	l.sw    	4(r3),r4	 # SI store
	l.movhi  	r3,hi(.LC4)
	l.ori   	r3,r3,lo(.LC4)
	l.lwz   	r4,-32(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC5)
	l.ori   	r3,r3,lo(.LC5)
	l.lwz   	r4,-40(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC6)
	l.ori   	r3,r3,lo(.LC6)
	l.lwz   	r4,-44(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC7)
	l.ori   	r3,r3,lo(.LC7)
	l.addi  	r4,r2,-84
	l.sw    	0(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC8)
	l.ori   	r3,r3,lo(.LC8)
	l.lwz   	r4,-52(r2)	 # SI load
	l.lwz   	r4,0(r4)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC9)
	l.ori   	r3,r3,lo(.LC9)
	l.lwz   	r4,-48(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.addi  	r3,r0,0	 # move immediate I
	l.sw    	-16(r2),r3	 # SI store
	l.lwz   	r3,-44(r2)	 # SI load
	l.srai  	r4,r3,31
	l.andi  	r4,r4,3
	l.add   	r3,r4,r3
	l.srai  	r3,r3,2
	l.sw    	-56(r2),r3	 # SI store
	l.addi  	r3,r0,0	 # move immediate I
	l.sw    	-60(r2),r3	 # SI store
	l.addi  	r3,r0,0	 # move immediate I
	l.sw    	-64(r2),r3	 # SI store
	l.addi  	r3,r0,0	 # move immediate I
	l.sw    	-20(r2),r3	 # SI store
	l.addi  	r3,r0,0	 # move immediate I
	l.sw    	-68(r2),r3	 # SI store
	l.addi  	r3,r0,0	 # move immediate I
	l.sw    	-16(r2),r3	 # SI store
	l.j     	.L7
	l.nop			# nop delay slot
.L11:
	l.lwz   	r3,-52(r2)	 # SI load
	l.lwz   	r4,0(r3)	 # SI load
	l.lwz   	r3,-16(r2)	 # SI load
	l.slli  	r3,r3,2
	l.add   	r3,r4,r3
	l.sw    	-72(r2),r3	 # SI store
	l.lwz   	r3,-16(r2)	 # SI load
	l.sfnei	r3,0
	l.bf	.L8
	l.nop			# nop delay slot
	l.lwz   	r3,-72(r2)	 # SI load
	l.lwz   	r4,-68(r2)	 # SI load
#APP
# 100 "issue.c" 1
	l.lwz r14,0(r3)
	l.cust5 r4,r14,r3,0,4
	
# 0 "" 2
#NO_APP
	l.sw    	-20(r2),r14	 # SI store
	l.movhi  	r3,hi(.LC10)
	l.ori   	r3,r3,lo(.LC10)
	l.lwz   	r4,-16(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.lwz   	r4,-20(r2)	 # SI load
	l.sw    	4(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.j     	.L9
	l.nop			# nop delay slot
.L8:
	l.lwz   	r3,-56(r2)	 # SI load
	l.addi  	r4,r3,-1
	l.lwz   	r3,-16(r2)	 # SI load
	l.sfles 	r4,r3
	l.bf	.L10
	l.nop			# nop delay slot
	l.lwz   	r3,-72(r2)	 # SI load
	l.lwz   	r4,-68(r2)	 # SI load
#APP
# 109 "issue.c" 1
	l.lwz r14,0(r3)
	l.cust5 r4,r14,r3,0,2
	
# 0 "" 2
#NO_APP
	l.sw    	-20(r2),r14	 # SI store
	l.movhi  	r3,hi(.LC10)
	l.ori   	r3,r3,lo(.LC10)
	l.lwz   	r4,-16(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.lwz   	r4,-20(r2)	 # SI load
	l.sw    	4(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.j     	.L9
	l.nop			# nop delay slot
.L10:
	l.lwz   	r3,-56(r2)	 # SI load
	l.addi  	r4,r3,-1
	l.lwz   	r3,-16(r2)	 # SI load
	l.sfne 	r4,r3
	l.bf	.L9
	l.nop			# nop delay slot
	l.lwz   	r3,-72(r2)	 # SI load
	l.lwz   	r4,-68(r2)	 # SI load
#APP
# 118 "issue.c" 1
	l.lwz r14,0(r3)
	l.cust5 r4,r14,r3,0,1
	
# 0 "" 2
#NO_APP
	l.sw    	-20(r2),r14	 # SI store
	l.movhi  	r3,hi(.LC10)
	l.ori   	r3,r3,lo(.LC10)
	l.lwz   	r4,-16(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.lwz   	r4,-20(r2)	 # SI load
	l.sw    	4(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
.L9:
	l.lwz   	r3,-16(r2)	 # SI load
	l.addi  	r3,r3,1
	l.sw    	-16(r2),r3	 # SI store
.L7:
	l.lwz   	r3,-56(r2)	 # SI load
	l.addi  	r4,r3,-1
	l.lwz   	r3,-16(r2)	 # SI load
	l.sfges 	r4,r3
	l.bf	.L11
	l.nop			# nop delay slot
	l.addi  	r3,r0,10	 # move immediate I
	l.jal   	sleep
	l.nop			# nop delay slot
	l.lwz   	r3,-48(r2)	 # SI load
	l.lwz   	r4,-20(r2)	 # SI load
	l.lwz   	r5,-68(r2)	 # SI load
#APP
# 134 "issue.c" 1
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.nop 0
	l.cust5 r14, r5,r5,15,8
	l.cust5 r4,r5,r5, 0,8
	 l.sw 0(r3),r4
	 l.cust5 r4,r5,r5, 1,8
	 l.sw 4(r3),r4
	 l.cust5 r4,r5,r5, 2,8
	 l.sw 8(r3),r4
	 l.cust5 r4,r5,r5, 3,8
	 l.sw 12(r3),r4
	 l.cust5 r4,r5,r5, 4,8
	 l.sw 16(r3),r4
	 l.cust5 r4,r5,r5, 5,8
	 l.sw 20(r3),r4
	 l.cust5 r4,r5,r5, 6,8
	 l.sw 24(r3),r4
	 l.cust5 r4,r5,r5, 7,8
	 l.sw 28(r3),r4
	 l.cust5 r4,r5,r5, 8,8
	 l.sw 32(r3),r4
	 l.cust5 r4,r5,r5, 9,8
	 l.sw 36(r3),r4
	 l.cust5 r4,r5,r5,10,8
	 l.sw 40(r3),r4
	 l.cust5 r4,r5,r5,11,8
	 l.sw 44(r3),r4
	 l.cust5 r4,r5,r5,12,8
	 l.sw 48(r3),r4
	 l.cust5 r4,r5,r5,13,8
	 l.sw 52(r3),r4
	 l.cust5 r4,r5,r5,14,8
	 l.sw 56(r3),r4
	 l.cust5 r4,r5,r5,15,8
	 l.sw 60(r3),r4
	 
# 0 "" 2
#NO_APP
	l.sw    	-64(r2),r14	 # SI store
	l.movhi  	r3,hi(.LC11)
	l.ori   	r3,r3,lo(.LC11)
	l.lwz   	r4,-64(r2)	 # SI load
	l.sw    	0(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.lwz   	r3,-52(r2)	 # SI load
	l.lwz   	r3,0(r3)	 # SI load
	l.sw    	-72(r2),r3	 # SI store
	l.movhi  	r3,hi(.LC12)
	l.ori   	r3,r3,lo(.LC12)
	l.jal   	puts
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC13)
	l.ori   	r3,r3,lo(.LC13)
	l.jal   	puts
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC12)
	l.ori   	r3,r3,lo(.LC12)
	l.jal   	puts
	l.nop			# nop delay slot
	l.addi  	r3,r0,0	 # move immediate I
	l.sw    	-16(r2),r3	 # SI store
	l.j     	.L12
	l.nop			# nop delay slot
.L13:
	l.movhi  	r3,hi(.LC14)
	l.ori   	r3,r3,lo(.LC14)
	l.lwz   	r4,-16(r2)	 # SI load
	l.slli  	r4,r4,2
	l.ori   	r5,r4,0	 # move reg to reg
	l.lwz   	r4,-72(r2)	 # SI load
	l.add   	r4,r5,r4
	l.lwz   	r5,-16(r2)	 # SI load
	l.sw    	0(r1),r5	 # SI store
	l.sw    	4(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC15)
	l.ori   	r3,r3,lo(.LC15)
	l.lwz   	r4,-16(r2)	 # SI load
	l.slli  	r4,r4,2
	l.ori   	r5,r4,0	 # move reg to reg
	l.lwz   	r4,-72(r2)	 # SI load
	l.add   	r4,r5,r4
	l.lwz   	r5,-16(r2)	 # SI load
	l.sw    	0(r1),r5	 # SI store
	l.sw    	4(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.lwz   	r3,-16(r2)	 # SI load
	l.addi  	r3,r3,1
	l.sw    	-16(r2),r3	 # SI store
.L12:
	l.lwz   	r4,-16(r2)	 # SI load
	l.lwz   	r3,-44(r2)	 # SI load
	l.srli  	r3,r3,2
	l.sfltu 	r4,r3
	l.bf	.L13
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC12)
	l.ori   	r3,r3,lo(.LC12)
	l.jal   	puts
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC16)
	l.ori   	r3,r3,lo(.LC16)
	l.jal   	puts
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC12)
	l.ori   	r3,r3,lo(.LC12)
	l.jal   	puts
	l.nop			# nop delay slot
	l.addi  	r3,r0,0	 # move immediate I
	l.sw    	-16(r2),r3	 # SI store
	l.j     	.L14
	l.nop			# nop delay slot
.L15:
	l.movhi  	r3,hi(.LC17)
	l.ori   	r3,r3,lo(.LC17)
	l.lwz   	r4,-16(r2)	 # SI load
	l.slli  	r4,r4,2
	l.lwz   	r5,-48(r2)	 # SI load
	l.add   	r4,r5,r4
	l.lwz   	r5,-16(r2)	 # SI load
	l.sw    	0(r1),r5	 # SI store
	l.sw    	4(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC14)
	l.ori   	r3,r3,lo(.LC14)
	l.lwz   	r4,-16(r2)	 # SI load
	l.slli  	r4,r4,2
	l.lwz   	r5,-48(r2)	 # SI load
	l.add   	r4,r5,r4
	l.lwz   	r4,0(r4)	 # SI load
	l.lwz   	r5,-16(r2)	 # SI load
	l.sw    	0(r1),r5	 # SI store
	l.sw    	4(r1),r4	 # SI store
	l.jal   	printf
	l.nop			# nop delay slot
	l.lwz   	r3,-16(r2)	 # SI load
	l.addi  	r3,r3,1
	l.sw    	-16(r2),r3	 # SI store
.L14:
	l.lwz   	r3,-16(r2)	 # SI load
	l.sflesi	r3,15
	l.bf	.L15
	l.nop			# nop delay slot
	l.movhi  	r3,hi(.LC12)
	l.ori   	r3,r3,lo(.LC12)
	l.jal   	puts
	l.nop			# nop delay slot
	l.lwz   	r3,-32(r2)	 # SI load
	l.jal   	fclose
	l.nop			# nop delay slot
	l.lwz   	r3,-40(r2)	 # SI load
	l.jal   	free
	l.nop			# nop delay slot
	l.lwz   	r3,-48(r2)	 # SI load
	l.jal   	free
	l.nop			# nop delay slot
	l.lwz   	r3,-52(r2)	 # SI load
	l.jal   	destroy_str
	l.nop			# nop delay slot
	l.ori   	r11,r3,0	 # move reg to reg
	l.ori	r1,r2,0	# deallocate frame
	l.lwz   	r2,-8(r1)	 # SI load
	l.lwz   	r9,-4(r1)	 # SI load
	l.lwz   	r14,-12(r1)	 # SI load
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
	.4byte	.LCFI12-.LCFI9
	.byte	0x8e
	.uleb128 0x3
	.byte	0x89
	.uleb128 0x1
	.align	4
.LEFDE4:
	.ident	"GCC: (OpenRISC 32-bit toolchain for or32-linux (built 20111017)) 4.5.1-or32-1.0rc4"
