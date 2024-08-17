import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-translation-module' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

const TranslationModule = NativeModules.TranslationModule
  ? NativeModules.TranslationModule
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

/**
 * Shows a translation popover for the given text.
 * @param text The text to translate.
 * @returns A promise that resolves with the translated text.
 * @throws {Error} If the input is invalid or if the translation fails.
 */
export function showTranslationPopover(text: string): Promise<string> {
  if (typeof text !== 'string' || text.trim().length === 0) {
    return Promise.reject(
      new Error('Invalid input: text must be a non-empty string')
    );
  }
  return TranslationModule.showTranslationPopover(text).catch(
    (error: Error) => {
      console.error('Translation error:', error);
      throw error;
    }
  );
}
