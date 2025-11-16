import 'package:get/get.dart';

/// Initial Binding
/// Initialize app-wide dependencies that are needed throughout the app
class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // Initialize app-wide services here
    
    // Example: Supabase Service
    // Get.put<SupabaseService>(SupabaseService(), permanent: true);
    
    // Example: Auth Service
    // Get.put<AuthService>(AuthService(), permanent: true);
    
    // Example: Storage Service
    // Get.put<StorageService>(StorageService(), permanent: true);
    
    // Example: Network Service
    // Get.put<NetworkService>(NetworkService(), permanent: true);
    
    print('✅ Initial Binding: App-wide services initialized');
  }
}
