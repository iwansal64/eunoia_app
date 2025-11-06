T? findOrNull<T>(List<T> arr, bool Function(T element) testFunction) {
  for (var element in arr) {
    if (testFunction(element)) return element;
  }
  return null;
}
