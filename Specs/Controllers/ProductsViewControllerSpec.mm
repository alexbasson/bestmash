#import "ProductsViewController.h"
#import "ProductCell.h"
#import "ProductsAPIClient.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(ProductsViewControllerSpec)

describe(@"ProductsViewController", ^{
    __block ProductsViewController *controller;
    __block ProductsAPIClient *apiClient;

    beforeEach(^{
        apiClient = nice_fake_for([ProductsAPIClient class]);
        apiClient stub_method(@selector(fetchProductsWithCompletion:)).and_do_block(^void(FetchProductsCompletionBlock completion) {
            completion(@[@"! (Bonus Track) (Japan) - CD"], nil);
        });

        controller = [[ProductsViewController alloc] initWithAPIClient:apiClient];
        controller.view should_not be_nil;
        [controller.tableView layoutIfNeeded];
    });

    describe(@"when the view loads", ^{
        it(@"should fetch the products", ^{
            apiClient should have_received(@selector(fetchProductsWithCompletion:));
        });
        
        it(@"should show a table view with products", ^{
            ProductCell *cell = controller.tableView.visibleCells.firstObject;
            cell.productNameLabel.text should equal(@"! (Bonus Track) (Japan) - CD");
        });
    });
});

SPEC_END
