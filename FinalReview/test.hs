import System.Posix (accessModes)
sumseries :: Int -> Int
sumseries num
 | num == 0 = 0
 | otherwise = num + sumseries (num - 1)

sumseriesTR :: Int -> Int
sumseriesTR num = sumSeriesHelper num 0

sumSeriesHelper :: Int -> Int -> Int
sumSeriesHelper num acc
 | num == 0 = acc
 | otherwise = sumSeriesHelper (num - 1) (acc + num) 