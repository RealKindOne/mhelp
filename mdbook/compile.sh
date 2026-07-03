# TODO - Improve this...

cp ../identifiers/*.html src/identifiers/
cp ../commands/*.html src/commands/
cp ../events/*.html src/events/
cp ../other/*.html src/other/
cp ../images/* src/images/
cp ../dialog/* src/dialog/
cp ../sockets/* src/sockets/
cd src/commands

for file in *.html; do   mv "$file" "${file%.html}.md"; done

sed -i 's|<pre class ="code">|<pre><code class="code">|g' *.md
sed -i 's|<pre class = "code">|<pre><code class="code">|g' *.md
sed -i 's|</pre>|</code></pre>|g' *.md
sed -i '/default.css/d' *.md
sed -i 's|<html>||g' *.md
sed -i 's|</html>||g' *.md
sed -i 's|<body>||g' *.md
sed -i 's|</body>||g' *.md
sed -i 's|<head>||g' *.md
sed -i 's|</head>||g' *.md
sed -i 's|<p>||g' *.md
sed -i 's|</p>||g' *.md
sed -i 's|<P>||g' *.md
# hload
sed -i 's|\&copy|\&amp;copy|'g hload.md

cd ..

cd identifiers

for file in *.html; do   mv "$file" "${file%.html}.md"; done

sed -i 's|<pre class ="code">|<pre><code class="code">|g' *.md
sed -i 's|<pre class = "code">|<pre><code class="code">|g' *.md
sed -i 's|</pre>|</code></pre>|g' *.md
sed -i '/default.css/d' *.md
sed -i 's|<html>||g' *.md
sed -i 's|</html>||g' *.md
sed -i 's|<body>||g' *.md
sed -i 's|</body>||g' *.md
sed -i 's|<head>||g' *.md
sed -i 's|</head>||g' *.md
sed -i 's|<p>||g' *.md
sed -i 's|</p>||g' *.md
sed -i 's|<P>||g' *.md

cd ..

cd events

for file in *.html; do   mv "$file" "${file%.html}.md"; done

sed -i 's|<pre class ="code">|<pre><code class="code">|g' *.md
sed -i 's|<pre class = "code">|<pre><code class="code">|g' *.md
sed -i 's|</pre>|</code></pre>|g' *.md
sed -i '/default.css/d' *.md
sed -i 's|<html>||g' *.md
sed -i 's|</html>||g' *.md
sed -i 's|<body>||g' *.md
sed -i 's|</body>||g' *.md
sed -i 's|<head>||g' *.md
sed -i 's|</head>||g' *.md
sed -i 's|<p>||g' *.md
sed -i 's|</p>||g' *.md
sed -i 's|<P>||g' *.md

cd ..

cd other

for file in *.html; do   mv "$file" "${file%.html}.md"; done

sed -i 's|<pre class ="code">|<pre><code class="code">|g' *.md
sed -i 's|<pre class = "code">|<pre><code class="code">|g' *.md
sed -i 's|</pre>|</code></pre>|g' *.md
sed -i '/default.css/d' *.md
sed -i 's|<html>||g' *.md
sed -i 's|</html>||g' *.md
sed -i 's|<body>||g' *.md
sed -i 's|</body>||g' *.md
sed -i 's|<head>||g' *.md
sed -i 's|</head>||g' *.md
sed -i 's|<p>||g' *.md
sed -i 's|</p>||g' *.md
sed -i 's|<P>||g' *.md

# Fix warning...
sed -i 's|<pre><code class="code">|```c|g' sendmessage.md
sed -i 's|</code></pre>|```|g' sendmessage.md

cd ..
cd sockets

for file in *.html; do   mv "$file" "${file%.html}.md"; done

sed -i 's|<pre class ="code">|<pre><code class="code">|g' *.md
sed -i 's|<pre class = "code">|<pre><code class="code">|g' *.md
sed -i 's|</pre>|</code></pre>|g' *.md
sed -i '/default.css/d' *.md
sed -i 's|<html>||g' *.md
sed -i 's|</html>||g' *.md
sed -i 's|<body>||g' *.md
sed -i 's|</body>||g' *.md
sed -i 's|<head>||g' *.md
sed -i 's|</head>||g' *.md
sed -i 's|<p>||g' *.md
sed -i 's|</p>||g' *.md
sed -i 's|<P>||g' *.md
cd ..


cd dialog

for file in *.html; do   mv "$file" "${file%.html}.md"; done

sed -i 's|<pre class ="code">|<pre><code class="code">|g' *.md
sed -i 's|<pre class = "code">|<pre><code class="code">|g' *.md
sed -i 's|</pre>|</code></pre>|g' *.md
sed -i '/default.css/d' *.md
sed -i 's|<html>||g' *.md
sed -i 's|</html>||g' *.md
sed -i 's|<body>||g' *.md
sed -i 's|</body>||g' *.md
sed -i 's|<head>||g' *.md
sed -i 's|</head>||g' *.md
sed -i 's|<p>||g' *.md
sed -i 's|</p>||g' *.md
sed -i 's|<P>||g' *.md
cd ..