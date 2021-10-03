#import "UAAcceptButton.h"
//------------------------------------------------------------------------------
// 確定チェックボックス
//------------------------------------------------------------------------------
@implementation UAAcceptButton
//ファーストレスポンダーを受け入れる
- (BOOL)acceptsFirstResponder{
    return YES;
}
//確定チェックボックスの操作
-(void)keyDown:(NSEvent *)theEvent{
    //NSLog(@"UAAcceptButton keyDown:%d", theEvent.keyCode);
    if (theEvent.keyCode == 48 || theEvent.keyCode == 36){
        [_delegate KeyDownFromUAButton:self event:theEvent];
    }else{
        [super keyDown:theEvent];
    }
}
@end
