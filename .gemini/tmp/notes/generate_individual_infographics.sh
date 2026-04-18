#!/bin/bash
NB_ID="38ebefe3-5695-47ea-8734-c44367fa4508"

# 1. Ubiquitous Language Infographic
echo "Starting Ubiquitous Language infographic generation..."
UL_OUT=$(notebooklm generate infographic --orientation square --style professional --append "Focus exclusively on Ubiquitous Language: shared vocabulary between business and tech, eliminating translation, and matching code to domain terms." --json -n $NB_ID)
UL_ID=$(echo $UL_OUT | grep -o '"task_id": *"[^"]*"' | cut -d'"' -f4)

# 2. Aggregate Infographic
echo "Starting Aggregate infographic generation..."
AGG_OUT=$(notebooklm generate infographic --orientation square --style professional --append "Focus exclusively on Aggregates: bundles of data and behavior, state machine lifecycles, and the 'power of no' for data integrity." --json -n $NB_ID)
AGG_ID=$(echo $AGG_OUT | grep -o '"task_id": *"[^"]*"' | cut -d'"' -f4)

# 3. Bounded Context Infographic
echo "Starting Bounded Context infographic generation..."
BC_OUT=$(notebooklm generate infographic --orientation square --style professional --append "Focus exclusively on Bounded Contexts: defining domain boundaries, example of 'Stock' in Warehouse vs Finance, and eliminating 'God Objects'." --json -n $NB_ID)
BC_ID=$(echo $BC_OUT | grep -o '"task_id": *"[^"]*"' | cut -d'"' -f4)

# Wait and Download
echo "Waiting for Ubiquitous Language infographic ($UL_ID)..."
notebooklm artifact wait $UL_ID -n $NB_ID --timeout 1200
notebooklm download infographic ./posts/2026-04-18/ubiquitous-language/ul-infographic.png -a $UL_ID -n $NB_ID

echo "Waiting for Aggregate infographic ($AGG_ID)..."
notebooklm artifact wait $AGG_ID -n $NB_ID --timeout 1200
notebooklm download infographic ./posts/2026-04-18/aggregate/aggregate-infographic.png -a $AGG_ID -n $NB_ID

echo "Waiting for Bounded Context infographic ($BC_ID)..."
notebooklm artifact wait $BC_ID -n $NB_ID --timeout 1200
notebooklm download infographic ./posts/2026-04-18/bounded-context/bc-infographic.png -a $BC_ID -n $NB_ID

echo "Individual infographics generated and downloaded."
