# Website Development Roadmap

This document outlines the planned features and improvements for the personal website.

## Phase 1: Projects Page

- [ ] Create a `ProjectCard.js` component.
  - [ ] Props: `title`, `description`, `imageUrl`, `techStack` (array), `liveUrl`, `sourceUrl`.
- [ ] Create a `projects.json` file in `src/data` to store project information.
- [ ] Update `Projects.js` to fetch data from `projects.json`.
- [ ] Use `map()` to render a `ProjectCard` for each project.
- [ ] Style the project cards and the grid layout in `App.css` (or a new `Projects.css`).
- [ ] Add responsive design for mobile.

## Phase 2: About Page

- [ ] Create a two-column layout in `About.js`.
- [ ] Add a professional headshot image to the `src/assets` folder.
- [ ] Implement a `SkillBadge.js` component.
- [ ] Add content sections: Bio, Skills, Experience.
- [ ] Style the page for a clean, professional look.

## Phase 3: Contact Page

- [ ] Build the contact form structure in `Contact.js`.
- [ ] Add social media icons (GitHub, LinkedIn).
  - [ ] Check for `react-icons` package or install it.
- [ ] Implement a `mailto:` link for the form submission.
- [ ] Style the form and icons.
