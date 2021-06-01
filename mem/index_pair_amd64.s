// Code generated by command: go run index_pair_asm.go -pkg mem -out ../mem/index_pair_amd64.s -stubs ../mem/index_pair_amd64.go. DO NOT EDIT.

#include "textflag.h"

// func indexPair1(b []byte) int
// Requires: AVX, AVX2, BMI
TEXT ·indexPair1(SB), NOSPLIT, $0-32
	MOVQ b_base+0(FP), AX
	MOVQ b_len+8(FP), CX
	MOVQ AX, DX
	CMPQ CX, $0x00
	JLE  done
	SUBQ $0x01, CX
	BTL  $0x08, github·com∕segmentio∕asm∕cpu·X86+0(SB)
	JCS  avx2

tail:
	CMPQ CX, $0x00
	JE   fail

generic:
	MOVB (AX), BL
	MOVB 1(AX), SI
	CMPB BL, SI
	JE   done
	ADDQ $0x01, AX
	SUBQ $0x01, CX
	CMPQ CX, $0x00
	JA   generic

fail:
	ADDQ $0x01, AX

done:
	SUBQ DX, AX
	MOVQ AX, ret+24(FP)
	RET

avx2:
	CMPQ CX, $0x00000101
	JB   avx2_tail128
	MOVQ $0x0000000000000000, BX
	MOVQ $0x0000000000000000, SI
	MOVQ $0x0000000000000000, DI
	MOVQ $0x0000000000000000, R8
	MOVQ $0x0000000000000000, R9
	MOVQ $0x0000000000000000, R10
	MOVQ $0x0000000000000000, R11
	MOVQ $0x0000000000000000, R12

avx2_loop256:
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   64(AX), Y4
	VMOVDQU   96(AX), Y6
	VMOVDQU   128(AX), Y8
	VMOVDQU   160(AX), Y10
	VMOVDQU   192(AX), Y12
	VMOVDQU   224(AX), Y14
	VMOVDQU   1(AX), Y1
	VMOVDQU   33(AX), Y3
	VMOVDQU   65(AX), Y5
	VMOVDQU   97(AX), Y7
	VMOVDQU   129(AX), Y9
	VMOVDQU   161(AX), Y11
	VMOVDQU   193(AX), Y13
	VMOVDQU   225(AX), Y15
	VPCMPEQB  Y0, Y1, Y1
	VPCMPEQB  Y2, Y3, Y3
	VPCMPEQB  Y4, Y5, Y5
	VPCMPEQB  Y6, Y7, Y7
	VPCMPEQB  Y8, Y9, Y9
	VPCMPEQB  Y10, Y11, Y11
	VPCMPEQB  Y12, Y13, Y13
	VPCMPEQB  Y14, Y15, Y15
	VPMOVMSKB Y1, BX
	VPMOVMSKB Y3, SI
	VPMOVMSKB Y5, DI
	VPMOVMSKB Y7, R8
	VPMOVMSKB Y9, R9
	VPMOVMSKB Y11, R10
	VPMOVMSKB Y13, R11
	VPMOVMSKB Y15, R12
	TZCNTQ    BX, BX
	TZCNTQ    SI, SI
	TZCNTQ    DI, DI
	TZCNTQ    R8, R8
	TZCNTQ    R9, R9
	TZCNTQ    R10, R10
	TZCNTQ    R11, R11
	TZCNTQ    R12, R12
	CMPQ      BX, $0x40
	JNE       avx2_done0
	CMPQ      SI, $0x40
	JNE       avx2_done1
	CMPQ      DI, $0x40
	JNE       avx2_done2
	CMPQ      R8, $0x40
	JNE       avx2_done3
	CMPQ      R9, $0x40
	JNE       avx2_done4
	CMPQ      R10, $0x40
	JNE       avx2_done5
	CMPQ      R11, $0x40
	JNE       avx2_done6
	CMPQ      R12, $0x40
	JNE       avx2_done7
	ADDQ      $0x00000100, AX
	SUBQ      $0x00000100, CX
	CMPQ      CX, $0x00000101
	JAE       avx2_loop256

