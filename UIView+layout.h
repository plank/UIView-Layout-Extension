//
//  UIView+PLKAdditions.h
//  Plank Multimedia Inc.
//
//  Created by Sean Fraser on 2013-08-28.
//  http://www.plankdesign.com/blog/2013/08/making-uiviews-friendlier/
//  Copyright (c) 2013 Plank Multimedia Inc. All rights reserved.
//

typedef enum{
	PLKViewAlignmentTopLeft,
	PLKViewAlignmentTopCenter,
	PLKViewAlignmentTopRight,
	PLKViewAlignmentMiddleLeft,
	PLKViewAlignmentCenter,
	PLKViewAlignmentMiddleRight,
	PLKViewAlignmentBottomLeft,
	PLKViewAlignmentBottomCenter,
	PLKViewAlignmentBottomRight,
} PLKViewAlignment;


@interface UIView (layout)
	
	//-----------------------------
	#pragma mark - View Positioning
	//-----------------------------
	
	//access frame fields individually
	@property (nonatomic) CGFloat viewWidth;		//view.frame.size.width
	@property (nonatomic) CGFloat viewHeight;		//view.frame.size.height
	@property (nonatomic) CGFloat viewX;			//view.frame.origin.x
	@property (nonatomic) CGFloat viewY;			//view.frame.origin.y
	@property (nonatomic) CGPoint viewOrigin;		//view.frame.origin
	@property (nonatomic) CGSize  viewSize;			//view.frame.size
	@property (nonatomic) CGFloat viewRightEdge;	//view.frame.origin.x + view.frame.size.width
	@property (nonatomic) CGFloat viewBottomEdge;	//view.frame.origin.y + view.frame.size.height

	//get the point at the center of the view's bounds
	- (CGPoint) boundsCenter;

	//round frame coordinates to nearest integer
	- (void) frameIntegral;

	//-------------------------
	#pragma mark View Alignment
	//-------------------------

	//align the view relative to a point. Place the specified edge at the point
	-(void)align:(PLKViewAlignment)alignment relativeToPoint:(CGPoint)point;

	//align the view relative to a rectangle
	-(void)align:(PLKViewAlignment)alignment relativeToRect:(CGRect)rect;

@end