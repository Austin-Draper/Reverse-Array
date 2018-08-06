TITLE Reverse Array              (RevArr.asm)
;Austin Draper
;3/17/16
;This program will use a loop and indexed addressing 
;to reverse the elements of an array. 
INCLUDE Irvine32.inc

.data
dwarray          DWORD 3, 5, 7, 9, 13, 15, 17, 19
.code
main PROC
    xor edi, edi
    xor esi, esi
	mov edi, OFFSET dwarray[SIZEOF dwarray] -4
    mov esi, OFFSET dwarray
    mov ecx, LENGTHOF dwarray/2

L1: mov eax, [esi]                                         ;should I be using eax or al? 
    mov ebx, [edi]                                         ;should I be using ebx or bl?
    mov [edi], eax
    mov [esi], ebx
	add esi, 4
	sub edi, 4
    LOOP L1

	mov esi, OFFSET dwarray
	mov ecx, LENGTHOF dwarray
	mov ebx, TYPE dwarray
	call DumpMem					                       ;See the results in Array
	call WaitMsg

	exit
main ENDP
END main

