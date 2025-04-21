#!/bin/bash

# Set this to your working directory
BASE_PATH=~/projects/my-big-repo/modules
BRANCH="main"

cd "$BASE_PATH" || { echo "Directory not found: $BASE_PATH"; exit 1; }

for letter in {a..z}; do
    echo "=== 🔤 Processing folders starting with '$letter' ==="

    folders=$(find . -maxdepth 1 -type d -name "${letter}*" ! -name ".git" | sort)
    changes_made=false

    for folder in $folders; do
        # Check if the folder has changes
        if git status --short "$folder" | grep . >/dev/null; then
            echo "🟢 Adding $folder"
            git add "$folder"
            changes_made=true
        else
            echo "⚪️ No changes in $folder, skipping..."
        fi
    done

    if [ "$changes_made" = true ]; then
        commit_msg="Add/Update folders starting with '$letter'"
        echo "✅ Committing and pushing..."
        git commit -m "$commit_msg"
        git push origin "$BRANCH"
    else
        echo "⏭ Nothing to commit for '$letter'"
    fi

    echo
done
