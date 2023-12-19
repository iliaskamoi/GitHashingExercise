#!/bin/bash
hash_input() {
    local input=$1

    # Validate that the input is a 4-digit integer
    #if ! [[ $input =~ ^[0-9]{4}$ ]]; then
      #  echo "Error: Please provide a valid 4-digit integer."
     #   exit 1
    #fi

    # Hash the input using SHA-256
    local hashed_output=$(echo -n "$input" | sha256sum | cut -d' ' -f1)

    # Output the hashed result
    echo "Hashed output for $input: $hashed_output"

    # Save the hashed output to a file
    echo "$hashed_output" >> hash_output.txt
}

# Check if an argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <4-digit integer>"
    exit 1
fi

# Call the function with the provided input
hash_input "$1"

