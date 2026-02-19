<#
.SYNOPSIS
    Removes ICON attributes from a Netscape bookmarks.html file.

.DESCRIPTION
    Keeps file structure and all entries intact, only stripping icon data.

.PARAMETER Path
    Path to the bookmarks file.

.PARAMETER Backup
    Create a .bak backup before modifying.

.PARAMETER OutputPath
    Write to a different file instead of overwriting.

.EXAMPLE
    .\Remove-BookmarkIcons.ps1
    .\Remove-BookmarkIcons.ps1 -Path bookmarks.html -Backup
    .\Remove-BookmarkIcons.ps1 -Path bookmarks.html -OutputPath bookmarks_no_icons.html
#>

param(
    [Parameter(Position = 0)]
    [string]$Path = "bookmarks.html",

    [switch]$Backup,

    [string]$OutputPath
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $Path)) {
    Write-Error "File not found: $Path"
    exit 1
}

$content = Get-Content $Path -Raw -Encoding UTF8
$iconCount = ([regex]::Matches($content, ' ICON="[^"]*"')).Count
$newContent = $content -replace ' ICON="[^"]*"', ''

$outPath = if ($OutputPath) { $OutputPath } else { $Path }

if ($Backup -and -not $OutputPath) {
    $backupPath = $Path + ".bak"
    $content | Set-Content $backupPath -Encoding UTF8 -NoNewline
    Write-Host "Backup saved to $backupPath"
}

$fullPath = [System.IO.Path]::GetFullPath($outPath)
[System.IO.File]::WriteAllText($fullPath, $newContent, [System.Text.UTF8Encoding]::new($false))

Write-Host "Removed $iconCount icon(s) from $outPath"
