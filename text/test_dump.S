
test:     file format elf64-x86-64


Disassembly of section .init:

00000000000006c8 <_init>:
 6c8:	48 83 ec 08          	sub    rsp,0x8
 6cc:	48 8b 05 15 09 20 00 	mov    rax,QWORD PTR [rip+0x200915]        # 200fe8 <__gmon_start__>
 6d3:	48 85 c0             	test   rax,rax
 6d6:	74 02                	je     6da <_init+0x12>
 6d8:	ff d0                	call   rax
 6da:	48 83 c4 08          	add    rsp,0x8
 6de:	c3                   	ret    

Disassembly of section .plt:

00000000000006e0 <.plt>:
 6e0:	ff 35 b2 08 20 00    	push   QWORD PTR [rip+0x2008b2]        # 200f98 <_GLOBAL_OFFSET_TABLE_+0x8>
 6e6:	ff 25 b4 08 20 00    	jmp    QWORD PTR [rip+0x2008b4]        # 200fa0 <_GLOBAL_OFFSET_TABLE_+0x10>
 6ec:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

00000000000006f0 <omp_get_thread_num@plt>:
 6f0:	ff 25 b2 08 20 00    	jmp    QWORD PTR [rip+0x2008b2]        # 200fa8 <omp_get_thread_num@OMP_1.0>
 6f6:	68 00 00 00 00       	push   0x0
 6fb:	e9 e0 ff ff ff       	jmp    6e0 <.plt>

0000000000000700 <__stack_chk_fail@plt>:
 700:	ff 25 aa 08 20 00    	jmp    QWORD PTR [rip+0x2008aa]        # 200fb0 <__stack_chk_fail@GLIBC_2.4>
 706:	68 01 00 00 00       	push   0x1
 70b:	e9 d0 ff ff ff       	jmp    6e0 <.plt>

0000000000000710 <GOMP_critical_end@plt>:
 710:	ff 25 a2 08 20 00    	jmp    QWORD PTR [rip+0x2008a2]        # 200fb8 <GOMP_critical_end@GOMP_1.0>
 716:	68 02 00 00 00       	push   0x2
 71b:	e9 c0 ff ff ff       	jmp    6e0 <.plt>

0000000000000720 <omp_get_max_threads@plt>:
 720:	ff 25 9a 08 20 00    	jmp    QWORD PTR [rip+0x20089a]        # 200fc0 <omp_get_max_threads@OMP_1.0>
 726:	68 03 00 00 00       	push   0x3
 72b:	e9 b0 ff ff ff       	jmp    6e0 <.plt>

0000000000000730 <GOMP_parallel@plt>:
 730:	ff 25 92 08 20 00    	jmp    QWORD PTR [rip+0x200892]        # 200fc8 <GOMP_parallel@GOMP_4.0>
 736:	68 04 00 00 00       	push   0x4
 73b:	e9 a0 ff ff ff       	jmp    6e0 <.plt>

0000000000000740 <GOMP_critical_start@plt>:
 740:	ff 25 8a 08 20 00    	jmp    QWORD PTR [rip+0x20088a]        # 200fd0 <GOMP_critical_start@GOMP_1.0>
 746:	68 05 00 00 00       	push   0x5
 74b:	e9 90 ff ff ff       	jmp    6e0 <.plt>

Disassembly of section .plt.got:

0000000000000750 <__cxa_finalize@plt>:
 750:	ff 25 a2 08 20 00    	jmp    QWORD PTR [rip+0x2008a2]        # 200ff8 <__cxa_finalize@GLIBC_2.2.5>
 756:	66 90                	xchg   ax,ax

Disassembly of section .text:

0000000000000760 <_start>:
 760:	31 ed                	xor    ebp,ebp
 762:	49 89 d1             	mov    r9,rdx
 765:	5e                   	pop    rsi
 766:	48 89 e2             	mov    rdx,rsp
 769:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
 76d:	50                   	push   rax
 76e:	54                   	push   rsp
 76f:	4c 8d 05 1a 03 00 00 	lea    r8,[rip+0x31a]        # a90 <__libc_csu_fini>
 776:	48 8d 0d a3 02 00 00 	lea    rcx,[rip+0x2a3]        # a20 <__libc_csu_init>
 77d:	48 8d 3d 7a 01 00 00 	lea    rdi,[rip+0x17a]        # 8fe <main>
 784:	ff 15 56 08 20 00    	call   QWORD PTR [rip+0x200856]        # 200fe0 <__libc_start_main@GLIBC_2.2.5>
 78a:	f4                   	hlt    
 78b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000000790 <deregister_tm_clones>:
 790:	48 8d 3d 79 08 20 00 	lea    rdi,[rip+0x200879]        # 201010 <__TMC_END__>
 797:	55                   	push   rbp
 798:	48 8d 05 71 08 20 00 	lea    rax,[rip+0x200871]        # 201010 <__TMC_END__>
 79f:	48 39 f8             	cmp    rax,rdi
 7a2:	48 89 e5             	mov    rbp,rsp
 7a5:	74 19                	je     7c0 <deregister_tm_clones+0x30>
 7a7:	48 8b 05 2a 08 20 00 	mov    rax,QWORD PTR [rip+0x20082a]        # 200fd8 <_ITM_deregisterTMCloneTable>
 7ae:	48 85 c0             	test   rax,rax
 7b1:	74 0d                	je     7c0 <deregister_tm_clones+0x30>
 7b3:	5d                   	pop    rbp
 7b4:	ff e0                	jmp    rax
 7b6:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
 7bd:	00 00 00 
 7c0:	5d                   	pop    rbp
 7c1:	c3                   	ret    
 7c2:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
 7c6:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
 7cd:	00 00 00 