avx2_tail128:
	CMPQ      CX, $0x81
	JB        avx2_tail64
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   64(AX), Y4
	VMOVDQU   96(AX), Y6
	VMOVDQU   1(AX), Y1
	VMOVDQU   33(AX), Y3
	VMOVDQU   65(AX), Y5
	VMOVDQU   97(AX), Y7
	VPCMPEQB  Y0, Y1, Y1
	VPCMPEQB  Y2, Y3, Y3
	VPCMPEQB  Y4, Y5, Y5
	VPCMPEQB  Y6, Y7, Y7
	VPMOVMSKB Y1, BX
	VPMOVMSKB Y3, SI
	VPMOVMSKB Y5, DI
	VPMOVMSKB Y7, R8
	TZCNTQ    BX, BX
	TZCNTQ    SI, SI
	TZCNTQ    DI, DI
	TZCNTQ    R8, R8
	CMPQ      BX, $0x40
	JNE       avx2_done0
	CMPQ      SI, $0x40
	JNE       avx2_done1
	CMPQ      DI, $0x40
	JNE       avx2_done2
	CMPQ      R8, $0x40
	JNE       avx2_done3
	ADDQ      $0x00000080, AX
	SUBQ      $0x00000080, CX

avx2_tail64:
	CMPQ      CX, $0x41
	JB        avx2_tail32
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   1(AX), Y1
	VMOVDQU   33(AX), Y3
	VPCMPEQB  Y0, Y1, Y1
	VPCMPEQB  Y2, Y3, Y3
	VPMOVMSKB Y1, BX
	VPMOVMSKB Y3, SI
	TZCNTQ    BX, BX
	TZCNTQ    SI, SI
	CMPQ      BX, $0x40
	JNE       avx2_done0
	CMPQ      SI, $0x40
	JNE       avx2_done1
	ADDQ      $0x00000040, AX
	SUBQ      $0x00000040, CX

avx2_tail32:
	CMPQ      CX, $0x21
	JB        avx2_tail16
	VMOVDQU   (AX), Y0
	VMOVDQU   1(AX), Y1
	VPCMPEQB  Y0, Y1, Y1
	VPMOVMSKB Y1, BX
	TZCNTQ    BX, BX
	CMPQ      BX, $0x40
	JNE       avx2_done0
	ADDQ      $0x00000020, AX
	SUBQ      $0x00000020, CX

avx2_tail16:
	CMPQ      CX, $0x11
	JB        avx2_tail
	VMOVDQU   (AX), X0
	VMOVDQU   1(AX), X1
	VPCMPEQB  X0, X1, X1
	VPMOVMSKB X1, BX
	TZCNTQ    BX, BX
	CMPQ      BX, $0x40
	JNE       avx2_done0
	ADDQ      $0x10, AX
	SUBQ      $0x10, CX

avx2_tail:
	VZEROUPPER
	JMP tail

avx2_done0:
	ADDQ BX, AX
	SUBQ BX, CX
	VZEROUPPER
	JMP  done

avx2_done1:
	ADDQ $0x00000020, AX
	SUBQ $0x00000020, CX
	ADDQ SI, AX
	SUBQ SI, CX
	VZEROUPPER
	JMP  done

avx2_done2:
	ADDQ $0x00000040, AX
	SUBQ $0x00000040, CX
	ADDQ DI, AX
	SUBQ DI, CX
	VZEROUPPER
	JMP  done

avx2_done3:
	ADDQ $0x00000060, AX
	SUBQ $0x00000060, CX
	ADDQ R8, AX
	SUBQ R8, CX
	VZEROUPPER
	JMP  done

avx2_done4:
	ADDQ $0x00000080, AX
	SUBQ $0x00000080, CX
	ADDQ R9, AX
	SUBQ R9, CX
	VZEROUPPER
	JMP  done

avx2_done5:
	ADDQ $0x000000a0, AX
	SUBQ $0x000000a0, CX
	ADDQ R10, AX
	SUBQ R10, CX
	VZEROUPPER
	JMP  done

avx2_done6:
	ADDQ $0x000000c0, AX
	SUBQ $0x000000c0, CX
	ADDQ R11, AX
	SUBQ R11, CX
	VZEROUPPER
	JMP  done

avx2_done7:
	ADDQ $0x000000e0, AX
	SUBQ $0x000000e0, CX
	ADDQ R12, AX
	SUBQ R12, CX
	VZEROUPPER
	JMP  done

