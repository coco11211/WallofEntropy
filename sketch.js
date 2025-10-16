// sketch.js — p5 + shader loader
let theShader;
let loopDuration = 12.0; // seconds (changeable)
let paused = false;

function preload() {
  // grab shader source from DOM
  const vert = document.getElementById('vert').textContent;
  const frag = document.getElementById('frag').textContent;
  theShader = new p5.Shader(this._renderer, vert, frag);
}

function setup() {
  const canvas = createCanvas(windowWidth, windowHeight, WEBGL);
  noStroke();
  pixelDensity(window.devicePixelRatio || 1);

  // get loop duration from query param if provided
  const url = new URL(window.location.href);
  const q = url.searchParams.get('loop');
  if (q) {
    const v = parseFloat(q);
    if (!isNaN(v) && v > 0.1) {
      loopDuration = v;
    }
  }
  document.getElementById('loopVal').textContent = loopDuration.toFixed(1);

  shader(theShader);
}

function draw() {
  if (!paused) {
    // set uniforms
    theShader.setUniform('u_time', millis() / 1000.0);
  }
  theShader.setUniform('u_loop', loopDuration);
  theShader.setUniform('u_resolution', [width, height]);
  theShader.setUniform('u_pixel_ratio', window.devicePixelRatio || 1.0);

  rect(-width/2, -height/2, width, height);
}

function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}

// simple keyboard controls
function keyPressed() {
  if (key === ' ') {
    paused = !paused;
  } else if (key === '?') {
    const c = document.getElementById('controls');
    c.style.display = (c.style.display === 'none') ? 'block' : 'none';
  }
}
