import 'package:intl/intl.dart';

rupiah(val) {
  return "Rp" + NumberFormat("#,###").format(val).replaceAll(',', '.');
}

dateformat(val) {
  return DateFormat("dd MMM yy h:mm", 'id').format(val);
}
