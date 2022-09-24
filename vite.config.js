import { defineConfig } from "vite";

/** @type {import('vite').UserConfig} */
export default defineConfig({
  optimizeDeps: {
    include: ["public/shaders/"],
  },
  define: {
    "process.env": process.env,
  },
});
