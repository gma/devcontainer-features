## Notes on usage

This feature has been written to speed up the installation of [Playwright] within your devcontainers.

Playwright is installed with `npm`, which means we need Node.js to be installed inside your devcontainer. You can achieve that by including the Node feature in your your `devcontainre.json` file, alongside this Playwright feature:

```json
  "features": {
      ...
      "ghcr.io/devcontainers/features/node:1": {},
      "ghcr.io/gma/devcontainer-features/playwright:1": {},
      ...
  },
```

While your devcontainer is building this feature will:

- Temporarily install the latest version of the `playwright` package
- Use Playwight to install any operating system dependencies required by the browers you want to use (i.e. it runs `npx playwright install-deps <browser>`)
- Setup a named volume called `playwright-browsers` that Playwright will (later) use when you actually install some browsers

By default the dependencies for Chromium are installed. If you'd like to specify different browsers you can so by setting the "browsers" option:

```json
      ...
      "ghcr.io/gma/devcontainer-features/playwright:1": {
          "browsers": "firefox chrome"
      },
      ...
```

Once the container is running, you'll take care of installing Playwright in your application as normal, with a command like this:

```sh
npm install --save-dev playwright@<version>
```

Once you've installed Playwright into your project, you'll be able to install the browsers you want to use:

```sh
npx playwright install chromium
```

The `playwright install` command will store the downloaded Chromium files in `/playwright/browsers`, which is mounted as a Docker volume. They'll therefore persist if you delete and then restart the container, or rebuild the image.

[Playwright]: https://playwright.dev
