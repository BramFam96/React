echo "Initializing babel JSX compiler"
node_modules/@babel/cli/bin/babel.js --presets @babel/react index.jsx>index.js
echo "JS Successfully Compiled"
echo "Initializing http connection"
python3 -m http.server