#!/bin/bash

# Create a directory for testing if it doesn't exist
mkdir -p file-organizer-test
cd file-organizer-test || exit

echo "Downloading test files..."

# The following commands will download various test files to the current directory
# === Images ===
wget -O cat.jpg https://filesamples.com/samples/image/jpeg/sample_640%C3%97426.jpeg
wget -O beach.png https://file-examples.com/storage/fe9e5a4c3bc93d1338356cb/2017/10/file_example_PNG_500kB.png
wget -O art.gif https://file-examples.com/storage/fe9e5a4c3bc93d1338356cb/2017/10/file_example_GIF_500kB.gif

# === Documents ===
wget -O resume.pdf https://filesamples.com/samples/document/pdf/sample1.pdf
wget -O report.doc https://filesamples.com/samples/document/doc/sample1.doc
wget -O notes.txt https://filesamples.com/samples/document/txt/sample1.txt

# === Music ===
wget -O song.mp3 https://filesamples.com/samples/audio/mp3/sample1.mp3
wget -O audio.wav https://filesamples.com/samples/audio/wav/sample1.wav
wget -O voice.flac https://filesamples.com/samples/audio/flac/sample1.flac

# === Videos ===
wget -O movie.mp4 https://filesamples.com/samples/video/mp4/sample_640x360.mp4
wget -O clip.avi https://filesamples.com/samples/video/avi/sample1.avi
wget -O trailer.mkv https://filesamples.com/samples/video/mkv/sample1.mkv

# === Archives ===
wget -O backup.zip https://filesamples.com/samples/archive/zip/sample1.zip
wget -O data.tar.gz https://file-examples.com/storage/fe9e5a4c3bc93d1338356cb/2017/02/file_example_TGZ_1mb.tgz
wget -O files.rar https://file-examples.com/storage/fe9e5a4c3bc93d1338356cb/2017/02/file_example_RAR_1mb.rar

# === Programs ===
wget -O firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US"
wget -O tool.deb https://packages.ubuntu.com/focal/amd64/bash/download
wget -O installer.pkg https://support.apple.com/library/content/dam/edam/applecare/images/en_US/macos/macos-big-sur-icon.pkg

# === Other ===
touch config.ini
touch unknownfile.xyz
touch readme.md

echo "Download complete. All test files are in $(pwd)"
