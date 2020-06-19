; Lançar débito com Fornecedor

HotKeySet("{z}", "lacar_debito_fornecedor")
Global $tela = "Sistema Fácil Retaguarda - Versão: 5.9.1.0  - Build: 5.9.1.0"
Global $fornecedor = 2
Global $centro_custo = "1"
Global $c_custo = ""
Global $titulo = "Baixa do Título"
Global $status = 0
$loop = 0

While 1
   if $loop = 0 Then
	  Sleep(100)
   EndIf
WEnd

Func consultar_lancamento_caixa() ;Financeiro -> Lançamento de Caixa
	; Supoe que o primeiro registro exibido na tela é o último na qual foi realizado a baixa
	WinWaitActive($tela)
	MouseClick("left", 334, 40, 1)
	Sleep(200)
	MouseClick("left", 373, 108, 1)
	WinWaitActive("Consulta de Lançamentos de Caixa")
	MouseClick("left", 614, 377, 2)
	MouseClick("left", 1150, 791, 1)
	;Conferir o valor
	WinWaitActive("Lançamento de Caixa")
	MouseClick("left", 873, 553, 1)
	Send("^a")
	Sleep(200)
	Send("^c")
	$c_custo = ClipGet()
	;MsgBox(0, "Valores do centro de custo", "Centro de Custo Fornecedor: " & $centro_custo )
	;MsgBox(0, "Valores do centro de custo", "Centro de Custo Lançamento Caixa: " &$c_custo)
	If $status = 0 Then
		IniWrite("valor_centro_de_custo.ini",$titulo, "Valor centro de custo fornecedor", " " & $centro_custo)
		IniWrite("valor_centro_de_custo.ini",$titulo, "Valor centro de custo lançamento de caixa", " " & $c_custo)
	EndIf
	If $status = 1 Then
		IniWrite("valor_centro_de_custo.ini",$titulo, "Valor centro de custo fornecedor", " " & $centro_custo)
		IniWrite("valor_centro_de_custo.ini",$titulo, "Valor centro de custo lançamento de caixa", " " & $c_custo)
	EndIf
	WinWaitActive("Lançamento de Caixa")
	MouseClick("left", 1346, 250, 1)
	WinWaitActive("Consulta de Lançamentos de Caixa")
	MouseClick("left", 1344, 226, 1)

EndFunc
Func baixa_titulo();Contas a pagar -> Manutenção de Títulos

	WinWaitActive($tela)
	MouseClick("left", 108, 39, 1)
	Sleep(200)
	MouseClick("left", 139, 125, 1)
	WinWaitActive("Manutenção de Títulos a Pagar")
	MouseClick("left", 973, 775, 1)
	WinActivate("Manutenção de Títulos a Pagar", "Baixar o título (F5)")
	MouseClick("left", 789, 721, 1)
	WinWaitActive("Confirmação!")
	MouseClick("left", 893, 572, 1)
	WinWaitActive("Informação!")
	MouseClick("left", 963, 572, 1)
	MouseClick("left", 1328, 778, 1)
	MouseClick("left", 894, 570, 1)

EndFunc
Func cancelamento() ; Cancelar o pagamento do título
	WinWaitActive($tela)
	MouseClick("left", 110, 39, 1)
	Sleep(200)
	MouseClick("left", 147, 125, 1)
	WinWaitActive("Manutenção de Títulos a Pagar")
	MouseClick("left", 972, 774, 1)
	WinWaitActive("Manutenção de Títulos a Pagar", "Cancelar Este Pagamento (F2)")
	MouseClick("left", 813, 723, 1)
	WinActivate("Confirmação!")
	MouseClick("left", 895, 572, 1)
	WinWaitActive("Autenticação de Senha Administrativa")
	MouseClick("left", 1048, 523, 1)
	MouseClick("left", 845, 545, 1)
	MouseClick("left", 821, 570, 1)
	Send("123")
	MouseClick("left", 1087, 512, 1)
	WinWaitActive("Data do Estorno")
	MouseClick("left", 936, 533, 1)
	MouseClick("left", 920, 586, 1)
	WinWaitActive("Informação!")
	MouseClick("left", 962, 571, 1)
	WinWaitActive("Manutenção de Títulos a Pagar")
	MouseClick("left", 1330, 778, 1)
	WinActivate("Confirmação!")
	MouseClick("left", 896, 571, 1)
	$titulo = "Cancelamento do Título"
	$status = 1

EndFunc


Func lacar_debito_fornecedor() ;Contas a pagar -> Lançamento de débito com fornecedor

	WinWaitActive($tela)
	MouseClick("left", 115, 40, 1)
	Sleep(200)
	MouseClick("left", 118, 104, 1)
	WinWaitActive("Lançamento de Débitos de Fornecedores")
	MouseClick("left", 650, 768, 1)
	MouseClick("left", 600, 322, 1)
	Send($fornecedor)
	Send("{ENTER}")
	Sleep(200)
	If WinExists("Lançamento de Débitos de Fornecedores > CONSULTA DE FORNECEDORES") Then
		MouseClick("left", 719, 272, 1)
		Sleep(300)
		Send("{ENTER}")
		MouseClick("left", 700, 322, 2)
	EndIf
	WinWaitActive("Lançamento de Débitos de Fornecedores")
	MouseClick("left", 1049, 371, 1)
	Send("50")
	MouseClick("left", 918, 464, 1)
	;Centro de Custo
	Send($centro_custo)
	MouseClick("left", 907, 765, 1)
	MouseClick("left", 891, 572, 1)
	MouseClick("left", 963, 570, 1)
	;Sair
	MouseClick("left", 1278, 766, 1)
	MouseClick("left", 895, 573, 1)
	;----------------Baixa no Título------------------
	baixa_titulo()
	;---------------- Consultar lançamento de caixa --
	consultar_lancamento_caixa()
	;--------------- Cancelamento do título-----------
	cancelamento()
	consultar_lancamento_caixa()

EndFunc


