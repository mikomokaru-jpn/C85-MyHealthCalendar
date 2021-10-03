#import "UADateMgr.h"
//------------------------------------------------------------------------------
// 日付操作ユーティリティ内部クラス宣言
//------------------------------------------------------------------------------
@interface UADateMgr(){
    unsigned unitDay;
    unsigned unitTime;
    NSDateFormatter* form;
}
//日付ライブラリのオブジェクト
@property NSCalendar *calendar;
@property NSArray* youbis;
@end
//------------------------------------------------------------------------------
// 日付操作ユーティリティ
//------------------------------------------------------------------------------
@implementation UADateMgr
static UADateMgr *sharedData = nil;  //自身のオブジェクト(シングルトン)
//------------------------------------------------------------------------------
//日付操作ユーティリティオブジェクト(シングルトン)を返す。
//------------------------------------------------------------------------------
+(UADateMgr *)DateManager{ //singleton
    if (!sharedData) {
        sharedData = [[UADateMgr alloc] init];
    }
    return sharedData;
}
//------------------------------------------------------------------------------
//イニシャライザ
//------------------------------------------------------------------------------
-(id)init{
    self = [super init];
    if (self == nil){
        return self;
    }    
    // 曜日テーブル
    _youbis = [[NSArray alloc] initWithObjects:@"日",@"月",@"火",@"水",@"木",@"金",@"土",nil];
    // NSCalendarオブジェクト
    _calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    // NSDateComponentsフラグ(年、月、日、曜日)
    unitDay = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday;
    // NSDateComponentsフラグ(時、分、秒)
    unitTime = NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    // --- 和暦変換 ---
    // 時刻書式指定子を設定
    form = [[NSDateFormatter alloc] init];
    [form setDateStyle:NSDateFormatterFullStyle];
    [form setTimeStyle:NSDateFormatterNoStyle];
    // ロケールを設定
    NSLocale* loc = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
    [form setLocale:loc];
    // カレンダーを指定
    NSCalendar* cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierJapanese];
    [form setCalendar: cal];
    // 和暦を出力するように書式指定
    [form setDateFormat:@"GG yy"];
    return self;
}
//------------------------------------------------------------------------------
// 当日±日数
//------------------------------------------------------------------------------
-(NSDate*)createNSDate:(NSDate*)date incr:(NSInteger)days{
    NSDateComponents *diff = [[NSDateComponents alloc] init];
    diff.day = days;
    return [_calendar dateByAddingComponents:diff toDate:date options:0];
}
//------------------------------------------------------------------------------
// 当月１日
//------------------------------------------------------------------------------
-(NSDate*)createFirstNSDate:(NSDate*)date{
    NSDateComponents *dateComp = [_calendar components:unitDay fromDate:date];
    dateComp.day = 1;
    return [_calendar dateFromComponents:dateComp];
}
//------------------------------------------------------------------------------
// 当月末日
//------------------------------------------------------------------------------
-(NSDate*)createLastNSDate:(NSDate*)date{
    NSInteger lastDay =[_calendar rangeOfUnit:NSCalendarUnitDay
                                       inUnit:NSCalendarUnitMonth
                                      forDate:date].length;
    NSDateComponents *dateComp = [_calendar components:unitDay fromDate:date];
    dateComp.day = lastDay;
    return [_calendar dateFromComponents:dateComp];
}
//------------------------------------------------------------------------------
// 翌月１日
//------------------------------------------------------------------------------
-(NSDate*)createNextFirstNSDate:(NSDate*)date{
    NSDate *firstDate = [self createFirstNSDate:date];
    NSDateComponents *diff = [[NSDateComponents alloc] init];
    diff.month = 1;
    return [_calendar dateByAddingComponents:diff toDate:firstDate options:0];
}
//------------------------------------------------------------------------------
// 翌月末日
//------------------------------------------------------------------------------
-(NSDate*)createNextLastNSDate:(NSDate*)date{
    NSDate *lastDate = [self createLastNSDate:date];
    NSDateComponents *diff = [[NSDateComponents alloc] init];
    diff.month = 1;
    return [_calendar dateByAddingComponents:diff toDate:lastDate options:0];
}
//------------------------------------------------------------------------------
// 前月１日
//------------------------------------------------------------------------------
-(NSDate*)createPreFirstNSDate:(NSDate*)date{
    NSDate *firstDate = [self createFirstNSDate:date];
    NSDateComponents *diff = [[NSDateComponents alloc] init];
    diff.month = -1;
    return [_calendar dateByAddingComponents:diff toDate:firstDate options:0];
}
//------------------------------------------------------------------------------
// 前月末日
//------------------------------------------------------------------------------
-(NSDate*)createPreLastNSDate:(NSDate*)date{
    NSDate *lastDate = [self createLastNSDate:date];
    NSDateComponents *diff = [[NSDateComponents alloc] init];
    diff.month = -1;
    return [_calendar dateByAddingComponents:diff toDate:lastDate options:0];
}
//------------------------------------------------------------------------------
// 月の日数
//------------------------------------------------------------------------------
-(NSInteger)daysOfMonth:(NSDate*)date{
    NSDateComponents* comp = [_calendar components:unitDay fromDate:date];
    NSInteger days =[_calendar rangeOfUnit:NSCalendarUnitDay
                              inUnit:NSCalendarUnitMonth
                             forDate:[_calendar dateFromComponents:comp]].length;
    return days;
}
//------------------------------------------------------------------------------
//NSDate->yyyymmdd(整数)
//------------------------------------------------------------------------------
-(NSInteger)integerYearMonthDay:(NSDate*)date{
    NSDateComponents *dateComp = [_calendar components:unitDay fromDate:date];
    return dateComp.year * 10000 + dateComp.month * 100 + dateComp.day;
}
//------------------------------------------------------------------------------
//NSDate->日付構造体
//------------------------------------------------------------------------------
-(DateRecord)structYearMonthDay:(NSDate*)date{
    DateRecord record;
    NSDateComponents *dateComp = [_calendar components:unitDay fromDate:date];
    record.year = dateComp.year;
    record.month = dateComp.month;
    record.day = dateComp.day;
    return record;
}
//------------------------------------------------------------------------------
//指定された日付の時刻 HHMMSS
//------------------------------------------------------------------------------
-(NSInteger)currentTime:(NSDate*)date{
    NSDateComponents *dateComp = [_calendar components:unitTime fromDate:date];
    return dateComp.hour * 10000 + dateComp.minute * 100 + dateComp.second;
}
//------------------------------------------------------------------------------
//西暦年月->和暦年月の変換（元号・半角スペース・和暦："平成 30"）
//------------------------------------------------------------------------------
-(NSString*)toWareki:(NSDate*)dt{
    return [form stringFromDate:dt];
}
//------------------------------------------------------------------------------
//西暦年月->和暦年月の変換（元号・半角スペース・和暦："平成 30"）
//------------------------------------------------------------------------------
-(NSString*)toWareki:(NSInteger)seireki withMonth:(NSInteger)month{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    NSString *strSeireki = [NSString stringWithFormat:@"%ld-%ld-01", seireki, month];
    NSDate *dt = [formatter dateFromString:strSeireki];
    return [form stringFromDate:dt];
}
@end
