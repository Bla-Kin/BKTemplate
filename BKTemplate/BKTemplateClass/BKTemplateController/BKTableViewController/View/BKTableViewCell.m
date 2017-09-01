//
//  BKTableViewCell.m
//  BKTemplate
//
//  Created by 优选智胜 on 2017/6/8.
//  Copyright © 2017年 King. All rights reserved.
//

#import "BKTableViewCell.h"

@implementation BKTableViewCell

+ (instancetype)dequeueReusableCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    BKTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.className forIndexPath:indexPath];
    
    cell.indexPath = indexPath;
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createControl];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self setupConstraint];
}

- (void)createControl {}

- (void)setupConstraint {
    if (_bk_imageView ||
        _bk_textLabel ||
        _bk_detailTextLabel ||
        _bk_indicator ||
        _bk_textField) [self setupBaseConstraint];
}

- (UIImageView *)bk_imageView {
    if (!_bk_imageView) {
        _bk_imageView = [UIImageView new];
        _bk_imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_bk_imageView];
    }
    return _bk_imageView;
}

- (YYLabel *)bk_textLabel {
    if (!_bk_textLabel) {
        _bk_textLabel = [YYLabel new];
        _bk_textLabel.text = @"bk_textLabel";
        _bk_textLabel.textColor = [UIColor blackColor];
        _bk_textLabel.textAlignment = NSTextAlignmentLeft;
        
        if (IPhone_5) {
            _bk_textLabel.font = System_Font(13.f);
        } else if (IPhone_6) {
            _bk_textLabel.font = System_Font(13.f);
        } else if (IPhone_6P) {
            _bk_textLabel.font = System_Font(14.f);
        } else {
            _bk_textLabel.font = System_Font(Layout_Width(13.f));
        }
        [self.contentView addSubview:_bk_textLabel];
    }
    return _bk_textLabel;
}

- (YYLabel *)bk_detailTextLabel {
    if (!_bk_detailTextLabel) {
        _bk_detailTextLabel = [YYLabel new];
        _bk_detailTextLabel.text = @"bk_detailTextLabel";
        _bk_detailTextLabel.textColor = [UIColor darkTextColor];
        _bk_detailTextLabel.textAlignment = NSTextAlignmentRight;
        if (IPhone_5) {
            _bk_detailTextLabel.font = System_Font(13.f);
        } else if (IPhone_6) {
            _bk_detailTextLabel.font = System_Font(13.f);
        } else if (IPhone_6P) {
            _bk_detailTextLabel.font = System_Font(14.f);
        } else {
            _bk_detailTextLabel.font = System_Font(Layout_Width(13.f));
        }
        [self.contentView addSubview:_bk_detailTextLabel];
    }
    return _bk_detailTextLabel;
}

- (void)setBk_accessoryType:(UITableViewCellAccessoryType)bk_accessoryType {
    _bk_accessoryType = bk_accessoryType;
    
    if (_bk_accessoryType == UITableViewCellAccessoryDisclosureIndicator) {
        [self.bk_indicator setImage:Image_Name(@"right_Arrow")];
    } else {
        self.accessoryType = _bk_accessoryType;
    }
}

- (UIImageView *)bk_indicator {
    if (!_bk_indicator) {
        _bk_indicator = [UIImageView new];
        _bk_indicator.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_bk_indicator];
    }
    return _bk_indicator;
}

- (UITextField *)bk_textField {
    if (!_bk_textField) {
        _bk_textField = [UITextField new];
        _bk_textField.placeholder = @"bk_textField";
        _bk_textField.textColor = [UIColor darkTextColor];
        _bk_textField.textAlignment = NSTextAlignmentLeft;
        if (IPhone_5) {
            _bk_textField.font = System_Font(13.f);
        } else if (IPhone_6) {
            _bk_textField.font = System_Font(13.f);
        } else if (IPhone_6P) {
            _bk_textField.font = System_Font(14.f);
        } else {
            _bk_textField.font = System_Font(Layout_Width(13.f));
        }
        [self.contentView addSubview:_bk_textField];
    }
    return _bk_textField;
}

- (void)setupBaseConstraint {
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (IPhone_6P) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 20, 0, 20));
        } else {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 15, 0, 15));
        }
    }];
    
    if (_bk_imageView) {
        [_bk_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@0);
            
            make.top.equalTo(@12);
            
            make.bottom.equalTo(@-12);
            
            make.width.equalTo(_bk_imageView.mas_height);
        }];
    }
    
    if (_bk_textLabel) {
        [_bk_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(@0);
            
            if (_bk_imageView) {
                make.left.equalTo(_bk_imageView.mas_right).offset(10);
            } else {
                make.left.equalTo(@0);
            }
        }];
    }
    
    if (_bk_indicator) {
        [_bk_indicator mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@0);
            
            make.centerY.equalTo(@0);
            
            make.size.mas_equalTo(CGSizeMake(8, 15));
        }];
    }
    
    if (_bk_detailTextLabel) {
        [_bk_detailTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(@0);
            
            if (_bk_indicator) {
                make.right.equalTo(_bk_indicator.mas_left).offset(-10);
            } else {
                make.right.equalTo(@0);
            }
            
            make.left.equalTo(_bk_textLabel.mas_right).offset(10);
        }];
        
        [_bk_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(_bk_detailTextLabel.mas_width);
        }];
    }
    
    if (_bk_textField) {
        [_bk_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@12);
            
            make.bottom.equalTo(@-12);
            
            make.right.equalTo(@0);
            
            if (_bk_textLabel) {
                make.left.equalTo(_bk_textLabel.mas_right).offset(10);
            } else {
                make.left.equalTo(@0);
            }
        }];
        
        if (_bk_textLabel) {
            _bk_textField.textAlignment = NSTextAlignmentRight;
            [_bk_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(_bk_textField.mas_width);
            }];
        }
    }
}

+ (CGFloat)height {
    if (IPhone_6) {
        return 42.f;
    } else if (IPhone_6P) {
        return 45.f;
    }
    return Layout_Width(40.f);
}

@end
