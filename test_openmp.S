	.file	"test_openmp.cpp"
# GNU C++14 (Ubuntu 7.5.0-3ubuntu1~18.04) version 7.5.0 (x86_64-linux-gnu)
#	compiled by GNU C version 7.5.0, GMP version 6.1.2, MPFR version 4.0.1, MPC version 1.1.0, isl version isl-0.19-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu -D_GNU_SOURCE -D_REENTRANT
# test_openmp.cpp -mtune=generic -march=x86-64 -auxbase-strip test_openmp
# -fopenmp -fverbose-asm -fstack-protector-strong -Wformat
# -Wformat-security
# options enabled:  -fPIC -fPIE -faggressive-loop-optimizations
# -fasynchronous-unwind-tables -fauto-inc-dec -fchkp-check-incomplete-type
# -fchkp-check-read -fchkp-check-write -fchkp-instrument-calls
# -fchkp-narrow-bounds -fchkp-optimize -fchkp-store-bounds
# -fchkp-use-static-bounds -fchkp-use-static-const-bounds
# -fchkp-use-wrappers -fcommon -fdelete-null-pointer-checks
# -fdwarf2-cfi-asm -fearly-inlining -feliminate-unused-debug-types
# -fexceptions -ffp-int-builtin-inexact -ffunction-cse -fgcse-lm
# -fgnu-runtime -fgnu-unique -fident -finline-atomics -fira-hoist-pressure
# -fira-share-save-slots -fira-share-spill-slots -fivopts
# -fkeep-static-consts -fleading-underscore -flifetime-dse
# -flto-odr-type-merging -fmath-errno -fmerge-debug-strings -fpeephole
# -fplt -fprefetch-loop-arrays -freg-struct-return
# -fsched-critical-path-heuristic -fsched-dep-count-heuristic
# -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
# -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
# -fsched-stalled-insns-dep -fschedule-fusion -fsemantic-interposition
# -fshow-column -fshrink-wrap-separate -fsigned-zeros
# -fsplit-ivs-in-unroller -fssa-backprop -fstack-protector-strong
# -fstdarg-opt -fstrict-volatile-bitfields -fsync-libcalls -ftrapping-math
# -ftree-cselim -ftree-forwprop -ftree-loop-if-convert -ftree-loop-im
# -ftree-loop-ivcanon -ftree-loop-optimize -ftree-parallelize-loops=
# -ftree-phiprop -ftree-reassoc -ftree-scev-cprop -funit-at-a-time
# -funwind-tables -fverbose-asm -fzero-initialized-in-bss
# -m128bit-long-double -m64 -m80387 -malign-stringops
# -mavx256-split-unaligned-load -mavx256-split-unaligned-store
# -mfancy-math-387 -mfp-ret-in-387 -mfxsr -mglibc -mieee-fp
# -mlong-double-80 -mmmx -mno-sse4 -mpush-args -mred-zone -msse -msse2
# -mstv -mtls-direct-seg-refs -mvzeroupper

	.text
	.section	.rodata
	.type	_ZStL19piecewise_construct, @object
	.size	_ZStL19piecewise_construct, 1
_ZStL19piecewise_construct:
	.zero	1
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
.LC0:
	.string	"BEGIN!!!!!!!!!!!!!!!"
.LC1:
	.string	"sum: "
	.text
	.globl	main
	.type	main, @function
main:
.LFB1493:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
# test_openmp.cpp:4: int main() {
	movq	%fs:40, %rax	#, tmp99
	movq	%rax, -8(%rbp)	# tmp99, D.40414
	xorl	%eax, %eax	# tmp99
# test_openmp.cpp:5:     int sum = 0;
	movl	$0, -12(%rbp)	#, sum
# test_openmp.cpp:7:     std::cout << "BEGIN!!!!!!!!!!!!!!!"<< std::endl;
	leaq	.LC0(%rip), %rsi	#,
	leaq	_ZSt4cout(%rip), %rdi	#,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
	movq	%rax, %rdx	#, _1
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rax	#, tmp92
	movq	%rax, %rsi	# tmp92,
	movq	%rdx, %rdi	# _1,
	call	_ZNSolsEPFRSoS_E@PLT	#