// func indexPair2(b []byte) int
// Requires: AVX, AVX2, BMI
TEXT ·indexPair2(SB), NOSPLIT, $0-32
	MOVQ b_base+0(FP), AX
	MOVQ b_len+8(FP), CX
	MOVQ AX, DX
	CMPQ CX, $0x00
	JLE  done
	SUBQ $0x02, CX
	BTL  $0x08, github·com∕segmentio∕asm∕cpu·X86+0(SB)
	JCS  avx2

tail:
	CMPQ CX, $0x00
	JE   fail

generic:
	MOVW (AX), BX
	MOVW 2(AX), SI
	CMPW BX, SI
	JE   done
	ADDQ $0x02, AX
	SUBQ $0x02, CX
	CMPQ CX, $0x00
	JA   generic

fail:
	ADDQ $0x02, AX

done:
	SUBQ DX, AX
	MOVQ AX, ret+24(FP)
	RET

avx2:
	CMPQ CX, $0x00000102
	JB   avx2_tail128
	MOVQ $0x0000000000000000, BX
	MOVQ $0x0000000000000000, SI
	MOVQ $0x0000000000000000, DI
	MOVQ $0x0000000000000000, R8
	MOVQ $0x0000000000000000, R9
	MOVQ $0x0000000000000000, R10
	MOVQ $0x0000000000000000, R11
	MOVQ $0x0000000000000000, R12

avx2_loop256:
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   64(AX), Y4
	VMOVDQU   96(AX), Y6
	VMOVDQU   128(AX), Y8
	VMOVDQU   160(AX), Y10
	VMOVDQU   192(AX), Y12
	VMOVDQU   224(AX), Y14
	VMOVDQU   2(AX), Y1
	VMOVDQU   34(AX), Y3
	VMOVDQU   66(AX), Y5
	VMOVDQU   98(AX), Y7
	VMOVDQU   130(AX), Y9
	VMOVDQU   162(AX), Y11
	VMOVDQU   194(AX), Y13
	VMOVDQU   226(AX), Y15
	VPCMPEQW  Y0, Y1, Y1
	VPCMPEQW  Y2, Y3, Y3
	VPCMPEQW  Y4, Y5, Y5
	VPCMPEQW  Y6, Y7, Y7
	VPCMPEQW  Y8, Y9, Y9
	VPCMPEQW  Y10, Y11, Y11
	VPCMPEQW  Y12, Y13, Y13
	VPCMPEQW  Y14, Y15, Y15
	VPMOVMSKB Y1, BX
	VPMOVMSKB Y3, SI
	VPMOVMSKB Y5, DI
	VPMOVMSKB Y7, R8
	VPMOVMSKB Y9, R9
	VPMOVMSKB Y11, R10
	VPMOVMSKB Y13, R11
	VPMOVMSKB Y15, R12
	TZCNTQ    BX, BX
	TZCNTQ    SI, SI
	TZCNTQ    DI, DI
	TZCNTQ    R8, R8
	TZCNTQ    R9, R9
	TZCNTQ    R10, R10
	TZCNTQ    R11, R11
	TZCNTQ    R12, R12
	CMPQ      BX, $0x40
	JNE       avx2_done0
	CMPQ      SI, $0x40
	JNE       avx2_done1
	CMPQ      DI, $0x40
	JNE       avx2_done2
	CMPQ      R8, $0x40
	JNE       avx2_done3
	CMPQ      R9, $0x40
	JNE       avx2_done4
	CMPQ      R10, $0x40
	JNE       avx2_done5
	CMPQ      R11, $0x40
	JNE       avx2_done6
	CMPQ      R12, $0x40
	JNE       avx2_done7
	ADDQ      $0x00000100, AX
	SUBQ      $0x00000100, CX
	CMPQ      CX, $0x00000102
	JAE       avx2_loop256

