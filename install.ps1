#install modules
& {
    $color = [ConsoleColor]::Green
    # install PsGet
    Write-Host "installing PsGet" -ForegroundColor $color
    (new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex

    # psake
    Write-Host "installing psake" -ForegroundColor $color
    Install-Module psake

    # psurl
    Write-Host "installing psurl" -ForegroundColor $color
    Install-Module PsUrl

    #posh-git
    Install-Module Posh-Git
}

# run tasks

& {
    Invoke-psake ./default.ps1
}

& {
    $color = [ConsoleColor]::Green
    Write-Host "Installing successful. Reload your shell to take effects." -ForegroundColor $color
}
