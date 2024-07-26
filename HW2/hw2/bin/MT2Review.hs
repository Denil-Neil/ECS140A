
mymaximum :: (Ord a) => [a] -> a
mymaximum list
 | null (tail list) = head list
 | head list >= mymaximum (tail list) = head list
 | otherwise = mymaximum (tail list)