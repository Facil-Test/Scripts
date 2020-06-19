#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         		Josué da Silva Souza
 Resolução Monitor: 	1920x1080
 Resolução Retaguarda:  800x600

 Script Function:
	Validar confirmações para devolução de mercadorias

#ce ----------------------------------------------------------------------------
HotKeySet("z", "devolucao")
HotKeySet("x", "sair")
Global $tela = "Sistema Fácil Retaguarda - Versão: 5.9.1.0  - Build: 5.9.1.0"
Global $cliente = 2
Global $id_produto = 4100
Global $funcionario = 1
Global $quantidade_devolucao = 2

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
	WinWaitActive($tela)
	MouseClick("left", 280, 36, 1) ; Vendas
	Sleep(200)
	MouseMove(487, 152) ; DAV prévendas -orçamento
	Sleep(200)
	MouseClick("left", 558, 174, 1) ; Abrir DAV
	WinWaitActive("Fácil Sistemas - Módulo de DAV")
	Sleep(500)
	MouseClick("left", 603, 350, 1) ; Funcionário
	Send($funcionario)
	Send("{enter}")
	Sleep(200)
	If WinExists("Confirmação de Funcionários") Then ; Solicitar senha
		MouseClick("left", 603, 350, 1)
		Send("123")
		MouseClick("left", 925, 563, 1)
	EndIf
	MouseClick("left", 601, 401, 1) ; Cliente
	; Cliente que não possui débitos, inativo ou bloqueado
	Send($cliente)
	Send("{enter}")
	Sleep(200)
	MouseClick("left", 601, 454, 1) ; Produto
	; Não deve ser de grade, kit, estoque negativo ou bloqueado
	Send($id_produto)
	Send("{enter}")
	MouseClick("left", 1307, 495, 1); Incluir produto
	Sleep(200)
	MouseClick("left", 1188, 770, 1) ; Finaliar
	Sleep(500)
	Send("{F2}")
	WinWaitActive("Titulos - Valor Recebido")
	MouseClick("left", 892, 565, 1) ; ok
	WinWaitActive("Fácil Sistemas - Módulo de DAV")
	MouseClick("left", 964, 713, 1) ; Confirmar
	WinWaitActive("Confirmação!") ; Consolidar
	MouseClick("left", 895, 571, 1) ; Sim
	WinWaitActive("Informação!") ; Consolidado com sucesso
	MouseClick("left", 965, 571, 1) ; ok
	WinWaitActive("Confirmação!") ; imprimir
	MouseClick("left", 1028, 571, 1); Não
	WinWaitActive("Fácil Sistemas - Módulo de DAV")
	MouseClick("left", 1302, 766, 1); Sair
	WinWaitActive("Confirmação!") ; Sair sistema
	MouseClick("left", 895, 571, 1) ; Sim
EndFunc

Func abrir_ultima_venda_dav()
	WinWaitActive($tela)
	MouseClick("left", 536, 39, 1); Estoque
	Sleep(200)
	MouseClick("left", 775, 149, 1); Controle de Devoluções
	MouseClick("left", 824, 150, 1); Devoluções
	WinWaitActive("Devolução de Mercadorias")
	MouseClick("left", 591, 334, 1); Por Venda
	MouseClick("left", 1160, 334, 1); Documento
	Send("{space}")
	WinWaitActive("Devolução de Mercadorias > Consulta de Vendas")
	MouseClick("left", 709, 272, 1); campo Documento
	send("^a")
	send("{delete}")
	send("{enter}")
	;Ordenar para pegar o último
	MouseClick("left", 641, 302, 1) ; ordenação código
	Sleep(500)
	MouseClick("left", 641, 302, 1) ; ordenação código
	Sleep(500)
	MouseClick("left", 633, 320, 1)
	send("{enter}")
	If WinExists("Confirmação!") Then
		MouseClick("left", 1027, 569, 1)
	EndIf

EndFunc

Func confirmar_quantidade()
	WinWaitActive("Informação!")
	MouseClick("left", 893, 571, 1)
	WinWaitActive("Autenticação de Senha Administrativa")
	MouseClick("left", 1047, 523, 1)
	MouseClick("left", 833, 541, 1)
	MouseClick("left", 822, 570, 1)
	send("123")
	MouseClick("left", 1087, 512, 1)
	If WinExists("Fácil Retaguarda") Then
		MouseClick("left", 919, 563, 1)
	EndIf


EndFunc

Func salvar_devolucao()

	WinWaitActive("Devolução de Mercadorias")
	MouseClick("left", 666, 762, 1) ; Salvar Devolução
	WinWaitActive("Confirmação!")
	MouseClick("left", 893, 570, 1) ; Sim
	WinWaitActive("Confirmação!") ; Gerar Débito para cliente
	MouseClick("left", 1025, 570, 1) ; Não
	WinWaitActive("Informação!")
	MouseClick("left", 962, 570, 1) ; Ok
	WinWaitActive("Confirmação!") ; Gerar Recibo da devolução
	MouseClick("left", 1025, 570, 1) ; Não
	WinWaitActive("Visualizar")
	Send("{esc}")

EndFunc

Func verificar_mensagem()
	WinWaitActive("Devolução de Mercadorias")
	MouseClick("left", 1278, 423, 1) ; Botão Pesquisar
	If WinExists("Informação!") Then
		IniWrite("devolucao_mercadoria.ini", "Não deveria aparecer", "", " essa mensagem não deveria aparecer nesse momento")
		confirmar_quantidade()
	EndIf
	If WinExists("Fácil Retaguarda") Then
		MouseClick("left", 919, 562, 1) ; Botão desconto
	EndIf
	; Alterar a quantidade

	WinWaitActive("Devolução de Mercadorias")
	MouseClick("left", 1298, 674, 1)  ; Botão alterar
	MouseClick("left", 980, 547, 1) ; Campo quantidade
	Send("^a")
	Send("^x")
	Send($quantidade_devolucao)
	MouseClick("left", 1298, 675, 1) ; btn Salvar
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

	; Sair

EndFunc


