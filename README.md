# Personal Portfolio Website for Seraphin

This is a personal portfolio website built to showcase projects, provide information about Seraphin, and offer a way for visitors to get in touch. The site is designed to be clean, modern, and visually engaging, featuring a persistent 3D animated background.

## Key Features

- **Responsive Design**: The website is fully responsive and works on all screen sizes, from mobile phones to desktops.
- **Dynamic 3D Background**: A persistent, interactive 3D background powered by Spline is present on all pages, creating a unique and immersive user experience.
- **Page-Specific Content Blur**: The 3D background is blurred on all pages except the homepage to ensure that text content is readable and stands out.
- **React-Based Single Page Application (SPA)**: Built with React and React Router for fast, seamless navigation between pages without full-page reloads.
- **Minimalist "Clean" Aesthetic**: The design prioritizes a clean, dark theme with a focused color palette and modern typography.

---

## Technology Stack

The project utilizes a modern frontend technology stack:

- **[React](https://reactjs.org/)**: The core library for building the user interface.
- **[React Router](https://reactrouter.com/)**: For handling client-side routing and navigation within the SPA.
- **[@splinetool/react-spline](https://github.com/splinetool/react-spline)**: To integrate and manage the Spline 3D scene as a background component.
- **[Bootstrap](https://getbootstrap.com/)**: The underlying CSS framework providing a responsive grid system and basic component styling.
- **[Create React App](https://create-react-app.dev/)**: The toolchain used to bootstrap the project, providing a development server, build scripts, and more.
- **[GitHub Pages](https://pages.github.com/)**: The platform used for deploying and hosting the live website.

---

## Project Structure

The project follows a standard Create React App structure, with key files organized as follows:

```
personal-website/
├── build/                 # Production-ready build files (auto-generated)
├── public/                # Static assets like index.html and manifest.json
└── src/                   # Main source code for the application
    ├── assets/            # (Currently unused) For storing images, icons, etc.
    ├── components/        # Reusable React components
    │   ├── Background.js  # Manages the Spline 3D background
    │   └── Header.js      # The main navigation bar
    ├── data/              # (Currently unused) For storing JSON data
    ├── pages/             # Page-level components
    │   ├── About.js
    │   ├── Contact.js
    │   ├── Home.js
    │   └── Projects.js
    ├── App.js             # Main application component, handles routing
    ├── index.js           # The entry point of the application
    └── index.css          # Global styles and font imports
```

### Key Components

- **`App.js`**: The root component that sets up the `Router` and defines the routes for each page.
- **`Header.js`**: Contains the main navigation bar, allowing users to navigate between Home, Projects, About, and Contact pages.
- **`Background.js`**: This component is responsible for loading and displaying the Spline 3D animation. It also accepts a `blur` prop to toggle the blur effect based on the current page.
- **Page Components (`Home.js`, `About.js`, etc.)**: Each of these files represents a distinct page within the application.

---

## Available Scripts

In the project directory, you can run the following commands:

### `npm start`

Runs the app in development mode. Open [http://localhost:3000](http://localhost:3000) to view it in your browser. The page will automatically reload if you make edits.

### `npm run build`

Builds the app for production to the `build` folder. It correctly bundles React in production mode and optimizes the build for the best performance.

### `npm test`

Launches the test runner in interactive watch mode.

---

## Deployment

The website is configured to be deployed on GitHub Pages. The `homepage` field in `package.json` is set to ensure that the build process creates the correct asset paths for this hosting environment.