class LRUCache
  
  def initialize(cache_limit)
    @cache_limit = cache_limit
    @cache = Array.new(cache_limit)
  end

  def count
    # returns number of elements currently in cache
    cache_limit - cache.count(nil)
  end

  def add(el)
    # adds element to cache according to LRU principle
    if full?
      if cache.include?(el)
        remove_from_cache(el)
      else
        remove_lru_el
      end
    end
    cache << el
  end	

  def show
    # shows the items in the cache, with the LRU item first
    p cache
  end

  private
  # helper methods go here!
  attr_reader :cache_limit, :cache

  def full?
    cache.count == cache_limit
  end

  def remove_lru_el
    cache.shift
  end

  def remove_from_cache(el)
    cache.delete(el)
  end
end


# johnny_cache = LRUCache.new(4)

# johnny_cache.add("I walk the line")
# johnny_cache.add(5)

# p johnny_cache.count # => returns 2

# johnny_cache.add([1,2,3])
# johnny_cache.add(5)
# johnny_cache.add(-5)
# johnny_cache.add({a: 1, b: 2, c: 3})
# johnny_cache.add([1,2,3,4])
# johnny_cache.add("I walk the line")
# johnny_cache.add(:ring_of_fire)
# johnny_cache.add("I walk the line")
# johnny_cache.add({a: 1, b: 2, c: 3})


# johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]