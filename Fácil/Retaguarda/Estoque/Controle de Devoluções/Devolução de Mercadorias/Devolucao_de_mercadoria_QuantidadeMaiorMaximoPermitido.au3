#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         		Josué da Silva Souza
 Resolução Monitor: 	1920x1080
 Resolução Retaguarda:  800x600

 Script Function:
	Validar confirmações para devolução de mercadorias

#ce ----------------------------------------------------------------------------
;HotKeySet("z", "devolucao")
HotKeySet("x", "sair")
Global $tela = "Sistema Fácil Retaguarda - Versão: 5.9.1.0  - Build: 5.9.1.0"
Global $cliente = 1655
Global $id_produto = 6603
Global $funcionario = 1
Global $quantidade_devolucao = 3
Global $sleep = 200

devolucao()

While 1
	 ;Laço para deixar o programa aberto
WEnd

Func sair()
	Exit
EndFunc
; Marcar configuração Estoque -> Devolução -> Aceita devolução...

Func marcar_configuracao()
	WinWaitActive($tela)
	MouseClick("left", 707, 39, 1) ;Sistema
	Sleep(200)
	MouseClick("left", 761, 107, 1) ;Configurações
	WinWaitActive("Configurações")
	MouseClick("left", 1220, 268, 1) ;Estoque
	MouseClick("left", 672, 294, 1) ;Devolução
	MouseClick("left", 587, 343, 1) ;Marcar configuração
	MouseClick("left", 1280, 794, 1) ; Salvar
	WinWaitActive("Confirmação!")
	MouseClick("left", 897, 570, 1)
	WinWaitActive("Informação!")
	MouseClick("left", 964, 570, 1)
	MouseClick("left", 1327, 793, 1);sair
	WinWaitActive("Confirmação!")
	MouseClick("left", 897, 570, 1)
EndFunc
; Fazer uma venda no Dav
Func venda_dav()
	$dav = "Fácil Sistemas - Módulo de DAV"
	WinWaitActive($tela)
	MouseClick("left", 280, 36, 1) ; Vendas
	Sleep($sleep)
	MouseMove(487, 152) ; DAV prévendas -orçamento
	Sleep($sleep)
	MouseClick("left", 558, 174, 1) ; Abrir DAV
	; Espera abrir módulo DAV
	If Not WinWaitActive($dav, "", 30) Then
		IniWrite("devolucao_mercadoria.ini", "Erro 1", "", " Falha ao abrir módulo DAV")
		Exit
	EndIf
	; Inserir Funcionário ------------------------------------------------------------------
	ControlSend($dav, "", "TMyEdit5", $funcionario)
	Send("{enter}")
	Sleep($sleep)
	; Caso Solicite a senha do vendedor
	If WinExists("Confirmação de Funcionários") Then ; Solicitar senha
		ControlSend("Confirmação de Funcionários", "", "TEdit1", "123")
		ControlClick("Confirmação de Funcionários", "", "TButton2", "left", 1)
	EndIf
	Sleep($sleep)
	; Inserir Cliente ----------------------------------------------------------------------
	ControlSend($dav, "", "TMyEdit3", $cliente)
	Send("{enter}")
	Sleep($sleep)
	; Inserir Produto ----------------------------------------------------------------------
	ControlClick($dav, "", "TMyEdit16", "left", 1)
	Send($id_produto)
	Send("{enter}")
	Sleep($sleep)
	ControlClick($dav, "", "TJvXPButton3", "left", 1)
	Sleep($sleep)
	; Finalizar ----------------------------------------------------------------------------
	ControlClick($dav, "", "TBitBtn2", "left", 1)
	Sleep($sleep)
	ControlClick($dav, "", "TBitBtn12", "left", 1) ; Modalidade dinheiro
	If Not WinWaitActive("Titulos - Valor Recebido", "", 5) Then
		IniWrite("devolucao_mercadoria.ini", "Erro 2", "", " Era esperado a tela (Titulos - Valor Recebido)")
		Exit
	EndIf
	ControlClick("Titulos - Valor Recebido", "", "TButton2", "left", 1) ;Ok
	If Not WinWaitActive($dav, "", 5) Then
		IniWrite("devolucao_mercadoria.ini", "Erro 3", "", " Era esperado a tela" & $dav)
		Exit
	EndIf
	ControlClick($dav, "", "TBitBtn9", "left", 1)
	If Not WinWaitActive("Confirmação!", "", 5) Then ; Consolidar
		IniWrite("devolucao_mercadoria.ini", "Erro 4", "", " Era esperado a tela Confirmação!")
		Exit
	EndIf
	ControlClick("Confirmação!", "", "TJvXPButton2", "left", 1) ; Sim
	If Not WinWaitActive("Informação!", "", 5) Then ; ; Consolidado com sucesso
		IniWrite("devolucao_mercadoria.ini", "Erro 5", "", " Era esperado a tela Informação!")
		Exit
	EndIf
	ControlClick("Informação!", "", "TJvXPButton1", "left", 1) ; Ok
	If Not WinWaitActive("Confirmação!", "", 5) Then ; imprimir
		IniWrite("devolucao_mercadoria.ini", "Erro 6", "", " Era esperado a tela Confirmação!")
		Exit
	EndIf
	ControlClick("Confirmação!", "", "TJvXPButton1", "left", 1) ; Não
	If Not WinWaitActive($dav, "", 5) Then
		IniWrite("devolucao_mercadoria.ini", "Erro 7", "", " Era esperado a tela de venda DAV!")
		Exit
	EndIf
	ControlClick($dav, "", "TBitBtn1", "left", 1) ; Sair
	If Not WinWaitActive("Confirmação!", "", 5) Then ; Sair sistema
		IniWrite("devolucao_mercadoria.ini", "Erro 8", "", " Era esperado a tela Confirmação!")
		Exit
	EndIf
	ControlClick("Confirmação!", "", "TJvXPButton2", "left", 1)

