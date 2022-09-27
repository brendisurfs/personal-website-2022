import { defineConfig } from "vite";
import glslify from "vite-plugin-glslify";

/** @type {import('vite').UserConfig} */
export default defineConfig({
  plugins: [glslify()],
  define: {
    "process.env": process.env,
  },
});
