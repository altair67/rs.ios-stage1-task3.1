#import "Combinator.h"

@implementation Combinator
- (NSNumber*)chechChooseFromArray:(NSArray <NSNumber*>*)array {
    
    NSInteger m = [[array firstObject] integerValue];
    NSInteger n = [[array lastObject] integerValue];
    NSInteger x;
    
    if ( m == n) {
        return @1;
    }
    
    for (NSInteger i = 1; i < n; i++) {
        x = i;
        NSInteger nFact = [self factorial:n];
        NSInteger den = [self factorial:x] * [self factorial:(n - x)];
        double res = nFact/den;
        
        if ( res == m) {
            return [NSNumber numberWithInteger:x];
        }
    }
    return nil;    
}

- (NSInteger)factorial:(NSInteger)num {
    NSInteger numRes = 1;
    
    for (NSInteger i = 1; i <= num; i++) {
        numRes = numRes * i;
    }
    return numRes;
}
@end
