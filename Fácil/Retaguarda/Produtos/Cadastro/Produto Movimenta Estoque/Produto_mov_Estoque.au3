#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         		Josué da Silva Souza
 Resolução Monitor: 	1920x1080
 Resolução Retaguarda:  800x600

 Script Function:
	Validar campo Produto movimenta estoque no Cadastro de Produtos.

#ce ----------------------------------------------------------------------------
; Verifique primeiro se existem inconormidades no último produto cadastrado
; Clique em Editar e depois Salvar para ver se está tudo correto

HotKeySet("z", "produto_mov_estoque")
HotKeySet("x", "sair")
Global $tela = "Sistema Fácil Retaguarda - Versão: 5.9.1.0  - Build: 5.9.1.0"
Global $produto_inserido
Global $descricao_produto
Global $statusScript = "Inserir"


While 1
   ;Laço para deixar o programa aberto
WEnd

Func sair()
	Exit
EndFunc

Func capturar_id_descricao_produto_movimenta_estoque()
		ClipPut(" Nenhum valor encontrado")
		; ----Capturar id do produto movimenta estoque
		WinWaitActive($tela & " > Cadastro de Produtos")
		;---id
		MouseClick("left", 643, 407, 1)
		MouseClick("right", 643, 407, 1)
		Send("{down}")
		Send("{down}")
		Send("{down}")
		Send("{down}")
		Send("{down}")
		Send("{down}")
		Send("{enter}")
		Send("^c")
		Send("^c")
		$produto_inserido = ClipGet()
		;MsgBox(0, "valor", $produto_inserido)
		;----descrição
		Sleep(200)
		MouseClick("left", 881, 406, 1)
		MouseClick("right", 881, 406, 1)
		Send("{down}")
		Send("{down}")
		Send("{down}")
		Send("{down}")
		Send("{down}")
		Send("{down}")
		Send("{enter}")
		Send("^c")
		$descricao_produto = ClipGet()
		;Ecrever no Arquivo
		IniWrite("Produto_movimenta_Estoque.ini", $statusScript, "Produto ", " " & $produto_inserido & " - " & $descricao_produto)
	EndFunc

Func inserir_produto_mov_estoque()
	; Inserir o Produto que movimenta estoque
	MouseClick("left", 724, 288, 1)
	MouseClick("left", 975, 775, 1)
	MouseClick("left", 612, 407, 1)
	; Limpar caso haja algum produto salvo previamente
	Send("^a")
	Send("{del}")
	Send("1")
	Send("{enter}")
	Sleep(200)
	;Caso não exista o produto com id 1 será selecionado o primeiro da consulta
	If WinExists($tela & " > Cadastro de Produtos > CONSULTA DE PRODUTOS QUE MOVIMENTARÃO ESTOQUE NAS VENDAS") Then
		MouseClick("left", 712, 272, 1)
		Send("{enter}")
		MouseClick("left", 640, 322, 1)
		Send("{enter}")
	EndIf
	capturar_id_descricao_produto_movimenta_estoque()
	MouseClick("left", 973, 774, 1); Salvar
	Sleep(1000)
	;---------------Verificar se id e descrição continuam salvos---------
	; Mudar pela navegação
	WinWaitActive($tela & " > Cadastro de Produtos")
	MouseClick("left", 1125, 774, 1)
	Sleep(500)
	MouseClick("left", 1278, 774, 1)
	; Captura os valores
	MouseClick("left", 975, 774, 1); Editar
	$statusScript = "Conferir após inserir"
	capturar_id_descricao_produto_movimenta_estoque()
	MouseClick("left", 973, 774, 1); Salvar

EndFunc

Func editar_cancelar_salvamento()
	;Nessa situação, ao apagar o produto mov. estoque e cancelar, deveria voltar o produto m.e anterior
	WinWaitActive($tela & " > Cadastro de Produtos")
	MouseClick("left", 974, 775, 1) ; editar
	MouseClick("left", 642, 408, 1) ; id produto mivementa estoque
	Send("^a")
	Send("{delete}")
	Send("{enter}")
	MouseClick("left", 1023, 774, 1) ; Cancelar
	MouseClick("left", 974, 775, 1) ; editar
	$statusScript = "cancelar"
	capturar_id_descricao_produto_movimenta_estoque()
	MouseClick("left", 974, 773, 1) ; Salvar

EndFunc

Func alterar_mudar_aba()
	WinWaitActive($tela & " > Cadastro de Produtos")
	MouseClick("left", 718, 289, 1); Aba complemento
	MouseClick("left", 975, 774, 1); Editar
	$statusScript = "Navegar entre Abas"
	capturar_id_descricao_produto_movimenta_estoque()
	;Inserir Outro produto movimenta estoque
	; Limpar caso haja algum produto salvo previamente
	Send("^a")
	Send("{del}")
	Send("1")
	Send("{enter}")
	Sleep(200)
	;Caso não exista o produto com id 1 será selecionado o segundo da consulta
	If WinExists($tela & " > Cadastro de Produtos > CONSULTA DE PRODUTOS QUE MOVIMENTARÃO ESTOQUE NAS VENDAS") Then
		MouseClick("left", 712, 272, 1)
		Send("{enter}")
		MouseClick("left", 647, 344, 1)
		Send("{enter}")
	EndIf
	;
	MouseClick("left", 814, 286, 1); Aba Tributação
	MouseClick("left", 718, 289, 1); Aba complemento
	$statusScript = " Confirmar Navegar entre Abas"
	capturar_id_descricao_produto_movimenta_estoque()
	MouseClick("left", 973, 774, 1); Salvar
	;MouseClick("left", 1024, 774, 1); Cancelar

EndFunc


Func produto_mov_estoque()
	; Abrindo tela de cadastro -> Selecionar último produto
	WinWaitActive($tela)
	MouseClick("left", 133, 139, 1)
	WinWaitActive($tela & " > CONSULTA DE PRODUTOS")
	Send("{esc}")
	WinWaitActive($tela & " > Cadastro de Produtos")

	;  -------------Verificações -----------
	inserir_produto_mov_estoque()
	editar_cancelar_salvamento()
	alterar_mudar_aba()
	;-----------------------------------------
	MouseClick("left", 1331, 774, 1); Sair
	WinWaitActive("Confirmação!")
	MouseClick("left", 895, 572, 1); Sair
	Exit

EndFunc

