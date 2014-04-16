#import "ProductCell.h"

@implementation ProductCell

- (void)layoutSubviews {
    CGFloat padding = 10.0f;
    self.productImageView.frame = CGRectMake(0.0f, 0.0f, 52.0f, 52.0f);
    self.productNameLabel.frame = ({
        CGRect frame;
        CGFloat imageViewRightEdge = CGRectGetMaxX(self.productImageView.frame);
        frame.origin.x = imageViewRightEdge + padding;
        frame.origin.y = 0;
        frame.size.width = self.bounds.size.width - imageViewRightEdge - padding;
        frame.size.height = self.bounds.size.height;
        frame;
    });
}

- (UILabel *)productNameLabel {
    if (!_productNameLabel) {
        _productNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self addSubview:_productNameLabel];
    }
    return _productNameLabel;
}

- (UIImageView *)productImageView {
    if (!_productImageView) {
        _productImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:_productImageView];
    }
    return _productImageView;
}

@end
