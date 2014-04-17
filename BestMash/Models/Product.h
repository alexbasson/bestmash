#import <Foundation/Foundation.h>

@interface Product : NSObject

+ (instancetype)productWithAttributes:(NSDictionary *)dict;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSURL *thumbnailURL;
@property (nonatomic, strong, readonly) NSDate *releaseDate;

@end
