FROM golang:1.23-bookworm

WORKDIR /app

COPY . .

CMD ["./cowsay"]
