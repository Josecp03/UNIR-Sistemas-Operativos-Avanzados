param([string]$Directorio)

if (-not $Directorio) {
    $Directorio = Read-Host "Introduce el directorio"
}

if (-not (Test-Path $Directorio -PathType Container)) {
    Write-Host "El directorio no existe"
    exit 1
}

$items = Get-ChildItem $Directorio -Force
$ficheros = @($items | Where-Object { -not $_.PSIsContainer })
$directorios = @($items | Where-Object { $_.PSIsContainer })
$ejecutables = @($ficheros | Where-Object { $_.Extension -in ".exe", ".bat", ".cmd", ".ps1" })

Write-Host "Ficheros normales: $($ficheros.Count)"
Write-Host "Subdirectorios: $($directorios.Count)"
Write-Host "Ejecutables: $($ejecutables.Count)"
