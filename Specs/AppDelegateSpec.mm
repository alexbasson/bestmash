#import "AppDelegate.h"
#import "ProductsViewController.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(AppDelegateSpec)

describe(@"AppDelegate", ^{
    __block AppDelegate *appDelegate;

    beforeEach(^{
        appDelegate = [[AppDelegate alloc] init];
        [appDelegate application:nil didFinishLaunchingWithOptions:nil];
    });

    it(@"should show a products view controller", ^{
        appDelegate.window.rootViewController should be_instance_of([UINavigationController class]);
        ((UINavigationController *)appDelegate.window.rootViewController).topViewController should be_instance_of([ProductsViewController class]);
    });
});

SPEC_END
