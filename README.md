# Gruf on Docker

This simple project demonstrates an issue running a gruf with a Rails app using
`bundle exec gruf` in a Docker container.

## Reproduction

Running the process locally works:

*Testing RPC*:

    grpcurl -plaintext \
      -import-path app/proto \
      -proto app/proto/Product.proto \
      -d '{"id": 1}' \
      0.0.0.0:50051 \
      rpc.Products/GetProduct

When no gRPC server is running:

> Failed to dial target host "0.0.0.0:50051": dial tcp 0.0.0.0:50051: connect: connection refused

When gruf is running:

`bundle exec gruf`

> ERROR:
>   Code: Internal
>   Message: No connection pool with 'primary' found.

When gruf is running in docker:

`make`
