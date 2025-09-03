#import "VclAuthReactNative.h"
#import <objc/message.h>

// Import the auto-generated Swift interface header
#if __has_include(<VclAuthReactNative/VclAuthReactNative-Swift.h>)
#import <VclAuthReactNative/VclAuthReactNative-Swift.h>
#elif __has_include("VclAuthReactNative-Swift.h")
#import "VclAuthReactNative-Swift.h"
#else
#warning "VclAuthReactNative-Swift.h not found. Ensure the Swift sources are compiled and the header is exposed."
#endif

@implementation VclAuthReactNative

//RCT_EXPORT_MODULE()
RCT_EXPORT_MODULE(VclAuthReactNative)

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeVclAuthReactNativeSpecJSI>(params);
}

// MARK: - Spec methods (must match the generated header signatures)

- (void)authenticate:(nonnull NSDictionary *)authConfig resolve:(nonnull RCTPromiseResolveBlock)resolve reject:(nonnull RCTPromiseRejectBlock)reject
{
  [VclAuthReactNativeImpl.shared authenticateWithAuthConfigDictionary:authConfig resolve:resolve reject:reject];
}

- (void)isAuthenticationAvailable:(nonnull RCTPromiseResolveBlock)resolve reject:(nonnull RCTPromiseRejectBlock)reject
{
  [VclAuthReactNativeImpl.shared isAuthenticationAvailableWithResolve:resolve reject:reject];
}

- (void)openSecuritySettings:(nonnull RCTPromiseResolveBlock)resolve reject:(nonnull RCTPromiseRejectBlock)reject
{
  [VclAuthReactNativeImpl.shared openSecuritySettingsWithResolve:resolve reject:reject];
}

@end
