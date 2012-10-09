Task default -Depends DeleteProfileFile,LinkFiles

Task DeleteProfileFile {
    if(Test-Path $profile) {
        Remove-Item $profile
    }
}

Task LinkFiles {
    $profile_folder = Resolve-Path ~/Documents/WindowsPowershell
    Get-ChildItem ps\ | % { 
        $name = $_.Name
        $target = Resolve-Path ps\$name
        & cmd /c mklink "$profile_folder\$name" $target
    }
}
