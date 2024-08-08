#!/bin/bash

# Set start date in YYYY-MM-DD format
start_date="2024-08-08"

# Set the end date as today
end_date=$(date +"%Y-%m-%d")

# Generate a range of dates from the start date to the end date
current_date="$start_date"

# Loop through each date in the range
while [ "$current_date" != "$end_date" ]; do
  # Generate a random time for the commit (HH:MM:SS format)
  random_time=$(printf "%02d:%02d:%02d\n" $((RANDOM % 24)) $((RANDOM % 60)) $((RANDOM % 60)))

  # Create a dummy file with a unique name for each day
  dummy_file="dummy_file_$current_date.txt"
  echo "Commit made on $current_date at $random_time" > "dummy/$dummy_file"

  # Stage and commit the dummy file
  export GIT_COMMITTER_DATE="$current_date $random_time"
  git add .
  git commit -m "Automated commit on $current_date at $random_time" --date "$current_date $random_time"

  # Move to the next day
  current_date=$(date -I -d "$current_date + 1 day")
done

# Push changes to GitHub
git push origin master  # Replace 'main' with the appropriate branch name