avx2_tail128:
	CMPQ      CX, $0x82
	JB        avx2_tail64
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   64(AX), Y4
	VMOVDQU   96(AX), Y6
	VMOVDQU   2(AX), Y1
	VMOVDQU   34(AX), Y3
	VMOVDQU   66(AX), Y5
	VMOVDQU   98(AX), Y7
	VPCMPEQW  Y0, Y1, Y1
	VPCMPEQW  Y2, Y3, Y3
	VPCMPEQW  Y4, Y5, Y5
	VPCMPEQW  Y6, Y7, Y7
	VPMOVMSKB Y1, BX
	VPMOVMSKB Y3, SI
	VPMOVMSKB Y5, DI
	VPMOVMSKB Y7, R8
	TZCNTQ    BX, BX
	TZCNTQ    SI, SI
	TZCNTQ    DI, DI
	TZCNTQ    R8, R8
	CMPQ      BX, $0x40
	JNE       avx2_done0
	CMPQ      SI, $0x40
	JNE       avx2_done1
	CMPQ      DI, $0x40
	JNE       avx2_done2
	CMPQ      R8, $0x40
	JNE       avx2_done3
	ADDQ      $0x00000080, AX
	SUBQ      $0x00000080, CX

avx2_tail64:
	CMPQ      CX, $0x42
	JB        avx2_tail32
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   2(AX), Y1
	VMOVDQU   34(AX), Y3
	VPCMPEQW  Y0, Y1, Y1
	VPCMPEQW  Y2, Y3, Y3
	VPMOVMSKB Y1, BX
	VPMOVMSKB Y3, SI
	TZCNTQ    BX, BX
	TZCNTQ    SI, SI
	CMPQ      BX, $0x40
	JNE       avx2_done0
	CMPQ      SI, $0x40
	JNE       avx2_done1
	ADDQ      $0x00000040, AX
	SUBQ      $0x00000040, CX

avx2_tail32:
	CMPQ      CX, $0x22
	JB        avx2_tail16
	VMOVDQU   (AX), Y0
	VMOVDQU   2(AX), Y1
	VPCMPEQW  Y0, Y1, Y1
	VPMOVMSKB Y1, BX
	TZCNTQ    BX, BX
	CMPQ      BX, $0x40
	JNE       avx2_done0
	ADDQ      $0x00000020, AX
	SUBQ      $0x00000020, CX

avx2_tail16:
	CMPQ      CX, $0x12
	JB        avx2_tail
	VMOVDQU   (AX), X0
	VMOVDQU   2(AX), X1
	VPCMPEQW  X0, X1, X1
	VPMOVMSKB X1, BX
	TZCNTQ    BX, BX
	CMPQ      BX, $0x40
	JNE       avx2_done0
	ADDQ      $0x10, AX
	SUBQ      $0x10, CX

avx2_tail:
	VZEROUPPER
	JMP tail

avx2_done0:
	ADDQ BX, AX
	SUBQ BX, CX
	VZEROUPPER
	JMP  done

avx2_done1:
	ADDQ $0x00000020, AX
	SUBQ $0x00000020, CX
	ADDQ SI, AX
	SUBQ SI, CX
	VZEROUPPER
	JMP  done

avx2_done2:
	ADDQ $0x00000040, AX
	SUBQ $0x00000040, CX
	ADDQ DI, AX
	SUBQ DI, CX
	VZEROUPPER
	JMP  done

avx2_done3:
	ADDQ $0x00000060, AX
	SUBQ $0x00000060, CX
	ADDQ R8, AX
	SUBQ R8, CX
	VZEROUPPER
	JMP  done

avx2_done4:
	ADDQ $0x00000080, AX
	SUBQ $0x00000080, CX
	ADDQ R9, AX
	SUBQ R9, CX
	VZEROUPPER
	JMP  done

avx2_done5:
	ADDQ $0x000000a0, AX
	SUBQ $0x000000a0, CX
	ADDQ R10, AX
	SUBQ R10, CX
	VZEROUPPER
	JMP  done

avx2_done6:
	ADDQ $0x000000c0, AX
	SUBQ $0x000000c0, CX
	ADDQ R11, AX
	SUBQ R11, CX
	VZEROUPPER
	JMP  done

avx2_done7:
	ADDQ $0x000000e0, AX
	SUBQ $0x000000e0, CX
	ADDQ R12, AX
	SUBQ R12, CX
	VZEROUPPER
	JMP  done

// func indexPair4(b []byte) int
// Requires: AVX, AVX2, BMI
TEXT ·indexPair4(SB), NOSPLIT, $0-32
	MOVQ b_base+0(FP), AX
	MOVQ b_len+8(FP), CX
	MOVQ AX, DX
	CMPQ CX, $0x00
	JLE  done
	SUBQ $0x04, CX
	BTL  $0x08, github·com∕segmentio∕asm∕cpu·X86+0(SB)
	JCS  avx2

