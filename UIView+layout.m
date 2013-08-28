//
//  UIView+PLKAdditions.m
//  Plank Multimedia Inc.
//
//  Created by Sean Fraser on 2013-08-28.
//  http://www.plankdesign.com/blog/2013/08/making-uiviews-friendlier/
//  Copyright (c) 2013 Plank Multimedia Inc. All rights reserved.
//

@implementation UIView (layout)

//-----------------------------
#pragma mark View Positioning
//-----------------------------

-(CGPoint)viewOrigin{
	return self.frame.origin;
}

-(CGSize)viewSize{
	return self.frame.size;
}

-(CGFloat)viewHeight{
	return self.frame.size.height;
}

-(CGFloat)viewWidth{
	return self.frame.size.width;
}

-(CGFloat)viewX{
	return self.frame.origin.x;
}

-(CGFloat)viewY{
	return self.frame.origin.y;
}

-(CGFloat)viewRightEdge{
	return self.viewX + self.viewWidth;
}

-(CGFloat)viewBottomEdge{
	return self.viewY + self.viewHeight;
}

-(void)setViewOrigin:(CGPoint)viewOrigin{
	CGRect rect = self.frame;
	rect.origin = viewOrigin;
	self.frame = rect;
}

-(void)setViewSize:(CGSize)viewSize{
	CGRect rect = self.frame;
	rect.size = viewSize;
	self.frame = rect;
}

-(void)setViewHeight:(CGFloat)viewHeight{
	CGRect rect = self.frame;
	rect.size.height = viewHeight;
	self.frame = rect;
}

-(void)setViewWidth:(CGFloat)viewWidth{
	CGRect rect = self.frame;
	rect.size.width = viewWidth;
	self.frame = rect;
}

-(void)setViewX:(CGFloat)viewX{
	CGRect rect = self.frame;
	rect.origin.x = viewX;
	self.frame = rect;
}

-(void)setViewY:(CGFloat)viewY{
	CGRect rect = self.frame;
	rect.origin.y = viewY;
	self.frame = rect;
}

-(void)setViewRightEdge:(CGFloat)viewRightEdge{
	CGRect rect = self.frame;
	rect.origin.x = viewRightEdge-self.viewWidth;
	self.frame = rect;
}

-(void)setViewBottomEdge:(CGFloat)viewBottomEdge{
	CGRect rect = self.frame;
	rect.origin.y = viewBottomEdge-self.viewHeight;
	self.frame = rect;
}


-(CGpoint) boundsCenter{
	return CGPointMake(self.bounds.origin.x+self.bounds.size.width/2,self.bounds.origin.y+self.bounds.size.height/2);
}

-(void) frameIntegral{
	self.frame = CGRectIntegral(self.frame);
}

//-------------------------
#pragma mark View Alignment
//-------------------------

-(void)align:(PLKViewAlignment)alignment relativeToPoint:(CGPoint)point{
	switch (alignment) {
		case PLKViewAlignmentTopLeft:
			self.viewOrigin = CGPointMake(point.x, point.y);
			break;
		case PLKViewAlignmentTopCenter:
			self.viewOrigin = CGPointMake(point.x-self.viewWidth/2, point.y);
			break;
		case PLKViewAlignmentTopRight:
			self.viewOrigin = CGPointMake(point.x-self.viewWidth, point.y);
			break;
		case PLKViewAlignmentMiddleLeft:
			self.viewOrigin = CGPointMake(point.x, point.y-self.viewHeight/2);
			break;
		case PLKViewAlignmentCenter:
			self.center     = CGPointMake(point.x, point.y);
			break;
		case PLKViewAlignmentMiddleRight:
			self.viewOrigin = CGPointMake(point.x-self.viewWidth, point.y-self.viewHeight/2);
			break;
		case PLKViewAlignmentBottomLeft:
			self.viewOrigin = CGPointMake(point.x, point.y-self.viewHeight);
			break;
		case PLKViewAlignmentBottomCenter:
			self.viewOrigin = CGPointMake(point.x-self.viewWidth/2, point.y-self.viewHeight);
			break;
		case PLKViewAlignmentBottomRight:
			self.viewOrigin = CGPointMake(point.x-self.viewWidth, point.y-self.viewHeight);
			break;
		default:
			break;
	}
	
	//just to be safe
	[self integralFrame];
}
-(void)align:(PLKViewAlignment)alignment relativeToRect:(CGRect)rect{
	CGPoint point = CGPointZero;
	switch (alignment){
	case PLKViewAlignmentTopLeft:
		point = rect.origin;
		break;
	case PLKViewAlignmentTopCenter:
		point = CGPointMake(rect.origin.x+rect.size.width/2, rect.origin.y);
		break;
	case PLKViewAlignmentTopRight:
		point = CGPointMake(rect.origin.x+rect.size.width, rect.origin.y);
		break;
	case PLKViewAlignmentMiddleLeft:
		point = CGPointMake(rect.origin.x, rect.origin.y +rect.size.height/2);
		break;
	case PLKViewAlignmentCenter:
		point = CGPointMake(rect.origin.x+rect.size.width/2, rect.origin.y+rect.size.height/2);
		break;
	case PLKViewAlignmentMiddleRight:
		point = CGPointMake(rect.origin.x+rect.size.width, rect.origin.y+rect.size.height/2);
		break;
	case PLKViewAlignmentBottomLeft:
		point = CGPointMake(rect.origin.x, rect.origin.y+rect.size.height);
		break;
	case PLKViewAlignmentBottomCenter:
		point = CGPointMake(rect.origin.x+rect.size.width/2, rect.origin.y+rect.size.height);
		break;
	case PLKViewAlignmentBottomRight:
		point = CGPointMake(rect.origin.x+rect.size.width, rect.origin.y+rect.size.height);
		break;
	default:
		return;
	}
	[self align:alignment relativeToPoint:point];
}
@end