function prompt() {
    $loc = (Get-Location).Path
    $host.ui.RawUI.WindowTitle = $loc
    $dir = [System.IO.Path]::GetFileName($loc)
    Write-Host "PS /" -nonewline
    Write-Host "$($dir)" -nonewline -Foreground Yellow

    # writing git status
    $status = Get-GitStatus

    if($status) {
        $currentBranch = $status.Branch
        $branchColor = [ConsoleColor]::Green
        if($status.HasIndex -or $status.HasWorking) {
            $branchColor = [ConsoleColor]::Red
        }

        Write-Host -NoNewline " ["
        Write-Host -NoNewline $currentBranch -ForegroundColor $branchColor

        if($status.BehindBy -gt 0) {
            Write-Host -NoNewline "-$($status.BehindBy)" -ForegroundColor $branchColor
        } elseif($status.AheadBy -gt 0) {
            Write-Host -NoNewline "+$($status.AheadBy)" -ForegroundColor $branchColor
        }
        Write-Host -NoNewline "]"
    }

    return " > "
}

function Delete-MergedBranches ($Commit = 'HEAD', [switch]$Force) {
    git branch --merged $Commit |
        ? { $_ -notmatch '(^\*)|(^. master$)' } |
        % { git branch $(if($Force) { '-D' } else { "-d" }) $_.Substring(2) }
}

& {
    # import modules
    Import-Module PsGet
    Import-Module PsUrl

    # If Posh-Git environment is defined, load it. which is installed by GitHub For Windows
    if (test-path env:posh_git) {
        . $env:posh_git
    }
    else {
        Import-Module Posh-Git

        # set TERM as msys
        $env:TERM = "msys"
    }
}

# alias
. (Resolve-Path ~/Documents/WindowsPowershell/alias.ps1)
