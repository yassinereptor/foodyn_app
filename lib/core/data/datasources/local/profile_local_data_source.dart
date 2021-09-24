import 'package:injectable/injectable.dart';

abstract class IProfileLocalDataSource {
}

@Injectable(as: IProfileLocalDataSource)
class ProfileLocalDataSource implements IProfileLocalDataSource {
  ProfileLocalDataSource();
}
