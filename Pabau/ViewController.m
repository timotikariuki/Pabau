//
//  ViewController.m
//  Pabau
//
//  Created by star on 5/5/24.
//

#import "ViewController.h"
#import "ItemTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.itemTable.dataSource = self;
    self.itemTable.delegate = self;
    
    
    UIColor *redColor = [UIColor colorWithRed:1.0f green:91/255.0 blue:100/255.0 alpha:1.0];
    UIColor *greenColor = [UIColor colorWithRed:101/255.0 green:205/255.0 blue:152/255.0 alpha:1.0];
    
    // change logo image and color
    [self.imgLogo setImage:[UIImage imageNamed:@"payment_icon"]];
    [self.lblAmount setTextColor:redColor];
    
    // button title
    [self.btnBookNextAppointment setTitle:@"Add Payment" forState:UIControlStateNormal];
    
//    // hide Next Appointment
//    [self.viewNextAppointment setHidden:YES];
    
    [self changeStatus];
    
}



- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemTableViewCellIdentifier"];
    if (cell == nil) {
        cell = [[ItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ItemTableViewCellIdentifier"];
    }
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return the desired height for each row
    return 70.0; // Adjust this value as needed
}

- (IBAction)onBtnPrint:(id)sender {
}

- (IBAction)onBtnMessage:(id)sender {
}

- (IBAction)onBtnMail:(id)sender {
}

- (IBAction)onBookNextAppointment:(id)sender {
}

-(void) changeStatus {
    UIColor *completedBgColor = [UIColor colorWithRed:246/255.0f green:1.0f blue:237/255.0f alpha:1.0];
    UIColor *completedBorderColor = [UIColor colorWithRed:183/255.0f green:235/255.0f blue:143/255.0f alpha:1.0f];
    UIColor *completedTextColor = [UIColor colorWithRed:82/255.0f green:196/255.0f blue:26/255.0f alpha:1.0];
    
    UIColor *partPaidBgColor = [UIColor colorWithRed:255/255.0f green:247/255.0f blue:230/255.0f alpha:1.0];
    UIColor *partPaidBorderColor = [UIColor colorWithRed:255/255.0f green:213/255.0f blue:145/255.0f alpha:1.0f];
    UIColor *partPaidTextColor = [UIColor colorWithRed:250/255.0f green:140/255.0f blue:22/255.0f alpha:1.0];
    
    UIColor *unpaidBgColor = [UIColor colorWithRed:255/255.0f green:241/255.0f blue:240/255.0f alpha:1.0];
    UIColor *unpaidBorderColor = [UIColor colorWithRed:255/255.0f green:163/255.0f blue:158/255.0f alpha:1.0f];
    UIColor *unpaidTextColor = [UIColor colorWithRed:245/255.0f green:34/255.0f blue:45/255.0f alpha:1.0];
    
    // Completed.
    [self.lblStatus setText:@"Completed"];
    [self.lblStatus setTextColor:completedTextColor];
    [self.viewStatus setBackgroundColor:completedBgColor];
    [self.viewStatus.layer setBorderColor:completedBorderColor.CGColor];
    
    // Unpaid.
    [self.lblStatus setText:@"Unpaid"];
    [self.lblStatus setTextColor:unpaidTextColor];
    [self.viewStatus setBackgroundColor:unpaidBgColor];
    [self.viewStatus.layer setBorderColor:unpaidBorderColor.CGColor];
    
    // Part Paid.
    [self.lblStatus setText:@"Part-Paid"];
    [self.lblStatus setTextColor:partPaidTextColor];
    [self.viewStatus setBackgroundColor:partPaidBgColor];
    [self.viewStatus.layer setBorderColor:partPaidBorderColor.CGColor];
    
    [self.viewStatus.layer setBorderWidth:1.0f];
}

@end
