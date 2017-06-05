/*
 * This file is part of the JPNavigationController package.
 * (c) NewPan <13246884282@163.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * Click https://github.com/Chris-Pan
 * or http://www.jianshu.com/users/e2f2d779c022/latest_articles to contact me.
 */

/**
 * This class is custom navigation bar.
 * Framework add the link container view on it, then the link view is out of its super class' range, this lead to link view cannot response user's touch events. we need handle this situation by override hitTest:withEvent: method.
 * 这个类是自定义导航条.
 * 我们要添加的联动底部视图View就是添加在他身上，当我们把联动的底部视图添加到导航条上以后，联动视图就超出父控件的范围，不能响应点击事件了, 所以我们在hitTest:withEvent:方法里处理这种情况。
 */

#import <UIKit/UIKit.h>

@interface JPLinkContainerView : UIView
@end

@interface JPNavigationBar : UINavigationBar
@end
