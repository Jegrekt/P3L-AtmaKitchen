const withMT = require("@material-tailwind/react/utils/withMT");

module.exports = withMT({
  content: ["./index.html", "./src/**/*.{vue,js,ts,jsx,tsx}"],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Poppins"],
        numeric: ["Sono"],
      },
      screens: {
        sm: "640px",
        md: "768px",
        lg: "960px",
        xl: "1140px",
      },
      colors: {
        "pink-primary": "#FEA19F",
        "pink-secondary": "#FFEEEE",
        "slate-50": "#f9fafb",
        "slate-100": "#f3f4f6",
        "slate-200": "#e5e7eb",
      },
    },
  },
  plugins: [],
});
