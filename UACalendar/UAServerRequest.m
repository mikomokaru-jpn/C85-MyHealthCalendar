//------------------------------------------------------------------------------
// UAServerRequest.m
//------------------------------------------------------------------------------
#import "UAServerRequest.h"
@implementation UAServerRequest
//------------------------------------------------------------------------------
// POSTで送る(パラメータはid=data形式)
// 受信データはJSON形式で受け取り、NSArrayオブジェクト（レコードのリスト）に変換し戻り値にする。
//------------------------------------------------------------------------------
+(NSArray*)post:(NSString*)cmd prmString:(NSString*)param{
    //POSTパラメータ文字列をNSData形式に変換
    NSData *requestData = [param dataUsingEncoding:NSUTF8StringEncoding];
    //HTTPリクエストメッセージの作成
    NSMutableURLRequest *request = [self createRequest:cmd
                                                  data:requestData
                                                  type:@"application/x-www-form-urlencoded"];
    //送受信（同期通信）
    return [self doRequest:request];
}


+(NSArray*)post:(NSString*)cmd prmDictionary:(NSDictionary*)param{
    //辞書形式のパラメータをJSON形式文字列に変換 -> NSData形式に変換
    NSData *requestData =  [NSJSONSerialization dataWithJSONObject:param
                            options:NSJSONWritingPrettyPrinted
                            error:nil];
    //HTTPリクエストメッセージの作成
    NSMutableURLRequest *request = [self createRequest:cmd
                                                  data:requestData
                                                  type:@"application/json"];
    //送受信（同期通信）
    return [self doRequest:request];
}
//------------------------------------------------------------------------------
//HTTPリクエストメッセージの作成
//------------------------------------------------------------------------------
+(NSMutableURLRequest*)createRequest:(NSString*)cmd
                                data:(NSData*)data
                                type:(NSString*)type{
    //URLオブジェクトの作成
    NSURL *url = [NSURL URLWithString:cmd];
    //URL
    NSMutableURLRequest *request= [NSMutableURLRequest requestWithURL:url];
    //メソッド
    [request setHTTPMethod:@"POST"];
    //リクエストヘッダ：受信データ形式
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    //リクエストヘッダ：コンテンツ種別：id=dataの形式
    [request setValue:type forHTTPHeaderField:@"Content-Type"];
    //リクエストヘッダ：コンテンツ長(POSTデータのバイト数)
    [request setValue:[NSString stringWithFormat:@"%ld",[data length]]
     forHTTPHeaderField:@"Content-Length"];
    //リクエストヘッダ：メッセージボディ(POSTデータ)をセット
    [request setHTTPBody:data];
    return request;
}

//------------------------------------------------------------------------------
// HTTP送受信
//------------------------------------------------------------------------------
+(NSArray*)doRequest:(NSMutableURLRequest*)request{
    //GCDを利用して、HTTPリクエスト処理の終了まで待つ（同期する）
    //dispatch_semaphore_waitで処理を待機し、dispatch_semaphore_signalの実行により再開する。
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    //戻り値の変数定義：Blocksの中で値の変更を許可する。__block
    __block NSArray* responseList = nil;
    
    //ネットワーク通信オブジェクトの生成（一時セッション）
    NSURLSessionConfiguration *configuration =
        [NSURLSessionConfiguration ephemeralSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    //データの送受信：バックグラウンドで実行する
    NSURLSessionDataTask *task =
        [session dataTaskWithRequest:request
        completionHandler:^(NSData * _Nullable data,
                            NSURLResponse * _Nullable response,
                            NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
            dispatch_semaphore_signal(semaphore);   //taskの終了を通知する
            return;
        }
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if (httpResponse.statusCode != 200) {
            NSLog(@"statusCode:%ld", httpResponse.statusCode);
            dispatch_semaphore_signal(semaphore);   //taskの終了を通知する
            return;
        }
        //NSLog(@"OK statusCode:%ld", httpResponse.statusCode);
        //レスポンスデータは、NSData* data に格納されている。
        responseList =
          [NSJSONSerialization JSONObjectWithData:data
                                          options:NSJSONReadingMutableContainers
                                            error:nil];
        dispatch_semaphore_signal(semaphore);
    }];
    [task resume];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);  //taskの終了を待つ
    /* [request setTimeoutInterval:10]; */
    return responseList;
}
@end