00000000000007d0 <register_tm_clones>:
 7d0:	48 8d 3d 39 08 20 00 	lea    rdi,[rip+0x200839]        # 201010 <__TMC_END__>
 7d7:	48 8d 35 32 08 20 00 	lea    rsi,[rip+0x200832]        # 201010 <__TMC_END__>
 7de:	55                   	push   rbp
 7df:	48 29 fe             	sub    rsi,rdi
 7e2:	48 89 e5             	mov    rbp,rsp
 7e5:	48 c1 fe 03          	sar    rsi,0x3
 7e9:	48 89 f0             	mov    rax,rsi
 7ec:	48 c1 e8 3f          	shr    rax,0x3f
 7f0:	48 01 c6             	add    rsi,rax
 7f3:	48 d1 fe             	sar    rsi,1
 7f6:	74 18                	je     810 <register_tm_clones+0x40>
 7f8:	48 8b 05 f1 07 20 00 	mov    rax,QWORD PTR [rip+0x2007f1]        # 200ff0 <_ITM_registerTMCloneTable>
 7ff:	48 85 c0             	test   rax,rax
 802:	74 0c                	je     810 <register_tm_clones+0x40>
 804:	5d                   	pop    rbp
 805:	ff e0                	jmp    rax
 807:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
 80e:	00 00 
 810:	5d                   	pop    rbp
 811:	c3                   	ret    
 812:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
 816:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
 81d:	00 00 00 

0000000000000820 <__do_global_dtors_aux>:
 820:	80 3d e9 07 20 00 00 	cmp    BYTE PTR [rip+0x2007e9],0x0        # 201010 <__TMC_END__>
 827:	75 2f                	jne    858 <__do_global_dtors_aux+0x38>
 829:	48 83 3d c7 07 20 00 	cmp    QWORD PTR [rip+0x2007c7],0x0        # 200ff8 <__cxa_finalize@GLIBC_2.2.5>
 830:	00 
 831:	55                   	push   rbp
 832:	48 89 e5             	mov    rbp,rsp
 835:	74 0c                	je     843 <__do_global_dtors_aux+0x23>
 837:	48 8b 3d ca 07 20 00 	mov    rdi,QWORD PTR [rip+0x2007ca]        # 201008 <__dso_handle>
 83e:	e8 0d ff ff ff       	call   750 <__cxa_finalize@plt>
 843:	e8 48 ff ff ff       	call   790 <deregister_tm_clones>
 848:	c6 05 c1 07 20 00 01 	mov    BYTE PTR [rip+0x2007c1],0x1        # 201010 <__TMC_END__>
 84f:	5d                   	pop    rbp
 850:	c3                   	ret    
 851:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
 858:	f3 c3                	repz ret 
 85a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000000860 <frame_dummy>:
 860:	55                   	push   rbp
 861:	48 89 e5             	mov    rbp,rsp
 864:	5d                   	pop    rbp
 865:	e9 66 ff ff ff       	jmp    7d0 <register_tm_clones>

000000000000086a <sum(int*, int)>:
// const int NUM_CORE = 24;

// #define COUNT_CORE  // if define, will print thread mapping bitmap
// #define BIND_CORE   // if define, will bind thread to core

