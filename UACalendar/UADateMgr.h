//------------------------------------------------------------------------------
// 日付操作ユーティリティ
//------------------------------------------------------------------------------
#import <Foundation/Foundation.h>
@interface UADateMgr : NSObject
//日付構造体
typedef struct{
    NSInteger year;
    NSInteger month;
    NSInteger day;
}DateRecord;
//日付操作ユーティリティオブジェクト(シングルトン)を返す。
+(UADateMgr *)DateManager;
//指定したNSDateオブジェクトからUADateオブジェクトを作成する
//-(UADate*)createUADate:(NSDate*)date;
//NSDateオブジェクトを返す：指定の日付から日数を加減算した日付
-(NSDate*)createNSDate:(NSDate*)date incr:(NSInteger)days;
//NSDateオブジェクトを返す：当月1日
-(NSDate*)createFirstNSDate:(NSDate*)date;
//NSDateオブジェクトを返す：当月末日
-(NSDate*)createLastNSDate:(NSDate*)date;
//NSDateオブジェクトを返す：前月1日
-(NSDate*)createPreFirstNSDate:(NSDate*)date;
//NSDateオブジェクトを返す：前月末日
-(NSDate*)createPreLastNSDate:(NSDate*)date;
//NSDateオブジェクトを返す：翌月1日
-(NSDate*)createNextFirstNSDate:(NSDate*)date;
//NSDateオブジェクトを返す：翌月末日
-(NSDate*)createNextLastNSDate:(NSDate*)date;
//月の日数
-(NSInteger)daysOfMonth:(NSDate*)date;
//NSDate->yyyymmdd(整数)
-(NSInteger)integerYearMonthDay:(NSDate*)date;
//NSDate->日付構造体
-(DateRecord)structYearMonthDay:(NSDate*)date;
//指定された日付の時刻 HHMMSS
-(NSInteger)currentTime:(NSDate*)date;
//西暦年月->和暦年月の変換（元号・半角スペース・和暦："平成 30"）
-(NSString*)toWareki:(NSDate*)dt;
-(NSString*)toWareki:(NSInteger)seireki withMonth:(NSInteger)month;
@end
