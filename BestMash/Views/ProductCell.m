#import "ProductCell.h"

@implementation ProductCell

- (void)layoutSubviews {
    CGFloat padding = 10.0f;
    self.productImageView.frame = CGRectMake(0.0f, 0.0f, 52.0f, 52.0f);
    [self.productNameLabel sizeToFit];
    self.productNameLabel.frame = ({
        CGRect frame = self.productNameLabel.frame;
        CGFloat imageViewRightEdge = CGRectGetMaxX(self.productImageView.frame);
        frame.origin.x = imageViewRightEdge + padding;
        frame.origin.y = padding;
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
