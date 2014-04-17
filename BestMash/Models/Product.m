#import "Product.h"

@interface Product ()
@property (nonatomic, strong, readwrite) NSString *name;
@property (nonatomic, strong, readwrite) NSURL *thumbnailURL;
@property (nonatomic, strong, readwrite) NSDate *releaseDate;
@end

@implementation Product

+ (instancetype)productWithAttributes:(NSDictionary *)dict {
    NSMutableDictionary *productDict = [[self defaultAttributes] mutableCopy];
    for (id key in [dict allKeys]) {
        productDict[key] = dict[key];
    }
    return [[Product alloc] initWithDictionary:productDict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        self.name = dict[@"name"];
        self.thumbnailURL = [NSURL URLWithString:dict[@"thumbnailImage"]];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"YYYY-MM-dd"];
        [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
        self.releaseDate = [dateFormatter dateFromString:dict[@"releaseDate"]];
    }
    return self;
}

#pragma Overrides

- (BOOL)isEqual:(Product *)otherProduct {
    if (self == otherProduct) { return YES; }
    if (![self.name isEqual:otherProduct.name] && self.name != otherProduct.name) { return NO; }
    if (![self.thumbnailURL isEqual:otherProduct.thumbnailURL] && self.thumbnailURL != otherProduct.thumbnailURL) { return NO; }
    return YES;
}

- (NSUInteger)hash {
    NSUInteger prime = 31;
    NSUInteger result = 1;
    result = prime * result + [self.name hash];
    result = prime * result + [self.thumbnailURL hash];
    return result;
}

#pragma mark - Private

+ (NSDictionary *)defaultAttributes {
    return @{@"name": @"default name",
             @"thumbnailImage": @"default/thumbnail/image"
             };
}

@end
