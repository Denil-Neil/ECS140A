-- Question 1

addVectors :: [Int] -> [Int] -> [Int]
addVectors list1 list2
 | null list1 || null list2 = []
 | otherwise = (head list1 + head list2) : addVectors (tail list1) (tail list2)

addVectorsPM :: [Int] -> [Int] -> [Int]
addVectorsPM [] _ = []
addVectorsPM _ [] = []
addVectorsPM (x:xs) (y:ys) = x+y : addVectorsPM xs ys

-- Question 2

sumseries :: Int -> Int
sumseries num
 | num == 0 = 0
 | otherwise = num + sumseries (num-1)

sumseriesTR :: Int -> Int
sumseriesTR num = sumseriesTR_helper num 0

sumseriesTR_helper :: Int -> Int -> Int
sumseriesTR_helper 0 acc = acc
sumseriesTR_helper n acc = sumseriesTR_helper (n-1) (acc + n)


-- Question 3
-- Refer

-- Question 4

mmaximum :: [Int] -> Int
mmaximum 