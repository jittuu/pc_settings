# git
function Git-Status { git status -s @args }
Set-Alias g_s Git-Status

function Git-Pull { git pull --rebase @args }
Set-Alias g_l Git-Pull

function Git-Push { git push @args }
Set-Alias g_p Git-Push

function Git-AddAll { git add -A }
Set-Alias g_a Git-AddAll

function Git-Commit { git commit @args }
Set-Alias g_c Git-Commit

function Git-CheckOut { git checkout @args }
Set-Alias g_co Git-CheckOut

function Git-Diff { git diff @args }
Set-Alias g_d Git-Diff

function Git-Graph { git log --all --oneline --graph --decorate=short }
Set-Alias g_g Git-Graph

# nuget
Set-Alias n_ls Get-Package
Set-Alias n_i Install-Package
Set-Alias n_rm Uninstall-Package
Set-Alias n_u Update-Package
