<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    Powershell Tools
.SYNOPSIS
    remote restart computers & drop SCCM, LAPS, 1c
.DESCRIPTION
    remote restart computers & drop system center configuration manager remote session & remote kill rphost ( 1c ) process & get LAPS password for computer from Active Directory
#>


#################GUI STARTS HERE########################


Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '597,334'
$Form.text                       = "Ash's Super Script"
$Form.TopMost                    = $false

$PingTest                 = New-Object system.Windows.Forms.Button
$PingTest.text            = "Ping Test"
$PingTest.width           = 132
$PingTest.height          = 48
$PingTest.location        = New-Object System.Drawing.Point(8,14)
$PingTest.Font            = 'Microsoft Sans Serif,10'

$KillRPhostButton                = New-Object system.Windows.Forms.Button
$KillRPhostButton.text           = "Kill rphost"
$KillRPhostButton.width          = 132
$KillRPhostButton.height         = 48
$KillRPhostButton.location       = New-Object System.Drawing.Point(151,74)
$KillRPhostButton.Font           = 'Microsoft Sans Serif,10'

$RestartComputerButton           = New-Object system.Windows.Forms.Button
$RestartComputerButton.text      = "Restart Computer"
$RestartComputerButton.width     = 132
$RestartComputerButton.height    = 48
$RestartComputerButton.location  = New-Object System.Drawing.Point(11,73)
$RestartComputerButton.Font      = 'Microsoft Sans Serif,10'

$LapsPasswd                      = New-Object system.Windows.Forms.Button
$LapsPasswd.text                 = "Get LAPS Password"
$LapsPasswd.width                = 132
$LapsPasswd.height               = 48
$LapsPasswd.location             = New-Object System.Drawing.Point(9,135)
$LapsPasswd.Font                 = 'Microsoft Sans Serif,10'

$Clean1cCashBotton               = New-Object system.Windows.Forms.Button
$Clean1cCashBotton.text          = "Clean 1Cv8 Cash"
$Clean1cCashBotton.width         = 132
$Clean1cCashBotton.height        = 48
$Clean1cCashBotton.location      = New-Object System.Drawing.Point(8,197)
$Clean1cCashBotton.Font          = 'Microsoft Sans Serif,10'

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "Drop SCCM Session"
$Button1.width                   = 132
$Button1.height                  = 48
$Button1.location                = New-Object System.Drawing.Point(151,13)
$Button1.Font                    = 'Microsoft Sans Serif,10'

$Button2                         = New-Object system.Windows.Forms.Button
$Button2.text                    = "Drop SCCM Session"
$Button2.width                   = 132
$Button2.height                  = 48
$Button2.location                = New-Object System.Drawing.Point(439,14)
$Button2.Font                    = 'Microsoft Sans Serif,10'

$Button3                         = New-Object system.Windows.Forms.Button
$Button3.text                    = "Drop SCCM Session"
$Button3.width                   = 132
$Button3.height                  = 48
$Button3.location                = New-Object System.Drawing.Point(295,14)
$Button3.Font                    = 'Microsoft Sans Serif,10'

$Button4                         = New-Object system.Windows.Forms.Button
$Button4.text                    = "Get LAPS Password"
$Button4.width                   = 132
$Button4.height                  = 48
$Button4.location                = New-Object System.Drawing.Point(9,258)
$Button4.Font                    = 'Microsoft Sans Serif,10'

$Button5                         = New-Object system.Windows.Forms.Button
$Button5.text                    = "Kill rphost"
$Button5.width                   = 132
$Button5.height                  = 48
$Button5.location                = New-Object System.Drawing.Point(295,74)
$Button5.Font                    = 'Microsoft Sans Serif,10'

$Button6                         = New-Object system.Windows.Forms.Button
$Button6.text                    = "Kill rphost"
$Button6.width                   = 132
$Button6.height                  = 48
$Button6.location                = New-Object System.Drawing.Point(439,74)
$Button6.Font                    = 'Microsoft Sans Serif,10'

$Button7                         = New-Object system.Windows.Forms.Button
$Button7.text                    = "Get LAPS Password"
$Button7.width                   = 132
$Button7.height                  = 48
$Button7.location                = New-Object System.Drawing.Point(151,135)
$Button7.Font                    = 'Microsoft Sans Serif,10'

$Button8                         = New-Object system.Windows.Forms.Button
$Button8.text                    = "Get LAPS Password"
$Button8.width                   = 132
$Button8.height                  = 48
$Button8.location                = New-Object System.Drawing.Point(295,135)
$Button8.Font                    = 'Microsoft Sans Serif,10'

$Button9                         = New-Object system.Windows.Forms.Button
$Button9.text                    = "Get LAPS Password"
$Button9.width                   = 132
$Button9.height                  = 48
$Button9.location                = New-Object System.Drawing.Point(439,135)
$Button9.Font                    = 'Microsoft Sans Serif,10'

$Button10                        = New-Object system.Windows.Forms.Button
$Button10.text                   = "Clean 1Cv8 Cash"
$Button10.width                  = 132
$Button10.height                 = 48
$Button10.location               = New-Object System.Drawing.Point(151,197)
$Button10.Font                   = 'Microsoft Sans Serif,10'

