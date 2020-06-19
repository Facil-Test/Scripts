#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         		Josué da Silva Souza
 Resolução Monitor: 	1920x1080
 Resolução Retaguarda:  800x600

 Script Function:
	verificar staus de boleto na tela de recebimentos de títulos

#ce ----------------------------------------------------------------------------

HotKeySet("z", "lancar_boletos")
HotKeySet("x", "sair")
Global $tela = "Sistema Fácil Retaguarda - Versão: 5.9.1.0  - Build: 5.9.1.0"
Global $cliente = 8
Global $quantidade_parcelas = 5
Global $valor_parcela = 1

While 1
	 ;Laço para deixar o programa aberto
WEnd

Func sair()
	Exit
EndFunc

Func Lancar_debito_cliente()
	WinWaitActive($tela)
	MouseClick("left", 211, 40, 1) ; Contas a Receber
	Sleep(200)
	MouseClick("left", 204, 59, 1) ; CLançamento de dábitos para clientes
	WinWaitActive("Lançamento de Débitos de Clientes")
	MouseClick("left", 652, 766, 1) ; Novo
	MouseClick("left", 607, 322, 1) ; id Cliente
	send($cliente)
	send("{enter}")
	; Selecionar Modalidade de pagamento
	; Nesse banco a modalidade Boleto é a primeira
	MouseClick("left", 1341, 321, 1) ; Modalidade de pagamento
	Send("{up}")
	Send("{up}")
	Send("{up}")
	Send("{up}")
	Send("{up}")
	Send("{up}")
	Send("{up}")
	Send("{up}")
	Send("{up}")
	Send("{up}")
	Send("{up}")
	send("{enter}")
	;
	MouseClick("left", 931, 369, 1); Qtde PArcelas
	Send("^a")
	Send($quantidade_parcelas)
	send("{enter}")
	Send($valor_parcela)
	send("{enter}")
	MouseClick("left", 1285, 453, 1); Botão processar
	MouseClick("left", 915, 769, 1); Botão Salvar
	WinWaitActive("Confirmação!")
	MouseClick("left", 896, 570, 1) ; Sim
	WinWaitActive("Informação!")
	MouseClick("left", 958, 571, 1) ; Ok
	WinClose("Lançamento de Débitos de Clientes")

EndFunc

Func emitir_boletos()
	WinWaitActive($tela)
	MouseClick("left", 211, 40, 1) ; Contas a Receber
	Sleep(200)
	MouseClick("left", 469, 240, 1) ; Controle de Boletos
	Sleep(200)
	MouseClick("left", 520, 236, 1) ; Emissão /remessa / Retorno Boletos
	WinWaitActive("Emissão de Boletos Bancários")
	MouseClick("left", 616, 351, 1) ; Id cliente
	send($cliente)
	send("{enter}")
	MouseClick("left", 663, 759, 1) ; Marcar todos
	;Local $todos_selecionados =  PixelSearch(597, 456, 606, 464, 5789784)
	;WinWaitActive($todos_selecionados)
	MsgBox(0, "Quantidade", "Selecione os títulos desejados")

EndFunc


Func lancar_boletos()
	Lancar_debito_cliente()
	emitir_boletos()

	Exit
EndFunc
