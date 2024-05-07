//
//  ViewController.m
//  Pabau
//
//  Created by star on 5/5/24.
//

#import "ViewController.h"
#import "ItemTableViewCell.h"
#import "PaymentTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.paymentTypes = @[@"Subtotal", @"Discount", @"Tax", @"Cash", @"Card", @"Bank Transfer", @"Total"];
    self.paymentAmounts = @[@"£181.50", @"£0", @"£4.33", @"£10.00", @"10.00", @"£161.50", @"£181.50"];
    
    // For Products list
    self.productTable.dataSource = self;
    self.productTable.delegate = self;
    self.productTable.contentInset = UIEdgeInsetsZero;
    self.productTable.scrollIndicatorInsets = UIEdgeInsetsZero;
        
    // For Payments list
    self.paymentsTable.dataSource = self;
    self.paymentsTable.delegate = self;
    self.paymentsTable.contentInset = UIEdgeInsetsZero;
    self.paymentsTable.scrollIndicatorInsets = UIEdgeInsetsZero;
    
    
//    // hide Next Appointment
//    [self.viewNextAppointment setHidden:YES];
    
    [self changeStatus: COMPLETED];
    
    [self.btnMessage setHidden:YES];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:UIDeviceOrientationDidChangeNotification object:nil];
    }
    
}

-(void)viewDidLayoutSubviews {
    
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    if (orientation == UIDeviceOrientationUnknown) {
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        if (screenSize.height > screenSize.width) {
            orientation = UIDeviceOrientationPortrait;
        } else {
            orientation = UIDeviceOrientationLandscapeLeft;
        }
    }
    [self handleOrientation:orientation];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)orientationChanged:(NSNotification *)notification {
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    [self handleOrientation:orientation];
}

- (void)handleOrientation:(UIDeviceOrientation)orientation {
    
    BOOL isLandscape = NO;
    BOOL isUnknown = NO;
    switch (orientation) {
        case UIDeviceOrientationPortrait:
        case UIDeviceOrientationPortraitUpsideDown:
            isLandscape = NO;
            break;
        case UIDeviceOrientationLandscapeLeft:
        case UIDeviceOrientationLandscapeRight:
            isLandscape = YES;
            break;
        default:
            NSLog(@"Unknown orientation");
            isUnknown = YES;
            break;
    }
    
    if (!isUnknown) {
        [self.landscapeLeftViewTrailingConstraint setActive:isLandscape];
        [self.landscapeLeftViewBottomConstraint setActive:isLandscape];
        [self.landscapeRightViewTopConstraint setActive:isLandscape];
        
        [self.portraitLeftViewBottomConstraint setActive:!isLandscape];
        [self.portraitLeftViewTrailingConstraint setActive:!isLandscape];
        [self.portraitRightViewLeadingConstraint setActive:!isLandscape];
        
        [self updateViewConstraints];
        [self.view layoutIfNeeded];
    }
    
}



- (IBAction)onBtnPrint:(id)sender {
}

- (IBAction)onBtnMessage:(id)sender {
}

- (IBAction)onBtnMail:(id)sender {
}

- (IBAction)onBookNextAppointment:(id)sender {
}

