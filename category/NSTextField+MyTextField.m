//------------------------------------------------------------------------------
// カテゴリ実装:NSTextField
//------------------------------------------------------------------------------
#import "NSTextField+MyTextField.h"

@implementation NSTextField (MyTextField)
//文字列を設定し、文字列の大きさに合わせてframeサイズを変更する。
-(void)setText:(NSString*)text
{
    self.stringValue = text;
    NSSize size = [text sizeWithAttributes:@{NSFontAttributeName:self.font}];
    size.width += 4; 
    [self setFrameSize:size];
}

@end
