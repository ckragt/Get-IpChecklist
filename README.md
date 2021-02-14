# ⚠ The Project behind this is abandoned! ⚠
Currently this script will not work because thr IP-Checklist project has been abandoned by it's owner. I have changed the link in the script for security and demo reasons.

# Get-IpChecklist
PowerShell Script to test data against spam.

### DESCRIPTION
After you have imported this module, you can call it via <code>Get-IpChecklist</code> but without parameter this module would not work.

### USAGE EXAMPLE
<code>Get-IpChecklist -CheckType username -CheckValue johndoe;</code><br />
<code>Get-IpChecklist -CheckType username -CheckValue johndoe -ConvertTime true;</code><br />
<code>Get-IpChecklist -CheckType username -CheckValue johndoe -ConsoleMode silent;</code><br />
<code>Get-IpChecklist -CheckType username -CheckValue johndoe -ConvertTime true -ConsoleMode silent;</code><br />
<code>GetIpChecklist -CheckType [string] -CheckValue [string] [-ConvertTime [true]] [-ConsoleMode [silent]];</code>

### PARAMETER 
<code>[mandatory] -CheckType</code> = you can choose between ip, email or username<br />
<code>[mandatory] -CheckValue</code> = the ip, email or username you want to check<br />
<code>[optional] -ConvertTime</code> = set true if you want to convert the last_update value to a readable string<br />
<code>[optional] -ConsoleMode</code> = if set silent, ther will be no output to the console windows if true or false

### OUTPUT
The module thorws either <code>True</code> or <code>False</code> if <code>-CheckValue</code> is found or not. Using variable <code>$IpCheckResult</code> you can process the answer. You can also use the <code>$IpChecklistOutput_[TYPE]</code> to get specific informations. For example <code>$IpChecklistOutput_LastUpdate.</code>

### HOW TO IMPORT
Import in a script (current session): <code>Import-Module \path\to\Get-IpChecklist.ps1;</code>

Import to all sessions: Open <code>C:\Windows\System32\WindowsPowerShell\v1.0\profile.ps1</code> or create it as administrator. Add <code>Import-Module \path\to\Get-IpChecklist.ps1;</code> and save profile.ps1 and you are ready to go.

### CONTACT
Feel free to contact me via e-mail: code [at] kragt.pro 
