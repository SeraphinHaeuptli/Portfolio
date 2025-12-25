# Website Design Guide

This document outlines the design philosophy, color palette, and typography for the personal portfolio website. The goal is to maintain a clean, modern, and professional aesthetic that is consistent across all pages.

## Design Philosophy

The website's design is guided by a "clean" and minimalist philosophy. Key principles include:

- **Minimalism**: Avoid clutter. Every element should have a purpose. Use ample white space (or, in this case, "dark space") to give content room to breathe.
- **Readability**: Ensure that all text is easy to read. This is achieved through careful font selection, appropriate font sizes, and sufficient contrast between text and background.
- **Visual Engagement**: While minimalist, the design is not boring. The dynamic 3D background provides a unique "wow" factor, while a focused use of accent colors draws attention to key interactive elements.
- **Consistency**: The header, footer, and overall page structure should remain consistent across the entire site.

A central design choice is the **omission of a global stylesheet (`App.css`)**. This is an intentional decision to enforce component-level styling and rely on the foundational styles provided by Bootstrap and minimal global overrides in `index.css`. This prevents style conflicts and keeps the CSS footprint small.

---

## Color Palette

The color scheme is a dark theme, chosen to be easy on the eyes and to make the accent colors pop.

| Role                | Color           | Hex Code    | Usage                                           |
| ------------------- | --------------- | ----------- | ----------------------------------------------- |
| **Primary Background** | Dark Navy/Charcoal | `#1a1a2e`   | Used for the main navigation bar background.    |
| **Content Background** | Transparent Black | `rgba(0, 0, 0, 0.5)` | Used for the main content containers, allowing the 3D background to be visible behind the text. |
| **Primary Accent**  | Bright Cyan     | `#00a8ff`   | Used for the brand name, navigation links, and primary buttons. |
| **Accent Hover**    | White           | `#ffffff`   | Used for navigation link hover effects.         |
| **Primary Text**    | White           | `#ffffff`   | Used for all body copy and general text inside content containers. |

---

## Typography

The typography is chosen to be modern, clean, and highly readable on digital screens.

### Fonts

- **Headings & Brand Name**:
  - **Font**: **'Audiowide'**, sans-serif
  - **Usage**: Used exclusively for the "SERAPHIN" brand name in the header. Its wide, geometric style gives it a distinct, futuristic, and memorable look suitable for a logo.

- **Body Text**:
  - **Font**: **'Roboto'**, sans-serif (with system font fallbacks)
  - **Usage**: Used for all paragraphs, labels, and other general text content. Roboto is a clean, versatile, and highly readable font that works well for both long and short-form text.

### Font Importing

Both 'Audiowide' and 'Roboto' are imported from Google Fonts in the `src/index.css` file:

```css
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');
```
*(Note: 'Audiowide' is currently loaded via a separate mechanism or was assumed to be present, but for best practice, it should be added to this import.)*
