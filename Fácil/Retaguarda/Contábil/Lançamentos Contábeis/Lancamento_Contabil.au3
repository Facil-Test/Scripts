HotKeySet("{x}", "contabil_receita")
HotKeySet("{z}", "contabil_despesa")
HotKeySet("{w}", "editar_excluir")
HotKeySet("{esc}", "sair")

Global $versao_sistema = "Sistema Fácil Retaguarda - Versão: 5.9.1.0  - Build: 5.9.1.0"
Global $loop = 0

while 1
    if $loop = 0 Then
        Sleep(100)
     EndIf
wend

Func contabil_receita()
    WinWaitActive("Sistema Fácil Retaguarda - Versão: 5.9.1.0  - Build: 5.9.1.0")
    MouseClick("left", 399, 38, 1)
    MouseClick("left", 475, 260, 1)
    WinWaitActive("Sistema Fácil Retaguarda - Versão: 5.9.1.0  - Build: 5.9.1.0 > CONSULTA DE LANÇAMENTOS CONTÁBEIS")
    MouseClick("left", 1288, 760, 1)
    WinWaitActive("Sistema Fácil Retaguarda - Versão: 5.9.1.0  - Build: 5.9.1.0 > Lançamentos Contábeis")
	$documento = 1
	$historico = 1
	$valor = 1
	$Plano_contas = 1 ; vai até 120
	$centro_de_custo = 1 ; Vai até 5
	$cliente = 2
	$pc = 1
	$h1 = "Histórico"
	;Inserir Receita
	While $pc < 121
		MouseClick("left", 924, 775, 1)
		MouseClick("left", 696, 333, 1)
		MouseClick("left", 873, 349, 1)
		Send($documento)
		MouseClick("left", 969, 349, 1)
		Send($h1 & " " & $historico)
		Send("{ENTER}")
		If $Plano_contas < 61 Then
			Send("12122019")
		EndIf
		If $Plano_contas > 60 Then
			Send("01012020")
		EndIf
		MouseClick("left", 744, 398, 1)
		Send($Valor)
		MouseClick("left", 871, 398, 1)
		Send($Plano_contas)
		MouseClick("left", 818, 447, 1)
		If $Plano_contas < 61 Then
			MouseClick("left", 615, 485, 1)
		EndIf
		If $Plano_contas > 60 Then
			MouseClick("left", 617, 518, 1)
		EndIf
		MouseClick("left", 877, 447, 1)
		Send($cliente)
		MouseClick("left", 970, 495, 1)
		If $pc < 25 Then
			Send("1")
		EndIf
		If $pc > 24 and $pc < 49 Then
			Send("2")
		EndIf
		If $pc > 48 and $pc < 73 Then
			Send("3")
		EndIf
		If $pc > 72 and $pc < 97 Then
			Send("4")
		EndIf
		If $pc > 96 Then
			Send("5")
		EndIf
		MouseClick("left", 924, 775, 1)

		;Sleep(500)
		$documento += 1
		$historico += 1
		$valor += 1
		$Plano_contas += 1
		$cliente += 1
		$pc += 1
		If $cliente = 6 Then
			$cliente += 1
		EndIf
	WEnd

EndFunc
Func contabil_despesa()
    WinWaitActive("Sistema Fácil Retaguarda - Versão: 5.9.1.0  - Build: 5.9.1.0")
    MouseClick("left", 399, 38, 1)
    MouseClick("left", 475, 260, 1)
    WinWaitActive("Sistema Fácil Retaguarda - Versão: 5.9.1.0  - Build: 5.9.1.0 > CONSULTA DE LANÇAMENTOS CONTÁBEIS")
    MouseClick("left", 1288, 760, 1)
    WinWaitActive("Sistema Fácil Retaguarda - Versão: 5.9.1.0  - Build: 5.9.1.0 > Lançamentos Contábeis")
	$documento = 121
	$historico = 121
	$valor = 121
	$Plano_contas = 1 ; vai até 120
	$centro_de_custo = 1 ; Vai até 5
	$fornecedor = 1
	$pc = 1
	$h1 = "Histórico"
	;Inserir Receita
	While $pc < 121
		MouseClick("left", 924, 775, 1)
		MouseClick("left", 698, 348, 1)
		MouseClick("left", 873, 349, 1)
		Send($documento)
		MouseClick("left", 969, 349, 1)
		Send($h1 & " " & $historico)
		Send("{ENTER}")
		If $Plano_contas < 61 Then
			Send("12122019")
		EndIf
		If $Plano_contas > 60 Then
			Send("01012020")
		EndIf
		MouseClick("left", 744, 398, 1)
		Send($Valor)
		MouseClick("left", 871, 398, 1)
		Send($Plano_contas)
		MouseClick("left", 818, 447, 1)
		If $Plano_contas < 61 Then
			MouseClick("left", 615, 485, 1)
		EndIf
		If $Plano_contas > 60 Then
			MouseClick("left", 617, 518, 1)
		EndIf
		MouseClick("left", 877, 447, 1)
		Send($fornecedor)
		MouseClick("left", 970, 495, 1)
		If $pc < 25 Then
			Send("1")
		EndIf
		If $pc > 24 and $pc < 49 Then
			Send("2")
		EndIf
		If $pc > 48 and $pc < 73 Then
			Send("3")
		EndIf
		If $pc > 72 and $pc < 97 Then
			Send("4")
		EndIf
		If $pc > 96 Then
			Send("5")
		EndIf
		MouseClick("left", 924, 775, 1)

		$documento += 1
		$historico += 1
		$valor += 1
		$Plano_contas += 1
		$fornecedor += 1
		$pc += 1
		If $fornecedor = 108 Then
			$fornecedor = 1
		EndIf

	WEnd

EndFunc
Func editar_excluir()
	WinWaitActive("Sistema Fácil Retaguarda - Versão: 5.9.1.0  - Build: 5.9.1.0 > Lançamentos Contábeis")
	MouseClick("left", 974, 774, 1)
	MouseClick("left", 869, 350, 2)
	Send("999")
	MouseClick("left", 1012, 350, 1)
	Send("^+{a}")
	Send("{del}")
	Send("HISTÓRICO 999")
	Send("{enter}")
	Send("19092019")
	MouseClick("left", 714, 399, 2)
	Send("999")
	MouseClick("left", 880, 399, 2)
	Send("99")
	MouseClick("left", 817, 446, 1)
	MouseClick("left", 690, 484, 1)
	Send("{enter}")
	Send("99")
	Send("{enter}")
	Sleep(200)
	Send("^+{a}")
	Send("{del}")
	Send("2")
	Send("{enter}")
	Sleep(200)
	Send("^+{a}")
	Send("{del}")
	Send("1")
	MouseClick("left", 974, 773, 1)
	Sleep(2000)
	MouseClick("left", 1024, 774, 1)
	MouseClick("left", 894, 571, 1)

EndFunc
Func sair()
	Exit
EndFunc
