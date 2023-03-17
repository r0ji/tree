#!/bin/bash

# Default values
DIRECTORY_PATH="."
OUTPUT_FILE="tree.txt"
INCLUDE_FILES=false
MAX_DEPTH=""

print_help() {
    echo "Usage: $0 [OPTIONS]"
    echo "Generate a directory structure in a readable format."
    echo
    echo "Options:"
    echo "  -i, --input    Directory path to analyze (default: current directory)"
    echo "  -o, --output   Output file for the directory structure (default: tree.txt)"
    echo "  -f, --files    Include files in the directory structure (default: only directories)"
    echo "  -d, --depth    Maximum depth for the directory structure (default: full depth)"
    echo "  -h, --help     Display this help message"
    echo
    echo "Examples:"
    echo "  $0 -i /path/to/directory -o output.txt"
    echo "  $0 -i /path/to/directory -o output.txt -f -d 3"
}

# Parsing command-line options
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -i|--input)
            DIRECTORY_PATH="$2"
            shift 2
            ;;
        -o|--output)
            OUTPUT_FILE="$2"
            shift 2
            ;;
        -f|--files)
            INCLUDE_FILES=true
            shift
            ;;
        -d|--depth)
            MAX_DEPTH="-maxdepth $2"
            shift 2
            ;;
        -h|--help)
            print_help
            exit 0
            ;;
        *)
            echo "Unknown parameter passed: $1"
            exit 1
            ;;
    esac
done

if [ ! -d "$DIRECTORY_PATH" ]; then
    echo "Error: Directory not found"
    exit 1
fi

echo "Outputting directory structure for $DIRECTORY_PATH to $OUTPUT_FILE"

if $INCLUDE_FILES; then
    find "$DIRECTORY_PATH" $MAX_DEPTH -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g' > "$OUTPUT_FILE"
else
    find "$DIRECTORY_PATH" $MAX_DEPTH -type d -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g' > "$OUTPUT_FILE"
fi

echo "Done!"