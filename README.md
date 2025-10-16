# Wall of Entropy — GPU WebGL pack

This is a small GPU-powered WebGL shader version of the "wall of entropy" (lava-lamp wall). It runs in the browser (no build step), using p5.js to create a WebGL canvas and a GLSL fragment shader for the gooey blobs.

Files:
- index.html — entry page (contains shader sources and loads sketch.js)
- sketch.js — p5 sketch that sets up the shader and passes uniforms
- make_zip.ps1 — PowerShell script to make gpu_wall.zip on Windows
- make_zip.sh — bash script to make gpu_wall.zip on macOS/Linux

How to run locally:
1. Save all files in the same folder.
2. Open index.html in a modern browser (Chrome, Edge, Firefox). For best performance use Chrome/Edge.
   - Optionally serve with a simple static server (recommended for consistent behavior):
     - Python 3: python -m http.server 8000
     - Then visit http://localhost:8000/index.html
3. Keyboard:
   - Space: pause / resume
   - ?: toggle controls

Loop duration:
- Default loop duration is 12 seconds. To override, add ?loop=20.0 (seconds) to the URL:
  index.html?loop=20