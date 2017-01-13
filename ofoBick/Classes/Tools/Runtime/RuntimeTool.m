//
//  RuntimeTool.m
//  ofoBick
//
//  Created by Jack on 17/1/12.
//  Copyright © 2017年 SUP M. All rights reserved.
//

#import "RuntimeTool.h"
#import <objc/runtime.h>

@implementation NSObject (RuntimeTool)



+ (void)printfClassIvars {
    
    [[self alloc] printfClassIvars];

}

- (void)printfClassIvars {
    
    id selfClass = [self class];
    unsigned int numIvars = 0;
    Ivar *ivars = class_copyIvarList(selfClass, &numIvars);
    for(int i = 0; i < numIvars; i++) {
        Ivar ivar = ivars[i];
        const char *ivarName = ivar_getName(ivar);
        const char *ivarType = ivar_getTypeEncoding(ivar);// 获取类型
        
        printf("ivarName:%s\n", ivarName);
        //printf("ivarType:%s\n", ivarType);
    }
    
}



+ (void)printfClassProperties {

    [[self alloc] printfClassProperties];
}

- (void)printfClassProperties {
    
    
    id selfClass = objc_getClass(object_getClassName(self));//获取classA 的类,不同于[ClassA class]返回本身
    unsigned int outCount;//属性数量
    // 获取属性列表
    objc_property_t *properties = class_copyPropertyList(selfClass, &outCount);
    
    // 遍历
    for (int i = 0; i < outCount; i++) {
        
        objc_property_t property = properties[i];
        
        const char *propertyName = property_getName(property);// 获取属性名
        const char *propertyAttributes = property_getAttributes(property);// 获取属性描述
        
        printf("propertyName：%s\n", propertyName);
       // printf("propertyAttributes:%s\n", propertyAttributes);//属性名及描述
    }
    
}

+ (void)printfClassMethods {
    
    [[self alloc] printfClassMethods];

}

- (void)printfClassMethods {

    
    UInt32 count;
    char dst;
    Method *methods = class_copyMethodList([self class], &count);//获取方法列表
    for (int i = 0; i < count; i++) {
        Method method = methods[i];// 获取方法
        SEL methodName = method_getName(method);// 获取方法名
        method_getReturnType(method, &dst, sizeof(char));// 获取方法返回类型
        const char *methodType = method_getTypeEncoding(method);// 获取方法参数类型和返回类型
        NSLog(@"methodName = %@",NSStringFromSelector(methodName));
        //NSLog(@"dst = %c", dst);
    }
    
}




@end
