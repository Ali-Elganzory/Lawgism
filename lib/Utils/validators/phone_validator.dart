String? validatePhone(String? phone) {
  if (phone == null || phone.length != 11)
    return "Please, enter a valid number.";

  return null;
}
