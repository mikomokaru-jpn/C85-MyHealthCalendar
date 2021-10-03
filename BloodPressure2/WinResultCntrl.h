//------------------------------------------------------------------------------
// 月間血圧一覧表を作成する
//------------------------------------------------------------------------------
#import <Cocoa/Cocoa.h>
#import "UAItemView.h"
@interface WinResultCntrl : NSWindowController <NSWindowDelegate>
//月間表の作成・表示
-(void)monthlyChartItems:(NSArray<UAItemView*>*)itemViews
                title:(NSString*)title;
@end
