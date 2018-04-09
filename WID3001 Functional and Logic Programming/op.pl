+(-(2,*(1,3)),4)
-(2,+(*(1,3),4))

:-op(300, xfx, likes).
:-op(200, xfy, and).
likes(danial, drawing).
likes(danial, reading).

danial likes drawing and reading
likes(danial,and(reading, drawing))

?.danial likes What and reading.
