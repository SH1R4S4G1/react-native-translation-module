import { showTranslationPopover } from '../index';
import { NativeModules } from 'react-native';

jest.mock('react-native', () => ({
  NativeModules: {
    TranslationModule: {
      showTranslationPopover: jest.fn().mockResolvedValue('Hello'),
    },
  },
  Platform: {
    select: jest.fn((obj) => obj.ios),
  },
}));

describe('showTranslationPopover', () => {
  it('有効な入力で NativeModule を呼び出す', async () => {
    await expect(showTranslationPopover('こんにちは')).resolves.toBe('Hello');
    expect(
      NativeModules.TranslationModule.showTranslationPopover
    ).toHaveBeenCalledWith('こんにちは');
  });

  it('空の入力でエラーを投げる', async () => {
    await expect(showTranslationPopover('')).rejects.toThrow('Invalid input');
  });
});
