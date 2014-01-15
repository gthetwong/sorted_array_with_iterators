class SortedArray
  attr_reader :internal_arr

  def initialize arr=[]
    @internal_arr = []
    arr.each { |el| add el }
  end

  def add el
    # we are going to keep this array
    # sorted at all times. so this is ez
    lo = 0
    hi = @internal_arr.size
    # note that when the array just
    # starts out, it's zero size, so
    # we don't do anything in the while
    # otherwise this loop determines
    # the position in the array, *before*
    # which to insert our element
    while lo < hi
      # let's get the midpoint
      mid = (lo + hi) / 2
      if @internal_arr[mid] < el
        # if the middle element is less 
        # than the current element
        # let's increment the lo by one
        # from the current midway point
        lo = mid + 1
      else
        # otherwise the hi *is* the midway 
        # point, we'll take the left side next
        hi = mid 
      end
    end

    # insert at the lo position
    @internal_arr.insert(lo, el)
  end

  def each &block
    #loop over all elements in @internal_arr
    #yield to each element in that array
    #keep track of our index
    i = 0
    while i < @internal_arr.size
      yield @internal_arr[i]
      i += 1 
    end
    @internal_arr
    #raise NotImplementedError.new("You need to implement the each method!")
  end

  def map &block
    new_arr=[]
    self.each {|x| new_arr << (yield x) }
    new_arr
    # raise NotImplementedError.new("You need to implement the map method!")
  end

  def map! &block
    new_arr= []
    self.each {|x| new_arr << (yield x) }
    @internal_arr = new_arr
    # raise NotImplementedError.new("You need to implement the map! method!")
  end

  def find &block
    i = 0
    new_arr = []
    while i < @internal_arr.size
     value = yield @internal_arr[i]
    if yield @internal_arr[i] == true 
      return value
    else
      return nil
    end
    i+= 1
    end
  end
    # take a block 
    # array 2,3,4,7,9
    # find takes a block that tests for equality
    # return the value 3
    # block values at true when it hits that value
    # compares successive elements against the value that you want to compare
    # and then stops yielding
    # raise NotImplementedError.new("You need to implement the find method!")
  def inject acc=nil, &block
     i = 0
    while i < @internal_arr.size
     acc = yield acc,@internal_arr[i]
      i += 1 
    end
    return acc  # raise NotImplementedError.new("You need to implement the inject method!")
  end
end
