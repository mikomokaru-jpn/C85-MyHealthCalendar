//------------------------------------------------------------------------------
// カレンダオブジェクトクラス
//------------------------------------------------------------------------------
#import <Foundation/Foundation.h>
#import "UAConstants.h"
#import "UADate.h"
#import "UADateMgr.h"
@interface UACalendar : NSObject
@property(readonly) NSInteger numWeeks;         // 週数を返す。(5週 or 6週)
@property(readonly) NSInteger fromDate;         //開始日
@property(readonly) NSInteger toDate;           //終了日
// 引数の日付の年月に相当するカレンダーを作成し返す。日数(35 or 42)
-(NSArray<UADate*>*)createDateList:(NSDate*)date;
//指定の日付のUADateオブジェクトを返す：未使用
-(UADate*)getDate:(NSDate*)dt;
@end
