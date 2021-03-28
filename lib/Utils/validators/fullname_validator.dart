String? validateFullName(String? name) {
  if (name == null || name.isEmpty) return "Please, enter your name.";
  if (!name.trim().contains(' ')) return "Please, enter your full name.";

  return null;
}
