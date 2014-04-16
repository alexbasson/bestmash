#import "ProductsViewController.h"
#import "ProductCell.h"
#import "ProductsAPIClient.h"
#import "Product.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(ProductsViewControllerSpec)

describe(@"ProductsViewController", ^{
    __block ProductsViewController *controller;
    __block ProductsAPIClient *apiClient;

    beforeEach(^{
        apiClient = nice_fake_for([ProductsAPIClient class]);
        apiClient stub_method(@selector(fetchProductsWithCompletion:)).and_do_block(^void(FetchProductsCompletionBlock completion) {
            Product *product = [Product productWithAttributes:@{}];
            completion(@[product], nil);
        });

        controller = [[ProductsViewController alloc] initWithAPIClient:apiClient];
        controller.view should_not be_nil;
        [controller.tableView layoutIfNeeded];
    });

    describe(@"when the view loads", ^{
        __block NSString *thumbnailPath;
        __block UIImage *thumbnailImage;

        beforeEach(^{
            thumbnailPath = [[NSBundle bundleForClass:[self class]] pathForResource:@"default_music_s" ofType:@"jpg"];
            thumbnailImage = [UIImage imageWithContentsOfFile:thumbnailPath];
        });

        it(@"should fetch the products", ^{
            apiClient should have_received(@selector(fetchProductsWithCompletion:));
        });

        it(@"should show a product names", ^{
            ProductCell *cell = controller.tableView.visibleCells.firstObject;
            cell.productNameLabel.text should equal(@"default name");
        });

        it(@"should show product images", ^{
            NSURLConnection *connection = [[NSURLConnection connections] lastObject];
            PSHKFakeHTTPURLResponse *response = [[PSHKFakeHTTPURLResponse alloc] initWithStatusCode:200
                                                                                         andHeaders:@{}
                                                                                        andBodyData:[NSData dataWithContentsOfFile:thumbnailPath]];
            [connection receiveResponse:response];
            ProductCell *cell = controller.tableView.visibleCells.firstObject;
            [cell.productImageView.image isEqualToByBytes:thumbnailImage] should be_truthy;
        });
    });
});

SPEC_END
