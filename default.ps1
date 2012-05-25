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
        New-Symlink "$profile_folder\$name" ps\$name
    }
}