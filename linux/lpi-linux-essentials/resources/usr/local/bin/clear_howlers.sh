#!/bin/bash
# ==============================================================================
# HOGWARTS IT AUTOMATION: HOWLER ISOLATION & BUFFER FLUSH
# ==============================================================================
# This script runs via cron to prevent structural acoustic damage caused by 
# un-opened explosive correspondence (Howlers).

BUFFER_DIR="/var/spool/howlers"
LOG_FILE="/var/log/howler_cleanup.log"

echo "[$(date '+%Y-%m-%dT%H:%M:%S')] Starting automated Howler buffer flushing sequence..." >> $LOG_FILE

if [ -d "$BUFFER_DIR" ]; then
    COUNT=$(ls -1 $BUFFER_DIR | wc -l)
    if [ "$COUNT" -gt 0 ]; then
        # Safely neutralize letters before deletion
        rm -rf $BUFFER_DIR/*
        echo "[$(date '+%Y-%m-%dT%H:%M:%S')] Neutralized and deleted $COUNT pending howler packet(s)." >> $LOG_FILE
    else
        echo "[$(date '+%Y-%m-%dT%H:%M:%S')] Buffer clean. No volatile letters found." >> $LOG_FILE
    fi
else
    echo "[$(date '+%Y-%m-%dT%H:%M:%S')] ERROR: Howler buffer directory missing. Re-instantiating path structure..." >> $LOG_FILE
    mkdir -p $BUFFER_DIR
    chmod 777 $BUFFER_DIR
fi

echo "[$(date '+%Y-%m-%dT%H:%M:%S')] Sequencing complete." >> $LOG_FILE