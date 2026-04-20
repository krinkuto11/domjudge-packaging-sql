#!/bin/bash

set -euo pipefail

# Build the base chroot
/opt/domjudge/judgehost/bin/dj_make_chroot

# --- ADDED FOR SQL CHALLENGES ---
echo "[..] Installing SQLite3 into the chroot"
chroot /chroot apt-get update
chroot /chroot apt-get install -y sqlite3
# --------------------------------

cd /
echo "[..] Compressing chroot"
tar -czpf /chroot.tar.gz --exclude=/chroot/tmp --exclude=/chroot/proc --exclude=/chroot/sys --exclude=/chroot/mnt --exclude=/chroot/media --exclude=/chroot/dev --one-file-system /chroot
echo "[..] Compressing judge"
tar -czpf /judgehost.tar.gz /opt/domjudge/judgehost
