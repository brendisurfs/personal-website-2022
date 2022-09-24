import { defineConfig } from "vite";
import vitePluginString from "vite-plugin-string";

/** @type {import('vite').UserConfig} */
export default defineConfig({
	define: {
		"process.env": process.env,
	},
	plugins: [
		vitePluginString({
			include: ["**/*.glsl", "**/*.vert", "**/*.frag"],
		}),
	],
});
