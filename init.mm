#import <UIKit/UIKit.h>
#import <substrate.h>

namespace sce {
    namespace EMBlackPearlIsFeatureEnabled {
        BOOL (*original)(void);
        BOOL custom(void) {
            return YES;
        }
        void hook() {
            MSImageRef image = MSGetImageByName("/System/Library/PrivateFrameworks/Email.framework/Email");
            void *symbol = MSFindSymbol(image, "_EMBlackPearlIsFeatureEnabled");

            if (symbol != NULL) {
                MSHookFunction(symbol,
                reinterpret_cast<void *>(&custom),
                reinterpret_cast<void **>(&original));
            }
        }
    }
}

__attribute__((constructor)) static void init() {
    @autoreleasepool {
        sce::EMBlackPearlIsFeatureEnabled::hook();
    }
}
