//
//  FRWaterfallLayout.swift
//  FRKit
//
//  Created by free on 2019/4/20.
//  Copyright © 2019 free. All rights reserved.
//

import UIKit

class FRWaterfallLayout: UICollectionViewFlowLayout {
    
    enum LayoutType : String {
        case twoColumn, threeColumn, sixColumn, twelveColumn
        
        var column : Int {
            switch self {
            case .twoColumn: return 2
            case .threeColumn : return 3
            case .sixColumn : return 6
            case .twelveColumn : return 12
            }
        }
        
        var keyName : String {
            switch self {
            case .twoColumn : return "two"
            case .threeColumn : return "three"
            case .sixColumn : return "six"
            case .twelveColumn : return "twelve"
            }
        }
    }

    var layoutType : LayoutType = .twoColumn
    
    var items = [UIImage]()
    
    fileprivate lazy var layoutAttributes : [String : [UICollectionViewLayoutAttributes]] = {
        return [String : [UICollectionViewLayoutAttributes]]()
    }()
    
    fileprivate lazy var layoutItemSize : [String : CGSize] = {  return [String : CGSize]() }()
    
    override func prepare() {
        super.prepare()
        
        minimumInteritemSpacing = 10
        minimumLineSpacing = 10
        sectionInset.top = 10
        sectionInset.left = 10
        sectionInset.right = 10
        
        // 如果之前没有计算过 layout 则计算并存入 cache 中
        if layoutAttributes[layoutType.keyName] == nil && collectionView != nil {
            // 根据想要的 column 数量来计算一个 cell 的宽度
            let contentWidth : CGFloat = collectionView!.bounds.size.width - sectionInset.left - sectionInset.right
            let itemWidth = (contentWidth - minimumInteritemSpacing * (CGFloat(layoutType.column)-1)) / CGFloat(layoutType.column)
            // 计算 cell 的布局
            computeAndStoreAttributes(layoutType, itemWidth)
        }
        
        if let size = layoutItemSize[layoutType.keyName] { itemSize = size  }
        
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return layoutAttributes[layoutType.keyName]
    }
    
    /// 计算 cell 的 frame 以及设定 item size 来提供系统计算 UICollectionView 的 contentSize
    fileprivate func computeAndStoreAttributes(_ layoutType : LayoutType, _ itemWidth : CGFloat) {
        
        // 以 sectionInset.top 作为最初始的高度，记录每一个column的高度
        var columnHeights = [CGFloat](repeating: sectionInset.top, count: layoutType.column)
        
        // 记录每一个column的item个数
        var columnItemCount = [Int](repeating: 0, count: layoutType.column)
        
        // 记录每一个cell的attributes
        var attributes = [UICollectionViewLayoutAttributes]()
        
        var row = 0
        
        for _ in items {
            // 建立一个attribute
            let indexPath = IndexPath.init(row: row, section: 0)
            let attribute = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            
            // 找出最短的 column
            let minHeight = columnHeights.sorted().first!
            let minHeightColumn = columnHeights.firstIndex(of: minHeight)!
            
            // 新的照片放到最短 column 上
            columnItemCount[minHeightColumn] += 1
            
            let itemX = (itemWidth + minimumInteritemSpacing) * CGFloat(minHeightColumn) + sectionInset.left
            let itemY = minHeight
            // 计算高度，按照原图片大小等比例缩放，可调整这个来改变高度
//            let itemHeight = item.size.height * itemWidth / item.size.width
            let itemHeight = (UIScreen.main.bounds.size.width - 30) / 2
            
            // 设定 frame，加入到 attributes 中
            attribute.frame = CGRect(x: itemX, y: itemY, width: itemWidth, height: CGFloat(itemHeight))
            attributes.append(attribute)
            
            // 计算最短的 column 当前的高度
            columnHeights[minHeightColumn] += itemHeight + minimumLineSpacing
            
            row += 1
        }
        
        // 找出最高的 column
        let maxHeight = columnHeights.sorted().last!
        let column = columnHeights.firstIndex(of: maxHeight)
        
        // 用于系统计算 collectionView 的 contentSize - 根据最高的 Column 来设置 itemSize，使用总高度的平均值
        let itemHeight = (maxHeight - minimumLineSpacing * CGFloat(columnItemCount[column!])) / CGFloat(columnItemCount[column!])
        let cellSize = CGSize(width: itemWidth, height: itemHeight)
        
        // 将计算后的结果保存起来
        layoutAttributes[layoutType.keyName] = attributes
        layoutItemSize[layoutType.keyName] = cellSize
        
    }

}
