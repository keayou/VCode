//
//  ArrayHandler.swift
//  VCode
//
//  Created by fk on 2021/5/30.
//

import Foundation


@objc public class ArraySolution: NSObject {
    
    /*
     给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。
     你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。
     你可以按任意顺序返回答案。

     链接：https://leetcode-cn.com/problems/two-sum
     */
    @objc public static func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        guard nums.count > 1 else {
            return []
        }
        
        var tempDict = Dictionary<Int, Int>()
        
        for (idx, num) in nums.enumerated() {
            
            let q = target - num
            if let index = tempDict[q] {
                return [index, idx]
            }
             
            tempDict[num] = idx
        }
        return []
    }
    
    /*
     给你一个有序数组 nums ，请你 原地 删除重复出现的元素，使每个元素 只出现一次 ，返回删除后数组的新长度。
     不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。

     链接：https://leetcode-cn.com/problems/remove-duplicates-from-sorted-array
     
     var list = [1, 2, 2, 3, 3, 4]
     let re = removeDuplicates(&list)
     */
    func removeDuplicates(_ nums: inout [Int]) -> Int {

        guard nums.count > 1 else {
            return nums.count
        }
        
        var cur = nums.first!
        let count = nums.count
        var deleteCount = 0
        
        for idx in 1..<count {
            
            let num = nums[idx - deleteCount]
            
            if cur == num {
                nums.remove(at: idx - deleteCount)
                deleteCount += 1
            } else {
                cur = num
            }
        }
        
        return nums.count
    }
    
    /*
     给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。
     不要使用额外的数组空间，你必须仅使用 O(1) 额外空间并 原地 修改输入数组。
     元素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素。

     链接：https://leetcode-cn.com/problems/remove-element
     */
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {

        guard nums.count > 0 else {
            return 0
        }
        
        let count = nums.count
        var deleteCount = 0
        
        for idx in 0..<count {
            let num = nums[idx - deleteCount]
            if val == num {
                nums.remove(at: idx - deleteCount)
                deleteCount += 1
            }
        }
        return nums.count
    }
    
    /*
     给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。
     你可以假设数组中无重复元素。
     
     https://leetcode-cn.com/problems/search-insert-position/
     
     备注：还可以用二分查找来降低时间复杂度
     */
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {

        guard nums.count > 0 else {
            return 0
        }
        
        for (idx, num) in nums.enumerated() {
            if num >= target {
                return idx
            }
        }
        return nums.count
    }
    
    
    /*
     给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
     
     https://leetcode-cn.com/problems/maximum-subarray/
     输入：nums = [-2,1,-3,4,-1,2,1,-5,4]
     输出：6
     解释：连续子数组 [4,-1,2,1] 的和最大，为 6。
     */
    func maxSubArray(_ nums: [Int]) -> Int {

        var maxSum = nums.first!
        var curSum = 0

        for num in nums {
            if curSum > 0 {
                curSum += num
            } else {
                curSum = num
            }
            
            maxSum = max(curSum, maxSum)
        }
        
        return maxSum
    }
    
    /*
     给定一个由 整数 组成的 非空 数组所表示的非负整数，在该数的基础上加一。
     最高位数字存放在数组的首位， 数组中每个元素只存储单个数字。
     你可以假设除了整数 0 之外，这个整数不会以零开头。

     链接：https://leetcode-cn.com/problems/plus-one
     */
    func plusOne(_ digits: [Int]) -> [Int] {

        var res = 1
        
        var nums = digits
        
        for (idx, num) in nums.reversed().enumerated() {
            
            if res < 0 {
                break
            }
            
            var temp = num + res
            res = 0
            
            if temp >= 10 {
                res = temp / 10
                temp = temp % 10
            }
            nums.remove(at: idx)
            nums.insert(temp, at: idx)
        }
                
        if res > 0 {
            nums.append(res)
        }
        
        return nums.reversed()
        
    }
    
    /*
     给你两个有序整数数组 nums1 和 nums2，请你将 nums2 合并到 nums1 中，使 nums1 成为一个有序数组。
     初始化 nums1 和 nums2 的元素数量分别为 m 和 n 。你可以假设 nums1 的空间大小等于 m + n，这样它就有足够的空间保存来自 nums2 的元素。

     链接：https://leetcode-cn.com/problems/merge-sorted-array
     
     备注： 能通过，但解法不好
     */
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
        var mIdx = 0
        var nIdx = 0
        var mCount = m
        
        while mIdx < mCount && nIdx < n {
            
            let mValue = nums1[mIdx]
            let nValue = nums2[nIdx]
            
            if nValue < mValue {
                
                nums1.insert(nValue, at: mIdx)
                
                nIdx += 1
                mIdx += 1
                
                mCount += 1
                
                nums1.removeLast()
            } else {
                mIdx += 1
            }
        }
        
        for idx in nIdx..<n {
                        
            let nValue = nums2[idx]
            nums1.remove(at: mCount)
            nums1.insert(nValue, at: mCount)
            mCount += 1
        }
    }
    
    /*
     给定一个非负整数 numRows，生成杨辉三角的前 numRows 行。
     在杨辉三角中，每个数是它左上方和右上方的数的和。
     
     https://leetcode-cn.com/problems/pascals-triangle/
     */
    @objc public static func generate(_ numRows: Int) -> [[Int]] {

        var resultList = [[Int]]()
        var curRowList = [1]

        for row in 0..<numRows {

            let itemCount = row + 1
            var rowList = [1]

            if itemCount - 1 > 0 {
                for idx in 1..<itemCount - 1 {
                    let sum = curRowList[idx - 1] + curRowList[idx]
                    rowList.append(sum)
                }
                rowList.append(1)
            }
            curRowList = rowList
            resultList.append(curRowList)
        }

        return resultList
    }
}
