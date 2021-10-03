//------------------------------------------------------------------------------
// カテゴリ実装:NSColor
//------------------------------------------------------------------------------
#import "NSColor+MyColor.h"

@implementation NSColor (MyColor)
//RGB値を指定してNSColorオブジェクトを作成する（RGB値は一般的な0〜255の値で指定する）
+(NSColor*)myColorR:(float)r G:(float)g B:(float)b{
    return [NSColor colorWithRed:r/255 green:g/255 blue:b/255 alpha:1.0];
}
//RGB値とalph値を指定してNSColorオブジェクトを作成する（alph値は0〜1で指定)
+(NSColor*)myColorR:(float)r G:(float)g B:(float)b alph:(float)a
{
    return [NSColor colorWithRed:r/255 green:g/255 blue:b/255 alpha:a];
}

@end

