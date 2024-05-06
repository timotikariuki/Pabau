//
//  ViewController.h
//  Pabau
//
//  Created by star on 5/5/24.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

typedef NS_ENUM(NSInteger, PaymentStatus) {
    COMPLETED,
    UNPAID,
    PART_PAID
};

@property (weak, nonatomic) IBOutlet UIView *viewLeft;
@property (weak, nonatomic) IBOutlet UIView *viewRight;


@property (weak, nonatomic) IBOutlet UIImageView *imgLogo;
@property (weak, nonatomic) IBOutlet UILabel *lblAmount;
@property (weak, nonatomic) IBOutlet UILabel *lblTotal;


@property (weak, nonatomic) IBOutlet UIButton *btnBookNextAppointment;
@property (weak, nonatomic) IBOutlet UIButton *btnMail;
@property (weak, nonatomic) IBOutlet UIButton *btnMessage;
@property (weak, nonatomic) IBOutlet UIButton *btnPrint;

@property (weak, nonatomic) IBOutlet UIView *viewNextAppointment;

@property (weak, nonatomic) IBOutlet UITableView *itemTable;


@property (weak, nonatomic) IBOutlet UIView *viewStatus;
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *landscapeLeftViewTrailingConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *landscapeLeftViewBottomConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *landscapeRightViewTopConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *portraitLeftViewTrailingConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *portraitRightViewLeadingConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *portraitLeftViewBottomConstraint;


- (IBAction)onBookNextAppointment:(id)sender;
- (IBAction)onBtnMail:(id)sender;
- (IBAction)onBtnMessage:(id)sender;
- (IBAction)onBtnPrint:(id)sender;

- (void) changeStatus:(PaymentStatus)status;

@end

