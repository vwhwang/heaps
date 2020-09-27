class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(logn)
  # Space Complexity: O(n)
  def add(key, value = key)
    @store << HeapNode.new(key,value)
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(logn)
  # Space Complexity: O(n)
  def remove()
    swap(0,@store.length - 1)
    result = @store.pop()
    heap_down(0)
    return result.value
  end


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: O(1)
  # Space complexity: O(1)
  def empty?
    return true if @store.length == 0 
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(logn)
  # Space complexity: O(n)
  def heap_up(index)
    return nil if @store.empty?

    parent_index = (index - 1)/2
  
    if @store[index].key >= @store[parent_index].key || index == 0 
      return @store
    else  
      swap(index, parent_index)
      heap_up(parent_index)
    end 
    
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    return nil if @store.empty?

    left = 2 * index + 1 
    right = 2 * index + 2 

    if left > @store.length || right > @store.length
      return @store
    end 

    if @store[left].key > @store[right].key
      min = right  
    else  
      min = left 
    end 

    if @store[index].key <= @store[min].key
      return @store 
    else  
      swap(index, min)
      heap_down(min)
    end 
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end