#!/bin/bash
NB_ID="38ebefe3-5695-47ea-8734-c44367fa4508"

echo "Adding source to notebook..."
SRC_OUT=$(notebooklm source add ./Architecture/DDD/DDD.md --json -n $NB_ID)
SRC_ID=$(echo $SRC_OUT | grep -o '"source_id": *"[^"]*"' | cut -d'"' -f4)

echo "Waiting for source to be processed..."
notebooklm source wait $SRC_ID -n $NB_ID --timeout 600

echo "Starting infographic generation..."
INFO_OUT=$(notebooklm generate infographic --orientation square --style professional --json -n $NB_ID)
INFO_ID=$(echo $INFO_OUT | grep -o '"task_id": *"[^"]*"' | cut -d'"' -f4)

echo "Starting video generation..."
VID_OUT=$(notebooklm generate video "Summarize Domain-Driven Design concepts: Ubiquitous Language, Aggregates, and Bounded Contexts" --json -n $NB_ID)
VID_ID=$(echo $VID_OUT | grep -o '"task_id": *"[^"]*"' | cut -d'"' -f4)

echo "Waiting for infographic ($INFO_ID)..."
notebooklm artifact wait $INFO_ID -n $NB_ID --timeout 1200
notebooklm download infographic ./posts/2026-04-18/ddd-summary/ddd-infographic.png -a $INFO_ID -n $NB_ID

echo "Copying infographic to other posts..."
cp ./posts/2026-04-18/ddd-summary/ddd-infographic.png ./posts/2026-04-18/ubiquitous-language/
cp ./posts/2026-04-18/ddd-summary/ddd-infographic.png ./posts/2026-04-18/aggregate/
cp ./posts/2026-04-18/ddd-summary/ddd-infographic.png ./posts/2026-04-18/bounded-context/

echo "Waiting for video ($VID_ID)..."
notebooklm artifact wait $VID_ID -n $NB_ID --timeout 2700
notebooklm download video ./posts/2026-04-18/ddd-summary/ddd-video.mp4 -a $VID_ID -n $NB_ID

echo "Done!"
