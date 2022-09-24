import { defineConfig } from "vite";
import path from "path";

export default defineConfig({
  base: "./",
  resolve: {
    alias: {
      "@wasm": path.resolve(__dirname, "./wasm"),
      shaders: path.resolve(__dirname, "./wasm/shaders"),
    },
  },
  define: {
    "process.env": process.env,
  },
});
