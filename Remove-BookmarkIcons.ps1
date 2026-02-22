# Remove-BookmarkIcons-AutoFolder.ps1
# Looks for bookmarks.html in THE SAME FOLDER AS THIS SCRIPT
# Creates bookmarks-noicons.html in the same folder

$scriptFolder = $PSScriptRoot
$inputFile    = Join-Path $scriptFolder "bookmarks.html"
$outputFile   = Join-Path $scriptFolder "bookmarks-noicons.html"

if (-not (Test-Path $inputFile)) {
    Write-Host "Error: bookmarks.html not found in the script's folder:" -ForegroundColor Red
    Write-Host "       $scriptFolder" -ForegroundColor Red
    Write-Host ""
    Write-Host "Make sure this .ps1 file and bookmarks.html are in the same folder." -ForegroundColor Yellow
    pause
    exit
}

Write-Host "Script folder : $scriptFolder"
Write-Host "Reading       : bookmarks.html"
Write-Host ""

$content = Get-Content $inputFile -Raw -Encoding UTF8

# Case-insensitive match for ICON= attributes (covers ICON=, icon=, Icon=, etc.)
$iconCount = ([regex]::Matches($content, '(?i)\sICON\s*=\s*"[^"]*"')).Count

if ($iconCount -eq 0) {
    Write-Host "No ICON attributes found in the file." -ForegroundColor Yellow
    Write-Host "Copying original file unchanged → $outputFile" -ForegroundColor Yellow
    Copy-Item $inputFile $outputFile -Force
} else {
    $cleanContent = $content -replace '(?i)\s*ICON\s*=\s*"[^"]*"', ''
    
    # Write UTF-8 without BOM (standard for bookmarks.html)
    [System.IO.File]::WriteAllText($outputFile, $cleanContent, [System.Text.UTF8Encoding]::new($false))
    
    Write-Host "Removed $iconCount icon attribute(s)." -ForegroundColor Green
    Write-Host "Saved cleaned version → $outputFile" -ForegroundColor Green
    Write-Host "Original file is untouched." -ForegroundColor Green
}

Write-Host ""
Write-Host "Done."
Write-Host "You can now use $outputFile for import."
pause   # Keeps window open if double-clicked