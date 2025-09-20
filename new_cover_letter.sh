#!/bin/bash

# Cover Letter Generator Script
# Usage: ./new_cover_letter.sh <company_name> <language>
# Language: en or pl

if [ $# -ne 2 ]; then
    echo "Usage: $0 <company_name> <language>"
    echo "Language: en or pl"
    echo "Example: $0 google en"
    exit 1
fi

COMPANY_NAME="$1"
LANGUAGE="$2"

# Create directory name (lowercase, replace spaces with underscores)
DIR_NAME="applications/cover_$(echo "$COMPANY_NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '_')"

if [ -d "$DIR_NAME" ]; then
    echo "Directory $DIR_NAME already exists!"
    exit 1
fi

# Create new directory
mkdir "$DIR_NAME"

# Copy necessary files
cp "coverletter/cover_${LANGUAGE}.cls" "$DIR_NAME/"
cp "coverletter/template_${LANGUAGE}.tex" "$DIR_NAME/cover_letter_$COMPANY_NAME.tex"
cp "coverletter/signature.png" "$DIR_NAME/"
cp -r "coverletter/OpenFonts" "$DIR_NAME/"

echo "Cover letter template created in: $DIR_NAME"
echo "Edit $DIR_NAME/cover_letter_$COMPANY_NAME.tex to customize for $COMPANY_NAME"
echo "Compile with: cd $DIR_NAME && lualatex cover_letter_$COMPANY_NAME.tex"