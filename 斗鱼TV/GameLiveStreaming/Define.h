//
//  Define.h
//  GameLiveStreaming
//
//  Created by qianfeng on 15/10/4.
//  Copyright (c) 2015年 mayongxin. All rights reserved.
//

#ifndef GameLiveStreaming_Define_h
#define GameLiveStreaming_Define_h


#define kScreenSize   [UIScreen mainScreen].bounds.size
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height



//推荐
#define KSlideUrl          @"http://www.douyutv.com/api/v1/slide/6?aid=ios&auth=43323960d2735d70528d6974f608bcc1&client_sys=ios"
#define kRecommendUrl      @"http://www.douyutv.com/api/v1/home_newbie_list?aid=ios&auth=70cdb2b1357e98d5ea0ae922e66123f5&client_sys=ios"
#define kRecmdCategoryUrl  @"http://www.douyutv.com/api/v1/channel?aid=ios&auth=61573e807313a052ff0fed7b447b4af3&client_sys=ios&limit=4"
#define kLoadMoreUrl       @"http://www.douyutv.com/api/v1/live/%@?aid=ios&auth=b22e22d3da9642690c339613e8b9b1ad&client_sys=ios&limit=20&offset=0"


//栏目
#define kColumnUrl         @"http://www.douyutv.com/api/v1/game?aid=ios&auth=5fb0be4609cad468cd3f9326189e280c&client_sys=ios"


//直播
#define kLiveListUrl       @"http://www.douyutv.com/api/v1/live?aid=ios&auth=0400ada58a55a2f8e707bbeb038bdde6&client_sys=ios&limit=20&offset=0"


//搜索页面
#define kSearchingUrl @"http://www.douyutv.com/api/v1/search/%@/1?aid=ios&auth=56924a50bc612dceb7119d2c18a737f3&client_sys=ios&time=1443959400"

#define kSearchNoneUrl @"http://www.douyutv.com/api/v1/search/%@/0?aid=ios&auth=1032b89a9505f8729028da699945c712&client_sys=ios&time=1444013100"

#define kSearchNextUrl @"http://www.douyutv.com/api/v1/room/%@?aid=ios&auth=f64865e31f9c481fbd0eb71eff12d453&client_sys=ios&time=1444013640"




#endif
