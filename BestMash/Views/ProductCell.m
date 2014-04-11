#import "ProductCell.h"

@implementation ProductCell

- (void)layoutSubviews {
    self.productNameLabel.frame = self.contentView.bounds;
}

- (UILabel *)productNameLabel {
    if (!_productNameLabel) {
        _productNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self addSubview:_productNameLabel];
    }
    return _productNameLabel;
}

@end
