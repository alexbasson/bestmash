#import "ProductsAPIClient.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(ProductsAPIClientSpec)

describe(@"ProductsAPIClient", ^{
    __block ProductsAPIClient *client;

    beforeEach(^{
        client = [[ProductsAPIClient alloc] init];
    });

    describe(@"fetching products", ^{
        __block NSURLConnection *connection;
        __block NSArray *returnedProducts;

        beforeEach(^{
            returnedProducts = nil;
            [client fetchProductsWithCompletion:^(NSArray *products, NSError *error){
                returnedProducts = products;
            }];
            connection = [[NSURLConnection connections] lastObject];
        });

        it(@"should make a network connection with the appropriate request url", ^{
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

            it(@"should call the completion handler with the products", ^{
                returnedProducts should equal(@[@"! (Bonus Track) (Japan) - CD"]);
            });
        });
    });
});

SPEC_END
