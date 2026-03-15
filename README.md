# 📚 Bookmarks Collection & Icon Stripper

> A curated collection of browser bookmarks with a PowerShell utility to optimize file size by removing embedded icons.

---

## ✨ Features

- **Comprehensive Bookmark Collection** — Organized Netscape-format bookmarks covering social media, AI tools, software, development resources, and more
- **Icon Removal Utility** — PowerShell script to strip base64-encoded favicon data, dramatically reducing file size
- **Non-destructive** — Optional backup creation before modifications
- **Flexible Output** — Write to original file or create a separate cleaned version

---

## 📁 Project Structure

```
Bookmarks/
├── bookmarks.html           # Netscape bookmark file (browser export)
├── Remove-BookmarkIcons.ps1 # Icon stripping utility
└── README.md
```

---

## 🚀 Quick Start

### Remove Icons (Default)

```powershell
.\Remove-BookmarkIcons.ps1
```

### Remove Icons with Backup

```powershell
.\Remove-BookmarkIcons.ps1 -Backup
```

### Output to Different File

```powershell
.\Remove-BookmarkIcons.ps1 -Path bookmarks.html -OutputPath bookmarks_clean.html
```

---

## 🛠️ Remove-BookmarkIcons.ps1

A lightweight PowerShell script that removes `ICON="..."` attributes from Netscape bookmark files.

### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `-Path` | String | `bookmarks.html` | Path to the input bookmarks file |
| `-Backup` | Switch | `$false` | Create a `.bak` backup before modifying |
| `-OutputPath` | String | — | Write output to a different file |

### Why Remove Icons?

Browser bookmark exports embed favicons as base64-encoded data URIs. This can bloat file sizes significantly:

| State | Typical Size |
|-------|--------------|
| With Icons | 300+ KB |
| Without Icons | ~50 KB |

Removing icons makes bookmarks:
- ✅ Faster to load in text editors
- ✅ Easier to diff and version control
- ✅ More portable across systems

---

## 📂 Bookmark Categories

The collection includes curated links across multiple categories:

| Category | Subcategories |
|----------|---------------|
| **Social** | News, AI, Networks, Business, Media, Dating |
| **Software** | Giveaways, Tools, Downloads |
| **Development** | Languages, Frameworks, Documentation |
| **Entertainment** | Gaming, Streaming, Music |
| **Utilities** | Converters, Editors, Productivity |

---

## 📥 Import Bookmarks

### Chrome
1. Go to `chrome://bookmarks`
2. Click ⋮ → **Import bookmarks**
3. Select `bookmarks.html`

### Firefox
1. Press `Ctrl+Shift+O` to open Library
2. Click **Import and Backup** → **Import Bookmarks from HTML...**
3. Select `bookmarks.html`

### Edge
1. Go to `edge://favorites`
2. Click ⋮ → **Import favorites**
3. Choose **Favorites or bookmarks HTML file**
4. Select `bookmarks.html`

---

## 📄 License

This project is provided as-is for personal use.

---

<p align="center">
  <sub>Made with ❤️ for organized browsing</sub>
</p>

---

## Disclaimer

**NO WARRANTY.** THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.

**Limitation of Liability.** IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MODIFIES AND/OR CONVEYS THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
