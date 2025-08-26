#import "VclAuthReactNative.h"
#import "VclAuthReactNative-Swift.h"


@implementation VclAuthReactNative
RCT_EXPORT_MODULE()

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeVclAuthReactNativeSpecJSI>(params);
}

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