EndFunc

Func abrir_ultima_venda_dav()
	WinWaitActive($tela)
	MouseClick("left", 536, 39, 1); Estoque
	Sleep(200)
	MouseClick("left", 775, 149, 1); Controle de Devoluções
	MouseClick("left", 824, 150, 1); Devoluções


	If Not WinWaitActive("Devolução de Mercadorias", "", 5) Then
		IniWrite("devolucao_mercadoria.ini", "Erro 9", "", " Era esperado a tela Devolução de Mercadorias")
		Exit
	EndIf
	ControlClick("Devolução de Mercadorias", "", "TGroupButton1", "left", 1);Por Venda
	ControlClick("Devolução de Mercadorias", "", "TMyEdit22", "left", 1); Documento
	Send("{space}")
	If Not WinWaitActive("Devolução de Mercadorias > Consulta de Vendas", "", 5) Then
		IniWrite("devolucao_mercadoria.ini", "Erro 10", "", " Era esperado a tela Consulta de Vendas")
		Exit
	EndIf
	ControlClick("Devolução de Mercadorias > Consulta de Vendas", "", "TMyEdit1", "left", 1); campo Documento
	send("^a")
	send("{delete}")
	send("{enter}")
	;Ordenar para pegar o último
	ControlClick("Devolução de Mercadorias > Consulta de Vendas", "", "TDBGrid1", "left", 1, 55, 11)
	;MouseClick("left", 641, 302, 1) ; ordenação código
	Sleep(500)
	ControlClick("Devolução de Mercadorias > Consulta de Vendas", "", "TDBGrid1", "left", 1, 55, 11)
	;MouseClick("left", 641, 302, 1) ; ordenação código
	Sleep(500)
	ControlClick("Devolução de Mercadorias > Consulta de Vendas", "", "TDBGrid1", "left", 1, 90, 33)
	;MouseClick("left", 633, 320, 1)
	send("{enter}")
	Sleep($sleep)
	If WinExists("Confirmação!") Then
		ControlClick("Confirmação!", "", "TJvXPButton1", "left", 1)
	EndIf

EndFunc

Func confirmar_quantidade()
	WinWaitActive("Informação!")
	ControlClick("Informação!", "", "TJvXPButton2", "left", 1)
	If Not WinWaitActive("Autenticação de Senha Administrativa", "", 5) Then
		IniWrite("devolucao_mercadoria.ini", "Erro 11", "", " Era esperado a tela Autenticação de Senha Administrativa")
		Exit
	EndIf
	ControlClick("Autenticação de Senha Administrativa", "", "TDBLookupComboBox1", "left", 1)
	Send("{down}")
	Send("{enter}")
	ControlSend("Autenticação de Senha Administrativa", "", "TMaskEdit1", "123")
	Sleep($sleep)
	ControlClick("Autenticação de Senha Administrativa", "", "TJvXPButton2", "left", 1)
	If WinExists("Fácil Retaguarda") Then
		ControlClick("Fácil Retaguarda", "", "TButton2", "left", 1) ; Botão desconto
	EndIf


