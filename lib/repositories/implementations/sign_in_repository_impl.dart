import '../contracts/sign_in_repository_contract.dart';
import '../../data_source/remote/contracts/sign_in_data_contract.dart';
    
class SignInRepositoryImpl implements SignInRepositoryContract {
  final SignInDataContract dataContract;

  SignInRepositoryImpl(this.dataContract);

}
