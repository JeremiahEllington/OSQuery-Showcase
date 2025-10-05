# OSQuery Showcase

A practical, demo-ready repository for presenting osquery across Windows, macOS, and Linux. Includes quick install scripts, a reusable launcher, common queries, and a sample config.

## What is osquery?
Osquery exposes an operating system as a high-performance relational database. You can write SQL to query system state and security-relevant data. Learn more: https://osquery.io/

## Contents
- `scripts/` — Install and run scripts for Windows, macOS, and Linux
- `configs/` — Example osquery configuration (`osquery.conf`) with useful packs
- `queries/` — Demo SQL queries for live presentations
- `slides/` — Starter slide deck (Markdown) you can present with Marp or VS Code

## Quick start
Choose your OS and run the install + query demo.

### Windows (PowerShell as Admin)
```powershell
Set-ExecutionPolicy -Scope Process Bypass -Force
irm https://raw.githubusercontent.com/JeremiahEllington/OSQuery-Showcase/main/scripts/windows-install.ps1 | iex
```
Then run demo queries:
```powershell
& "$env:ProgramFiles\osquery\osqueryi.exe" --json < .\queries\demo_basic.sql
```

### macOS
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JeremiahEllington/OSQuery-Showcase/main/scripts/macos-install.sh)"
```
Then run:
```bash
osqueryi --json < ./queries/demo_basic.sql
```

### Linux (Debian/Ubuntu)
```bash
bash <(curl -fsSL https://raw.githubusercontent.com/JeremiahEllington/OSQuery-Showcase/main/scripts/linux-install.sh)
```

## Live demo ideas
- Enumerate running processes and network connections
- Detect unsigned binaries or unusual persistence
- Check installed software and patch levels
- Query Windows Event Logs via event_tapping (on Windows builds that support it)

## Presenting the slides
The `slides/slides.md` can be shown in VS Code with the Marp extension or converted to PDF.

## License
MIT
