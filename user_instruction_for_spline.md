Okay, I've updated the styles for the new floating monitor and adjusted the JavaScript.

Now, regarding the **keyboard keydown animations** in Spline:

The `main.js` code has been updated so that when you press `1`, `2`, or `3`, the event *will* propagate to the Spline viewer. However, for an animation to play, you need to set this up **inside the Spline editor** for each key:

1.  **Select a Key Object in Spline (e.g., your "Resume" key).**
2.  In the right-hand sidebar, find the **"Events"** section.
3.  Click the `+` to **add a new Event**.
4.  Choose **"On Key Down"** as the event type.
5.  In the event settings that appear, set the **"Key"** to `1` (for the "About" section).
6.  Then, add an **"Action"** (e.g., `Start Animation`, `Set State`, `Move Object`) that corresponds to the animation you want to play when '1' is pressed.
7.  Repeat this process for keys `2` (for "Projects") and `3` (for "Contact").

This way, when you press `1`, the browser will register it, my JavaScript will open the "About" monitor, AND the Spline viewer will also register the `1` key press and play its corresponding animation.

---

Now, please start your local server. I will be awaiting your next instruction.