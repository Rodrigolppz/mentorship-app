# README

## How this project was generated

I used **SvelteKit**, which gave me a ready-made template with a few options to make development easier.

To create the project:

```sh
npx sv create frontend
```

This command opens a wizard with a few questions and generates the project with the chosen tools (TypeScript, ESLint, Prettier, Vitest and Tailwind CSS). That is how all the files below came about; they were not created one by one. Below is a brief explanation of what each one is.

## What each file and folder does

- `src/` → It is **the actual site**: the screens, the texts, what the user sees. Each folder inside `routes/` becomes an address of the site.
- `static/` → Static files, such as images and icons, made available as they are.
- `package.json` → The list of everything the project needs to work, and of the commands to use it.
- `package-lock.json` → The same list, but with the exact version of each item, so everyone installs the same thing.
- `vite.config.ts` → Connects the tools to each other and makes the site show up in the browser, updating by itself when you save.
- `tsconfig.json` → Rules for writing code more safely, catching errors early, right in the editor.
- `eslint.config.js` → A tool that underlines errors in the code and warns about slips before the site runs.
- `prettier.config.js` and `.prettierignore` → Automatically tidy up how the code looks (spacing, quotes) so everyone writes in the same style; `.prettierignore` says what not to touch.
- `.npmrc` → Configuration file for **npm**: stores options for how npm should behave in this project, for example requiring a compatible Node version at install time.
EOF
