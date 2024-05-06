//
//  ItemTableViewCell.h
//  Pabau
//
//  Created by star on 5/6/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ItemTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblItemName;
@property (weak, nonatomic) IBOutlet UILabel *lblAmount;
@property (weak, nonatomic) IBOutlet UILabel *lblNumber;
@property (weak, nonatomic) IBOutlet UILabel *lblFrom;


@end

NS_ASSUME_NONNULL_END
