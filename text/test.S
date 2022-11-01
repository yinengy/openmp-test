	.file	"summp.cpp"
# GNU C++14 (Ubuntu 7.5.0-3ubuntu1~18.04) version 7.5.0 (x86_64-linux-gnu)
#	compiled by GNU C version 7.5.0, GMP version 6.1.2, MPFR version 4.0.1, MPC version 1.1.0, isl version isl-0.19-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -I . -I ./lib/ -imultiarch x86_64-linux-gnu
# -D_GNU_SOURCE -D_REENTRANT lib/summp.cpp -mtune=generic -march=x86-64
# -auxbase-strip test -fverbose-asm -fPIC -fopenmp -fstack-protector-strong
# -Wformat -Wformat-security
# options enabled:  -fPIC -faggressive-loop-optimizations
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
	.align 4
	.type	_ZL6REPEAT, @object
	.size	_ZL6REPEAT, 4
_ZL6REPEAT:
	.long	100
	.text
	.globl	_Z3sumPii
	.type	_Z3sumPii, @function
_Z3sumPii:
.LFB830:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$64, %rsp	#,
	movq	%rdi, -56(%rbp)	# v, v
	movl	%esi, -60(%rbp)	# num_items, num_items
# lib/summp.cpp:13: int sum(int* v, int num_items) {
	movq	%fs:40, %rax	#, tmp101
	movq	%rax, -8(%rbp)	# tmp101, D.15148
	xorl	%eax, %eax	# tmp101
# lib/summp.cpp:15:     int num_threads = omp_get_max_threads();
	call	omp_get_max_threads@PLT	#
	movl	%eax, -48(%rbp)	# tmp89, num_threads
# lib/summp.cpp:16:     int batch_size = num_items / num_threads;
	movl	-60(%rbp), %eax	# num_items, tmp93
	cltd
	idivl	-48(%rbp)	# num_threads
	movl	%eax, -44(%rbp)	# tmp91, batch_size
# lib/summp.cpp:19:     int partial_sum = 0;
	movl	$0, -40(%rbp)	#, partial_sum
# lib/summp.cpp:20:     int sum = 0;
	movl	$0, -36(%rbp)	#, sum
# lib/summp.cpp:27:     #pragma omp parallel private(th_id) firstprivate(partial_sum)
	movl	-40(%rbp), %eax	# partial_sum, tmp94
	movl	%eax, -16(%rbp)	# tmp94, .omp_data_o.1.partial_sum
	movl	-44(%rbp), %eax	# batch_size, tmp95
	movl	%eax, -24(%rbp)	# tmp95, .omp_data_o.1.batch_size
	movq	-56(%rbp), %rax	# v, tmp96
	movq	%rax, -32(%rbp)	# tmp96, .omp_data_o.1.v
	movl	-36(%rbp), %eax	# sum, tmp97
	movl	%eax, -20(%rbp)	# tmp97, .omp_data_o.1.sum
	leaq	-32(%rbp), %rax	#, tmp98
	movl	$0, %ecx	#,
	movl	$0, %edx	#,
	movq	%rax, %rsi	# tmp98,
	leaq	_Z3sumPii._omp_fn.0(%rip), %rdi	#,
	call	GOMP_parallel@PLT	#
	movl	-20(%rbp), %eax	# .omp_data_o.1.sum, tmp99
	movl	%eax, -36(%rbp)	# tmp99, sum
# lib/summp.cpp:54:     return sum;
	movl	-36(%rbp), %eax	# sum, _16
# lib/summp.cpp:55: }
	movq	-8(%rbp), %rcx	# D.15148, tmp102
	xorq	%fs:40, %rcx	#, tmp102
	je	.L3	#,
	call	__stack_chk_fail@PLT	#
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE830:
	.size	_Z3sumPii, .-_Z3sumPii
	.globl	main
	.type	main, @function
main:
.LFB831:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$304, %rsp	#,
	movl	%edi, -292(%rbp)	# argc, argc
	movq	%rsi, -304(%rbp)	# argv, argv
# lib/summp.cpp:57: int main(int argc, char *argv[]) {
	movq	%fs:40, %rax	#, tmp93
	movq	%rax, -8(%rbp)	# tmp93, D.15150
	xorl	%eax, %eax	# tmp93
# lib/summp.cpp:59:     for (int i = 0; i < 64; i++) {
	movl	$0, -276(%rbp)	#, i
.L6:
# lib/summp.cpp:59:     for (int i = 0; i < 64; i++) {
	cmpl	$63, -276(%rbp)	#, i
	jg	.L5	#,
# lib/summp.cpp:60:         first[i] = 1;
	movl	-276(%rbp), %eax	# i, tmp90
	cltq
	movl	$1, -272(%rbp,%rax,4)	#, first
