# Versión sencilla: recorre usuarios y verifica tamaño de directorio

$thresholdUser = 100 * 1MB
$thresholdRoot = 300 * 1MB
$thresholdBlock = 500 * 1MB

Get-ChildItem -Directory -Path "C:\Users" | ForEach-Object {
    $userDir = $_.FullName
    $username = $_.Name
    
    # Calcular tamaño
    $dirSize = (Get-ChildItem -Recurse -Force -ErrorAction SilentlyContinue $userDir | Measure-Object -Property Length -Sum).Sum
    
    # Verificar umbrales
    if ($dirSize -gt $thresholdBlock) {
        Write-Host "BLOQUEAR: $username ($('{0:N2}' -f ($dirSize/1MB)) MB)"
    }
    elseif ($dirSize -gt $thresholdRoot) {
        Write-Host "ALERTAR ADMIN: $username ($('{0:N2}' -f ($dirSize/1MB)) MB)"
    }
    elseif ($dirSize -gt $thresholdUser) {
        Write-Host "AVISAR USUARIO: $username ($('{0:N2}' -f ($dirSize/1MB)) MB)"
    }
}
