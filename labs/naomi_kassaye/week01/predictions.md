## Task 2: Hello World and Hot Reload

| Step | Prediction: what will you see? | What you saw | Same? |
|---|---|---|---|
| a. Change `'Hello World!'` in `lib/main.dart` to a greeting in your language, then press `r` |The screen will update immediately to display the new greeting text without restarting the app or losing its state|The screen updated immediately and showed the new greeting text | Yes|
| b. Change `runApp(const MainApp())` to `runApp(const Placeholder())`, then press `r` |The screen will update immediately to display the `Placeholder` widget |Nothing changed on the screen. It continued to display the previous greeting text because hot reload doesn't re-execute the `main()` function where `runApp()` is called. | No|
| c. With the change from b still there, press `R` |The app will perform a full restart and display the `Placeholder` widget across the screen. |The app restarted completely and rendered the full screen `Placeholder` widget. |Yes|

## Self-check 2: Hot reload vs Hot restart

Hot reload updates the code and shows change on the screen without restarting the app as I have seen in step b. Hot restart resets the Dart app, re-executes main() and applies changes that hot reload couldn not as I observed in step c when the `Placeholder` widget appeared.

## Task 5: Checking an Assistant's Answer
# 1. Predictions

| Input | My prediction | Actual output |
|---|---|---|
| `'addis ababa'` |It will return `'Addis Ababa'` |`'Addis Ababa'`|
| `'hello  world'` |It will crash because we have no implementation for when the space is double |`RangeError (index): Index out of range: index should be less than 0: Index 0`|
| `''` | It will crash because splitting an empty string results in `[""]` and calling word[0] on an empty string fails|`RangeError (index): Index out of range: index should be less than 0: Index 0` |

# 2. Incorrect statements of lines

1. **Incorrect line:** `split(' ')` breaks the text into words. It ignores repeated spaces, so 'hello   world' works correctly too.
- **Problem** :`split(' ')` in Dart doesn't ignore repeated spaces. Instead it creates empty string elements between consecutive spaces. Thus when the function runs on these empty string and calls word[0] causes an uncaught runtime RangeError.
- **How I found it**: Tested capitalizeWords('hello   world') in Dart and it immediately crashed with `RangeError (index): Index out of range: index should be less than 0: Index 0`

2. **Incorrect line**: Tip: For a single word you can also simply call 'hello'.capitalize(), which Dart provides on every String.
- **Problem**: Dart's standard library doesn't provide .capitalize() method. Thus, calling it results in compile-time error.
- **How I found it**: Attempted to call 'hello'.capitalize() in Dart code and  the analyzer reported `The method 'capitalize' isn't defined for the class 'String'.`

3.**Incorrect line:** This function handles all inputs safely.

- **Problem:** The function fails on empty strings (""), inputs with leading/trailing spaces, and inputs containing consecutive spaces, crashing with an unhandled exception instead of returning a valid string.

- **How I found it:** Passed '' and '  ' into the function and observed fatal runtime exceptions. 

## 3. My corrected implementation
```dart
String capitalizeWords(String text) {
  if (text.isEmpty) return text;

  return text
      .split(' ')
      .map((word) {
        if (word.isEmpty) return word;
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      })
      .join(' ');
}
```