#!/bin/bash

# ChatGPT Terminal Interaction Script for Free Tier with History Logging

# Replace with your OpenAI API key
#https://platform.openai.com/api-keys

API_KEY="sk-proj-.....
API_URL="https://api.openai.com/v1/chat/completions"

# Default model for free-tier users
MODEL="gpt-3.5-turbo"

# History file
HISTORY_FILE="history.txt"

# Function to display help
function show_help() {
    echo "Usage: ./chat.sh [-h]"
    echo ""
    echo "Options:"
    echo "  -h         Display this help message"
}

# Parse command-line options
while getopts "h" opt; do
    case ${opt} in
        h)
            show_help
            exit 0
            ;;
        *)
            show_help
            exit 1
            ;;
    esac
done

# Main chat loop
echo "ChatGPT Terminal (Free Tier). Type 'exit' to quit."
while true; do
    echo -n "You: "
    read -r INPUT

    # Exit if user types 'exit'
    if [[ "$INPUT" == "exit" ]]; then
        echo "Goodbye!"
        break
    fi

    # Log user input to the history file
    echo "You: $INPUT" >> "$HISTORY_FILE"

    # Create the JSON payload
    PAYLOAD=$(jq -n \
        --arg model "$MODEL" \
        --arg content "$INPUT" \
        '{
            model: $model,
            messages: [
                {
                    role: "user",
                    content: $content
                }
            ]
        }')

    # Send the request and capture the response
    RESPONSE=$(curl -s -X POST "$API_URL" \
        -H "Authorization: Bearer $API_KEY" \
        -H "Content-Type: application/json" \
        -d "$PAYLOAD")

    # Extract and display the assistant's message
    MESSAGE=$(echo "$RESPONSE" | jq -r '.choices[0].message.content')
    if [[ "$MESSAGE" == "null" ]]; then
        echo "Error: Unable to retrieve a response. Check your API key and input."
        echo "ChatGPT: Error retrieving response" >> "$HISTORY_FILE"
    else
        echo -e "Bob: $MESSAGE\n"
        # Log AI response to the history file
        echo "Bob: $MESSAGE" >> "$HISTORY_FILE"
    fi
done
