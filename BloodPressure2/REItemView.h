//------------------------------------------------------------------------------
// アイテムビュークラス
//------------------------------------------------------------------------------
#import <Cocoa/Cocoa.h>
typedef enum : NSInteger{
    ALLIGN_LEFT = 0,
    ALLIGN_CENTER = 1,
    ALLIGN_RHGHT = 3
} TYPE_ALLIGN;
@interface REItemView : NSView
//表示に関する属性
@property NSString *string;             //表示文字列
@property NSColor *backgroundColor;     //背景色
@property float borderWidth;            //枠線の太さ
@property float opacity;                //透明度
@property TYPE_ALLIGN allign;           //文字列揃え
@property NSDictionary* atr;            //文字列修飾
@end
