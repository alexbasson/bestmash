#import "ProductsViewController.h"
#import "ProductCell.h"

@interface ProductsViewController () <UITableViewDataSource>

@property (nonatomic, strong) NSArray *products;
@property (nonatomic, strong, readwrite) UITableView *tableView;

@end

@implementation ProductsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.products = @[@"! (Bonus Track) (Japan) - CD"];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.dataSource = self;
    [self.tableView registerClass:[ProductCell class] forCellReuseIdentifier:@"ProductCell"];
    [self.view addSubview:self.tableView];
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.products.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProductCell *cell = (ProductCell *)[tableView dequeueReusableCellWithIdentifier:@"ProductCell" forIndexPath:indexPath];
    cell.productNameLabel.text = self.products[indexPath.row];
    return cell;
}

@end
