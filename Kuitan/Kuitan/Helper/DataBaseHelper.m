//
//  DataBaseHelper.m
//  Kuitan
//
//  Created by lanouhn on 15/10/22.
//  Copyright (c) 2015年 S&G. All rights reserved.
//

#import "DataBaseHelper.h"
#import <UIKit/UIKit.h>

@interface DataBaseHelper ()

@property (nonatomic,retain) NSMutableArray *dataArr;//存放数据

@end

static DataBaseHelper *helper = nil;
@implementation DataBaseHelper

- (void)dealloc {
    self.dataArr = nil;
    [super dealloc];
}

- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        self.dataArr = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataArr;
}

/**
 *  返回分区的行数
 */
+ (NSInteger)numberOfRowAtSection {
    return [self sharedDataBaseHelper].dataArr.count;
}

/**
 *  返回cell的model对象
 */
+ (DetailModel *)modelAtIndexPath:(NSIndexPath *)indexPath {
    DetailModel *model = [self sharedDataBaseHelper].dataArr[indexPath.row];
    return model;
}

/**
 *  添加数据
 */
+ (void)addDataModel:(DetailModel *)model {
    [self sharedDataBaseHelper];
    //往数据库中添加
    [[self sharedDataBaseHelper].dataArr addObject:model];
    [self insertIntoTableInDataBase:model];
}

/**
 *  删除cell操作
 */
+ (void)deleteModelInSection:(NSIndexPath *)indexPath {
    //从内存中删除
    DetailModel *model = helper.dataArr[indexPath.row];
    [helper.dataArr removeObject:model];
    //从数据库中删除
    [self deleteDataInTableAtDataBase:[model.RecipeId integerValue]];
}

/**
 *  查询是否已经收藏过
 */
+ (BOOL)selectExistOrNotByKey:(NSString *)mainKey {
    [self sharedDataBaseHelper];
    for (int i = 0; i < helper.dataArr.count; i++) {
        DetailModel *model = helper.dataArr[i];
        if ([mainKey isEqualToString:[NSString stringWithFormat:@"%@",model.RecipeId]]) {
            return YES;
            break;
        }
    }
    return NO;
}


+ (void)moveFromIndexPath:(NSIndexPath *)sourceIndexPath ToIndexPath:(NSIndexPath *)destinationIndexPath {
    //
    [helper.dataArr removeObjectAtIndex:sourceIndexPath.row];
    DetailModel *model = helper.dataArr[sourceIndexPath.row];
    [helper.dataArr insertObject:model atIndex:destinationIndexPath.row];
}


#pragma mark ************** 数据库操作 *************
/**
 *  创建单例
 */
+ (DataBaseHelper *)sharedDataBaseHelper {
    @synchronized(self) {
        if (helper == nil) {
            helper = [[DataBaseHelper alloc] init];
            [self createNewTableInDataBase];
            [self selectDataInTableAtDataBase];
        }
    }
    return helper;
}

/**
 *  新建表操作
 */
+ (void)createNewTableInDataBase {
    //创建SQL语句
    NSString *createString = @"create table if not exists CaiPu1 (con_RecipeId integer primary key autoincrement,con_Title text,con_Cover text,con_Stuff,con_Duration text)";
    NSString *message = @"创建表语句正确";
    //创建SQL指令集对象
    sqlite3_stmt *stmt = [DataBaseHelper allSQLMethod:createString message:message];
    //绑定参数
    //执行SQL语句
    int flag = sqlite3_step(stmt);
    if (flag == SQLITE_DONE) {
        NSLog(@"创建表操作成功");
    }
    //释放资源
    sqlite3_finalize(stmt);
    //关闭数据库
    [DataBaseManager closeMyDataBase];
}

/**
 *  添加数据操作
 */
