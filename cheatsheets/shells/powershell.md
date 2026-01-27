# PS  - Commands, strings, functions, and info

Various
- Bits of info
- Commands
- Strings
- bash/zsh options
- Syntax examples
-
<img src="image.png"
        alt="Cause I can't remember shit."
        width="200"
        height="200"
        style="display: block; margin: 0 auto" />


## PS Profile

Like bash and zsh powershell has a config file, `$PROFILE`, that is loaded when starting.
PowerShell 5.X, 6+, and VSCodeall have their own profiles that are loaded.

The usual locations and names for `$PROFILE`can be found below.

PowerShell 5.x
- `%UserProfile%\Documents\WindowsPowerShell\profile.ps1`
- `%UserProfile%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`

PowerShell 6+
- `%UserProfile%\Documents\PowerShell\profile.ps1`
- `%UserProfile%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1`

VSCode
- PowerShell 6+: `%UserProfile%\Documents\PowerShell\Microsoft.VSCode_profile.ps1`
- PowerShell 5.x: `%UserProfile%\Documents\WindowsPowerShell\Microsoft.VSCode_profile.ps1`



It is very likely that your machine will not have a profile to load. If the file does not exist on your machine, you can generate one with `new-item $profile -itemtype file -force`


## HISTORY: Bash like history command

### Display all using "more" command

`Get-Content (Get-PSReadlineOption).HistorySavePath | more`

### Display last N items:

```powershell
function history {
    DisplayItems =200
    cat (Get-PSReadlineOption).HistorySavePath | select -Last $DisplayItems
}
```

## AUTO COMPLETE: Make PowerShell tab completion work like Bash

New versions of PowerShell include PSReadline, which can be used to do this:

```powershell
Set-PSReadlineKeyHandler -Key Tab -Function Complete
```

or, to make it even more like bash where you can use arrow-keys to navigate available options:

```powershell
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
```

To make it permanent, put one of the commands or functions into your powershell profile, defined by `$PROFILE`
