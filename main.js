// --- main.js (minimal code for iframe embed) ---

// In this new architecture, all interaction logic (keyboard presses,
// showing/hiding screens, animations) must be handled directly
// within the Spline editor itself.

// The only purpose of this JavaScript file now is to act as a placeholder.
// No Spline API calls or event listeners are needed from the main page,
// as the iframe encapsulates the Spline viewer completely.

window.addEventListener('resize', () => {
    console.log(`Window resized to: ${window.innerWidth} x ${window.innerHeight}`);
});
