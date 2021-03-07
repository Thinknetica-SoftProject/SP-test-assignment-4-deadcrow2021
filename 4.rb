## Задача №4:
#
# В соседнем районе рождественские эльфы готовят подарки для жителей города.
# Для каждого подарка (файл data/4.txt) нужно найти сколько оберточной бумаги потребуется.
# Формула рассчета: 2*ш*д + 2*д*в + 2*в*ш + площадь наименьшей стороны
# Например, на подарок размером 2х3х4 требуется 2*6 + 2*12 + 2*8 = 52 + 6 кв. см.
#
# Сколько всего оберточной бумаги нужно купить эльфам?
#
## Требования к решению:
# - Входные данные находятся в файле data/4.txt
# - В значениях данные длины, ширины и высоты не упорядочены и могут идти в любом порядке, однако
# длина всегда наименьшее число из трех, высота - среднее, ширина - самое большое.
# - Результат должен быть выведен в консоль командой puts
#
#
## Решение:


file = File.open("data/4.txt", "r+").read

present = file.split("\n")

present_sides = []
area = 0

present.each do |s|
    sides = s.split("x")

    sides.each do |p|
        present_sides << p.to_i
    end

    if (present_sides.count {|s| s == present_sides.min}) == 2
        l = present_sides.min
        h = l
        w = present_sides.max
        present_sides = []

    elsif (present_sides.count {|s| s == present_sides.max}) == 2
        l = present_sides.min
        h = present_sides.max
        w = h
        present_sides = []
    
    else
        present_sides.sort!
        l = present_sides[0]
        h = present_sides[1]
        w = present_sides[2]
        present_sides = []
    end

    smallest_area = [w*l, l*h, h*w]
    area += 2*w*l + 2*l*h + 2*h*w + smallest_area.min

end

puts area