//
//  ViewController.h
//  Pabau
//
//  Created by star on 5/5/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

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



- (IBAction)onBookNextAppointment:(id)sender;
- (IBAction)onBtnMail:(id)sender;
- (IBAction)onBtnMessage:(id)sender;
- (IBAction)onBtnPrint:(id)sender;


- (void)changeStatus;
@end

