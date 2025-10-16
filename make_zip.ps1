# make_zip.ps1 — create gpu_wall.zip in current folder (Windows PowerShell)
$zipName = "gpu_wall.zip"
$files = @("index.html","sketch.js","README.md","make_zip.ps1","make_zip.sh")
foreach ($f in $files) {
  if (-not (Test-Path $f)) {
    Write-Host "Warning: $f not found in $(Get-Location). Make sure all files are in the same folder."
  }
}
if (Test-Path $zipName) { Remove-Item $zipName -Force }
Compress-Archive -Path $files -DestinationPath $zipName
Write-Host "Created $zipName"
