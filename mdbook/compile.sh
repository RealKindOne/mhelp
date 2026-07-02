# TODO - Improve this...

cp ../identifiers/*.html src/identifiers/
cp ../commands/*.html src/commands/
cp ../events/*.html src/events/
cp ../other/*.html src/other/

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


cd ..
cd ..