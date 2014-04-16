#import <UIKit/UIKit.h>

@class ProductsAPIClient;

@interface ProductsViewController : UIViewController

- (instancetype)initWithAPIClient:(ProductsAPIClient *)apiClient;

@property (nonatomic, strong, readonly) UITableView *tableView;

@end
