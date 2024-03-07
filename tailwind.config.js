const defaultTheme = require("tailwindcss/defaultTheme")
const colors = require("tailwindcss/colors")
module.exports = {
  content: [
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.html.erb",
  ],
  safelist: [{ pattern: /form-.+/ }, { pattern: /btn-.+/ }],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Inter", ...defaultTheme.fontFamily.sans],
      },
      colors: {
        primary: colors.indigo,
        secondary: colors.purple,
        neutral: colors.gray,
        success: colors.green,
        warning: colors.yellow,
        danger: colors.red,
      },
      borderWidth: {
        DEFAULT: '1px',
        '0': '0',
        '2': '0.1px',
        '3': '3px',
        '4': '4px',
        '6': '6px',
        '8': '8px',
      }
    },
  },
  plugins: [
    require("@tailwindcss/typography"),
    require("@tailwindcss/forms"),
    // https://github.com/adoxography/tailwind-scrollbar
    require("tailwind-scrollbar")({ nocompatible: true }),
  ],
}