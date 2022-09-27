import { defineConfig } from "vite";

/** @type {import('vite').UserConfig} */
export default defineConfig({
  plugins: [glslify()],
  define: {
    "process.env": process.env,
  },
});
