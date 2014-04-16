#import <Foundation/Foundation.h>

typedef void(^FetchProductsCompletionBlock)(NSArray *products, NSError *error);

@interface ProductsAPIClient : NSObject

- (void)fetchProductsWithCompletion:(FetchProductsCompletionBlock)completion;

@end
