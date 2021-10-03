#import <Cocoa/Cocoa.h>
//------------------------------------------------------------------------------
// 確定チェックボックス
//------------------------------------------------------------------------------
@protocol UAAcceptButtonDelegate <NSObject>
@optional
-(void)KeyDownFromUAButton:(id)sender event:(NSEvent *)theEvent;
@end
@interface UAAcceptButton : NSButton
@property(weak) id<UAAcceptButtonDelegate> delegate;  //デリゲート変数の宣言
@end
