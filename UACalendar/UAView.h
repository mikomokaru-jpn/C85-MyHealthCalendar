//------------------------------------------------------------------------------
// カレンダービュークラス
//------------------------------------------------------------------------------
#import <Cocoa/Cocoa.h>
#import "UAConstants.h"             //定数定義
#import "UAItemView.h"              //日付ビュー
#import "UACalendar.h"              //カレンダー情報
#import "UADate.h"                  //日付情報
#import "UADateMgr.h"               //日付操作ユーティリティ
#import "UAServerRequest.h"         //汎用HTTPリクエストサービス
#import "WinDataEntryCntrl.h"       //血圧データ入力：ウィンドウコントローラ
#import "WinResultCntrl.h"          //月間血圧一覧表：ウィンドウコントローラ

//**** インタフェース宣言 ****
//カレンダービュー
@interface UAView : NSView <UAItemViewDelegate, WinDataEntryCntrlDelegate>
//月間血圧一覧表：ウィンドウ
@property WinResultCntrl *resultCntrl;
//イニシャライザー：親ウィンドウの中央にカレンダーを表示
-(id)initWindowCenter;
//日付情報をカレンダービューにセットする
-(void)setDate;

@end
