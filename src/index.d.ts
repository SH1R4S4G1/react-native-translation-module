declare module 'react-native-translation-module' {
  /**
   * Shows a translation popover for the given text.
   * @param text The text to translate.
   * @returns A promise that resolves with the translated text.
   * @throws {Error} If the input is invalid or if the translation fails.
   */
  export function showTranslationPopover(text: string): Promise<string>;
}
