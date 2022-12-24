/***
 * Excerpted from "Modern Front-End Development for Rails, Second Edition",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material,
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose.
 * Visit https://pragprog.com/titles/nrclient2 for more book information.
***/
module.exports = {
  env: {
    browser: true,
    es2021: true,
  },
  extends: [
    "eslint:recommended",
    "plugin:prettier/recommended",
    "plugin:cypress/recommended",
  ],
  parser: "@babel/eslint-parser",
  parserOptions: {
    ecmaVersion: 12,
    parser: "@babel/eslint-parser",
    requireConfigFile: false,
    sourceType: "module",
  },
  rules: {},
  globals: {
    require: true,
    Stimulus: true,
    process: true,
    module: true,
  },
}
