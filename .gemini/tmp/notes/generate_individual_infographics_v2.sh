#!/bin/bash
NB_ID="38ebefe3-5695-47ea-8734-c44367fa4508"

# Helper function to extract task_id from JSON output
get_task_id() {
  local json="$1"
  echo "$json" | python3 -c "import sys, json; print(json.load(sys.stdin).get('task_id', ''))"
}

# 1. Ubiquitous Language Infographic
echo "Starting Ubiquitous Language infographic generation..."
UL_OUT=$(notebooklm generate infographic "Focus exclusively on Ubiquitous Language: shared vocabulary between business and tech, eliminating translation, and matching code to domain terms." --orientation square --style professional --json -n $NB_ID)
UL_ID=$(get_task_id "$UL_OUT")

# 2. Aggregate Infographic
echo "Starting Aggregate infographic generation..."
AGG_OUT=$(notebooklm generate infographic "Focus exclusively on Aggregates: bundles of data and behavior, state machine lifecycles, and the 'power of no' for data integrity." --orientation square --style professional --json -n $NB_ID)
AGG_ID=$(get_task_id "$AGG_OUT")

# 3. Bounded Context Infographic
echo "Starting Bounded Context infographic generation..."
BC_OUT=$(notebooklm generate infographic "Focus exclusively on Bounded Contexts: defining domain boundaries, example of 'Stock' in Warehouse vs Finance, and eliminating 'God Objects'." --orientation square --style professional --json -n $NB_ID)
BC_ID=$(get_task_id "$BC_OUT")

echo "Task IDs: UL=$UL_ID, AGG=$AGG_ID, BC=$BC_ID"

# Wait and Download
if [ -n "$UL_ID" ]; then
  echo "Waiting for Ubiquitous Language infographic ($UL_ID)..."
  notebooklm artifact wait $UL_ID -n $NB_ID --timeout 1200
  notebooklm download infographic ./posts/2026-04-18/ubiquitous-language/ul-infographic.png -a $UL_ID -n $NB_ID
fi

if [ -n "$AGG_ID" ]; then
  echo "Waiting for Aggregate infographic ($AGG_ID)..."
  notebooklm artifact wait $AGG_ID -n $NB_ID --timeout 1200
  notebooklm download infographic ./posts/2026-04-18/aggregate/aggregate-infographic.png -a $AGG_ID -n $NB_ID
fi

if [ -n "$BC_ID" ]; then
  echo "Waiting for Bounded Context infographic ($BC_ID)..."
  notebooklm artifact wait $BC_ID -n $NB_ID --timeout 1200
  notebooklm download infographic ./posts/2026-04-18/bounded-context/bc-infographic.png -a $BC_ID -n $NB_ID
fi

echo "Individual infographics generated and downloaded."
