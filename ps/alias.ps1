# git
function Git-Status { git status -s @args }
Set-Alias ghs Git-Status

function Git-Pull { git pull --rebase @args }
Set-Alias ghl Git-Pull

function Git-Push { git push @args }
Set-Alias ghp Git-Push

function Git-AddAll { git add -A }
Set-Alias gha Git-AddAll

function Git-Commit { git commit @args }
Set-Alias ghc Git-Commit

function Git-CheckOut { git checkout @args }
Set-Alias ghco Git-CheckOut

function Git-Diff { git diff @args }
Set-Alias ghd Git-Diff

function Git-Graph { git log --all --oneline --graph --decorate=short }
Set-Alias ghg Git-Graph

# nuget
Set-Alias ngls Get-Package
Set-Alias ngi Install-Package
Set-Alias ngrm Uninstall-Package
Set-Alias ngu Update-Package

# gae goapp
function GoApp-Gae { goapp serve -clear_datastore }
Set-Alias gogae GoApp-Gae

# which
function which($name) { Get-Command $name | Select-Object -ExpandProperty Definition }

# hub
Set-Alias git hub