tail:
	CMPQ CX, $0x00
	JE   fail

generic:
	MOVL (AX), BX
	MOVL 4(AX), SI
	CMPL BX, SI
	JE   done
	ADDQ $0x04, AX
	SUBQ $0x04, CX
	CMPQ CX, $0x00
	JA   generic

fail:
	ADDQ $0x04, AX

done:
	SUBQ DX, AX
	MOVQ AX, ret+24(FP)
	RET

avx2:
	CMPQ CX, $0x00000104
	JB   avx2_tail128
	MOVQ $0x0000000000000000, BX
	MOVQ $0x0000000000000000, SI
	MOVQ $0x0000000000000000, DI
	MOVQ $0x0000000000000000, R8
	MOVQ $0x0000000000000000, R9
	MOVQ $0x0000000000000000, R10
	MOVQ $0x0000000000000000, R11
	MOVQ $0x0000000000000000, R12

avx2_loop256:
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   64(AX), Y4
	VMOVDQU   96(AX), Y6
	VMOVDQU   128(AX), Y8
	VMOVDQU   160(AX), Y10
	VMOVDQU   192(AX), Y12
	VMOVDQU   224(AX), Y14
	VMOVDQU   4(AX), Y1
	VMOVDQU   36(AX), Y3
	VMOVDQU   68(AX), Y5
	VMOVDQU   100(AX), Y7
	VMOVDQU   132(AX), Y9
	VMOVDQU   164(AX), Y11
	VMOVDQU   196(AX), Y13
	VMOVDQU   228(AX), Y15
	VPCMPEQD  Y0, Y1, Y1
	VPCMPEQD  Y2, Y3, Y3
	VPCMPEQD  Y4, Y5, Y5
	VPCMPEQD  Y6, Y7, Y7
	VPCMPEQD  Y8, Y9, Y9
	VPCMPEQD  Y10, Y11, Y11
	VPCMPEQD  Y12, Y13, Y13
	VPCMPEQD  Y14, Y15, Y15
	VPMOVMSKB Y1, BX
	VPMOVMSKB Y3, SI
	VPMOVMSKB Y5, DI
	VPMOVMSKB Y7, R8
	VPMOVMSKB Y9, R9
	VPMOVMSKB Y11, R10
	VPMOVMSKB Y13, R11
	VPMOVMSKB Y15, R12
	TZCNTQ    BX, BX
	TZCNTQ    SI, SI
	TZCNTQ    DI, DI
	TZCNTQ    R8, R8
	TZCNTQ    R9, R9
	TZCNTQ    R10, R10
	TZCNTQ    R11, R11
	TZCNTQ    R12, R12
	CMPQ      BX, $0x40
	JNE       avx2_done0
	CMPQ      SI, $0x40
	JNE       avx2_done1
	CMPQ      DI, $0x40
	JNE       avx2_done2
	CMPQ      R8, $0x40
	JNE       avx2_done3
	CMPQ      R9, $0x40
	JNE       avx2_done4
	CMPQ      R10, $0x40
	JNE       avx2_done5
	CMPQ      R11, $0x40
	JNE       avx2_done6
	CMPQ      R12, $0x40
	JNE       avx2_done7
	ADDQ      $0x00000100, AX
	SUBQ      $0x00000100, CX
	CMPQ      CX, $0x00000104
	JAE       avx2_loop256

avx2_tail128:
	CMPQ      CX, $0x84
	JB        avx2_tail64
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   64(AX), Y4
	VMOVDQU   96(AX), Y6
	VMOVDQU   4(AX), Y1
	VMOVDQU   36(AX), Y3
	VMOVDQU   68(AX), Y5
	VMOVDQU   100(AX), Y7
	VPCMPEQD  Y0, Y1, Y1
	VPCMPEQD  Y2, Y3, Y3
	VPCMPEQD  Y4, Y5, Y5
	VPCMPEQD  Y6, Y7, Y7
	VPMOVMSKB Y1, BX
	VPMOVMSKB Y3, SI
	VPMOVMSKB Y5, DI
	VPMOVMSKB Y7, R8
	TZCNTQ    BX, BX
	TZCNTQ    SI, SI
	TZCNTQ    DI, DI
	TZCNTQ    R8, R8
	CMPQ      BX, $0x40
	JNE       avx2_done0
	CMPQ      SI, $0x40
	JNE       avx2_done1
	CMPQ      DI, $0x40
	JNE       avx2_done2
	CMPQ      R8, $0x40
	JNE       avx2_done3
	ADDQ      $0x00000080, AX
	SUBQ      $0x00000080, CX

