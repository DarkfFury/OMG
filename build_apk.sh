#!/bin/bash

# Script para gerar APK de release do aplicativo BlogLink

echo "Iniciando processo de build do APK..."

# Navegar para o diretório do projeto
cd /home/ubuntu/backlink_app

# Limpar builds anteriores
echo "Limpando builds anteriores..."
/home/ubuntu/flutter/flutter/bin/flutter clean

# Obter dependências
echo "Obtendo dependências..."
/home/ubuntu/flutter/flutter/bin/flutter pub get

# Construir APK de release
echo "Construindo APK de release..."
/home/ubuntu/flutter/flutter/bin/flutter build apk --release

# Verificar se o build foi bem-sucedido
if [ -f "/home/ubuntu/backlink_app/build/app/outputs/flutter-apk/app-release.apk" ]; then
    echo "Build concluído com sucesso!"
    echo "APK disponível em: /home/ubuntu/backlink_app/build/app/outputs/flutter-apk/app-release.apk"
    
    # Copiar APK para um local mais acessível
    cp /home/ubuntu/backlink_app/build/app/outputs/flutter-apk/app-release.apk /home/ubuntu/BlogLink.apk
    echo "APK copiado para: /home/ubuntu/BlogLink.apk"
else
    echo "Erro ao gerar o APK. Verifique os logs acima para mais detalhes."
fi
