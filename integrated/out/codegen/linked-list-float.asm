global main

extern malloc
extern printf
extern scanf

section .data
			function_return_error_msg db "Error: function with return type not void, did not seem to return", 0x0a, 0
			array_access_up_error_msg db "Error: array index exceeds dimension size", 0x0a, 0
			array_access_low_error_msg db "Error: array index cannot be negative", 0x0a, 0
		_149 DD 10
	_int db "%i", 0x00
	_float db "%f", 0
	__dummy_float dq 0.0
	_float_in db "%lf", 0
	_int_in db "%i", 0
	_char db "%c", 0
	_char_in db "%c", 0


section .text

func_List_set_value:
	push ebp
	mov ebp, esp
	sub esp, 4
	;mem
	;x_5
	mov dword eax, [ebp - -8]
	mov dword ebx, [ebp - -12]
	mov dword [ebx+0], eax
	mov dword [ ebp - -8], eax
	mov dword [ ebp - -12], ebx
	mov dword esp, ebp
	pop ebp
	ret
func_List_set_next:
	push ebp
	mov ebp, esp
	sub esp, 4
	;mem
	;next_7
	mov dword eax, [ebp - -8]
	mov dword ebx, [ebp - -12]
	mov dword [ebx+4], eax
	mov dword [ ebp - -12], ebx
	mov dword [ ebp - -8], eax
	mov dword esp, ebp
	pop ebp
	ret
main:
	push ebp
	mov ebp, esp
	sub esp, 4
	sub esp, 4
	push 40
	call malloc
	add esp, 4
	push eax
	sub esp, 4
	sub esp, 4
	sub esp, 4
	sub esp, 4
	sub esp, 4
	sub esp, 4
	sub esp, 4
	sub esp, 4
	sub esp, 4
	sub esp, 4
	sub esp, 4
	sub esp, 4
	sub esp, 4
	sub esp, 4
	sub esp, 4
	sub esp, 4
	sub esp, 4
	sub esp, 4
	sub esp, 4
	sub esp, 4
	sub esp, 4
	sub esp, 4
	sub esp, 4
	sub esp, 4
	sub esp, 4
	sub esp, 4
	sub esp, 4
	sub esp, 4
	sub esp, 4
	sub esp, 4
	sub esp, 4
	push 0
	call malloc
	add esp, 4
	mov [ebp -8], eax
	mov dword eax, [ebp - 8]
	push eax
	mov dword [ ebp - 8], eax
	call func_IO_IO
	add esp, 1* 4
	mov dword eax, [ ebp - 8]
	mov dword [ ebp - 16], 0
	mov dword [ ebp - 4], eax

label_27:
	mov dword [ ebp - 20], 1
	cmp dword [ ebp - 16], 10
	jl label_31
	mov dword [ ebp - 20], 0

label_31:
	cmp dword [ ebp - 20], 0
	je label_64
	push 8
	call malloc
	add esp, 4
	mov [ebp -24], eax
	mov dword eax, [ebp - 24]
	push eax
	mov dword [ ebp - 24], eax
	call func_List_List
	add esp, 1* 4
	mov dword [ ebp - 28], 0
	cmp dword [ ebp - 16], 0
	jge label_40
	push array_access_low_error_msg
	call printf
	mov dword eax, 1
	int 0x80

label_40:
	cmp dword [ ebp - 16], 10
	jl label_42
	push array_access_up_error_msg
	call printf
	mov dword eax, 1
	int 0x80

label_42:
	mov dword eax, [ebp - 28]
	mov dword ebx, [ ebp - 16]
	add dword eax, ebx
	mov dword ecx, [ebp - 24]
	mov dword edx, [ebp - 12]
	mov dword [edx + eax * 4], ecx
	mov dword [ebp - 16], ebx
	fild dword [ebp - 16]
	fstp dword [ebp - 36]
	fld dword [ebp -36]
	fstp dword [ebp - 32]
	mov dword [ ebp - 40], 0
	cmp dword ebx, 0
	mov dword [ ebp - 12], edx
	mov dword [ ebp - 16], ebx
	mov dword [ ebp - 24], ecx
	mov dword [ ebp - 28], eax
	jge label_52
	push array_access_low_error_msg
	call printf
	mov dword eax, 1
	int 0x80

label_52:
	cmp dword [ ebp - 16], 10
	jl label_54
	push array_access_up_error_msg
	call printf
	mov dword eax, 1
	int 0x80

label_54:
	mov dword eax, [ebp - 40]
	add dword eax, [ ebp - 16]
	mov dword ecx, [ebp - 12]
	mov dword ebx, [ecx + eax * 4]
	push ebx
	mov dword edx, [ebp - 16]
	push edx
	mov dword [ ebp - 12], ecx
	mov dword [ ebp - 16], edx
	mov dword [ ebp - 40], eax
	mov dword [ ebp - 44], ebx
	call func_List_set_value
	add esp, 2* 4
	mov dword eax, [ebp - 16]
	mov dword [ ebp - 48], eax
	add dword eax, 1
	mov dword [ ebp - 16], eax
	jmp label_27

label_64:
	mov dword [ ebp - 56], 0

label_67:
	mov dword [ ebp - 60], 1
	cmp dword [ ebp - 56], 9
	jl label_71
	mov dword [ ebp - 60], 0

label_71:
	cmp dword [ ebp - 60], 0
	je label_99
	mov dword [ ebp - 64], 0
	cmp dword [ ebp - 56], 0
	jge label_76
	push array_access_low_error_msg
	call printf
	mov dword eax, 1
	int 0x80

label_76:
	cmp dword [ ebp - 56], 10
	jl label_78
	push array_access_up_error_msg
	call printf
	mov dword eax, 1
	int 0x80

