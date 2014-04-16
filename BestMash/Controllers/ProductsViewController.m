#import "ProductsViewController.h"
#import "ProductCell.h"
#import "ProductsAPIClient.h"

@interface ProductsViewController () <UITableViewDataSource>

@property (nonatomic, strong) NSArray *products;
@property (nonatomic, strong, readwrite) UITableView *tableView;
@property (nonatomic, strong) ProductsAPIClient *apiClient;

@end

@implementation ProductsViewController

- (instancetype)initWithAPIClient:(ProductsAPIClient *)apiClient {
    if (self = [super init]) {
        self.apiClient = apiClient;
    }
    return self;
}

- (instancetype)init {
    return [self initWithAPIClient:[[ProductsAPIClient alloc] init]];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.apiClient fetchProductsWithCompletion:^(NSArray *products, NSError *error) {
        self.products = products;
        [self.tableView reloadData];
    }];
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
