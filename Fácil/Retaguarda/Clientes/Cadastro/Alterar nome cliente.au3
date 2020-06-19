HotKeySet("{x}", "Mudar_Nome_Cliente")
HotKeySet("{z}", "Mudar_Nome_Fornecedor")
HotKeySet("{w}", "Mudar_Nome_Funcionario")
HotKeySet("{esc}", "sair")

Global $loop = 0

while 1
    if $loop = 0 Then
        Sleep(100)
     EndIf
wend

Func Mudar_Nome_Cliente()
	$cliente = 1306
	WinWaitActive("Sistema Fácil Retaguarda - Versão: 5.9.1.0  - Build: 5.9.1.0 > Cadastro de Clientes")
	While $cliente < 1646
		MouseClick("left", 920, 774, 1)
		MouseClick("left", 742, 365, 1)
		Send(" " & $cliente)
		MouseClick("left", 921, 775, 1)
		MouseClick("left", 1173, 773, 1)
		$cliente += 1
	WEnd
EndFunc

Func Mudar_Nome_Fornecedor()
	$fornecedor = 1
	WinWaitActive("Sistema Fácil Retaguarda - Versão: 5.9.1.0  - Build: 5.9.1.0 > Cadastro de Fornecedores")
	While $fornecedor < 109
		MouseClick("left", 920, 774, 1)
		MouseClick("left", 793, 365, 1)
		Send(" " & $fornecedor)
		MouseClick("left", 921, 775, 1)
		MouseClick("left", 1177, 773, 1)
		$fornecedor += 1
	WEnd
EndFunc

Func Mudar_Nome_Funcionario()
	$funcionario = 60
	WinWaitActive("Sistema Fácil Retaguarda - Versão: 5.8.1.0  - Build: 5.8.1.18 > Cadastro de Funcionários")
	While $funcionario < 74
		MouseClick("left", 973, 774, 1)
		MouseClick("left", 940, 362, 1)
		Send(" " & $funcionario)
		MouseClick("left", 973, 774, 1)
		MouseClick("left", 1225, 774, 1)
		$funcionario += 1
	WEnd
EndFunc

Func sair()
	Exit
EndFunc
