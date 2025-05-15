FROM alpine AS builder
RUN apk update; apk add make bash curl imagemagick

WORKDIR /data
COPY . .

RUN make



FROM python:3.10-alpine AS release
COPY --from=builder /data /data

EXPOSE 8080
WORKDIR /data/src
CMD ["python", "-m" , "http.server", "8080"]