$Button11                        = New-Object system.Windows.Forms.Button
$Button11.text                   = "Clean 1Cv8 Cash"
$Button11.width                  = 132
$Button11.height                 = 48
$Button11.location               = New-Object System.Drawing.Point(295,197)
$Button11.Font                   = 'Microsoft Sans Serif,10'

$Button12                        = New-Object system.Windows.Forms.Button
$Button12.text                   = "Clean 1Cv8 Cash"
$Button12.width                  = 132
$Button12.height                 = 48
$Button12.location               = New-Object System.Drawing.Point(439,197)
$Button12.Font                   = 'Microsoft Sans Serif,10'

$Button13                        = New-Object system.Windows.Forms.Button
$Button13.text                   = "Get LAPS Password"
$Button13.width                  = 132
$Button13.height                 = 48
$Button13.location               = New-Object System.Drawing.Point(151,258)
$Button13.Font                   = 'Microsoft Sans Serif,10'

$Button14                        = New-Object system.Windows.Forms.Button
$Button14.text                   = "Get LAPS Password"
$Button14.width                  = 132
$Button14.height                 = 48
$Button14.location               = New-Object System.Drawing.Point(295,258)
$Button14.Font                   = 'Microsoft Sans Serif,10'

$Button15                        = New-Object system.Windows.Forms.Button
$Button15.text                   = "Get LAPS Password"
$Button15.width                  = 132
$Button15.height                 = 48
$Button15.location               = New-Object System.Drawing.Point(439,258)
$Button15.Font                   = 'Microsoft Sans Serif,10'

$Form.controls.AddRange(@($PingTest,$KillRPhostButton,$RestartComputerButton,$LapsPasswd,$Clean1cCashBotton,$Button1,$Button2,$Button3,$Button4,$Button5,$Button6,$Button7,$Button8,$Button9,$Button10,$Button11,$Button12,$Button13,$Button14,$Button15))

$PingTest.Add_Click({ PingTest })
$KillRPhostButton.Add_Click({ ResetRphost })
$RestartComputerButton.Add_Click({ restartpc })
$LapsPasswd.Add_Click({ GetLapspass })
$Clean1cCashBotton.Add_Click({ Clean_1cV8_cash })

#################GUI ENDS HERE########################

#################LOGIC STARTS HERE########################

function Clean_1cV8_cash { 
    
    Get-Service -ComputerName "$computerName" -Name "1C*" | Stop-Service -Force
    Get-Process -ComputerName "$computerName" -Name "1cv8*" | Stop-Process -Force
    Get-ChildItem -Path "\\$computerName\c$\Program Files\1cv8\srvinfo\reg_1541" -Directory -Force
    $names = Get-ChildItem -Path '\\$computerName\c$\Users' | Select-Object -ExpandProperty Name 
    foreach($name in $names){
    Get-ChildItem -Path "\\$computerName\c$\Users\$name\AppData\Roaming\1C\1cv8" -Directory | Remove-Item -Force
    Get-ChildItem -Path "\\$computerName\c$\Users\$name\AppData\Local\1C\1cv8" -Directory | Remove-Item -Force}
 }

function GetLapspass { 
    if($AdminpswCheckBox.Checked -eq $true ){
    $pass=ConvertTo-SecureString -AsPlainText $Password.text -Force
    $Cred=New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $Login.text,$pass
    [string]$LapsPWD = Get-ADComputer -Identity $computerName.text -Properties * -Credential $Cred | Select-Object -ExpandProperty ms-Mcs-AdmPwd
    $ResultTexBox.text += "`r`n" +"`r`n" + $LapsPWD }else{
        [string]$LapsPWD = Get-ADComputer -Identity $computerName.text -Properties * | Select-Object -ExpandProperty ms-Mcs-AdmPwd
        $ResultTexBox.text += "`r`n" +"`r`n" + $LapsPWD }
    }

function PingTest()
{
    cls
        $HostOrIP = Read-Host "Please enter and IP or Computer Name"
        $Port = Read-Host "Please enter the port you wish to test"
            do {
                    Write-Host "waiting..."
                    sleep 3      
                } until(Test-NetConnection $HostOrIP -Port $Port | ? { $_.TcpTestSucceeded } )

}

    
function ResetRphost(){
if($AdminpswCheckBox.Checked -eq $true ){
    $pass=ConvertTo-SecureString -AsPlainText $Password.text -Force
    $Cred=New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $Login.text,$pass
    Invoke-Command -ComputerName $computerName.text -Credential $cred {Stop-Process -Name rphost -force }
    }else{
    Invoke-Command -ComputerName $computerName.text {Stop-Process -Name rphost -force } }
}

function restartpc(){
if($AdminpswCheckBox.Checked -eq $true ){
    $pass=ConvertTo-SecureString -AsPlainText $Password.text -Force
    $Cred=New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $Login.text,$pass
    Restart-Computer -ComputerName $computerName.text -Force -Credential $cred 
    }else{
    Restart-Computer -ComputerName $computerName.text -Force }
}
[void]$Form.ShowDialog()
#################LOGIC ENDS HERE########################