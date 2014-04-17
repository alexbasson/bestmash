#import "Product.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(ProductSpec)

describe(@"Product", ^{
    __block Product *product;
    __block NSDictionary *dict;

    beforeEach(^{
        dict = @{@"name": @"Product Name",
                 @"thumbnailImage": @"a/thumbnail/url",
                 @"releaseDate": @"2014-04-15"
                };
        product = [[Product alloc] initWithDictionary:dict];
    });

    it(@"should set the appropriate properties on the model", ^{
        product.name should equal(@"Product Name");
        product.thumbnailURL should equal([NSURL URLWithString:@"a/thumbnail/url"]);
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:1397520000];
        product.releaseDate should equal(date);
    });

    describe(@"equality", ^{
        __block Product *otherProduct;
        __block NSMutableDictionary *otherDict;

        beforeEach(^{
            otherDict = [dict mutableCopy];
        });

        context(@"otherProduct is equal to product", ^{
            beforeEach(^{
                otherProduct = [[Product alloc] initWithDictionary:otherDict];
            });

            it(@"should verify equality", ^{
                [product isEqual:otherProduct] should be_truthy;
                [product hash] should equal([otherProduct hash]);
            });
        });

        context(@"otherProduct has a different name", ^{
            beforeEach(^{
                otherDict[@"name"] = @"Different Name";
                otherProduct = [[Product alloc] initWithDictionary:otherDict];
            });

            it(@"should verify inequality", ^{
                [product isEqual:otherProduct] should_not be_truthy;
                [product hash] should_not equal([otherProduct hash]);
            });
        });

        context(@"otherProduct has a different thumbnail URL", ^{
            beforeEach(^{
                otherDict[@"thumbnailImage"] = @"different/thumbnail/image/url";
                otherProduct = [[Product alloc] initWithDictionary:otherDict];
            });

            it(@"should verify inequality", ^{
                [product isEqual:otherProduct] should_not be_truthy;
                [product hash] should_not equal([otherProduct hash]);
            });
        });
    });
});

SPEC_END