# test_openmp.cpp:9:     #pragma omp parallel
	movl	-12(%rbp), %eax	# sum, tmp93
	movl	%eax, -16(%rbp)	# tmp93, .omp_data_o.1.sum
	leaq	-16(%rbp), %rax	#, tmp94
	movl	$0, %ecx	#,
	movl	$0, %edx	#,
	movq	%rax, %rsi	# tmp94,
	leaq	main._omp_fn.0(%rip), %rdi	#,
	call	GOMP_parallel@PLT	#
	movl	-16(%rbp), %eax	# .omp_data_o.1.sum, tmp95
	movl	%eax, -12(%rbp)	# tmp95, sum
# test_openmp.cpp:14:     std::cout << "sum: " << sum << std::endl;
	leaq	.LC1(%rip), %rsi	#,
	leaq	_ZSt4cout(%rip), %rdi	#,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
	movq	%rax, %rdx	#, _2
	movl	-12(%rbp), %eax	# sum, tmp96
	movl	%eax, %esi	# tmp96,
	movq	%rdx, %rdi	# _2,
	call	_ZNSolsEi@PLT	#
	movq	%rax, %rdx	#, _3
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rax	#, tmp97
	movq	%rax, %rsi	# tmp97,
	movq	%rdx, %rdi	# _3,
	call	_ZNSolsEPFRSoS_E@PLT	#
# test_openmp.cpp:16:     return 0;
	movl	$0, %eax	#, _18
# test_openmp.cpp:17: }
	movq	-8(%rbp), %rcx	# D.40414, tmp100
	xorq	%fs:40, %rcx	#, tmp100
	je	.L3	#,
	call	__stack_chk_fail@PLT	#
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1493:
	.size	main, .-main
	.type	_Z41__static_initialization_and_destruction_0ii, @function
_Z41__static_initialization_and_destruction_0ii:
.LFB1982:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movl	%edi, -4(%rbp)	# __initialize_p, __initialize_p
	movl	%esi, -8(%rbp)	# __priority, __priority
# test_openmp.cpp:17: }
	cmpl	$1, -4(%rbp)	#, __initialize_p
	jne	.L6	#,
# test_openmp.cpp:17: }
	cmpl	$65535, -8(%rbp)	#, __priority
	jne	.L6	#,
# /usr/include/c++/7/iostream:74:   static ios_base::Init __ioinit;
	leaq	_ZStL8__ioinit(%rip), %rdi	#,
	call	_ZNSt8ios_base4InitC1Ev@PLT	#
	leaq	__dso_handle(%rip), %rdx	#,
	leaq	_ZStL8__ioinit(%rip), %rsi	#,
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rax	#, tmp87
	movq	%rax, %rdi	# tmp87,
	call	__cxa_atexit@PLT	#
.L6:
# test_openmp.cpp:17: }
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1982:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.type	_GLOBAL__sub_I_main, @function
_GLOBAL__sub_I_main:
.LFB1983:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
# test_openmp.cpp:17: }
	movl	$65535, %esi	#,
	movl	$1, %edi	#,
	call	_Z41__static_initialization_and_destruction_0ii	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1983:
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_main
	.text
	.type	main._omp_fn.0, @function
main._omp_fn.0:
.LFB1984:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# .omp_data_i, .omp_data_i
# test_openmp.cpp:11:         sum += 1;
	movq	-8(%rbp), %rax	# .omp_data_i, tmp89
	movl	(%rax), %eax	# .omp_data_i_2(D)->sum, _3
	leal	1(%rax), %edx	#, _4
	movq	-8(%rbp), %rax	# .omp_data_i, tmp90
	movl	%edx, (%rax)	# _4, .omp_data_i_2(D)->sum
# test_openmp.cpp:9:     #pragma omp parallel
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1984:
	.size	main._omp_fn.0, .-main._omp_fn.0
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
