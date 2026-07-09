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

    # This must run first.
    #
    # Fix <br> spacing at top or command/identifier/etc is
    # converted from markdown -> html correctly.
    sed -i -z 's|</H1>\n<br>\n<br>\n|</H1>\n\n|g' *.md

    # Sed out basic stuff not needed.
    sed -i \
        -e '/<html>/d' \
        -e '/<\/html>/d' \
        -e '/<body>/d' \
        -e '/<\/body>/d' \
        -e '/default.css/d' \
        -e 's|<p>||g' \
        -e 's|</p>||g' \
        -e 's|<H1>|# |g' \
        -e 's|</H1>||g' \
        -e 's|<H2>|## |g' \
        -e 's|</H2>||g' \
        -e 's|<H3>|### |g' \
        -e 's|</H3>||g' \
        -e 's|<H4>|#### |g' \
        -e 's|</H4>||g' \
        -e '/<title>/d' *.md

    sed -i '/mdBook remove/d' *.md

    # Images
    #sed -i -r 's|<img src="([^"]+)">|![\1](\1)|g' *.md

    # This tries to get most of them... sort of.
    # Replace "\n<br><b>" with "  \n<b>"
    sed -i -z -E 's/([^\n]*)\n(<br><b>)/\1  \n<b>/g' *.md

    sed -i -z 's|<b>\*</b>|**\\\***|g' *.md

    sed -i \
        -e 's|<b>|**|g' \
        -e 's|</b>|**|g' *.md

    # Convert code blocks to markdown.
    # The opening <pre...> and closing </pre> MUST be
    # on their own separate lines.
    sed -i 's|<pre class ="code">|```|g' *.md
    sed -i 's|<pre class = "code">|```|g' *.md
    sed -i 's|</pre>|```|g' *.md

    sed -i -z 's|injection.html).\n</center>\n\n<br>|injection.html).|g' *.md

    # Convert <a> links to Markdown
    sed -i -E 's|<a href="([^"]*)">([^<]*)</a>|[\2](\1)|g' *.md
    # Replace the &lt; and &gt; inside the code...
    sed -i '/^```/,/^```/ { s/&lt;/</g; s/&gt;/>/g; }' *.md
    # Remove these from the URLs.
    sed -z -i 's/\.html)<br>\n\[/\.html)  \n\[/g' *.md
    # Remove last line one.
    sed -z -i 's/\.html)<br>/\.html)  /g' *.md

    # $dqwindow
    sed -i -z 's|\n<br>\$|  \n$|g' *.md
    # $mouse
    sed -i -z 's|\n<br>\i|  \ni|g' *.md
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

# Convert html <table> to  markdown version
sed -i 's|<table style = "[^"]*">|<table>|g' \
   src/identifiers/asctime.md \
   src/other/hash_tables.md \
   src/commands/timestamp.md

sed -i -z 's|<table>||g' \
   src/other/com.md \
   src/other/hash_tables.md \
   src/other/operations.md \
   src/identifiers/asctime.md \
   src/identifiers/codepage.md \
   src/identifiers/com.md \
   src/other/hash_tables.md \
   src/identifiers/comcall.md \
   src/identifiers/input.md \
   src/commands/timestamp.md
sed -i -z 's|<tr>||g' \
   src/other/com.md \
   src/other/hash_tables.md \
   src/other/operations.md \
   src/identifiers/asctime.md \
   src/identifiers/codepage.md \
   src/identifiers/com.md \
   src/other/hash_tables.md \
   src/identifiers/comcall.md \
   src/identifiers/input.md \
   src/commands/timestamp.md
sed -i -z 's|</tr>||g' \
   src/other/com.md \
   src/other/hash_tables.md \
   src/other/operations.md \
   src/identifiers/asctime.md \
   src/identifiers/codepage.md \
   src/identifiers/com.md \
   src/other/hash_tables.md \
   src/identifiers/comcall.md \
   src/identifiers/input.md \
   src/commands/timestamp.md
sed -i -z 's|</th>\n<th>| \| |g' \
   src/other/com.md \
   src/other/hash_tables.md \
   src/other/operations.md \
   src/identifiers/asctime.md \
   src/identifiers/codepage.md \
   src/identifiers/com.md \
   src/other/hash_tables.md \
   src/identifiers/comcall.md \
   src/identifiers/input.md \
   src/commands/timestamp.md
