# @sh1r4s4g1/react-native-translation-module

a RTNmodule for TranslationAPI@iOS

## Installation

```sh
npm install @sh1r4s4g1/react-native-translation-module
```

or

```sh
yarn add @sh1r4s4g1/react-native-translation-module
```

## Usage

```js
import { showTranslation } from '@sh1r4s4g1/react-native-translation-module';

// ...

try {
  const translatedText = await showTranslationPopover('Hello, world!');
  console.log('Translated text:', translatedText);
} catch (error) {
  console.error('Translation error:', error);
}
```

## iOS Setup

This module only supports iOS. To use it in an iOS project, follow these steps:

1. Run the following command in the root directory of your project to install the necessary dependencies:

```sh
yarn pod-install
```

or

```sh
npm run pod-install
```

2. Open your project in Xcode and set up any necessary permissions or settings.

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
