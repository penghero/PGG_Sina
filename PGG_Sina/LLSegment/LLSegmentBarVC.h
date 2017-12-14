

#import <UIKit/UIKit.h>
#import "LLSegmentBar.h"

@interface LLSegmentBarVC : UIViewController

@property (nonatomic,weak) LLSegmentBar * segmentBar;

- (void)setUpWithItems: (NSArray <NSString *>*)items childVCs: (NSArray <UIViewController *>*)childVCs;

@end
