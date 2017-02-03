require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  attr_reader :count, :num_buckets

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
    @num_buckets = num_buckets
  end

  def include?(key)
    hashed_key = key.hash
    @store[hashed_key % num_buckets].include?(hashed_key)
  end

  def set(key, val)
    hashed_key = key.hash
    if include?(key)
      @store[hashed_key % num_buckets].update(hashed_key, val)
    else
      @store[hashed_key % num_buckets].append(hashed_key, val)
    end
  end

  def get(key)
    hashed_key = key.hash
    @store[hashed_key % num_buckets].get(hashed_key)
  end

  def delete(key)
  end

  def each
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def resize!
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
