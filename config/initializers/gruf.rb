Gruf.configure do |c|
  c.server_binding_url = '0.0.0.0:50051'
  c.grpc_logger = Logger.new(STDOUT)
  c.logger = Logger.new(STDOUT)
end
