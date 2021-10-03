//------------------------------------------------------------------------------
// UAServerRequest.h
//------------------------------------------------------------------------------
#import <Foundation/Foundation.h>
@interface UAServerRequest : NSObject
//POSTリクエスト(パラメータはid=data形式)　戻り値は、NSArrayオブジェクト
+(NSArray*)post:(NSString*)cmd prmString:(NSString*)param;
//POSTリクエスト(パラメータはNSDictionary) 戻り値は、NSArrayオブジェクト
+(NSArray*)post:(NSString*)cmd prmDictionary:(NSDictionary*)param;
@end
