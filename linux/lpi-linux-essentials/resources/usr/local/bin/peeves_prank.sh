#!/bin/bash
# ==============================================================================
# WARNING: UNAUTHORIZED SYSTEM PRANK DAEMON
# SOURCE: PEEVES THE POLTERGEIST
# TARGET: CASTLE MEMORY ARRAYS & CPU CORES
# ==============================================================================

# Ensure the script identifies its running instance easily for tracking labs
PID=$$
echo "[HOGWARTS SECURITY NOTICE] Rogue process initiated by PEEVES under PID: $PID"

# Check if running in simulated forkbomb or high-utilization mode
if [[ "$1" == "--forkbomb-mode" ]]; then
    while true; do
        # Emulate a high-CPU calculation sequence to show up in 'top'
        # This creates a safe math loop that eats cycles without actually crashing the kernel
        : $((13**37 % 42))
        
        # Brief sleep period to prevent hard lockups on student instances 
        # while keeping CPU usage metrics artificially high
        sleep 0.001
    done
else
    # Default fallback: Sleep continuously in the background to practice simple process tracking
    while true; do
        sleep 3600
    done
fi