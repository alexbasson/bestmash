#import "ProductsViewController.h"
#import "ProductCell.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(ProductsViewControllerSpec)

describe(@"ProductsViewController", ^{
    __block ProductsViewController *controller;

    beforeEach(^{
        controller = [[ProductsViewController alloc] init];
        controller.view should_not be_nil;
        [controller.tableView layoutIfNeeded];
    });

    it(@"should show a table view with products", ^{
        ProductCell *cell = controller.tableView.visibleCells.firstObject;
        cell.productNameLabel.text should equal(@"! (Bonus Track) (Japan) - CD");
    });
});

SPEC_END
