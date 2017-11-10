; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -march=wasm32 | FileCheck %s

declare i32 @get_int(i16 %arg)

define i32 @func_1(i16 %arg1 , i32 %arg2) #0 {
; CHECK-LABEL: func_1:
; CHECK:       # BB#0: # %entry
; CHECK-NEXT:    i32.const $push1=, 16
; CHECK-NEXT:    i32.shl $push2=, $0, $pop1
; CHECK-NEXT:    i32.const $push4=, 16
; CHECK-NEXT:    i32.shr_s $push3=, $pop2, $pop4
; CHECK-NEXT:    i32.call $push0=, get_int@FUNCTION, $pop3
; CHECK-NEXT:    # fallthrough-return: $pop0
; CHECK-NEXT:    .endfunc
entry:
  %retval = call i32 @get_int(i16 signext %arg1)
  ret i32 %retval
}

attributes #0 = {noinline nounwind optnone}
