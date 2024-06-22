import '../../../core/class/read_updata_delete_inser_view.dart';
import '../../../core/const/app_links.dart';

class GradData {
  ReadUpdateDeleteInsertView crud = ReadUpdateDeleteInsertView();
  GradData(this.crud);
  getGradData() async {
    var respones = await crud.postData(AppLinkes.gradView, {});
    return respones.fold((l) => l, (r) => r);
  }
}