avx2_tail64:
	CMPQ      CX, $0x44
	JB        avx2_tail32
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   4(AX), Y1
	VMOVDQU   36(AX), Y3
	VPCMPEQD  Y0, Y1, Y1
	VPCMPEQD  Y2, Y3, Y3
	VPMOVMSKB Y1, BX
	VPMOVMSKB Y3, SI
	TZCNTQ    BX, BX
	TZCNTQ    SI, SI
	CMPQ      BX, $0x40
	JNE       avx2_done0
	CMPQ      SI, $0x40
	JNE       avx2_done1
	ADDQ      $0x00000040, AX
	SUBQ      $0x00000040, CX

avx2_tail32:
	CMPQ      CX, $0x24
	JB        avx2_tail16
	VMOVDQU   (AX), Y0
	VMOVDQU   4(AX), Y1
	VPCMPEQD  Y0, Y1, Y1
	VPMOVMSKB Y1, BX
	TZCNTQ    BX, BX
	CMPQ      BX, $0x40
	JNE       avx2_done0
	ADDQ      $0x00000020, AX
	SUBQ      $0x00000020, CX

avx2_tail16:
	CMPQ      CX, $0x14
	JB        avx2_tail
	VMOVDQU   (AX), X0
	VMOVDQU   4(AX), X1
	VPCMPEQD  X0, X1, X1
	VPMOVMSKB X1, BX
	TZCNTQ    BX, BX
	CMPQ      BX, $0x40
	JNE       avx2_done0
	ADDQ      $0x10, AX
	SUBQ      $0x10, CX

avx2_tail:
	VZEROUPPER
	JMP tail

avx2_done0:
	ADDQ BX, AX
	SUBQ BX, CX
	VZEROUPPER
	JMP  done

avx2_done1:
	ADDQ $0x00000020, AX
	SUBQ $0x00000020, CX
	ADDQ SI, AX
	SUBQ SI, CX
	VZEROUPPER
	JMP  done

avx2_done2:
	ADDQ $0x00000040, AX
	SUBQ $0x00000040, CX
	ADDQ DI, AX
	SUBQ DI, CX
	VZEROUPPER
	JMP  done

avx2_done3:
	ADDQ $0x00000060, AX
	SUBQ $0x00000060, CX
	ADDQ R8, AX
	SUBQ R8, CX
	VZEROUPPER
	JMP  done

avx2_done4:
	ADDQ $0x00000080, AX
	SUBQ $0x00000080, CX
	ADDQ R9, AX
	SUBQ R9, CX
	VZEROUPPER
	JMP  done

avx2_done5:
	ADDQ $0x000000a0, AX
	SUBQ $0x000000a0, CX
	ADDQ R10, AX
	SUBQ R10, CX
	VZEROUPPER
	JMP  done

avx2_done6:
	ADDQ $0x000000c0, AX
	SUBQ $0x000000c0, CX
	ADDQ R11, AX
	SUBQ R11, CX
	VZEROUPPER
	JMP  done

avx2_done7:
	ADDQ $0x000000e0, AX
	SUBQ $0x000000e0, CX
	ADDQ R12, AX
	SUBQ R12, CX
	VZEROUPPER
	JMP  done

// func indexPair8(b []byte) int
// Requires: AVX, AVX2, BMI
TEXT ·indexPair8(SB), NOSPLIT, $0-32
	MOVQ b_base+0(FP), AX
	MOVQ b_len+8(FP), CX
	MOVQ AX, DX
	CMPQ CX, $0x00
	JLE  done
	SUBQ $0x08, CX
	BTL  $0x08, github·com∕segmentio∕asm∕cpu·X86+0(SB)
	JCS  avx2

tail:
	CMPQ CX, $0x00
	JE   fail

