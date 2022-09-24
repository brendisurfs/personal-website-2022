import { defineConfig } from "vite";
import path from "path";

export default defineConfig({
  base: "./",
  resolve: {
    alias: {
      "@wasm": path.resolve(__dirname, "./wasm"),
    },
  },
  define: {
    "process.env": process.env,
  },
});
