# File Backup System

A Bash-based file backup utility that supports full and partial backups with compression. Ideal for archiving important files, automating regular backups, and managing storage efficiently.

## Features

- Full backups of entire directories
- Partial backups using filename patterns (e.g., `*.txt`, `*report*`)
- Compressed `.tar.gz` archives
- Timestamped backups to avoid overwriting
- Simple to integrate with cron for scheduled backups

## Usage

### 1. Make the script executable:

```bash
chmod +x fileBackupSystem.sh
```

### 2. Full Backup:

```bash
./fileBackupSystem.sh full <sourceDir> <backupDir>
```

### 3. Partial Backup (Pattern-based):

```bash
./fileBackupSystem.sh partial <sourceDir> <backupDir> <pattern>
```

#### Example:

```bash
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
