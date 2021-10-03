#import <Cocoa/Cocoa.h>
@class BPButton;
//------------------------------------------------------------------------------
// 数値ボタン
//------------------------------------------------------------------------------
//プロトコルの宣言
@protocol BPButtonDelegate <NSObject>
@optional
-(void)clickNumber:(BPButton*)btn; //ボタンをクリックした
@end
@interface BPButton : NSButton
@property(weak) id<BPButtonDelegate> delegate;  //デリゲート変数の宣言
@property NSInteger number;    //数値
-(id)initWithRect:(NSRect)rect number:(NSInteger)num delegate:(id)obj;
@end
