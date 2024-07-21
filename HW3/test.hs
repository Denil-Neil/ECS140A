mymaximum :: [Int] -> Int
mymaximum list
 | null list = []
 | head list <= tail list 