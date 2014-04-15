#import <Foundation/Foundation.h>

@interface ProductsAPIClient : NSObject

- (void)fetchProductsWithCompletion:(void(^)(NSArray *products, NSError *error))completion;

@end
