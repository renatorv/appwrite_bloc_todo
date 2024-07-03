import 'package:appwrite/appwrite.dart';
import 'package:appwrite_bloc_todo/core/utils/appwrite_constants.dart';

class AppwriteProdived {
  Client client = Client();
  Account? account;
  Databases? database;

  AppwriteProdived() {
    client.setEndpoint(AppwriteConstants.endpoint).setProject(AppwriteConstants.projectId).setSelfSigned(status: true);
    account = Account(client);
    database = Databases(client);
  }
}