int sum(int* v, int num_items) {
 86a:	55                   	push   rbp
 86b:	48 89 e5             	mov    rbp,rsp
 86e:	48 83 ec 40          	sub    rsp,0x40
 872:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
 876:	89 75 c4             	mov    DWORD PTR [rbp-0x3c],esi
 879:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
 880:	00 00 
 882:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
 886:	31 c0                	xor    eax,eax
    // auto t1 = std::chrono::high_resolution_clock::now();
    int num_threads = omp_get_max_threads();
 888:	e8 93 fe ff ff       	call   720 <omp_get_max_threads@plt>
 88d:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    int batch_size = num_items / num_threads;
 890:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
 893:	99                   	cdq    
 894:	f7 7d d0             	idiv   DWORD PTR [rbp-0x30]
 897:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax

    int th_id;
    int partial_sum = 0;
 89a:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [rbp-0x28],0x0
    int sum = 0;
 8a1:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
    // #ifdef COUNT_CORE
    // std::vector<int> core_count(NUM_CORE, 0);
    // #endif

    // 1. Not Ok To Substitue
    #pragma omp parallel private(th_id) firstprivate(partial_sum)
 8a8:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
 8ab:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
 8ae:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
 8b1:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
 8b4:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
 8b8:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
 8bc:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
 8bf:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
 8c2:	48 8d 45 e0          	lea    rax,[rbp-0x20]
 8c6:	b9 00 00 00 00       	mov    ecx,0x0
 8cb:	ba 00 00 00 00       	mov    edx,0x0
 8d0:	48 89 c6             	mov    rsi,rax
 8d3:	48 8d 3d a4 00 00 00 	lea    rdi,[rip+0xa4]        # 97e <sum(int*, int) [clone ._omp_fn.0]>
 8da:	e8 51 fe ff ff       	call   730 <GOMP_parallel@plt>
 8df:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
 8e2:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    //     std::cout << i << " ";
    // }
    // std::cout << std::endl;
    // #endif

    return sum;
 8e5:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
}
 8e8:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
 8ec:	64 48 33 0c 25 28 00 	xor    rcx,QWORD PTR fs:0x28
 8f3:	00 00 
 8f5:	74 05                	je     8fc <sum(int*, int)+0x92>
 8f7:	e8 04 fe ff ff       	call   700 <__stack_chk_fail@plt>
 8fc:	c9                   	leave  
 8fd:	c3                   	ret    

00000000000008fe <main>:

