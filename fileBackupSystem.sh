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

backupType=$1
sourceDir=$2
backupDir=$3
pattern=$4

timestamp=$(date +"%Y%m%d_%H%M%S")
archiveName=""
archivePath=""

if [ "$backupType" == "full" ]; then
  mkdir -p "$backupDir"
  archiveName="backup_full_${timestamp}.tar.gz"
  archivePath="${backupDir}/${archiveName}"
  tar -czf "$archivePath" -C "$sourceDir" .
  echo "Full backup created at: $archivePath"

elif [ "$backupType" == "partial" ]; then
  if [ -z "$pattern" ]; then
    echo "Pattern required for partial backup."
    exit 1
  fi

  mkdir -p "$backupDir"
  archiveName="backup_partial_${timestamp}.tar.gz"
  archivePath="${backupDir}/${archiveName}"

  cd "$sourceDir" || exit
  matchingFiles=$(find . -type f -name "$pattern")

  if [ -z "$matchingFiles" ]; then
    echo "No files matched pattern: $pattern"
    exit 1
  fi

  tar -czf "$archivePath" $matchingFiles
  echo "Partial backup created at: $archivePath"

else
  echo "Usage: $0 [full|partial] <sourceDir> <backupDir> [pattern]"
  exit 1
fi
