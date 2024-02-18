$userName = $env:USERNAME
$userDocumentsFolderPath = "C:\Users\$userName\Documents\"


# Install Winget manuelly via GitHub or via Microsoft Store
explorer "https://github.com/microsoft/winget-cli"

#TODO - still working on it 
<#
$ProgrammsToinstall = @()
$ProgrammsToinstall += "Git.Git"
$ProgrammsToinstall += "Neovim.Neovim"
$ProgrammsToinstall += "Python.Python.3.10"


foreach($programm in $ProgrammsToinstall) {
    $wingetCommand = "install "+ $programm
    Write-Host -ForegroundColor Green -BackgroundColor Black "Installing $programm"
    winget $wingetCommand
}

#>
