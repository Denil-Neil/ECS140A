
myremoveduplicates :: Eq a => [a] -> [a]
myremoveduplicates [] = []
myremoveduplicates list
  | head list `elem` tail list = myremoveduplicates (tail list)
  | otherwise = head list : myremoveduplicates (tail list)

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
myintersection_pm [] _ = []
myintersection_pm _ [] = []
myintersection_pm (x:xs) list2
  | x `elem` list2 = x : myintersection_pm xs list2
  | otherwise = myintersection_pm xs list2

mynthtail :: Int -> [a] -> [a]
mynthtail n list
  | n == 0 = list
  | null list = []
  | otherwise = mynthtail (n - 1) (tail list)

mynthtail_pm :: Int -> [a] -> [a]
mynthtail_pm 0 (x:xs) = (x:xs)
mynthtail_pm _ [] = []
mynthtail_pm n (x:xs) = mynthtail_pm (n - 1) xs


mylast :: [a] -> [a]
mylast xs
  | null xs = []
  | null (tail xs) = [head xs]
  | otherwise = mylast (tail xs)

mylast_pm :: [a] -> [a]
mylast_pm [] = []
mylast_pm [x] = [x]
mylast_pm (_:xs) = mylast xs

myreverse :: [a] -> [a]
myreverse xs = revAcc xs []
revAcc :: [a] -> [a] -> [a]
revAcc xs acc
  | null xs = acc
  | otherwise = revAcc (tail xs) (head xs : acc)


myreverse_pm :: [a] -> [a]
myreverse_pm (x:xs) = revAcc (x:xs) []
revAcc_pm :: [a] -> [a] -> [a]
revAcc_pm [] (y:ys) = y:ys
revAcc_pm (x:xs) (y:ys) = revAcc (x:xs)  (x:y:ys)

myreplaceall :: Eq a => a -> a -> [a] -> [a]
myreplaceall x y list
  | null list = []
  | head list == y = x : myreplaceall x y (tail list)
  | otherwise = head list : myreplaceall x y (tail list)

myreplaceall_pm :: Eq a => a -> a -> [a] -> [a]
myreplaceall_pm _ _ [] = []
myreplaceall_pm x y (z:zs)
  | z == y    = x : myreplaceall_pm x y zs
  | otherwise = z : myreplaceall_pm x y zs

myordered :: Ord a => [a] -> Bool
myordered list
  | null list = True
  | null (tail list) = True
  | head list <= head (tail list) = myordered (tail list)
  | otherwise = False

myordered_pm :: Ord a => [a] -> Bool
myordered_pm [] = True
myordered_pm [x] = True
myordered_pm (x:y:xs) = x <= y && myordered_pm (y:xs)

-- Learned this string parser function from ChatGPT
-- Learned the 'where' statement from ChatGPT
computeFees :: String -> Int
computeFees input = case studentType of
  "Y" -> if hasFinancialAid == "Y"
           then computeDegreeFeesWithAid credits (read aidAmount)
           else computeDegreeFees credits
  "N" -> case nonDegreeType of
           "C" -> computeCertificateFees credits
           "S" -> computeSeniorFees credits
           _   -> error "Invalid non-degree student type"
  _   -> error "Invalid student type"
  where
    fields = splitOn ';' input
    studentType = fields !! 5
    credits = read (fields !! 4)
    hasFinancialAid = if length fields > 7 then fields !! 8 else "N"
    nonDegreeType = fields !! 6
    aidAmount = if length fields > 8 then fields !! 9 else "0"

-- Helper function to split a string by a delimiter
splitOn :: Char -> String -> [String]
splitOn delimiter = foldr f [[]]
  where
    f c l@(x:xs)
      | c == delimiter = [] : l
      | otherwise = (c : x) : xs

-- Compute fees for a degree-seeking student without financial assistance
computeDegreeFees :: Int -> Int
computeDegreeFees credits = baseFee + perCreditFee
  where
    baseFee = 100 + 50
    perCreditFee = if credits > 12 then 275 * 12 else 275 * credits

-- Compute fees for a degree-seeking student with financial assistance
computeDegreeFeesWithAid :: Int -> Int -> Int
computeDegreeFeesWithAid credits aid = max 0 (computeDegreeFees credits - aid)

-- Compute fees for a certificate student
computeCertificateFees :: Int -> Int
computeCertificateFees credits = 700 + 300 * credits

-- Compute fees for a senior citizen
computeSeniorFees :: Int -> Int
computeSeniorFees credits = baseFee + extraFee
  where
    baseFee = 100
    extraFee = if credits > 6 then 50 * (credits - 6) else 0