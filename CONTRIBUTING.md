# Contributing

Contributions are always welcome, no matter how large or small!

We want this community to be friendly and respectful to each other. Please follow it in all your interactions with the project. Before contributing, please read the [code of conduct](./CODE_OF_CONDUCT.md).

## Development workflow

This project contains the following packages:

- The library package in the root directory.
- An example app in the `example/` directory.

To get started with the project, run either `npm install` or `yarn` in the root directory to install the required dependencies for each package:

```sh
npm install
```

or

```sh
yarn
```

The [example app](/example/) demonstrates usage of the library. You need to run it to test any changes you make.

It is configured to use the local version of the library, so any changes you make to the library's source code will be reflected in the example app. Changes to the library's JavaScript code will be reflected in the example app without a rebuild, but native code changes will require a rebuild of the example app.

If you want to use Android Studio or XCode to edit the native code, you can open the `example/android` or `example/ios` directories respectively in those editors. To edit the Objective-C or Swift files, open `example/ios/TranslationModuleExample.xcworkspace` in XCode and find the source files at `Pods > Development Pods > react-native-translation-module`.

To edit the Java or Kotlin files, open `example/android` in Android studio and find the source files at `react-native-translation-module` under `Android`.

You can use various commands from the root directory to work with the project.

To start the packager:

```sh
npm run setup
```

or

```sh
yarn setup:yarn
```

<!-- To run the example app on Android:

```sh
npm run android
```

or

```sh
yarn android
``` -->

To run the example app on iOS:

```sh
npm run ios
```

or

```sh
yarn ios
```

Make sure your code passes TypeScript and ESLint. Run the following to verify:

```sh
npm run typecheck
```

or

```sh
yarn typecheck
```

```sh
npm run lint
```

or

```sh
yarn lint
```

To fix formatting errors, run the following:

```sh
npm run lint --fix
```

or

```sh
yarn lint --fix
```

Remember to add tests for your change if possible. Run the unit tests by:

```sh
npm test
```

or

```sh
yarn test
```

### Commit message convention

We follow the [conventional commits specification](https://www.conventionalcommits.org/en) for our commit messages:

- `fix`: bug fixes, e.g. fix crash due to deprecated method.
- `feat`: new features, e.g. add new method to the module.
- `refactor`: code refactor, e.g. migrate from class components to hooks.
- `docs`: changes into documentation, e.g. add usage example for the module..
- `test`: adding or updating tests, e.g. add integration tests using detox.
- `chore`: tooling changes, e.g. change CI config.

Our pre-commit hooks verify that your commit message matches this format when committing.

### Linting and tests

[ESLint](https://eslint.org/), [Prettier](https://prettier.io/), [TypeScript](https://www.typescriptlang.org/)

We use [TypeScript](https://www.typescriptlang.org/) for type checking, [ESLint](https://eslint.org/) with [Prettier](https://prettier.io/) for linting and formatting the code, and [Jest](https://jestjs.io/) for testing.

Our pre-commit hooks verify that the linter and tests pass when committing.

### Publishing to npm

We use [release-it](https://github.com/release-it/release-it) to make it easier to publish new versions. It handles common tasks like bumping version based on semver, creating tags and releases etc.

To publish new versions, run the following:

```sh
npm run release
```

or

```sh
yarn release
```

### Scripts

The `package.json` file contains various scripts for common tasks:

- `npm install` or `yarn`: setup project by installing dependencies.
- `npm run typecheck` or `yarn typecheck`: type-check files with TypeScript.
- `npm run lint` or `yarn lint`: lint files with ESLint.
- `npm test` or `yarn test`: run unit tests with Jest.
- `npm run --prefix example start` or `yarn workspace react-native-translation-module-example`: start the Metro server for the example app.
- `npm run setup && npm run example ios` or `yarn setup:yarn && yarn example:yarn ios`: setup the project, install dependencies, and run the example app on iOS.
- `npm run example` or `yarn example`: run the example app on iOS.
- `npm run pod-install` or `yarn pod-install`: install CocoaPods dependencies for the example app.
- `npm run clean` or `yarn clean`: clean build artifacts.
- `npm run prepare` or `yarn prepare`: build the project using react-native-builder-bob.
- `npm run release` or `yarn release`: publish a new version using release-it.

### Sending a pull request

> **Working on your first pull request?** You can learn how from this _free_ series: [How to Contribute to an Open Source Project on GitHub](https://app.egghead.io/playlists/how-to-contribute-to-an-open-source-project-on-github).

When you're sending a pull request:

- Prefer small pull requests focused on one change.
- Verify that linters and tests are passing.
- Review the documentation to make sure it looks good.
- Follow the pull request template when opening a pull request.
- For pull requests that change the API or implementation, discuss with maintainers first by opening an issue.
