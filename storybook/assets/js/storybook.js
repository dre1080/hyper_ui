// This file is loaded by the Phoenix Storybook in the browser.
// Use it to inject custom scripts or styles into the Storybook UI.

(() => {
	let icons = document.querySelectorAll('link[rel="icon"]');
	const appleTouchIcon = document.querySelector('link[rel="apple-touch-icon"]');
	const manifest = document.querySelector('link[rel="manifest"]');
	const maskIcon = document.querySelector('link[rel="mask-icon"]');
	const tileColor = document.querySelector(
		'meta[name="msapplication-TileColor"]',
	);

	icons = [...icons, appleTouchIcon, manifest, maskIcon, tileColor];
	icons.forEach((icon) => {
		icon.remove();
	});

	// Inject custom favicon
	const link = document.createElement("link");
	link.rel = "icon";
	link.href = "/favicon.ico";
	document.head.appendChild(link);

	// Initialize storybook window object
	window.storybook = {
		Hooks: {},
		Params: {},
	};
})();
