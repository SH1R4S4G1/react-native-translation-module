#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(TranslationModule, NSObject)

RCT_EXTERN_METHOD(showTranslationPopover:(NSString *)text
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)

@end