-(void) changeStatus:(PaymentStatus) status {
    
    UIColor *redColor = [UIColor colorWithRed:1.0f green:91/255.0 blue:100/255.0 alpha:1.0];
    UIColor *greenColor = [UIColor colorWithRed:101/255.0 green:205/255.0 blue:152/255.0 alpha:1.0];
        
    UIColor *backgroundColor = [UIColor colorWithRed:246/255.0f green:1.0f blue:237/255.0f alpha:1.0];
    UIColor *borderColor = [UIColor colorWithRed:183/255.0f green:235/255.0f blue:143/255.0f alpha:1.0f];
    UIColor *textColor = [UIColor colorWithRed:82/255.0f green:196/255.0f blue:26/255.0f alpha:1.0];
    
    switch (status) {
        case COMPLETED:
            // left
            [self.imgLogo setImage:[UIImage imageNamed:@"success_icon"]];
            [self.lblAmount setTextColor:greenColor];
            [self.btnBookNextAppointment setTitle:@"Book Next Appointment" forState:UIControlStateNormal];
            
            // right
            [self.lblStatus setText:@"Completed"];
            break;
        case UNPAID:
            // left
            [self.imgLogo setImage:[UIImage imageNamed:@"payment_icon"]];
            [self.lblAmount setTextColor:redColor];
            [self.btnBookNextAppointment setTitle:@"Add A Payment" forState:UIControlStateNormal];
            
            // right
            backgroundColor = [UIColor colorWithRed:255/255.0f green:241/255.0f blue:240/255.0f alpha:1.0];
            borderColor = [UIColor colorWithRed:255/255.0f green:163/255.0f blue:158/255.0f alpha:1.0f];
            textColor = [UIColor colorWithRed:245/255.0f green:34/255.0f blue:45/255.0f alpha:1.0];
            
            [self.lblStatus setText:@"Unpaid"];
            break;
        case PART_PAID:
            // left
            [self.imgLogo setImage:[UIImage imageNamed:@"payment_icon"]];
            [self.lblAmount setTextColor:redColor];
            [self.btnBookNextAppointment setTitle:@"Add A Payment" forState:UIControlStateNormal];
            
            // right
            backgroundColor = [UIColor colorWithRed:255/255.0f green:247/255.0f blue:230/255.0f alpha:1.0];
            borderColor = [UIColor colorWithRed:255/255.0f green:213/255.0f blue:145/255.0f alpha:1.0f];
            textColor = [UIColor colorWithRed:250/255.0f green:140/255.0f blue:22/255.0f alpha:1.0];
            
            [self.lblStatus setText:@"Part-Paid"];
            break;
        default:
            break;
    }
        
    [self.btnBookNextAppointment.layer setCornerRadius:4.0f];
    
    [self.lblStatus setTextColor:textColor];
    [self.viewStatus setBackgroundColor:backgroundColor];
    [self.viewStatus.layer setBorderColor:borderColor.CGColor];
    
    [self.viewStatus.layer setBorderWidth:1.0f];
    [self.viewStatus.layer setCornerRadius: 2.0f];
}


#pragma TableView Datasouce

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
        
    if (tableView == self.productTable) {
        ItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemTableViewCellIdentifier"];
        if (cell == nil) {
            cell = [[ItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ItemTableViewCellIdentifier"];
        }
        cell.lblItemName.text = @"Hydrafacial";
        cell.lblFrom.text = @"With Mel Pabau";
        cell.lblAmount.text = @"£120.00";
        cell.lblNumber.text = @"1";
        return cell;
    } else if (tableView == self.paymentsTable) {
        PaymentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PaymentTableViewCellIdentifier"];
        if (cell == nil) {
            cell = [[PaymentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PaymentTableViewCellIdentifier"];
        }
        cell.lblPaymentType.text = self.paymentTypes[indexPath.row];
        cell.lblAmount.text = self.paymentAmounts[indexPath.row];

        if (indexPath.row == (self.paymentTypes.count - 1)) {
            UIColor *textColor = [UIColor colorWithRed:61/255.0f green:61/255.0f blue:70/255.0f alpha:1.0];
            UIFont *font = cell.lblPaymentType.font;
            font = [UIFont systemFontOfSize:font.pointSize + 1 weight:UIFontWeightMedium];
            [cell.lblPaymentType setFont:font];
            [cell.lblPaymentType setTextColor:textColor];
            
            [cell.lblAmount setFont:font];
            [cell.lblAmount setTextColor:textColor];
        }
        return cell;
    }
    return cell;
}

#pragma TableviewDelegate
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.productTable) {
        return 2;
    } else if (tableView == self.paymentsTable) {
        return self.paymentTypes.count;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == self.productTable) {
        return 70.0f;
    } else if (tableView == self.paymentsTable) {
        return 30.0f;
    }
    return 0.0;
}

@end
