//------------------------------------------------------------------------------
// 日付オブジェクトクラス
//------------------------------------------------------------------------------
#import <Foundation/Foundation.h>
#import "UAConstants.h"

@interface UADate : NSObject
@property NSInteger year;                   //年
@property NSInteger month;                  //月
@property NSInteger day;                    //日
@property NSInteger dayOfWeek;              //曜日
@property NSString *strYobi;                //曜日名 "日"〜"土"
@property NSString *holidayName;            //休日名 "文化の日" etc.
@property DayType dayType;                  //曜日タイプ
@property BOOL isHoliday;                   //休日フラグ
@property MonthType monthType;              //月タイプ
@property BOOL isToday;                     //現在日フラグ
@property NSDate* nsdate;                   //日付オブジェクト(NSDate)
@property NSInteger integerYearMonthDay;    //年月日整数（yyyymmdd）
-(id)initWithDate:(NSDate*)date;            //イニシャライザー
@end