+ (void)insertIntoTableInDataBase:(DetailModel *)model {
    NSString *addString = @"insert into CaiPu1 (con_RecipeId, con_Title, con_Cover,con_Stuff,con_Duration) values(?,?,?,?,?)";
    NSString *message = @"插入语法正确";
    sqlite3_stmt *stmt = [DataBaseHelper allSQLMethod:addString message:message];
    //绑定参数
    //Id
    sqlite3_bind_int(stmt, 1, (int)[model.RecipeId integerValue]);
    //Title
    sqlite3_bind_text(stmt, 2, [model.Title UTF8String], -1, nil);
    //Cover
    sqlite3_bind_text(stmt, 3, [model.Cover UTF8String], -1, nil);
    //Collection
//    sqlite3_bind_text(stmt, 4, [model.Collection UTF8String], -1, nil);
    //Stuff
    sqlite3_bind_text(stmt, 4, [model.Stuff UTF8String], -1, nil);
    //Duration
    sqlite3_bind_text(stmt, 5, [model.Duration UTF8String], -1, nil);
    //执行SQL语句
    int flag = sqlite3_step(stmt);
    if (flag == SQLITE_DONE) {
        NSLog(@"插入操作成功");
    }
    //释放资源
    sqlite3_finalize(stmt);
    //关闭数据库
    [DataBaseManager closeMyDataBase];
}

/**
 *  删除数据操作
 */
+ (void)deleteDataInTableAtDataBase:(NSInteger)RecipeId {
    NSString *deleteString = @"delete from CaiPu1 where con_RecipeId = ?";
    NSString *message = @"删除语句正确";
    sqlite3_stmt *stmt = [self allSQLMethod:deleteString message:message];
    sqlite3_bind_int(stmt, 1, (int)RecipeId);
    //绑定参数
    //执行SQL语句
    int flag = sqlite3_step(stmt);
    if (flag == SQLITE_DONE) {
        NSLog(@"删除操作成功");
    }
    //释放资源
    sqlite3_finalize(stmt);
    //关闭数据库
    [DataBaseManager closeMyDataBase];
}

/**
 *  查询数据库数据操作
 */
+ (void)selectDataInTableAtDataBase {
    NSString *selectString = @"select * from CaiPu1";
    NSString *message = @"查询语句正确";
    sqlite3_stmt *stmt = [self allSQLMethod:selectString message:message];
    //绑定参数
    //执行SQL语句
    while (sqlite3_step(stmt) == SQLITE_ROW) {
        NSInteger RecipeId = sqlite3_column_int(stmt, 0);
        char *Title = (char *)sqlite3_column_text(stmt, 1);
        char *Cover = (char *)sqlite3_column_text(stmt, 2);
//        char *Collection = (char *)sqlite3_column_text(stmt, 3);
        char *Stuff = (char *)sqlite3_column_text(stmt, 3);
        char *Duration = (char *)sqlite3_column_text(stmt, 4);
        DetailModel *model = [[DetailModel alloc] init];
        model.RecipeId = @(RecipeId);
        model.Title = [NSString stringWithUTF8String:Title];
        model.Cover = [NSString stringWithUTF8String:Cover];
//        model.Collection = [NSString stringWithUTF8String:Collection];
        model.Stuff = [NSString stringWithUTF8String:Stuff];
        model.Duration = [NSString stringWithUTF8String:Duration];
        [[self sharedDataBaseHelper].dataArr addObject:model];
    }
    //释放资源
    sqlite3_finalize(stmt);
    //关闭数据库
    [DataBaseManager closeMyDataBase];
}

/**
 *  SQL指令集
 */
+ (sqlite3_stmt *)allSQLMethod:(NSString *)sqlString message:(NSString *)message {
    //1.打开数据库
    sqlite3 *db = [DataBaseManager openMyDataBase];
    //2.SQL语句
    //3.创建指令集对象
    sqlite3_stmt *stmt = nil;
    //4.检查SQL语句是否正确
    int flag = sqlite3_prepare(db, [sqlString UTF8String], -1, &stmt, 0);
    if (flag == SQLITE_OK) {
        NSLog(@"%@",message);
    }
    return stmt;
}
@end
