//------------------------------------------------------------------------------
// 日付オブジェクトクラス
//------------------------------------------------------------------------------
#import "UADate.h"
@implementation UADate
// 静的領域：全ての日付オブジェクトが唯一のデータ(youbis, calendar, unitFlags)を参照する。
static NSArray* youbis;
static NSCalendar* calendar;
static unsigned unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday;
//------------------------------------------------------------------------------
// イニシャライザ
//------------------------------------------------------------------------------
-(id)initWithDate:(NSDate*)date{
    self = [super init];
    if (self == nil){
        return self;
    }
    //日付情報の設定
    if (youbis == nil){
        youbis = [[NSArray alloc] initWithObjects:@"日",@"月",@"火",@"水",@"木",@"金",@"土",nil];
    }
    if (calendar == nil){
        calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    }
    //日付データを求める
    NSDateComponents *dateComp = [calendar components:unitFlags fromDate:date];
    _year = dateComp.year;                              //年
    _month = dateComp.month;                            //月
    _day = dateComp.day;                                //日
    _dayOfWeek = dateComp.weekday;                      //曜日
    _strYobi = youbis[dateComp.weekday - 1];            //曜日名
    _nsdate = date;                                     //日付オブジェクト(NSDate)
    _dayType = Weekday;                                 //曜日タイプ
    if (_dayOfWeek == 7) _dayType = Saturday;
    if (_dayOfWeek == 1) _dayType= Sunday;
    _integerYearMonthDay = _year*10000+_month*100+_day; //年月日整数（yyyymmdd）
    _holidayName = @"";                                 //休日名(初期化)
    return self;
}
@end






