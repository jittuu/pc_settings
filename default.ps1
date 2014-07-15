Task default -Depends SetupProfile,SetupVim

Task SetupProfile -Depends DeleteProfileFile,LinkProfileFiles

Task DeleteProfileFile {
    if(Test-Path $profile) {
        Remove-Item $profile
    }
}

Task LinkProfileFiles {
    $profile_folder = Resolve-Path ~/Documents/WindowsPowershell
    Get-ChildItem ps\ | % {
        $name = $_.Name
        $target = Resolve-Path ps\$name
        & cmd /c mklink "$profile_folder\$name" $target
    }
}

Task SetupVim -Depends CreateVimTmp,LinkVimFiles

Task CreateVimTmp {
  if(!(Test-Path ~/vimtmp)) {
    & mkdir ~/vimtmp
    & mkdir ~/vimtmp/backup
  }
}

Task LinkVimFiles {
  $vimrc = Resolve-Path vim\_vimrc
  &cmd /c mklink "$HOME\_vimrc" $vimrc

  $vimfiles = Resolve-Path vim\vimfiles
  &cmd /c mklink /d "$HOME\vimfiles" $vimfiles
}
