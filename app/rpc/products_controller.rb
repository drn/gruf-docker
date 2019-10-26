require 'Product_services_pb'

class ProductsController < Gruf::Controllers::Base
  bind ::Rpc::Products::Service

  ##
  # Illustrates a request and response call
  #
  # @return [Rpc::GetProductResp] The response
  #
  def get_product
    Rpc::GetProductResp.new(
      product: Rpc::Product.new(
        id:    1,
        name:  'name',
        price: 2
      )
    )
  end
end
