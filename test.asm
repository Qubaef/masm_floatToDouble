.686
.model flat

extern _malloc : proc
public _floatToDouble

.data

.code

	_floatToDouble proc
		push ebp
		mov ebp, esp
		push ebx
		push esi
		push edi

		mov esi, [ebp+8]
		mov edi, [ebp+12]

		mov ebx, 0
		mov edx, 0
		mov eax, [esi]

		; weü wyk≥adnik
		mov ebx, eax
		shr ebx, 23
		btr ebx, 8
		sub bx, 127
		add bx, 1023

		; weü znak
		shl ebx, 21
		bt eax, 31
		rcr ebx, 1
		
		; 1 czesc liczby
		and eax, 00000000011111111111111111111111b
		mov dword ptr [edi], 0
		mov ecx, 3
	ptl3:
		shr eax, 1
		rcr dword ptr [edi], 1
		loop ptl3

		or ebx, eax

		; 2 czesc liczby
		mov dword ptr [edi + 4], ebx

		pop edi
		pop esi
		pop ebx
		pop ebp 
		ret
	_floatToDouble endp
end