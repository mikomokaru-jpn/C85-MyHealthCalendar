#import <Cocoa/Cocoa.h>
//------------------------------------------------------------------------------
// 血圧入力エリア
//------------------------------------------------------------------------------
//プロトコルの宣言
@protocol BPValueViewDelegate <NSObject>
@optional
-(void)tabkeyJumpView:(id)bpview;   //タブキーで移動
-(void)updateCheck:(id)bpview;      //更新要否
@end
@interface BPValueView : NSView{
    NSInteger _intValue;                         //血圧値（整数）
    NSInteger _preIntValue;
    NSAttributedString* attributedStringValue;   //血圧値（表示用文字列）
}
//血圧値（整数）Accesser
@property (nonatomic, getter=getIntValue, setter=setIntValue:) NSInteger intValue;
@property BOOL initialInput; //初期入力フラグ
@property(weak) id<BPValueViewDelegate> delegate;  //デリゲート変数の宣言

@end