# lib/summp.cpp:59:     for (int i = 0; i < 64; i++) {
	addl	$1, -276(%rbp)	#, i
	jmp	.L6	#
.L5:
# lib/summp.cpp:63:     return sum(first, 64);
	leaq	-272(%rbp), %rax	#, tmp91
	movl	$64, %esi	#,
	movq	%rax, %rdi	# tmp91,
	call	_Z3sumPii@PLT	#
# lib/summp.cpp:64: }
	movq	-8(%rbp), %rdx	# D.15150, tmp94
	xorq	%fs:40, %rdx	#, tmp94
	je	.L8	#,
	call	__stack_chk_fail@PLT	#
.L8:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE831:
	.size	main, .-main
	.type	_Z3sumPii._omp_fn.0, @function
_Z3sumPii._omp_fn.0:
.LFB837:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movq	%rdi, -40(%rbp)	# .omp_data_i, .omp_data_i
# lib/summp.cpp:27:     #pragma omp parallel private(th_id) firstprivate(partial_sum)
	movq	-40(%rbp), %rax	# .omp_data_i, tmp95
	movl	16(%rax), %eax	# .omp_data_i_6(D)->partial_sum, tmp96
	movl	%eax, -28(%rbp)	# tmp96, partial_sum
	movq	-40(%rbp), %rax	# .omp_data_i, tmp97
	movl	8(%rax), %eax	# .omp_data_i_6(D)->batch_size, tmp98
	movl	%eax, -16(%rbp)	# tmp98, batch_size
	movq	-40(%rbp), %rax	# .omp_data_i, tmp99
	movq	(%rax), %rax	# .omp_data_i_6(D)->v, tmp100
	movq	%rax, -8(%rbp)	# tmp100, v
# lib/summp.cpp:30:         th_id = omp_get_thread_num();
	call	omp_get_thread_num@PLT	#
	movl	%eax, -12(%rbp)	# tmp101, th_id
# lib/summp.cpp:32:         for (int j = 0; j < REPEAT; j++) {
	movl	$0, -24(%rbp)	#, j
.L12:
# lib/summp.cpp:32:         for (int j = 0; j < REPEAT; j++) {
	cmpl	$99, -24(%rbp)	#, j
	jle	.L10	#,
# lib/summp.cpp:39:         #pragma omp critical
	call	GOMP_critical_start@PLT	#
# lib/summp.cpp:40:         sum += partial_sum;
	movq	-40(%rbp), %rax	# .omp_data_i, tmp102
	movl	12(%rax), %edx	# .omp_data_i_6(D)->sum, _24
	movl	-28(%rbp), %eax	# partial_sum, tmp103
	addl	%eax, %edx	# tmp103, _25
	movq	-40(%rbp), %rax	# .omp_data_i, tmp104
	movl	%edx, 12(%rax)	# _25, .omp_data_i_6(D)->sum
# lib/summp.cpp:39:         #pragma omp critical
	call	GOMP_critical_end@PLT	#
	jmp	.L14	#
.L10:
# lib/summp.cpp:33:             for (int i = 0; i < batch_size; i++) {
	movl	$0, -20(%rbp)	#, i
.L13:
# lib/summp.cpp:33:             for (int i = 0; i < batch_size; i++) {
	movl	-20(%rbp), %eax	# i, tmp105
	cmpl	-16(%rbp), %eax	# batch_size, tmp105
	jl	.L11	#,
# lib/summp.cpp:32:         for (int j = 0; j < REPEAT; j++) {
	addl	$1, -24(%rbp)	#, j
	jmp	.L12	#
.L11:
# lib/summp.cpp:34:                 partial_sum += v[th_id * batch_size + i];
	movl	-12(%rbp), %eax	# th_id, tmp106
	imull	-16(%rbp), %eax	# batch_size, tmp106
	movl	%eax, %edx	# tmp106, _14
	movl	-20(%rbp), %eax	# i, tmp107
	addl	%edx, %eax	# _14, _15
	cltq
	leaq	0(,%rax,4), %rdx	#, _17
	movq	-8(%rbp), %rax	# v, tmp108
	addq	%rdx, %rax	# _17, _18
	movl	(%rax), %eax	# *_18, _19
	addl	%eax, -28(%rbp)	# _19, partial_sum
# lib/summp.cpp:33:             for (int i = 0; i < batch_size; i++) {
	addl	$1, -20(%rbp)	#, i
	jmp	.L13	#
.L14:
# lib/summp.cpp:27:     #pragma omp parallel private(th_id) firstprivate(partial_sum)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE837:
	.size	_Z3sumPii._omp_fn.0, .-_Z3sumPii._omp_fn.0
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
