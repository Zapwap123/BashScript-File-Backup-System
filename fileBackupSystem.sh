#!/bin/bash

# File Backup System
# This script creates a backup of files from a source directory to a backup directory.
# It supports two types of backups: full and partial.
# - Full backup: Backs up all files in the source directory.
# - Partial backup: Backs up files matching a specified pattern in the source directory.
# The backup is stored in a compressed tarball with a timestamp in the filename.

# Usage:
#   ./fileBackupSystem.sh full <sourceDir> <backupDir>
#   ./fileBackupSystem.sh partial <sourceDir> <backupDir> <pattern>
# Example:
#   ./fileBackupSystem.sh full /path/to/source /path/to/backup
#   ./fileBackupSystem.sh partial /path/to/source /path/to/backup "*.txt"

set -euo pipefail

# File Backup System

backupType=$1
sourceDir=$2
backupDir=$3
pattern=${4:-}

if [ "$#" -lt 3 ]; then
  echo "Usage: $0 [full|partial] <sourceDir> <backupDir> [pattern]"
  exit 1
fi

if [ ! -d "$sourceDir" ]; then
  echo "Source directory does not exist: $sourceDir"
  exit 1
fi

timestamp=$(date +"%Y%m%d_%H%M%S")
mkdir -p "$backupDir"

if [ "$backupType" == "full" ]; then
  archiveName="backup_full_${timestamp}.tar.gz"
  archivePath="${backupDir}/${archiveName}"
  tar -czf "$archivePath" -C "$sourceDir" .
  echo "Full backup created at: $archivePath"

elif [ "$backupType" == "partial" ]; then
  if [ -z "$pattern" ]; then
    echo "Pattern required for partial backup."
    exit 1
  fi

  archiveName="backup_partial_${timestamp}.tar.gz"
  archivePath="$(realpath "$backupDir")/${archiveName}"

  cd "$sourceDir" || exit
  readarray -t files <<< "$(find . -type f -name "$pattern")"

  if [ "${#files[@]}" -eq 0 ]; then
    echo "No files matched pattern: $pattern"
    exit 1
  fi

  tar -czf "$archivePath" "${files[@]}"
  echo "Partial backup created at: $archivePath"

else
  echo "Invalid backup type: $backupType"
  echo "Usage: $0 [full|partial] <sourceDir> <backupDir> [pattern]"
  exit 1
fi