generic:
	MOVQ (AX), BX
	MOVQ 8(AX), SI
	CMPQ BX, SI
	JE   done
	ADDQ $0x08, AX
	SUBQ $0x08, CX
	CMPQ CX, $0x00
	JA   generic

fail:
	ADDQ $0x08, AX

done:
	SUBQ DX, AX
	MOVQ AX, ret+24(FP)
	RET

avx2:
	CMPQ CX, $0x00000108
	JB   avx2_tail128
	MOVQ $0x0000000000000000, BX
	MOVQ $0x0000000000000000, SI
	MOVQ $0x0000000000000000, DI
	MOVQ $0x0000000000000000, R8
	MOVQ $0x0000000000000000, R9
	MOVQ $0x0000000000000000, R10
	MOVQ $0x0000000000000000, R11
	MOVQ $0x0000000000000000, R12

avx2_loop256:
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   64(AX), Y4
	VMOVDQU   96(AX), Y6
	VMOVDQU   128(AX), Y8
	VMOVDQU   160(AX), Y10
	VMOVDQU   192(AX), Y12
	VMOVDQU   224(AX), Y14
	VMOVDQU   8(AX), Y1
	VMOVDQU   40(AX), Y3
	VMOVDQU   72(AX), Y5
	VMOVDQU   104(AX), Y7
	VMOVDQU   136(AX), Y9
	VMOVDQU   168(AX), Y11
	VMOVDQU   200(AX), Y13
	VMOVDQU   232(AX), Y15
	VPCMPEQQ  Y0, Y1, Y1
	VPCMPEQQ  Y2, Y3, Y3
	VPCMPEQQ  Y4, Y5, Y5
	VPCMPEQQ  Y6, Y7, Y7
	VPCMPEQQ  Y8, Y9, Y9
	VPCMPEQQ  Y10, Y11, Y11
	VPCMPEQQ  Y12, Y13, Y13
	VPCMPEQQ  Y14, Y15, Y15
	VPMOVMSKB Y1, BX
	VPMOVMSKB Y3, SI
	VPMOVMSKB Y5, DI
	VPMOVMSKB Y7, R8
	VPMOVMSKB Y9, R9
	VPMOVMSKB Y11, R10
	VPMOVMSKB Y13, R11
	VPMOVMSKB Y15, R12
	TZCNTQ    BX, BX
	TZCNTQ    SI, SI
	TZCNTQ    DI, DI
	TZCNTQ    R8, R8
	TZCNTQ    R9, R9
	TZCNTQ    R10, R10
	TZCNTQ    R11, R11
	TZCNTQ    R12, R12
	CMPQ      BX, $0x40
	JNE       avx2_done0
	CMPQ      SI, $0x40
	JNE       avx2_done1
	CMPQ      DI, $0x40
	JNE       avx2_done2
	CMPQ      R8, $0x40
	JNE       avx2_done3
	CMPQ      R9, $0x40
	JNE       avx2_done4
	CMPQ      R10, $0x40
	JNE       avx2_done5
	CMPQ      R11, $0x40
	JNE       avx2_done6
	CMPQ      R12, $0x40
	JNE       avx2_done7
	ADDQ      $0x00000100, AX
	SUBQ      $0x00000100, CX
	CMPQ      CX, $0x00000108
	JAE       avx2_loop256

avx2_tail128:
	CMPQ      CX, $0x88
	JB        avx2_tail64
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   64(AX), Y4
	VMOVDQU   96(AX), Y6
	VMOVDQU   8(AX), Y1
	VMOVDQU   40(AX), Y3
	VMOVDQU   72(AX), Y5
	VMOVDQU   104(AX), Y7
	VPCMPEQQ  Y0, Y1, Y1
	VPCMPEQQ  Y2, Y3, Y3
	VPCMPEQQ  Y4, Y5, Y5
	VPCMPEQQ  Y6, Y7, Y7
	VPMOVMSKB Y1, BX
	VPMOVMSKB Y3, SI
	VPMOVMSKB Y5, DI
	VPMOVMSKB Y7, R8
	TZCNTQ    BX, BX
	TZCNTQ    SI, SI
	TZCNTQ    DI, DI
	TZCNTQ    R8, R8
	CMPQ      BX, $0x40
	JNE       avx2_done0
	CMPQ      SI, $0x40
	JNE       avx2_done1
	CMPQ      DI, $0x40
	JNE       avx2_done2
	CMPQ      R8, $0x40
	JNE       avx2_done3
	ADDQ      $0x00000080, AX
	SUBQ      $0x00000080, CX

