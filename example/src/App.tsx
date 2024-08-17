import { useState } from 'react';
import { StyleSheet, View, TextInput, Button } from 'react-native';
import { showTranslationPopover } from 'react-native-translation-module';

export default function App() {
  const [text, setText] = useState('');

  const handleTranslation = async () => {
    if (text.trim()) {
      const result = await showTranslationPopover(text);
      setText(result);
    }
  };

  return (
    <View style={styles.container}>
      <TextInput
        style={styles.textArea}
        multiline
        numberOfLines={4}
        onChangeText={setText}
        value={text}
        placeholder="翻訳したいテキストを入力してください"
      />
      <Button title="翻訳" onPress={handleTranslation} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    padding: 20,
  },
  textArea: {
    width: '100%',
    height: 100,
    borderColor: 'gray',
    borderWidth: 1,
    marginBottom: 10,
    padding: 10,
  },
});
