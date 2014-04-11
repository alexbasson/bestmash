#import "AppDelegate.h"
#import "ProductsViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    ProductsViewController *productsViewController = [[ProductsViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:productsViewController];
    self.window.rootViewController = navController;

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
