; Abrir o Retaguarda
; Pressione A para abrir como administrador e U para logar como usuário comum S suporte

HotKeySet("q", "adm")
HotKeySet("w", "usuario")
HotKeySet("p", "suporte")
HotKeySet("{space}", "sair")


Global $tela = "Fácil Retaguarda"
Global $caminhoExecutavel = "C:\Facil\Retaguarda\Retaguarda.exe"

Run($caminhoExecutavel)
WinWaitActive($tela)

Func sair()
   Exit
EndFunc
Func adm()
   ;ControlClick($tela, "", "[CLASS:Edit; INSTANCE:1]", "left", 2)
   Send("ADMINISTRADOR")
   Sleep(200)
   Send("{enter}")
   Sleep(200)
   Send("123")
   Sleep(200)
   Send("{enter}")
   Exit
EndFunc

Func usuario()
   ;ControlClick($tela, "", "[CLASS:Edit; INSTANCE:1]", "left", 2)
   Send("USUÁRIO")
   Sleep(200)
   Send("{enter}")
   Sleep(200)
   Send("123")
   Sleep(200)
   Send("{enter}")
   Exit
EndFunc

Func suporte()
   ControlClick($tela, "", "[CLASS:Edit; INSTANCE:1]", "left", 2)
   Sleep(200)
   Send("{enter}")
   Sleep(200)
   Send("masterkey")
   Sleep(200)
   Send("{enter}")
   WinWaitActive("Informação!")
   Send("{enter}")
   Sleep(200)
   WinWaitActive("Fácil Retaguarda > Cadastro de Atendimento")
   Send("{insert}")
   Sleep(200)
   Send("1")
   Send("{enter}")
   Sleep(200)
   Send("-")
   Send("{enter}")
   Sleep(200)
   Send("--")
   Send("{enter}")
   Sleep(200)
   Send("---")
   Send("{enter}")
   Sleep(200)
   Send("----")
   Send("{enter}")
   Sleep(200)
   MouseClick("left", 923, 776, 1)
   Send("{esc}")
   WinWaitActive("Fácil Retaguarda > Cadastro de Atendimento")
   MouseClick("left", 896, 571, 1)
   Exit
EndFunc



While 1
   ;Laço para deixar o programa aberto
WEnd
