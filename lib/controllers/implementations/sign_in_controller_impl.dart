import '../contracts/sign_in_controller_contract.dart';
import '../../base/controller.dart';
import '../../repositories/contracts/sign_in_repository_contract.dart';

class SignInControllerImpl extends Controller
implements SignInControllerContract {
  final SignInRepositoryContract repository;

  SignInControllerImpl(this.repository);

  @override
  void initListeners() {}

}
