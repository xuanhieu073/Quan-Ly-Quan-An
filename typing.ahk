#NoEnv
#UseHook
#InstallKeybdHook
#InstallMouseHook
#SingleInstance, force
#Persistent

PedalMode := -1
!q::PedalMode := PedalMode*(-1)

<!a:: Send, {Home}
<!d:: Send, {End}
<!w:: Send, {PgUp}
<!s:: Send, {PgDn}
<!i:: Send, {Up}
<!k:: Send, {Down}

>^i:: Send, {Up}
>^k:: Send, {Down}
>^+i:: Send, +{Up}
>^+k:: Send, +{Down}

!>^i:: Send, !{Up}
!>^k:: Send, !{Down}
#>^i:: Send, #{Up}
#>^k:: Send, #{Down}
<^>^i:: Send, ^{Up}
<^>^k:: Send, ^{Down}
+<^>^i:: Send, +^{Up}
+<^>^k:: Send, +^{Down}

#>^j:: Send, #{Left}
#>^l:: Send, #{Right}
<^>^j:: Send, ^{Left}
<^>^l:: Send, ^{Right}
+<^>^j:: Send, +^{Left}
+<^>^l:: Send, +^{Right}

#If (PedalMode = 1)
    <!j:: Send, {Left}
    <!l:: Send, {Right}
    <!+j:: Send, +{Left}
    <!+l:: Send, +{Right}
    
    >^j:: Send, ^{Left}
    >^l:: Send, ^{Right}
    >^+j:: Send, ^+{Left}
    >^+l:: Send, ^+{Right}
#If
#If (PedalMode = -1)
    <!j:: Send, ^{Left}
    <!l:: Send, ^{Right}
    <!+j:: Send, +^{Left}
    <!+l:: Send, +^{Right}
    
    >^j:: Send, {Left}
    >^l:: Send, {Right}
    >^+j:: Send, +{Left}
    >^+l:: Send, +{Right}
    !>^j:: Send, !{Left}
    !>^l:: Send, !{Right}
#If

!+a:: Send, +{Home}
!+d:: Send, +{End}
!+w:: Send, +{PgUp}
!+s:: Send, +{PgDn}
!+i:: Send, +{Up}
!+k:: Send, +{Down}
!+j:: Send, +^{Left}
!+l:: Send, +^{Right}






!Space:: 
Send ^{Left}
Send +^{Right}
return


!o:: Send, {BackSpace}


!r:: Send, {NumpadAdd}
!t:: Send, -
!y:: Send, *
!u:: Send, /

Alt:: return