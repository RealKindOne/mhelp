#!/bin/bash

# The entire help documentation is currently formatted for a CHM help file.

# This script converts various parts of the HTML files into markdown.

# This can be improves, but it is 'good enough' for now.

# Copy all source files and images
cp ../identifiers/*.html src/identifiers/
cp ../commands/*.html src/commands/
cp ../events/*.html src/events/
cp ../other/*.html src/other/
cp ../images/* src/images/
cp ../dialog/*.html src/dialog/
cp ../sockets/*.html src/sockets/
cp ../commands.html src/other/
cp ../identifiers.html src/other/
cp ../events.html src/other/

# Function to process one directory
process_dir() {
    local dir="$1"
    cd "src/$dir" || exit 1

    # Rename .html to .md
    for file in *.html; do
        mv "$file" "${file%.html}.md"
    done

    # Fix <br> spacing at top or command/identifier/etc is
    # converted from markdown -> html correctly.
    sed -i -z 's|</H1>\n<br>\n<br>\n|</H1>\n\n|g' *.md

    # This tries to get most of them... sort of.
    # Replace "\n<br><b>" with "  \n<b>"
    sed -i -z -E 's/([^\n]*)\n(<br><b>)/\1  \n<b>/g' *.md

    # Fix warning.
    sed -i -z 's|<br>\n<center>|<br>\n\n<center>|g' *.md

    # Convert code blocks to markdown.
    # The opening <pre...> and closing </pre> MUST be
    # on their own separate lines.
    sed -i 's|<pre class ="code">|```|g' *.md
    sed -i 's|<pre class = "code">|```|g' *.md
    sed -i 's|</pre>|```|g' *.md

    # Bold, headers, and HTML tags removal
    sed -i \
        -e 's|<b>\*</b>|**\\\***|g' \
        -e 's|<b>|**|g' \
        -e 's|</b>|**|g' \
        -e 's|<H1>|# |g' \
        -e 's|</H1>||g' \
        -e 's|<H4>|#### |g' \
        -e 's|</H4>||g' \
        -e '/default.css/d' \
        -e '/<title>/d' \
        -e '/<html>/d' \
        -e '/<\/html>/d' \
        -e '/<body>/d' \
        -e '/<\/body>/d' \
        -e '/<head>/d' \
        -e '/<\/head>/d' \
        -e 's|<p>||g' \
        -e 's|</p>||g' \
        -e '/warning.png/d' \
        *.md

    # Convert <a> links to Markdown
    sed -i -E 's|<a href="([^"]*)">([^<]*)</a>|[\2](\1)|g' *.md
    # Replace the &lt; and &gt; inside the code...
    sed -i '/^```/,/^```/ { s/&lt;/</g; s/&gt;/>/g; }' *.md
    # Remove these...
    sed -z -i 's/\.html)<br>\n\[/\.html)  \n\[/g' *.md
    # Remove last line one.
    sed -z -i 's/\.html)<br>/\.html)  /g' *.md

    sed -z -i 's|<br>||g' *.md
    cd ../..
}

# Process all directories
process_dir "commands"
process_dir "identifiers"
process_dir "events"
process_dir "other"
process_dir "dialog"
process_dir "sockets"

mv src/other/commands.md src/
mv src/other/identifiers.md src/
mv src/other/events.md src/