//
//  ViewController.h
//  Pabau
//
//  Created by star on 5/5/24.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btnRequestTerminal;
@property (weak, nonatomic) IBOutlet UIButton *btnLearnMore;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *backgroundImageWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *itemHeightConstraint;

@end

