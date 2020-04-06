#import "PolynomialConverter.h"

@implementation PolynomialConverter
- (NSString*)convertToStringFrom:(NSArray <NSNumber*>*)numbers {
    
            NSInteger count = numbers.count;
            NSInteger coeff;
            NSString *newEqt = @"";
   
            if(numbers.count == 0) {
                return nil;
            }
    
            for (NSInteger i = 0; i < numbers.count; i++) {
                if  ([numbers[i] integerValue] == 0) {
                    count--;
                } else if ([newEqt isEqualToString:@""]) {
                    if (numbers.count <= 2) {
                     if ([numbers[i] integerValue] == 1) {
                        newEqt = [newEqt stringByAppendingFormat:@"x "];
                     } else if ([numbers[i] integerValue] == -1) {
                        newEqt = [newEqt stringByAppendingFormat:@"-x "];
                     } else {
                        newEqt = [newEqt stringByAppendingFormat:@"%@x ",[numbers[i] stringValue]];
                     }
                    } else if ([numbers[i] integerValue] == 1) {
                        newEqt = [newEqt stringByAppendingFormat:@"x^%ld ", count-1];
                        count--;
                    } else if ([numbers[i] integerValue] == -1){
                        newEqt = [newEqt stringByAppendingFormat:@"-x^%ld ", count-1];
                        count--;
                    } else {
                    newEqt = [newEqt stringByAppendingFormat:@"%@x^%ld ", [numbers[i] stringValue], count-1];
                    count--;
                    }
                } else if ([numbers[i] integerValue] > 0) {
                    if ( i == numbers.count - 1 ) {
                        newEqt = [newEqt stringByAppendingFormat:@"+ %@ ", [numbers[i] stringValue]];
                    } else if (i == numbers.count-2) {
                        if ([numbers[i] integerValue] == 1) {
                        newEqt = [newEqt stringByAppendingFormat:@"+ x "];
                        } else {
                        newEqt = [newEqt stringByAppendingFormat:@"+ %@x ",[numbers[i] stringValue]];
                        }
                    } else if ([numbers[i] integerValue] == 1) {
                        newEqt = [newEqt stringByAppendingFormat:@"+ x^%ld ",count-1];
                        count--;
                    } else {
                        newEqt = [newEqt stringByAppendingFormat:@"+ %@x^%ld ", [numbers[i] stringValue], count-1];
                        count--;
                    }
                } else {
                    coeff = [numbers[i] integerValue] * -1;
                    if ( i == numbers.count - 1) {
                        newEqt = [newEqt stringByAppendingFormat:@"- %@ ", [NSString stringWithFormat:@"%ld",coeff]];
                    } else if (i == numbers.count-2) {
                        if (coeff == 1) {
                        newEqt = [newEqt stringByAppendingFormat:@"- x "];
                        } else {
                        newEqt = [newEqt stringByAppendingFormat:@"- %@x ",[NSString stringWithFormat:@"%ld",coeff]];
                        }
                    } else if (coeff == 1) {
                        newEqt = [newEqt stringByAppendingFormat:@"- x^%ld ",count-1];
                        count--;
                    } else {
                        newEqt = [newEqt stringByAppendingFormat:@"- %@x^%ld ", [NSString stringWithFormat:@"%ld",coeff], count-1];
                        count--;
                    }
                }
            }
            newEqt = [newEqt substringToIndex:[newEqt length]-1];
            
    return newEqt;
}
@end
