# Utiliser une image de base Go pour construire l'application
FROM golang:1.20 AS builder

WORKDIR /app

# Copier les fichiers nécessaires pour construire l'application
COPY . .

# Définir CGO_ENABLED=0 pour compiler un binaire statique Go
RUN CGO_ENABLED=0 go build -o cowsay main.go

# Utiliser une image alpine légère pour exécuter l'application
FROM alpine:latest

# Copier l'exécutable depuis l'étape de construction
COPY --from=builder /app/cowsay .

# Commande par défaut pour exécuter l'application
CMD ["./cowsay"]
