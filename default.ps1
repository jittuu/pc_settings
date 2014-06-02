Task default -Depends SetupProfile

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
