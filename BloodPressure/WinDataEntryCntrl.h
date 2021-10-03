#import <Cocoa/Cocoa.h>
#import "UADate.h"
#import "UAAcceptButton.h"
#import "BPButton.h"
#import "BPValueView.h"
//------------------------------------------------------------------------------
// 血圧データ入力ウィンドウ制御
//------------------------------------------------------------------------------
//プロトコルの宣言
@protocol WinDataEntryCntrlDelegate <NSObject>
@optional
-(void)updateColendaer;
@end
@interface WinDataEntryCntrl : NSWindowController <NSWindowDelegate,
                                                   BPButtonDelegate,
                                                   BPValueViewDelegate,
                                                   UAAcceptButtonDelegate>
@property(weak) id<WinDataEntryCntrlDelegate> delegate;  //デリゲート変数の宣言
-(void)getDataFor:(UADate*)dt;  //オブジェクト初期化
-(void)initialDataSet;          //シートのデータ初期設定
@end
