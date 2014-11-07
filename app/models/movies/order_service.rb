module Movies
  class OrderService
    def initialize(order)
      @order = order
    end

    def perform
      @order.each_with_index do |id, index|
        Movie.find(id).update_column(:index, index)
      end
    end
  end
end