sed -i -z 's|</td>\n<td>| \| |g' \
   src/other/com.md \
   src/other/hash_tables.md \
   src/other/operations.md \
   src/identifiers/asctime.md \
   src/identifiers/codepage.md \
   src/identifiers/com.md \
   src/other/hash_tables.md \
   src/identifiers/comcall.md \
   src/identifiers/input.md \
   src/commands/timestamp.md
sed -i -z 's|<th>|\| |g' \
   src/other/com.md \
   src/other/hash_tables.md \
   src/other/operations.md \
   src/identifiers/asctime.md \
   src/identifiers/codepage.md \
   src/identifiers/com.md \
   src/other/hash_tables.md \
   src/identifiers/comcall.md \
   src/identifiers/input.md \
   src/commands/timestamp.md
sed -i -z 's|</td>\n\n\n<td>| \|\n\| |g' \
   src/other/com.md \
   src/other/hash_tables.md \
   src/other/operations.md \
   src/identifiers/asctime.md \
   src/identifiers/codepage.md \
   src/identifiers/com.md \
   src/other/hash_tables.md \
   src/identifiers/comcall.md \
   src/identifiers/input.md \
   src/commands/timestamp.md
sed -i -z 's|</th>\n\n\n| \| |g' \
   src/other/com.md \
   src/other/hash_tables.md \
   src/other/operations.md \
   src/identifiers/asctime.md \
   src/identifiers/codepage.md \
   src/identifiers/com.md \
   src/other/hash_tables.md \
   src/identifiers/comcall.md \
   src/identifiers/input.md \
   src/commands/timestamp.md
sed -i -z 's| <td>|\n\| |g' \
   src/other/com.md \
   src/other/hash_tables.md \
   src/other/operations.md \
   src/identifiers/asctime.md \
   src/identifiers/codepage.md \
   src/identifiers/com.md \
   src/other/hash_tables.md \
   src/identifiers/comcall.md \
   src/identifiers/input.md \
   src/commands/timestamp.md
sed -i -z 's|</td>\n|\n|g' \
   src/other/com.md \
   src/other/hash_tables.md \
   src/other/operations.md \
   src/identifiers/asctime.md \
   src/identifiers/codepage.md \
   src/identifiers/com.md \
   src/other/hash_tables.md \
   src/identifiers/comcall.md \
   src/identifiers/input.md \
   src/commands/timestamp.md
sed -i -z 's|</th>\n\n<!-- | \|\n|g' \
   src/other/com.md \
   src/other/hash_tables.md \
   src/other/operations.md \
   src/identifiers/asctime.md \
   src/identifiers/codepage.md \
   src/identifiers/com.md \
   src/other/hash_tables.md \
   src/identifiers/comcall.md \
   src/identifiers/input.md \
   src/commands/timestamp.md
sed -i -z 's| -->\n\n<td>|\n\| |g' \
   src/other/com.md \
   src/other/hash_tables.md \
   src/other/operations.md \
   src/identifiers/asctime.md \
   src/identifiers/codepage.md \
   src/identifiers/com.md \
   src/other/hash_tables.md \
   src/identifiers/comcall.md \
   src/identifiers/input.md \
   src/commands/timestamp.md
sed -i -z 's|\n\n</table>| \|\n|g' \
   src/other/com.md \
   src/other/hash_tables.md \
   src/other/operations.md \
   src/identifiers/asctime.md \
   src/identifiers/codepage.md \
   src/identifiers/com.md \
   src/other/hash_tables.md \
   src/identifiers/comcall.md \
   src/identifiers/input.md \
   src/commands/timestamp.md

sed -i 's|&#233;|é|g' src/commands/quote.md

# The closing <b>/*</b> must be on the ...
sed -i 's|\*\*\*/\*\*|\*\*\\\*/\*\*|g' src/other/introduction.md

# $ulist() page
sed -i 's/\$ulist(\*!\*@Example\.com)\.info/\\$ulist(\\\*!\\\*@Example\.com)\.info/g' src/commands/iuser.md

# Escape "*!*" ...
sed -i 's|\*!\*|\\\*!\\\*|g' \
   src/identifiers/wildsite.md \
   src/other/local_identifiers.md



# EOF