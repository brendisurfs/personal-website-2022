import { defineConfig } from "vite";

/** @type {import('vite').UserConfig} */
export default defineConfig({
  root: "./",
  define: {
    "process.env": process.env,
  },
});
