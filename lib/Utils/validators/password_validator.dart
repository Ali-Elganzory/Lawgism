String? validatePassword(String? password) {
  if (password == null || password.isEmpty) return "* required";
  if (password.trim().length < 8)
    return "Password must be 8 characters at least.";

  return null;
}
