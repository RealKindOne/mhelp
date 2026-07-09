# mhelp

This unofficial help file is intended to document all parts of mIRC Scripting in a more detailed manner than the official help file.

This file only includes current or previously documented features. It must exist in the versions.txt OR a current/previous version of mirc.chm or mirc.hlp. If a feature is depreciated or removed it will be noted.

Undocumented commands, identifiers, switches, properties, onEVENT, and others things will NOT be included as they can possibly be removed at anytime.

<b>NOTE:</b> THIS HELP FILE IS NOT COMPLETE AND HAS BROKEN OR MISSING PARTS DUE TO THE IMPORTING.

<b>NOTE:</b> If you see something different between theses files and the official mirc.chm, you should treat the mirc.chm as the correct version. Please report any differences here on GitHub or on IRC.

<b>NOTE:</b> Check here for newer versions: https://github.com/RealKindOne/mhelp/tags

## Compiling (chm)

You will need to download the .chm help file compiler:

https://web.archive.org/web/20160423015142/http://download.microsoft.com/download/0/a/9/0a939ef6-e31c-430f-a3df-dfae7960d564/htmlhelp.exe

MD5: 53899BE5DA83419D772D5B97E653DA7C

Install it.

Open the "mhelp.hhp" file and click File -> Compile (or click the icon left of the sunglasses).

You can click the sunglasses icon to view the "mhelp.chm" file.

OR...

Run ```"C:\Program Files (x86)\HTML Help Workshop\hhc.exe" C:\path\to\mhelp.hhp``` in the command prompt.


## Compiling (mdBook)

mdBook - https://rust-lang.github.io/mdBook/ Is used to compile a browser version. This gives a much better user experience.

This is a WORK IN PROGRESS!

The html files are designed specifically for the CHM help file. They require extensive modification.

The ```compile.sh``` file copies the existing html files into a different folder and converts various parts of the html code into markdown.

You will need to re-run the ```compile.sh``` for each time you change a html file.

```
cd mdbook
chmod 777 compile.sh
./compile.sh
mdbook build
```


## Editing

The HTML Help Workshop program is very primitive and buggy. You would be better off using a different text editor.

The HTML 'pre' code for scripting examples must be on different lines.

Having html code and mIRC scripting code on the same line will cause serious formatting issues for mdBook.

```
<!-- The line below must be the only thing on that line! -->
<pre class = "code">
alias example {
  echo -a example
}
</pre>
<!-- The line above must be the only thing on that line! -->
```


## Adding new commands, identifiers or other stuff

You need to add the file into: index.hhk, mhelp.hhp.

Command: commands.html

Identifiers: identifiers.html

Events: events.html

Some identifiers like $highlight can be used with and without parentheses. They get separate pages. The one with the parentheses gets a trailing '_'.

$highlight   = highlight.html
$highlight() = highlight_.html

## Downloading

Check here for updates: https://github.com/RealKindOne/mhelp/tags

If you do not want to run the help file you can download the source code and open the .html files.
List of commands and identifiers can be found in ```commands.html``` and ```identifiers.html``` or you can search for the command/identifier filename.


## Contact

irc.libera.chat ##mirc

irc.swiftirc.net #msl / #mircscripting

irc.efnet.net #mirc


## NOTE:

Windows has a security feature that prevents running non-installed (downloaded) .chm files. You will need to Unblock the file by Right clicking the .chm file, click Properties, Unblock, Ok.

https://www.helpsmith.com/chm-cannot-be-displayed.php

