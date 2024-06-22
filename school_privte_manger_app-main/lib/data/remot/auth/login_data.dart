import '../../../core/class/read_updata_delete_inser_view.dart';
import '../../../core/const/app_links.dart';

class LoginData {
  ReadUpdateDeleteInsertView crud = ReadUpdateDeleteInsertView();
  LoginData(this.crud);
  login({required String password, required String email}) async {
    var respones = await crud
        .postData(AppLinkes.login, {"password": password, "email": email});
    return respones.fold((l) => l, (r) => r);
  }
}