int main(int argc, char *argv[]) {
 8fe:	55                   	push   rbp
 8ff:	48 89 e5             	mov    rbp,rsp
 902:	48 81 ec 30 01 00 00 	sub    rsp,0x130
 909:	89 bd dc fe ff ff    	mov    DWORD PTR [rbp-0x124],edi
 90f:	48 89 b5 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],rsi
 916:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
 91d:	00 00 
 91f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
 923:	31 c0                	xor    eax,eax
    int first[64];
    for (int i = 0; i < 64; i++) {
 925:	c7 85 ec fe ff ff 00 	mov    DWORD PTR [rbp-0x114],0x0
 92c:	00 00 00 
 92f:	83 bd ec fe ff ff 3f 	cmp    DWORD PTR [rbp-0x114],0x3f
 936:	7f 1c                	jg     954 <main+0x56>
        first[i] = 1;
 938:	8b 85 ec fe ff ff    	mov    eax,DWORD PTR [rbp-0x114]
 93e:	48 98                	cdqe   
 940:	c7 84 85 f0 fe ff ff 	mov    DWORD PTR [rbp+rax*4-0x110],0x1
 947:	01 00 00 00 
    for (int i = 0; i < 64; i++) {
 94b:	83 85 ec fe ff ff 01 	add    DWORD PTR [rbp-0x114],0x1
 952:	eb db                	jmp    92f <main+0x31>
    }

    return sum(first, 64);
 954:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
 95b:	be 40 00 00 00       	mov    esi,0x40
 960:	48 89 c7             	mov    rdi,rax
 963:	e8 02 ff ff ff       	call   86a <sum(int*, int)>
 968:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
 96c:	64 48 33 14 25 28 00 	xor    rdx,QWORD PTR fs:0x28
 973:	00 00 
 975:	74 05                	je     97c <main+0x7e>
 977:	e8 84 fd ff ff       	call   700 <__stack_chk_fail@plt>
 97c:	c9                   	leave  
 97d:	c3                   	ret    

000000000000097e <sum(int*, int) [clone ._omp_fn.0]>:
    #pragma omp parallel private(th_id) firstprivate(partial_sum)
 97e:	55                   	push   rbp
 97f:	48 89 e5             	mov    rbp,rsp
 982:	48 83 ec 30          	sub    rsp,0x30
 986:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
 98a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
 98e:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
 991:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
 994:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
 998:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
 99b:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
 99e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
 9a2:	48 8b 00             	mov    rax,QWORD PTR [rax]
 9a5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        th_id = omp_get_thread_num();
 9a9:	e8 42 fd ff ff       	call   6f0 <omp_get_thread_num@plt>
 9ae:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        for (int j = 0; j < REPEAT; j++) {
 9b1:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
 9b8:	83 7d e8 63          	cmp    DWORD PTR [rbp-0x18],0x63
 9bc:	7e 1f                	jle    9dd <sum(int*, int) [clone ._omp_fn.0]+0x5f>
        #pragma omp critical
 9be:	e8 7d fd ff ff       	call   740 <GOMP_critical_start@plt>
        sum += partial_sum;
 9c3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
 9c7:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
 9ca:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
 9cd:	01 c2                	add    edx,eax
 9cf:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
 9d3:	89 50 0c             	mov    DWORD PTR [rax+0xc],edx
        #pragma omp critical
 9d6:	e8 35 fd ff ff       	call   710 <GOMP_critical_end@plt>
 9db:	eb 3f                	jmp    a1c <sum(int*, int) [clone ._omp_fn.0]+0x9e>
            for (int i = 0; i < batch_size; i++) {
 9dd:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
 9e4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
 9e7:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
 9ea:	7c 06                	jl     9f2 <sum(int*, int) [clone ._omp_fn.0]+0x74>
        for (int j = 0; j < REPEAT; j++) {
 9ec:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
 9f0:	eb c6                	jmp    9b8 <sum(int*, int) [clone ._omp_fn.0]+0x3a>
                partial_sum += v[th_id * batch_size + i];
 9f2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
 9f5:	0f af 45 f0          	imul   eax,DWORD PTR [rbp-0x10]
 9f9:	89 c2                	mov    edx,eax
 9fb:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
 9fe:	01 d0                	add    eax,edx
 a00:	48 98                	cdqe   
 a02:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
 a09:	00 
 a0a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
 a0e:	48 01 d0             	add    rax,rdx
 a11:	8b 00                	mov    eax,DWORD PTR [rax]
 a13:	01 45 e4             	add    DWORD PTR [rbp-0x1c],eax
            for (int i = 0; i < batch_size; i++) {
 a16:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
 a1a:	eb c8                	jmp    9e4 <sum(int*, int) [clone ._omp_fn.0]+0x66>
    #pragma omp parallel private(th_id) firstprivate(partial_sum)
 a1c:	c9                   	leave  
 a1d:	c3                   	ret    
 a1e:	66 90                	xchg   ax,ax

0000000000000a20 <__libc_csu_init>:
 a20:	41 57                	push   r15
 a22:	41 56                	push   r14
 a24:	49 89 d7             	mov    r15,rdx
 a27:	41 55                	push   r13
 a29:	41 54                	push   r12
 a2b:	4c 8d 25 4e 03 20 00 	lea    r12,[rip+0x20034e]        # 200d80 <__frame_dummy_init_array_entry>
 a32:	55                   	push   rbp
 a33:	48 8d 2d 4e 03 20 00 	lea    rbp,[rip+0x20034e]        # 200d88 <__init_array_end>
 a3a:	53                   	push   rbx
 a3b:	41 89 fd             	mov    r13d,edi
 a3e:	49 89 f6             	mov    r14,rsi
 a41:	4c 29 e5             	sub    rbp,r12
 a44:	48 83 ec 08          	sub    rsp,0x8
 a48:	48 c1 fd 03          	sar    rbp,0x3
 a4c:	e8 77 fc ff ff       	call   6c8 <_init>
 a51:	48 85 ed             	test   rbp,rbp
 a54:	74 20                	je     a76 <__libc_csu_init+0x56>
 a56:	31 db                	xor    ebx,ebx
 a58:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
 a5f:	00 
 a60:	4c 89 fa             	mov    rdx,r15
 a63:	4c 89 f6             	mov    rsi,r14
 a66:	44 89 ef             	mov    edi,r13d
 a69:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
 a6d:	48 83 c3 01          	add    rbx,0x1
 a71:	48 39 dd             	cmp    rbp,rbx
 a74:	75 ea                	jne    a60 <__libc_csu_init+0x40>
 a76:	48 83 c4 08          	add    rsp,0x8
 a7a:	5b                   	pop    rbx
 a7b:	5d                   	pop    rbp
 a7c:	41 5c                	pop    r12
 a7e:	41 5d                	pop    r13
 a80:	41 5e                	pop    r14
 a82:	41 5f                	pop    r15
 a84:	c3                   	ret    
 a85:	90                   	nop
 a86:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
 a8d:	00 00 00 

0000000000000a90 <__libc_csu_fini>:
 a90:	f3 c3                	repz ret 

Disassembly of section .fini:

0000000000000a94 <_fini>:
 a94:	48 83 ec 08          	sub    rsp,0x8
 a98:	48 83 c4 08          	add    rsp,0x8
 a9c:	c3                   	ret    
