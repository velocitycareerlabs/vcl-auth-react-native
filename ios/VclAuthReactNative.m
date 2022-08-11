#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(VclAuthReactNative, NSObject)

RCT_EXTERN_METHOD(isAuthenticationAvailable:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(authenticate:(NSDictionary*)authConfigDictionary
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(openSecuritySettings:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)

@end
