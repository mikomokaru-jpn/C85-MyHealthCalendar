//------------------------------------------------------------------------------
// 日付ビュークラス
//------------------------------------------------------------------------------
#import <Cocoa/Cocoa.h>
#import "UAConstants.h"
#import "UADate.h"          //日付情報
#import "UACalendar.h"      //カレンダー情報

//------------------------------------------------------------------------------
//プロトコル宣言
//------------------------------------------------------------------------------
@class UAItemView;   //クラスの前方宣言
@protocol UAItemViewDelegate <NSObject>
@optional
//矢印キーを押す。：選択されている日付ビュー(ForstResponder)を移動する。
-(void)moveDate:(UAItemView*)view code:(MoveTyp)index;
//★日付ビューをクリックする。：血圧データ入力ウィンドウを開く。
-(void)clickItem:(UADate*)date;
@end
//------------------------------------------------------------------------------
//インタフェース宣言
//------------------------------------------------------------------------------
@interface UAItemView : NSView{
    float width;                    //ビューの幅
    float height;                   //ビューの高さ
}
@property NSInteger index;          //カレンダー内の順序番号
@property NSString *dateString;     //日付文字列：CAViewオブジェクトがセットする
@property UADate* uadate;           //日付オブジェクト：CAViewオブジェクトがセットする
@property(weak, nonatomic) id<UAItemViewDelegate> delegate; //デリゲートオブジェクトへの参照
//★血圧データ
@property NSInteger upper;                      //最高血圧(整数)
@property NSInteger lower;                      //最低血圧(整数)
@property NSInteger confirm;                    //確定フラグ
// イニシャライザー　引数：①日付ビュー(矩形)の位置と大きさ、②順序番号
- (id)initWithFrame:(CGRect)frame index:(NSInteger)index;
@end