avx2_tail64:
	CMPQ      CX, $0x48
	JB        avx2_tail32
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   8(AX), Y1
	VMOVDQU   40(AX), Y3
	VPCMPEQQ  Y0, Y1, Y1
	VPCMPEQQ  Y2, Y3, Y3
	VPMOVMSKB Y1, BX
	VPMOVMSKB Y3, SI
	TZCNTQ    BX, BX
	TZCNTQ    SI, SI
	CMPQ      BX, $0x40
	JNE       avx2_done0
	CMPQ      SI, $0x40
	JNE       avx2_done1
	ADDQ      $0x00000040, AX
	SUBQ      $0x00000040, CX

avx2_tail32:
	CMPQ      CX, $0x28
	JB        avx2_tail16
	VMOVDQU   (AX), Y0
	VMOVDQU   8(AX), Y1
	VPCMPEQQ  Y0, Y1, Y1
	VPMOVMSKB Y1, BX
	TZCNTQ    BX, BX
	CMPQ      BX, $0x40
	JNE       avx2_done0
	ADDQ      $0x00000020, AX
	SUBQ      $0x00000020, CX

avx2_tail16:
	CMPQ      CX, $0x18
	JB        avx2_tail
	VMOVDQU   (AX), X0
	VMOVDQU   8(AX), X1
	VPCMPEQQ  X0, X1, X1
	VPMOVMSKB X1, BX
	TZCNTQ    BX, BX
	CMPQ      BX, $0x40
	JNE       avx2_done0
	ADDQ      $0x10, AX
	SUBQ      $0x10, CX

avx2_tail:
	VZEROUPPER
	JMP tail

avx2_done0:
	ADDQ BX, AX
	SUBQ BX, CX
	VZEROUPPER
	JMP  done

avx2_done1:
	ADDQ $0x00000020, AX
	SUBQ $0x00000020, CX
	ADDQ SI, AX
	SUBQ SI, CX
	VZEROUPPER
	JMP  done

avx2_done2:
	ADDQ $0x00000040, AX
	SUBQ $0x00000040, CX
	ADDQ DI, AX
	SUBQ DI, CX
	VZEROUPPER
	JMP  done

avx2_done3:
	ADDQ $0x00000060, AX
	SUBQ $0x00000060, CX
	ADDQ R8, AX
	SUBQ R8, CX
	VZEROUPPER
	JMP  done

avx2_done4:
	ADDQ $0x00000080, AX
	SUBQ $0x00000080, CX
	ADDQ R9, AX
	SUBQ R9, CX
	VZEROUPPER
	JMP  done

avx2_done5:
	ADDQ $0x000000a0, AX
	SUBQ $0x000000a0, CX
	ADDQ R10, AX
	SUBQ R10, CX
	VZEROUPPER
	JMP  done

avx2_done6:
	ADDQ $0x000000c0, AX
	SUBQ $0x000000c0, CX
	ADDQ R11, AX
	SUBQ R11, CX
	VZEROUPPER
	JMP  done

avx2_done7:
	ADDQ $0x000000e0, AX
	SUBQ $0x000000e0, CX
	ADDQ R12, AX
	SUBQ R12, CX
	VZEROUPPER
	JMP  done

// func indexPair16(b []byte) int
// Requires: SSE2, SSE4.1
TEXT ·indexPair16(SB), NOSPLIT, $0-32
	MOVQ b_base+0(FP), AX
	MOVQ b_len+8(FP), CX
	MOVQ AX, DX
	CMPQ CX, $0x00
	JLE  done
	SUBQ $0x10, CX
	CMPQ CX, $0x00
	JE   fail

generic:
	MOVOU    (AX), X0
	MOVOU    16(AX), X1
	PCMPEQQ  X0, X1
	PMOVMSKB X1, BX
	CMPL     BX, $0x0000ffff
	JE       done
	ADDQ     $0x10, AX
	SUBQ     $0x10, CX
	CMPQ     CX, $0x00
	JA       generic

fail:
	ADDQ $0x10, AX

done:
	SUBQ DX, AX
	MOVQ AX, ret+24(FP)
	RET
