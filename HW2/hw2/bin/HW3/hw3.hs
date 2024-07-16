-- Problem 1
myremoveduplicates :: Eq a => [a] -> [a]
myremoveduplicates [] = []
myremoveduplicates (x:xs)
  | x `elem` xs = myremoveduplicates xs
  | otherwise = x : myremoveduplicates xs

myremoveduplicates_pm :: Eq a => [a] -> [a]
myremoveduplicates_pm [] = []
myremoveduplicates_pm (x:xs)
  | x `elem` xs = myremoveduplicates_pm xs
  | otherwise = x : myremoveduplicates_pm xs


myintersection :: Eq a => [a] -> [a] -> [a]
myintersection list1 list2
  | null list1 = []
  | head list1 `elem` list2 = head list1 : myintersection (tail list1) list2
  | otherwise = myintersection (tail list1) list2

myintersection_pm :: Eq a => [a] -> [a] -> [a]
myintersection_pm list1 list2
  | null list1 = []
  | head list1 `elem` list2 = head list1 : myintersection_pm (tail list1) list2
  | otherwise = myintersection_pm (tail list1) list2

mynthtail :: Int -> [a] -> [a]
mynthtail n list
  | n == 0 = list
  | null list = []
  | otherwise = mynthtail (n - 1) (tail list)


mylast _ = []
mylast_pm _ = []

myreverse _ = []
myreverse_pm _ = []


myordered _ = True
myordered_pm _ = True
computeFees _ = []
