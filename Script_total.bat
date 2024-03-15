@echo off
setlocal EnableDelayedExpansion
:inicio

cls

echo "Escolha uma opcao"
echo "1 - Bloquear USB (pen-drive)"
echo "2 - Ocultar HD"
echo "3 - Ocultar meu computador"
echo "4 - Ocultar o menu inicial"
echo "5 - Ocultar CD/DVD"
echo "0 - Sair"

SET /p opcao=Digite um numero:


if %opcao% == 1 (
        :inicio_op1
        cls
        echo "Escolha uma opcao"
        echo "1 - Desativar a USB"
        echo "2 - Ativar a USB"
        echo "3 - voltar"

        SET /p opcao_1=Digite um numero:  

    if !opcao_1! == 1 (
        reg query HKLM\SYSTEM\CurrentControlSet\Services\USBSTOR /v Start | find "3" > nul
        
        if !errorlevel! equ 0 (
            cls
            echo "Desativando as portas USB..."
            reg add HKLM\SYSTEM\CurrentControlSet\Services\USBSTOR /v Start /t REG_DWORD /d 4 /f
            echo "Portas USB desativadas com sucesso."
            pause
            goto :inicio_op1
        ) else (
                cls
                echo "Portas USB ja esta desativada"
                pause
                goto :inicio_op1
            )
    ) 
    
    if !opcao_1! == 2 (
        cls
         echo "Reativando as portas USB..."
         reg add HKLM\SYSTEM\CurrentControlSet\Services\USBSTOR /v Start /t REG_DWORD /d 3 /f
         echo "Portas USB reativadas com sucesso."
         pause
         goto :inicio_op1

    ) 
    if !opcao_1! == 3 (

        goto :inicio

    ) else (
         cls
         echo "Coloque um valor valido"
         pause 
         goto :inicio_op1
        
    )

) else if %opcao% == 2 (

        :inicio_op2
        cls
        echo "Escolha uma opcao"
        echo "1 - Ocultar dispositivos HD"
        echo "2 - desocultar dispositivos HD"
        echo "3 - voltar"

        SET /p opcao_2=Digite um numero: 

        if  !opcao_2! == 1 (
    
            %SystemRoot%\System32\reg.exe ADD "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "Nodrives" /t REG_DWORD /d "4" /f
            echo "O processo foi concluido"
            echo "deseja reiniciar agora para ativar as configuracoes"
            :inicio_op2_2
            echo "1 - Sim"
            echo "2 - Nao"
            SET /p valid= Digite :
            
            if !valid! == 1 (

                @REM shutdown.exe /s /t 00
                echo "entrouu no S"
                pause

            ) else if !valid! == 2 (
                cls
                echo "Voltando....."
                pause
                goto :inicio_op2
            ) else (
                cls
                echo "coloque um valor valido"
                pause
                goto :inicio_op2_2
            )
        ) else if !opcao_2! == 2 (
            
            echo "Desocultando HD"
            %SystemRoot%\System32\reg.exe DELETE "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "Nodrives" /f
            echo "O processo foi concluido"
            echo "deseja reiniciar agora para ativar as configuracoes"
            :inicio_op2_2_2
            echo "1 - Sim"
            echo "2 - Nao"
            SET /p valid= Digite :
            
            if !valid! == 1 (

                @REM shutdown.exe /s /t 00
                echo "entrouu no S"
                pause

            ) else if !valid! == 2 (
                cls
                echo "Voltando....."
                pause
                goto :inicio_op2
            ) else (
                cls
                echo "coloque um valor valido"
                pause
                goto :inicio_op2_2_2
            )

        )

        if !opcao_2! == 3 (

                goto :inicio

        ) else (
            goto :inicio_op2_2
        )
        
) else if %opcao% == 3 (

        :inicio_op3
        cls
        echo "Escolha uma opcao"
        echo "1 - Desativar o Meu computador"
        echo "2 - Ativar o Meu computador"
        echo "3 - voltar ao inicio"
        
        SET /p valor=Digite um numero:

        if !valor! == 1 (
            reg query HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer /v "HideMyComputerIcons" | find "1" > nul
            if %errorlevel% equ 0 (
                echo "Desativando Meu computador..."
                reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer /v "HideMyComputerIcons" /t REG_DWORD /d 1 /f
                cls
                echo "Meu computador desativadas com sucesso."
                echo "deseja reiniciar agora para ativar as configuracoes"
                :inicio_op3_3
                echo "1 - Sim"
                echo "2 - Nao"
                SET /p valid= Digite :
                
                if !valid! == 1 (

                    @REM shutdown.exe /s /t 00
                    echo "entrouu no S"
                    pause

                ) else if !valid! == 2 (
                    cls
                    echo "Voltando....."
                    pause
                    goto :inicio_op3
                ) else (
                    cls
                    echo "coloque um valor valido"
                    pause
                    goto :inicio_op3_3
                )

            ) else (
                echo "Meu computador ja esta desativada"
                goto :inicio_op3
            )  
        ) else if !valor! == 2 (
            echo "Reativando Meu computador..."
            %SystemRoot%\System32\reg.exe DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer" /v "HideMyComputerIcons" /f
            cls
            echo "Meu computador reativado com sucesso."
            echo "deseja reiniciar agora para ativar as configuracoes"
            :inicio_op3_3_3
            echo "1 - Sim"
            echo "2 - Nao"
            SET /p valid= Digite :
                
            if !valid! == 1 (

                @REM shutdown.exe /s /t 00
                echo "entrouu no S"
                pause

            ) else if !valid! == 2 (
                cls
                echo "Voltando....."
                pause
                goto :inicio_op3

            ) else (
                    cls
                    echo "coloque um valor valido"
                    pause
                    goto :inicio_op3_3_3
                )

        ) else if !valor! == 3 (

            goto :inicio

        ) else (
            cls
            echo "Coloque um valor valido"
            goto :inicio_op3
            pause
        )
    ) else if %opcao% == 4 (
    :inicio_op4
    cls
    echo "Escolha uma opcao"
    echo "1 - Desativar o menu inicial"
    echo "2 - Ativar o menu inicial"
    
    SET /p valor=Digite um numero:

    if !valor! == 1 (
        reg query HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v "NoStartMenu" | find "1" > nul
        if %errorlevel% equ 0 (
            echo "Desativando menu inicial..."
            reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v "NoStartMenu" /t REG_DWORD /d 1 /f
            echo "menu inicial desativadas com sucesso."
            echo "deseja reiniciar agora para ativar as configuracoes"
            :inicio_op4_4
            echo "1 - Sim"
            echo "2 - Nao"
            SET /p valid= Digite :
                
            if !valid! == 1 (

                    @REM shutdown.exe /s /t 00
                    echo "entrouu no S"
                    pause

            ) else if !valid! == 2 (
                    cls
                    echo "Voltando....."
                    pause
                    goto :inicio_op4
            ) else (
                    cls
                    echo "coloque um valor valido"
                    pause
                    cls
                    goto :inicio_op4_4
            )
            
        ) else (
            echo "menu inicial ja esta desativada"
            goto :inicio_op4
        )  
    ) else if !valor! == 2 (
        echo "Reativando menu inicial..."
        %SystemRoot%\System32\reg.exe DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoStartMenu" /f
        echo "menu inicial reativado com sucesso."
        echo "deseja reiniciar agora para ativar as configuracoes"
        :inicio_op4_4_4
        echo "1 - Sim"
        echo "2 - Nao"
        SET /p valid= Digite :
                
        if !valid! == 1 (

                    @REM shutdown.exe /s /t 00
                    echo "entrouu no S"
                    pause

        ) else if !valid! == 2 (
                    cls
                    echo "Voltando....."
                    pause
                    goto :inicio_op4
        ) else (
                    cls
                    echo "coloque um valor valido"
                    pause
                    cls
                    goto :inicio_op4_4_4
        )

    ) else (
        cls
        echo "Coloque um valor valido"
        goto :inicio_op4
        pause
    )

) else if %opcao% == 0 (

        :inicio_op6
        cls
        echo "deseja realmente sair"
        echo "1 - Sim"
        echo "2 - Nao"
        SET /p valid= Digite :
                
        if !valid! == 1 (
            
                    echo "obrigado por usar nosso sistema"
                    pause
                    exit /b
                 

        ) else if !valid! == 2 (
                    cls
                    echo "Voltando....."
                    pause
                    goto :inicio
        ) else (
                    cls
                    echo "coloque um valor valido"
                    pause
                    cls
                    goto :inicio_op6
        )


) else if %opcao% == 5 (
        :inicio_op5
        cls
        echo "Escolha uma opcao"
        echo "1 - Desativar o CD/DVD"
        echo "2 - Ativar o CD/DVD"
        echo "3 - voltar"

        SET /p opcao_1=Digite um numero:  

    if !opcao_1! == 1 (
        reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\cdrom /v Start | find "1" > nul
        
        if !errorlevel! equ 0 (
            cls
            echo "Desativando o CD/DVD..."
            reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\cdrom /v Start /t REG_DWORD /d 4 /f
            echo "O CD/DVD foi desativadas com sucesso."
            pause
            goto :inicio_op5
        ) else (
                cls
                echo "O CD/DVD ja esta desativada"
                pause
                goto :inicio_op5
            )
    ) 
    
    if !opcao_1! == 2 (
        cls
         echo "Reativando o CD/DVD..."
         reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\cdrom /v Start /t REG_DWORD /d 1 /f
         echo "O CD/DVD foi reativadas com sucesso."
         pause
         goto :inicio_op5

    ) 
    if !opcao_1! == 3 (

        goto :inicio

    ) else (
         cls
         echo "Coloque um valor valido"
         pause 
         goto :inicio_op5
        
    )

) else (
            cls
            echo "Coloque um valor valido"
            pause
            goto :inicio
        )


goto :inicio

