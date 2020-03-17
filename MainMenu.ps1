    $wshell = New-Object -ComObject Wscript.Shell
    $wshell.Popup("By running this script, you accept any responsibility, should there be any damage done to any of the systems that you are running, these can include but are not limited to (Servers, Workstations and Desktops). This script has been designed to work with Windows 10+ & Windows Server 2012 R2+ and has not been tested on any versions of Windows preceding Windows 10 or Server 2012 R2. Use at your own will. The creator of this script shall not be held liable.",0,"!!! Warning/Disclaimer !!!")
    $time = Get-Date
        function Show-Menu
        {
            param ([string]$Title = 'Ashs UKFast Super Script')
            cls
            Write-Host "Time of initial run:";
            $time; 
            Write-Host "";
            Write-Host "Current Time:";
            Get-Date;
            Write-Host "";
            Write-Host "Welcome to Ash's UKFast Super Script";
            Write-Host "Please Select an option from below";
            Write-Host "";
            Write-Host "";
            Write-Host "================ $Title ================";
            Write-Host "1: Press '1' to Check if a port is open on a Server/Workstation";
            Write-Host "2: Press '2' to Check Current Network Connections from this machine";
            Write-Host "Q: Press 'Q' to quit.";
        }
        do
        {
            Show-Menu
            Write-host ""
            $input = Read-Host "Please make a selection"
            switch ($input)
            {
                '1' {
                        cls
                        'You chose option #1'
                        $HostOrIP = Read-Host "Please enter and IP or Computer Name"
                        $Port = Read-Host "Please enter the port you wish to test"
                        do {
                          Write-Host "Checking..."
                          sleep 3      
                        } until(Test-NetConnection $HostOrIP -Port $Port | ? { $_.TcpTestSucceeded } )
                        Write-Host "The host '$HostOrIP' is responding on port '$Port'."

                    } 
                '2' {
                        cls
                        'You chose option #2'
                        $OutputCSV = Read-Host "Do you want to Save the Output to a CSV? (Y or N)"
                        if ($OutputCSV -eq "Y" -or $OutputCSV -eq "y" -or $OutputCSV -eq "Yes" -or $OutputCSV -eq "YES" -or $OutputCSV -eq "yes")
                        {
                            if ( -not (Test-Path $env:USERPROFILE\Desktop\SuperScriptOutput) ) 
                            { 
                                mkdir $env:USERPROFILE\Desktop\SuperScriptOutput
                                $Port = Read-Host "Please enter the port you wish to check"
                                Get-NetTCPConnection | Where-Object { ($_.LocalPort -eq $Port) -and ($_.LocalAddress -ne "::") -and ($_.LocalAddress -ne "0.0.0.0") -and ($_.RemoteAddress -ne "0.0.0.0") -and ($_.RemoteAddress -ne "::") } | Select-Object LocalAddress,LocalPort,RemoteAddress,RemotePort,State | Export-CSV $env:USERPROFILE\Desktop\SuperScriptOutput\PortCheck.csv
                            }
                            else
                            {
                                $Port = Read-Host "Please enter the port you wish to check"
                                Get-NetTCPConnection | Where-Object { ($_.LocalPort -eq $Port) -and ($_.LocalAddress -ne "::") -and ($_.LocalAddress -ne "0.0.0.0") -and ($_.RemoteAddress -ne "0.0.0.0") -and ($_.RemoteAddress -ne "::") } | Select-Object LocalAddress,LocalPort,RemoteAddress,RemotePort,State | Export-CSV $env:USERPROFILE\Desktop\SuperScriptOutput\PortCheck.csv
                            }
                            
                        }
                        else
                        {
                            $Port = Read-Host "Please enter the port you wish to check"
                            Get-NetTCPConnection | Where-Object { ($_.LocalPort -eq $Port) -and ($_.LocalAddress -ne "::") -and ($_.LocalAddress -ne "0.0.0.0") -and ($_.RemoteAddress -ne "0.0.0.0") -and ($_.RemoteAddress -ne "::") } | Select-Object LocalAddress,LocalPort,RemoteAddress,RemotePort,State | Format-Table
                        }
                    }
                                        					
                'q' {
                        return
                    }
			}
            pause
        }
until ($input -eq 'q')