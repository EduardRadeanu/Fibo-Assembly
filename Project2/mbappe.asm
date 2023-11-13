;sirul Fibonacci: F1=1; F2=1; F_n=F_n-1+F_n-2 pentru n>2
;dat n,afisam F_n
;folosim o procedura fibo cu un argument transmis pe stiva si returneaza f_n in eax
includelib msvcrt.lib
includelib legacy_stdio_definitions.lib
.386
.MODEL	FLAT,C
.STACK	100h
printf PROTO :ptr BYTE, :VARARG	
scanf  PROTO :ptr BYTE, :VARARG
.DATA	
mes  BYTE "Introduceti pozitia:",0
fmt  BYTE "%d",0
mes2 BYTE "Al %d-lea termen al sirului Fibonacci este:%d",0Ah,0
poz  DWORD	?  
.CODE
main	PROC
INVOKE printf,ADDR mes
INVOKE scanf,ADDR fmt,ADDR poz
push poz
call fibo
add esp,4
INVOKE printf,ADDR mes2,poz,eax
ret
main    ENDP


fibo PROC  arg:DWORd
    mov eax,1 ;F2
	mov edx,1 ;F1
	mov ecx,3	
while01:						
;for(k=3;k<=arg;k++) 
;eax<-eax+edx  si edx<-eax
cmp ecx,arg
	jg endwhile01
	add edx,eax
	xchg edx,eax			;schimba valorile intre ele
	;sub esp,4; mov [esp],eax; add eax,edx; mov edx,[esp]; add esp,4
	inc ecx
	jmp while01
endwhile01:
	ret	
fibo ENDP
	END
