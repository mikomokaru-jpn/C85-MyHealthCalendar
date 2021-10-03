
#import "AppDelegate.h"
//------------------------------------------------------------------------------
// カレンダー＆血圧入力
//------------------------------------------------------------------------------
@interface AppDelegate ()
@property (weak) IBOutlet NSWindow *window;
@property UAView *uaView;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    //カレンダを作成してメインウインドウ上に表示する。
    _uaView = [[UAView alloc] initWindowCenter];
    [[_window contentView] addSubview:_uaView];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
}

//Docのアイコンをクリックしたらウィンドウを再表示する（NSApplicationDelegate）
- (BOOL)applicationShouldHandleReopen:(NSApplication *)sender
                    hasVisibleWindows:(BOOL)flag {
    if (!flag)
    {
        for (NSWindow *openWindow in sender.windows) {
            if (openWindow == _window)
            {
                [openWindow makeKeyAndOrderFront:self];
            }
        }
    }
    return YES;
}
// メインウィンドウを閉じる前（WindowDelegate）
- (void)windowWillClose:(NSNotification *)notification
{
    if (_uaView.resultCntrl){
        [_uaView.resultCntrl.window close];
    }
}

@end
