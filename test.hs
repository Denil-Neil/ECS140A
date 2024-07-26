makeIntList num = makeIntListHelper num 0

makeIntListHelper num acc
  | num == 0 = []
  | otherwise = [acc + 1] : makeIntListHelper (num - 1) (acc + 1)
