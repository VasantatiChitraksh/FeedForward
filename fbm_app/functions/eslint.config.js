/** @type {import('eslint').FlatConfig} */
const config = [
  // Base configuration for general files
  {
    languageOptions: {
      globals: {
        es6: true,
        node: true,
      },
      parserOptions: {
        ecmaVersion: 2018,
      },
    },
    settings: {
      // Add any settings if required
    },
    rules: {
      "max-len": ["error", {code: 110}],
      "no-restricted-globals": ["error", "name", "length"],
      "prefer-arrow-callback": "error",
      "quotes": ["error", "double", {"allowTemplateLiterals": true}],
    },
  },
  // Configuration specifically for test files
  {
    files: ["**/*.spec.*"],
    languageOptions: {
      globals: {
        mocha: true,
      },
    },
    rules: {},
  },
];

module.exports = config;
