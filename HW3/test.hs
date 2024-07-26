myremoveduplicates :: Eq a => [a] -> [a]
myremoveduplicates list
 | null list = []
 | (head list) `elem` (tail list) = myremoveduplicates (tail list)
 | otherwise = (head list) : myremoveduplicates (tail list)

myintersection :: Eq a => [a] -> [a] -> [a]
myintersection list1 list2
 | null list1 || null list2 = []
 | head list1 `elem` list2 = (head list1) : myintersection (tail list1) list2
 | otherwise = myintersection (tail list1) list2

mynthtail :: Eq a => Int -> [a] -> [a]
mynthtail num list
 | num == 0 = list
 | otherwise = mynthtail (num-1) (tail list)

mylast :: Eq a => [a] -> [a]
mylast list
 | null list = []
 | null (tail list) = [head list]
 | otherwise = mylast (tail list)

myreverse :: Eq a => [a] -> [a]
myreverse list = myreverse_hr list []

myreverse_hr :: Eq a => [a] -> [a] -> [a]
myreverse_hr list acc
 | null list = acc
 | otherwise = myreverse_hr (tail list) (head list : acc)

myreplaceall :: Eq a => a -> a -> [a] -> [a]
myreplaceall x y list
 | null list = []
 | y == (head list) = x : myreplaceall x y (tail list)
 | otherwise = (head list) : myreplaceall x y (tail list)

myordered :: Ord a => [a] -> Bool
myordered list
 | null list = True
 | null (tail list) = True
 | head list >= head (tail list) = False
 | otherwise = myordered (tail list)