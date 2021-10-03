#import <Cocoa/Cocoa.h>
#import "UAConstants.h"
//------------------------------------------------------------------------------
// メインビュークラス
//------------------------------------------------------------------------------
@interface REMainView : NSView
//カスタムイニシャライザ
- (instancetype)initWithFrame:(NSRect)frameRect graphWidth:(float)width;
@end
