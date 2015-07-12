require 'prime'

class RorTask1

  #Напишите программу, которая для заданного натурального числа num определяет
  #количество вхождений числа 3 в разложение заданного числа на простые сомножители.
  def how_many_threes num
    return 0 if num < 2
    m = []
    loop do
      Prime.each do |p|
        if num % p == 0
          m << p
          num /= p  
          break
        end
        break if num == 1
      end
      break if num == 1
    end
    m.count(3)
  end

  #Дан текст. Определите максимальное из имеющихся в нем чисел.
  def max_number_in_text text
    max = 0
    text.scan(/[\-|\+]?\d+(?:\.\d+)?/) do |str| 
      if str.include? "."
        num = str.to_f
      else
        num = str.to_i 
      end
      max = num if num > max      
    end
    max
  end

  #Дан целочисленный массив. Необходимо вывести вначале его элементы с четными 
  #индексами, а затем - с нечетными.
  def even_odd_elements arr
    arr.each_with_index { |x, i| puts x if i.even? }
    arr.each_with_index { |x, i| puts x if i.odd? }
  end

  #Дан целочисленный массив. Преобразовать его, прибавив к нечетным числам последний 
  #элемент. Первый и последний элементы массива не изменять.
  def even_elements_addition arr
    arr.map.with_index { |x, i| i != 0 && i != arr.size - 1 ? x += arr[-1] : x }
  end

  #Дан целочисленный массив, содержащий по крайней мере два нуля. Вывести сумму чисел 
  #из данного массива, расположенных между первыми двумя нулями.
  def sum_between_zeros arr
    sum = 0
    i = arr.find_index(0)
    if i 
      loop do
        i += 1
        x = arr[i]
        break if x == 0 || !x
        sum += x
      end      
    end
    sum
  end
end
