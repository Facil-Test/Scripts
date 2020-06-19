#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:                  Josué da Silva Souza
 Resolução Monitor:        1920x1080
 Resolução Retaguarda:     800x600


 Script Function:
	Lançar um prontuário no PET

#ce ----------------------------------------------------------------------------
HotKeySet("z", "lancar_prontuario")
HotKeySet("x", "sair")


Global $tela = "Sistema Fácil - Módulo Pet - Versão: 5.9.1.0 - Build: 5.9.1.0 comp. 16.06.2020"
Global $cliente = 4
Global $animal = 1
Global $produto = 10


While 1

WEnd

Func sair()
	Exit
EndFunc



Func lancar_prontuario()

	WinWaitActive($tela)
	MouseClick("left",143, 75, 1) ; Prontuários (F4)
	If Not WinWaitActive($tela & " > Prontuário", "", 5) Then
		IniWrite("Prontuario.ini", "Prontuário", "erro ", "Tela de prontuário não abriu no tempo esperado")
		Exit
	EndIf
	MouseClick("left",923, 773, 1) ; Botão Novo
	MouseClick("left",711, 335, 1) ; Cliente
	Send($cliente)
	Send("{enter}")
	MouseClick("left",627, 384, 1) ; Animal
	send($animal)
	Send("{enter}")
	MouseClick("left",789, 287, 1) ; Aba Medicação
	MouseClick("left",607, 477, 1) ; Produto
	Send($produto)
	send("{enter}")
	MouseClick("left",1284, 589, 1) ; Botão Inserir
	MouseClick("left",923, 774, 1) ; Botão Salvar
	Sleep(200)
	WinClose($tela & " > Prontuário")
	if WinWaitActive("Confirmação!", "", 3) Then
		MouseClick("left",898, 571, 1)
	EndIf
	Exit

EndFunc


