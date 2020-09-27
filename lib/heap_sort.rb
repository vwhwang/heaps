require_relative "min_heap"

# This method uses a heap to sort an array.
# Time Complexity:  O(nlogn)
# Space Complexity: O(n)

def heapsort(list)
  heap = MinHeap.new
  list.each do |element|
    heap.add(element)
  end 
  list.each_with_index do |val, index|
    list[index] = heap.remove()
  end 
  return list 
end