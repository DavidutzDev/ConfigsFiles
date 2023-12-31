$ENV:STARSHIP_CONFIG = "$HOME\.starship\starship.toml"
$ENV:STARSHIP_DISTRO = ""
Invoke-Expression (&starship init powershell)


# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# Import PowerShell ReadLine module 
Import-Module PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Tab -Function Complete

# Custom Command Aliases
function Remove-Dir([string]$path) { Remove-Item -Recurse -Force $path}
Set-Alias -Name rmd -Value Remove-Dir
function Copy-Dir([string]$path) { Copy-Dir -Recurse -Path $path }
Set-Alias -Name cpd -Value Copy-Dir
Set-Alias -Name pwsh -Value powershell.exe
function SetLocDev { Set-Location -Path "G:\NextCloud Sync\Dev\" }
Set-Alias -Name cdd -Value SetLocDev
function LsCol([string]$path) { ls $path | Format-Wide -Column 5 -Property Name }
Set-Alias -Name l -Value LsCol
Set-Alias -Name cl -Value clear
function Neovim([string]$path) { nvim $path }
Set-Alias -Name n -Value Neovim
