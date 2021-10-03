#import <Cocoa/Cocoa.h>

@interface UATextAttribute : NSObject
//文字列装飾属性 *****************************************************************
//フォント名、フォントサイズ、文字色指定
+(NSDictionary*)makeAttributesFontName:(NSString*)fontName
                              FontSize:(float)size
                             ForeColor:(NSColor*)color;
//（デフォルト）
+(NSDictionary*)makeAttributes;
//フォントサイズ指定
+(NSDictionary*)makeAttributesFontSize:(float)size;
//文字色指定
+(NSDictionary*)makeAttributesForeColor:(NSColor*)color;
//フォントサイズ、文字色指定
+(NSDictionary*)makeAttributesFontSize:(float)size
                             ForeColor:(NSColor*)color;
//修飾文字列 *********************************************************************
//フォント名、フォントサイズ、文字色指定
+(NSMutableAttributedString*)attributedString:(NSString*)str
                                     FontName:(NSString*)name
                                     FontSize:(float)size
                                    ForeColor:(NSColor*)color;
//フォントサイズ指定
+(NSMutableAttributedString*)attributedString:(NSString*)str
                                     FontSize:(float)size;
//フォントサイズ、文字色指定
+(NSMutableAttributedString*)attributedString:(NSString*)str
                                     FontSize:(float)size
                                    ForeColor:(NSColor*)color;
@end
