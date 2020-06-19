#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\wmp.ico
#AutoIt3Wrapper_UseX64=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

;Cadastrar cliente

HotKeySet("{z}", "cadastrar")
Global $tela = "Sistema Fácil Retaguarda - Versão: 5.9.1.0  - Build: 5.9.1.0"
Global $loop = 0
Global $c_tipo = 0
Global $tempo = 1;
While 1
   if $loop = 0 Then
	  Sleep(100)
   EndIf
WEnd

WinWaitActive($tela)

Func cadastrar()
   ; Tipo de Cliente
   $c_tipo = InputBox("Digite o tipo de cliente", "1 - Física, 2 Jurídica")
   If $c_tipo <> 1 and $c_tipo <> 2 Then
	  MsgBox(0, "Erro", "selecione corretamente o tipo")
	  $c_tipo = InputBox("Digite o tipo de cliente", "1 - Física, 2 Jurídica")
   EndIf

   if $c_tipo = 1 or $c_tipo = 2 Then
	  MouseClick("left", 121, 78, 1)
	  WinWaitActive($tela & " > CONSULTA DE CLIENTES")
	  MouseClick("left", 1289, 762, 1)
	  WinWaitActive("Confirmação!")
	  ;--------------------------------------------------
	  If $c_tipo = 1 Then
		 MouseClick("left", 893, 571, 1) ; Física
	  EndIf
	  If $c_tipo = 2 Then
		 MouseClick("left", 1022, 571, 1) ; Física
	  EndIf
	  ;---------------------------------------------------
	  WinWaitActive($tela & " > Cadastro de Clientes")
	  MouseClick("left", 684, 364, 1)
	  Send("Novo Cliente Teste"); Nome
	  Sleep($tempo)
	  MouseClick("left", 1002, 364, 1)
	  MouseClick("left", 582, 410, 1) ; Data nascimento
	  Send("11012000")
	  Send("{enter}")
	  Sleep(100)
	  If $c_tipo = 1 Then
	  ;CPF
		 Send("691")
		 Sleep(100)
		 Send("731")
		 Sleep(100)
		 Send("860")
		 Sleep(100)
		 Send("40")
	  ; CPF
	  EndIf
	  If $c_tipo = 2 Then
	  ;CNPJ
		 Send("99")
		 Sleep(100)
		 Send("751")
		 Sleep(100)
		 Send("178")
		 Sleep(100)
		 Send("0001")
		 Sleep(100)
		 Send("31")
	  ; CNPJ
	  EndIf
	  Sleep($tempo)
	  ;--------------------------------------------
	  MouseClick("left", 918, 410, 1) ; Identidade / IE
	  If WinExists("Confirmação!") Then ; Caso CPF ou CNPJ já tenha sido cadastrado
		 MouseClick("left", 893, 571, 1)
		 MouseClick("left", 1048, 522, 1)
		 MouseClick("left", 881, 545, 1)
		 MouseClick("left", 828, 570, 1)
		 Send("123")
		 Sleep($tempo)
		 MouseClick("left", 1089, 512, 1)
	  EndIf
	  MouseClick("left", 918, 410, 1) ; Identidade / IE
	  If $c_tipo = 1 Then
		 Send("12345678")
	  EndIf
	  If $c_tipo = 2 Then
		 Send("2322143478908")
	  EndIf

	  ;----------------------------------------------
	  Sleep($tempo)
	  MouseClick("left", 1041, 410, 1) ;Cartão Ident
	  Send("1")
	  Sleep($tempo)
	  MouseClick("left", 1176, 410, 1); Contato Representante
	  Send("33988123456")
	  Sleep($tempo)
	  MouseClick("left", 591, 483, 1)
	  Send("endereço")
	  Sleep($tempo)
	  MouseClick("left", 917, 483, 1); Numero
	  Send("123")
	  Sleep($tempo)
	  MouseClick("left", 589, 529, 1)
	  Send("complemento")
	  Sleep($tempo)
	  MouseClick("left", 690, 529, 1)
	  Send("bairro")
	  Sleep($tempo)
	  MouseClick("left", 590, 577, 1)
	  Send("referência")
	  Sleep($tempo)
	  MouseClick("left", 588, 623, 1); CEP
	  Send("39740000")
	  Sleep($tempo)
	  MouseClick("left", 621, 689, 1)
	  MouseClick("left", 742, 689, 1)
	  Sleep($tempo)
	  Send("33")
	  Sleep($tempo)
	  MouseClick("left", 778, 689, 1)
	  Send("988123456")
	  Sleep($tempo)
	  MouseClick("left", 898, 689, 1)
	  Send("33")
	  Sleep($tempo)
	  MouseClick("left", 925, 689, 1)
	  Send("34219999")
	  Sleep($tempo)
	  MouseClick("left", 621, 689, 1)
	  Sleep($tempo)
	  Send("34210000")
	  Sleep($tempo)
	  MouseClick("left", 1038, 689, 1)
	  Send("testes@facilsistemas.com")
	  Sleep($tempo)
	  MouseClick("left", 589, 732, 1)
	  Send("https://www.instagram.com/teste")
	  Sleep($tempo)
	  MouseClick("left", 790, 732, 1)
	  Send("https://www.facebook.com/teste")
	  Sleep($tempo)
	  MouseClick("left", 996, 732, 1)
	  Send("www.teste.com")
	  Sleep($tempo)
	  MouseClick("left", 1199, 732, 1)
	  Send("39740000")
	  Sleep($tempo)
	  ;---------------------------------------- Complemento-------------
	  MouseClick("left", 713, 290, 1)
	  MouseClick("left", 589, 484, 1)
	  Send("nome do pai")
	  Sleep($tempo)
	  MouseClick("left", 968, 484, 1)
	  Send("nome da mãe")
	  Sleep($tempo)
	  MouseClick("left", 590, 528, 1)
	  Send("referência complemento 1")
	  Sleep($tempo)
	  MouseClick("left", 966, 528, 1)
	  Send("referência complemento 2")
	  Sleep($tempo)
	  MouseClick("left", 586, 574, 1)
	  Send("referência complemento 3")
	  Sleep($tempo)
	  MouseClick("left", 966, 574, 1)
	  Send("5168664568302")
	  Sleep($tempo)
	  MouseClick("left", 587, 641, 1)
	  Send("campo adicional 1")
	  Sleep($tempo)
	  MouseClick("left", 737, 641, 1)
	  Send("campo adicional 2")
	  Sleep($tempo)
	  MouseClick("left", 888, 641, 1)
	  Send("campo adicional 3")
	  Sleep($tempo)
	  MouseClick("left", 1040, 641, 1)
	  Send("campo adicional 4")
	  Sleep($tempo)
	  MouseClick("left", 1330, 640, 1)
	  MouseClick("left", 1236, 672, 1)
	  MouseClick("left", 597, 689, 1)
	  Send("observação")
	  Sleep($tempo)
	  ;------------------------------------- Financeiro -----------------
	  MouseClick("left", 805, 289, 1)
	  MouseClick("left", 649, 638, 1)
	  Send("1000")
	  Sleep($tempo)
	  ;------------------------------------- Salvar ---------------------
	  MouseClick("left", 869, 776, 1)
	  ;------------------------------------- Sair ---------------------
	  MouseClick("left", 1324, 776, 1)
	  MouseClick("left", 895, 570, 1)
EndIf
Exit
EndFunc


