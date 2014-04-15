#import "FixtureHelper.h"
#import "PSHKFixtures.h"

@implementation FixtureHelper

+ (void)beforeEach {
    [PSHKFixtures setDirectory:[[[NSBundle bundleForClass:[self class]] bundlePath] stringByAppendingPathComponent:@"Fixtures"]];
}

@end
