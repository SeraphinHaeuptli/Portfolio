# Integrating Spline Components in a React Website

This guide provides instructions on how to add Spline components to a React website using the `@splinetool/react-spline` library.

## Installation

First, you need to install the necessary packages. You can use either `npm` or `yarn`:

```bash
# Using npm
npm install @splinetool/react-spline @splinetool/runtime

# Using yarn
yarn add @splinetool/react-spline @splinetool/runtime
```

## Usage

1.  **Export your Spline scene:**
    *   Open your scene in the Spline editor.
    *   Click on "Export".
    *   Select "Code" and then choose the "React" option.
    *   Copy the URL of your scene.

2.  **Import and use the `Spline` component:**
    *   In your React component, import the `Spline` component from `@splinetool/react-spline`.
    *   Use the component in your JSX, passing the scene URL to the `scene` prop.

    ```jsx
    import Spline from '@splinetool/react-spline';

    export default function App() {
      return (
        <div>
          <Spline scene="YOUR_SPLINE_SCENE_URL" />
        </div>
      );
    }
    ```

## Handling CORS Issues

If you encounter Cross-Origin Resource Sharing (CORS) issues, you can resolve them by self-hosting the Spline scene file.

1.  In the Spline editor's export window, download the `.splinecode` file.
2.  Place this file in the `public` folder of your React project.
3.  Update the `scene` prop to point to the local file path.

    ```jsx
    <Spline scene="/scene.splinecode" />
    ```

For more detailed information and advanced usage, refer to the official documentation on the [`@splinetool/react-spline` GitHub repository](https://github.com/splinetool/react-spline).
