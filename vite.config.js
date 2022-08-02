import { defineConfig } from "vite";
const path = require("path");

export default defineConfig({
	define: {
		"process.env": process.env,
	},
	resolve: {
		alias: {
			"@": path.resolve(__dirname, "./lib"),
		},
	},
});
