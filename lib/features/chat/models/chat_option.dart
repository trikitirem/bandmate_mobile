enum ChatOptionType { basic, warning }

class ChatOption {
  const ChatOption({
    this.type,
    required this.iconPath,
    required this.label,
  });

  final ChatOptionType? type;
  final String iconPath;
  final String label;
}
