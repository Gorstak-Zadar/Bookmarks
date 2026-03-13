# Remove-BookmarkIcons-AutoFolder.ps1
# Looks for bookmarks.html in THE SAME FOLDER AS THIS SCRIPT
# Creates bookmarks-noicons.html in the same folder

$scriptFolder = $PSScriptRoot
$inputFile    = Join-Path $scriptFolder "bookmarks.html"
$outputFile   = Join-Path $scriptFolder "bookmarks-noicons.html"

if (-not (Test-Path $inputFile)) {
    Write-Host "Error: bookmarks.html not found in the script's folder:" -ForegroundColor Red
    Write-Host "       $scriptFolder" -ForegroundColor Red
    Write-Host "Make sure this .ps1 file and bookmarks.html are in the same folder." -ForegroundColor Yellow
    exit
}

Write-Host "Script folder : $scriptFolder"
Write-Host "Reading       : bookmarks.html"

$content = Get-Content $inputFile -Raw -Encoding UTF8

# Case-insensitive match for ICON= attributes (consistent regex for count and replace)
$iconRegex = '(?i)\s*ICON\s*=\s*"[^"]*"'
$iconCount = ([regex]::Matches($content, $iconRegex)).Count

if ($iconCount -eq 0) {
    Write-Host "No ICON attributes found." -ForegroundColor Yellow
    Copy-Item $inputFile $outputFile -Force
} else {
    $cleanContent = $content -replace $iconRegex, ' '
    [System.IO.File]::WriteAllText($outputFile, $cleanContent, [System.Text.UTF8Encoding]::new($false))
    Write-Host "Removed $iconCount icon attribute(s). Saved → $outputFile" -ForegroundColor Green
}
