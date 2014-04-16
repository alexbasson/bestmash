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

    describe(@"when the view loads", ^{
        __block NSURLConnection *connection;

        beforeEach(^{
            connection = [[NSURLConnection connections] lastObject];
        });

        it(@"should make a network request", ^{
            connection.request.URL.absoluteString should equal(@"http://api.remix.bestbuy.com/v1/products?apiKey=a6xexy2znvn29m9mjfzfkhp5&format=json");
        });

        context(@"failure due to lack of network access", ^{

        });

        context(@"failure due to server error", ^{

        });

        context(@"success", ^{
            beforeEach(^{
                PSHKFakeHTTPURLResponse *response = [[[PSHKFakeResponses alloc] initForRequest:@"products"] success];
                [connection receiveResponse:response];
            });

            it(@"should show a table view with products", ^{
                ProductCell *cell = controller.tableView.visibleCells.firstObject;
                cell.productNameLabel.text should equal(@"! (Bonus Track) (Japan) - CD");
            });
        });
    });
});

SPEC_END
