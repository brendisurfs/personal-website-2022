import { defineConfig } from "vite";
import glslify from "vite-plugin-glslify";
import path from "path";

/** @type {import('vite').UserConfig} */
export default defineConfig({
  plugins: [glslify()],
  resolve: {
    alias: {
      "@shaders": path.resolve(__dirname, "src/glsl"),
    },
  },
  define: {
    "process.env": process.env,
  },
});
