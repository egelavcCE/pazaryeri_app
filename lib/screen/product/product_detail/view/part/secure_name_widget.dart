part of"../product_detail_view.dart";

class SecureNameWidget extends StatelessWidget {
  final String name;

  const SecureNameWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    String secureName = _getSecureName(name);
    return Text(
      secureName,
      style: context.general.textTheme.titleSmall,
    );
  }

  String _getSecureName(String name) {
    List<String> nameParts = name.split(' ');
    String secureName = '';
    for (String part in nameParts) {
      secureName += '${part[0].toUpperCase()}${'*' * (part.length - 1)} ';
    }
    return secureName.trim();
  }
}