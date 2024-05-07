//
//  PaymentTableViewCell.h
//  Pabau
//
//  Created by star on 5/7/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PaymentTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblPaymentType;
@property (weak, nonatomic) IBOutlet UILabel *lblAmount;

@end

NS_ASSUME_NONNULL_END
