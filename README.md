# Project: Interactive Spline Keyboard Portfolio

A minimalist, single-page portfolio website designed to showcase projects and information for Seraphin.

The core feature is an interactive 3D keyboard scene, created in Spline, which serves as the primary user interface. The website is built with vanilla HTML5, CSS3, and modern JavaScript, intentionally avoiding heavy frameworks to ensure maximum performance and a minimal footprint.

**Final Architecture:**
*   The Spline scene is loaded using an `<iframe>` for the most reliable performance and loading, as provided by Spline's public URL export.
*   All navigation and interaction logic (e.g., responding to physical key presses to show/hide on-screen content) is managed **entirely within the Spline editor** using its native Events system.
*   The website code acts as a simple, clean container for the fully interactive Spline application.
*   The project is deployed and hosted on GitHub Pages.
