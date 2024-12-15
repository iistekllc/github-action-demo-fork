#!/bin/bash

# This script counts the number of words in each markdown file in the repository
# and outputs the results to the GitHub Actions step summary.

# Get all markdown files in the repository, including subdirectories
markdown_files=$(find . -type f -name "*.md")

# Check if any markdown files exist
if [ -z "$markdown_files" ]; then
  echo "No markdown files found in this repository."
  exit 0
fi

# Iterate over each markdown file and count the words
for file in $markdown_files; do
  if [ -f "$file" ]; then
    word_count=$(wc -w < "$file")
    echo "File: $file - Word Count: $word_count"
    echo "$file - $word_count words" >> $GITHUB_STEP_SUMMARY
  fi
done
