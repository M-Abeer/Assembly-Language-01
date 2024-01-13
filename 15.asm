.model small
.stack 100h
.data
	msg1 db "Enter your numbers: ", "$"
	msg2 db "Odd numbers in array are: ", "$"
	newline db 10,13,"$"
	pno dw 0
	cno dw 0
	ten dw 10
	intArr dw 5 dup(0)
	two dw 2
.code
  main proc
	mov ax,@data
	mov ds,ax

	mov dx,offset msg1
	call coutstr

	mov si,offset intArr
	mov cx,5
	inputArr:
		call getnum
		mov ax,pno
		mov [si],ax
		add si,2
		loop inputArr

	mov dx,offset msg2
	call coutstr
	
	mov si,offset intArr
	mov cx,5
	displayArr:
		mov ax,[si]
		mov dx,0
		mov pno,ax
		div two
		cmp dx,0
		je skip
		call shownum
		mov dx,offset newline
		call coutstr
		skip:
			add si,2
			loop displayArr
		
	mov ah,04ch
	int 21h
  main endp
  include io.lib
end