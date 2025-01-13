# Utiliser une image de base Go pour construire l'application
FROM golang:1.20 AS builder

WORKDIR /app

# Copier les fichiers nécessaires pour construire l'application
COPY . .

# Construire l'exécutable Go
RUN go build -o cowsay main.go

# Utiliser une image légère pour exécuter l'application
FROM alpine:latest

# Installer les dépendances nécessaires (si besoin)
RUN apk add --no-cache libc6-compat

# Copier l'exécutable depuis l'étape de construction
COPY --from=builder /app/cowsay .

# Commande par défaut pour exécuter l'application
CMD ["./cowsay"]
