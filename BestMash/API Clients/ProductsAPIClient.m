#import "ProductsAPIClient.h"
#import "NSDictionary+QueryString.h"

@implementation ProductsAPIClient

- (void)fetchProductsWithCompletion:(void(^)(NSArray *products, NSError *error))completion {
    NSDictionary *prodPList = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Production" ofType:@"plist"]];
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:prodPList[@"API Root"]];
    urlComponents.path = [urlComponents.path stringByAppendingPathComponent:@"products"];
    urlComponents.query = [@{@"apiKey": prodPList[@"API Key"], @"format": @"json"} queryString];

    NSURLRequest *request = [NSURLRequest requestWithURL:urlComponents.URL];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                               NSArray *products = [jsonDict[@"products"] valueForKeyPath:@"name"];
                               completion(products, nil);
                           }];
}

@end
