# File Backup System

A Bash-based file backup utility that supports full and partial backups with compression. Ideal for archiving important files, automating regular backups, and managing storage efficiently.

## Features

- Full backups of entire directories
- Partial backups using filename patterns (e.g., `*.txt`, `*report*`)
- Compressed `.tar.gz` archives
- Timestamped backups to avoid overwriting
- Simple to integrate with cron for scheduled backups

## Usage

### 1. Clone the repository:

```bash
git clone https://github.com/Zapwap123/BashScript-File-Backup-System
cd BashScript-Automated-File-Sorter
```

### 2. Make the script executable:

```bash
chmod +x fileBackupSystem.sh
```

### 3. Download test files (optional): If you'd like to test the script with pre-made files, run the following script to download test files:

```bash
chmod +x downloadTestFilesScript.sh
./downloadTestFilesScript.sh
```

### 4. Full Backup:

```bash
./fileBackupSystem.sh full <sourceDir> <backupDir>
```

#### Example:

```bash
mkdir -p full-Backup-Directory
./fileBackupSystem.sh full file-organizer-test/ full-Backup-Directory/
```

### 5. Partial Backup (Pattern-based):

```bash
./fileBackupSystem.sh partial <sourceDir> <backupDir> <pattern>
```

#### Example:

```bash
mkdir -p pattern-backup-partial
./fileBackupSystem.sh partial file-organizer-test/ pattern-backup-partial/ "*.txt"
```

## Scheduling Backups (Optional)

Use `cron` to automate backups:

```bash
crontab -e
```

#### Example Cron Job:

```bash
0 2 * * * /path/to/fileBackupSystem.sh partial /path/to/source /path/to/backup "*.txt" >> /var/log/backup.log 2>&1
```

## Requirements

- Bash
- tar
- Unix-like system (Linux, macOS)

## License

MIT License
