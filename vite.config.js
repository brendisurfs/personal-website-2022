import path from "path";
import { defineConfig } from "vite";
import glslify from "vite-plugin-glslify";

/** @type {import('vite').UserConfig} */
export default defineConfig({
  plugins: [glslify()],
  resolve: {
    alias: {
      "@shaders": path.resolve(__dirname, "src/glsl"),
      static: path.resolve(__dirname, "static/"),
      utils: path.resolve(__dirname, "src/utils"),
    },
  },
  define: {
    "process.env": process.env,
  },
});