label_78:
	mov dword eax, [ebp - 64]
	mov dword ebx, [ ebp - 56]
	add dword eax, ebx
	mov dword edx, [ebp - 12]
	mov dword ecx, [edx + eax * 4]
	mov dword [ ebp - 72], 0
	mov dword [ ebp - 56], ebx
	add dword ebx, 1
	cmp dword ebx, 0
	mov dword [ ebp - 12], edx
	mov dword [ ebp - 64], eax
	mov dword [ ebp - 68], ecx
	mov dword [ ebp - 76], ebx
	jge label_87
	push array_access_low_error_msg
	call printf
	mov dword eax, 1
	int 0x80

label_87:
	cmp dword [ ebp - 76], 10
	jl label_89
	push array_access_up_error_msg
	call printf
	mov dword eax, 1
	int 0x80

label_89:
	mov dword eax, [ebp - 72]
	add dword eax, [ ebp - 76]
	mov dword ecx, [ebp - 12]
	mov dword ebx, [ecx + eax * 4]
	mov dword edx, [ebp - 68]
	push edx
	push ebx
	mov dword [ ebp - 12], ecx
	mov dword [ ebp - 68], edx
	mov dword [ ebp - 72], eax
	mov dword [ ebp - 80], ebx
	call func_List_set_next
	add esp, 2* 4
	mov dword eax, [ebp - 56]
	mov dword [ ebp - 84], eax
	add dword eax, 1
	mov dword [ ebp - 56], eax
	jmp label_67

label_99:
	mov dword eax, 0
	add dword eax, 1
	mov dword ecx, [ebp - 12]
	mov dword ebx, [ecx + eax * 4]
	mov dword edx, 0
	add dword edx, 2
	mov dword esi, [ecx + edx * 4]
	fld dword [esi+0]
	fstp dword [ebp - 104]
	push ebx
	sub esp, 4
	fld dword [ebp - 104]
	fstp dword [esp]
	mov dword [ ebp - 12], ecx
	mov dword [ ebp - 88], eax
	mov dword [ ebp - 92], ebx
	mov dword [ ebp - 96], edx
	mov dword [ ebp - 100], esi
	call func_List_set_value
	add esp, 1* 4
	mov dword eax, 0
	add dword eax, 0
	mov dword ecx, [ebp - 12]
	mov dword ebx, [ecx + eax * 4]
	mov dword [ ebp - 116], ebx
	mov dword [ ebp - 120], 0
	mov dword [ ebp - 12], ecx
	mov dword [ ebp - 108], ebx
	mov dword [ ebp - 112], eax

label_123:
	mov dword [ ebp - 124], 1
	cmp dword [ ebp - 120], 10
	jl label_127
	mov dword [ ebp - 124], 0

label_127:
	cmp dword [ ebp - 124], 0
	je label_144
	mov dword eax, [ebp - 108]
	fld dword [eax+0]
	fstp dword [ebp - 128]
	fld dword [ebp -128]
	fstp dword [ebp - 52]
	mov ebx, [eax+4]
	mov dword eax, ebx
	mov dword ecx, [ebp - 4]
	push ecx
	sub esp, 4
	fld dword [ebp - 52]
	fstp dword [esp]
	mov dword [ ebp - 4], ecx
	mov dword [ ebp - 108], eax
	mov dword [ ebp - 132], ebx
	call func_IO_print_float
	add esp, 1* 4
	mov dword eax, [ebp - 4]
	push eax
	;-1
	push 10
	mov dword [ ebp - 4], eax
	call func_IO_print_char
	add esp, 1* 4
	mov dword eax, [ebp - 120]
	mov dword [ ebp - 136], eax
	add dword eax, 1
	mov dword [ ebp - 120], eax
	jmp label_123

label_144:
	mov dword esp, ebp
	pop ebp
	ret
func_List_List:
	push ebp
	mov ebp, esp
	sub esp, 4
	sub esp, 4
	sub esp, 4
	mov dword eax, [ebp - -8]
	fld dword [eax+0]
	fstp dword [ebp - 4]
	fild dword [_149]
	fstp dword [ebp - 8]
	;mem
	;t2
	mov dword ebx, [ebp - 8]
	mov dword [eax+0], ebx
	mov ecx, [eax+4]
	mov dword [ ebp - -8], eax
	mov dword [ ebp - 8], ebx
	mov dword [ ebp - 12], ecx
	mov dword esp, ebp
	pop ebp
	ret

func_IO_IO:
	ret
func_IO_print_char:
	push ebp
	mov ebp, esp
	mov eax, [ebp+8]
	mov edx, 0
	mov ebx, 128
	div ebx
	push edx
	push _char
	call printf
	mov esp, ebp
	pop ebp
	ret
func_IO_print_int:
	push ebp
	mov ebp, esp
	mov eax, [ebp + 8]
	push eax
	push _int
	call printf
	mov esp, ebp
	pop ebp
	ret
func_IO_print_float:
	push ebp
	mov ebp, esp
	fld dword [ebp + 8]
	sub esp, 8
	fstp qword [esp]
	push _float
	call printf
	mov esp, ebp
	pop ebp
	ret
func_IO_scan_char:
	push ebp
	mov ebp, esp
	sub esp, 4
	push esp
	push _char_in
	call scanf
	mov dword eax, [ebp - 4]
	mov esp, ebp
	pop ebp
	ret
func_IO_scan_int:
	push ebp
	mov ebp, esp
	sub esp, 4
	push esp 
	push _int_in
	call scanf
	mov eax, [ebp - 4]
	mov esp, ebp
	pop ebp
	ret
func_IO_scan_float:
	push ebp
	mov ebp, esp
	push __dummy_float
	push _float_in
	call scanf
	fld qword [__dummy_float]
	mov esp, ebp
	pop ebp
	ret