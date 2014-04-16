#import "FixtureHelper.h"

@implementation FixtureHelper

+ (void)beforeEach {
    [PSHKFixtures setDirectory:[[[NSBundle bundleForClass:[self class]] bundlePath] stringByAppendingPathComponent:@"Fixtures"]];
}

@end
