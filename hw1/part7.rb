class CartesianProduct
  include Enumerable
  attr_accessor :first, :second
  def initialize(first, second)
    @first, @second = first, second
  end
  
  def each(&block)
    @first.product(@second).each do |i|
      yield i
    end
  end
end