EndFunc

Func salvar_devolucao()


	If Not WinWaitActive("Devolução de Mercadorias", "", 5) Then
		IniWrite("devolucao_mercadoria.ini", "Erro 12", "", " Era esperado a tela Devolução de Mercadorias")
		Exit
	EndIf
	ControlClick("Devolução de Mercadorias", "", "TBitBtn5", "left", 1) ; Botão Salvar Devolução
	If Not WinWaitActive("Confirmação!", "", 5) Then
		IniWrite("devolucao_mercadoria.ini", "Erro 13", "", " Era esperado a tela Confirmação!")
		Exit
	EndIf
	ControlClick("Confirmação!", "", "TJvXPButton2", "left", 1) ; Sim
	If Not WinWaitActive("Confirmação!", "", 5) Then
		IniWrite("devolucao_mercadoria.ini", "Erro 14", "", " Era esperado a tela Confirmação!")
		Exit
	EndIf
	ControlClick("Confirmação!", "", "TJvXPButton1", "left", 1) ; Não
	If Not WinWaitActive("Informação!", "", 5) Then
		IniWrite("devolucao_mercadoria.ini", "Erro 15", "", " Era esperado a tela Informação!")
		Exit
	EndIf
	ControlClick("Informação!", "", "TJvXPButton1", "left", 1) ; Ok
	If Not WinWaitActive("Confirmação!", "", 5) Then
		IniWrite("devolucao_mercadoria.ini", "Erro 16", "", " Era esperado a tela Confirmação!")
		Exit
	EndIf
	ControlClick("Confirmação!", "", "TJvXPButton1", "left", 1) ; Não
	If Not WinWaitActive("Visualizar", "", 5) Then
		IniWrite("devolucao_mercadoria.ini", "Erro 17", "", " Era esperado a tela Visualizar")
		Exit
	EndIf
	Send("{esc}")
	WinClose("Devolução de Mercadorias")
	If Not WinWaitActive("Confirmação!", "", 5) Then
		IniWrite("devolucao_mercadoria.ini", "Erro 18", "", " Era esperado a tela Confirmação!")
		Exit
	EndIf
	ControlClick("Confirmação!", "", "TJvXPButton2", "left", 1) ; Sim

EndFunc

Func verificar_mensagem()
	WinWaitActive("Devolução de Mercadorias")
	ControlClick("Devolução de Mercadorias", "", "TBitBtn9", "left", 1) ; ; Botão Pesquisar
	Sleep($sleep)
	If WinExists("Informação!") Then
		IniWrite("devolucao_mercadoria.ini", "Não deveria aparecer", "", " essa mensagem não deveria aparecer nesse momento")
		confirmar_quantidade()
	EndIf
	Sleep($sleep)
	If WinExists("Fácil Retaguarda") Then
		ControlClick("Fácil Retaguarda", "", "TButton2", "left", 1) ; Botão desconto
	EndIf
	; Alterar a quantidade
	If Not WinWaitActive("Devolução de Mercadorias", "", 5) Then
		IniWrite("devolucao_mercadoria.ini", "Erro 18", "", " Era esperado a tela Devolução de Mercadorias")
		Exit
	EndIf
	ControlClick("Devolução de Mercadorias", "", "TBitBtn3", "left", 1) ; Botão Alterar
	ControlClick("Devolução de Mercadorias", "", "TMyEdit12", "left", 1); ; Campo quantidade
	Send("^a")
	Send("^x")
	Send($quantidade_devolucao)
	Sleep($sleep)
	ControlClick("Devolução de Mercadorias", "", "TBitBtn3", "left", 1) ; Botão Alterar; btn Salvar
	Sleep($sleep)
	If WinExists("Informação!") Then
		IniWrite("devolucao_mercadoria.ini", "Quantidade maior", "", " OK")
		confirmar_quantidade()
	EndIf


EndFunc


Func devolucao()
	;marcar_configuracao()

	venda_dav()
	abrir_ultima_venda_dav()
	verificar_mensagem()
	salvar_devolucao()
	Exit

EndFunc


