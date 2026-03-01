// Phoenix Storybook setup
// This file is bundled by esbuild into priv/static/assets/js/storybook.js

const Hooks = {};
const Params = {};
const Uploaders = {};

(function () {
  window.storybook = { Hooks, Params, Uploaders };
})();
