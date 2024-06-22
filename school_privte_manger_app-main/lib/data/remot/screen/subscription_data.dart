import '../../../core/class/read_updata_delete_inser_view.dart';
import '../../../core/const/app_links.dart';

class SubscriptionData {
  ReadUpdateDeleteInsertView crud = ReadUpdateDeleteInsertView();
  SubscriptionData(this.crud);

  addSubscription({
    required String student_id,
    required String cours_id,
    required String subscription_expiry_date,
    required String subscription_prise,
  }) async {
    var respones = await crud.postData(AppLinkes.subscriptionAdd, {
      "student_id": student_id,
      "cours_id": cours_id,
      "subscription_expiry_date": subscription_expiry_date,
      "subscription_prise": subscription_prise,
    });
    return respones.fold((l) => l, (r) => r);
  }

  editeSubscriptionData({
    required String id,
    required String subscription_expiry_date,
    required String subscription_prise,
  }) async {
    var respones = await crud.postData(AppLinkes.subscriptionEdite, {
      "id": id,
      "subscription_expiry_date": subscription_expiry_date,
      "subscription_prise": subscription_prise,
    });
    return respones.fold((l) => l, (r) => r);
  }

  deleteSubscriptionData({
    required String subscriptionId,
  }) async {
    var respones = await crud.postData(AppLinkes.subscriptionDelete, {
      "id": subscriptionId,
    });
    return respones.fold((l) => l, (r) => r);
  }
}
