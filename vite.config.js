import { defineConfig } from "vite";

/** @type {import('vite').UserConfig} */
export default defineConfig({
  define: {
    "process.env": process.env,
    "@public": "../../public",
  },
});
