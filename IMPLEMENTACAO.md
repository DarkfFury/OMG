# Guia de Implementação do BlogLink App

Este documento fornece instruções para implementar o aplicativo BlogLink na Play Store.

## Pré-requisitos

1. Conta de desenvolvedor Google Play (taxa de $25 USD)
2. Projeto Firebase configurado com chaves reais
3. Chave de assinatura para o aplicativo

## Passos para Implementação

### 1. Configurar o Firebase

1. Acesse o [Console do Firebase](https://console.firebase.google.com/)
2. Crie um novo projeto ou use um existente
3. Adicione um aplicativo Android com o pacote `com.bloglink.backlink_app`
4. Baixe o arquivo `google-services.json` e substitua o existente em `android/app/`
5. Ative os serviços Authentication, Firestore e Storage

### 2. Gerar Chave de Assinatura

```bash
keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

### 3. Configurar Assinatura no Projeto

Crie o arquivo `android/key.properties` com o seguinte conteúdo:

```
storePassword=<senha do keystore>
keyPassword=<senha da chave>
keyAlias=upload
storeFile=<caminho para upload-keystore.jks>
```

Atualize o arquivo `android/app/build.gradle` para usar esta chave.

### 4. Gerar APK Assinado

Execute o script de build incluído:

```bash
./build_apk.sh
```

Ou use o comando Flutter diretamente:

```bash
flutter build appbundle --release
```

### 5. Preparar Materiais para a Play Store

- Ícones do aplicativo em vários tamanhos
- Capturas de tela do aplicativo (telefone, tablet)
- Gráfico de recurso (1024x500 px)
- Descrição completa do aplicativo
- Política de privacidade

### 6. Publicar na Play Store

1. Acesse o [Google Play Console](https://play.google.com/console/)
2. Crie um novo aplicativo
3. Preencha todas as informações necessárias
4. Faça upload do APK ou App Bundle
5. Preencha a ficha do aplicativo
6. Envie para revisão

## Configuração do Usuário Master

Para configurar o primeiro usuário administrador:

1. Registre um usuário normal no aplicativo
2. Acesse o Console do Firebase > Firestore Database
3. Encontre o documento do usuário na coleção `users`
4. Edite o documento e defina o campo `isAdmin` como `true`

Este usuário terá acesso ao painel de administração e poderá conceder privilégios de administrador a outros usuários.

## Suporte e Manutenção

Para atualizações futuras:

1. Faça as alterações necessárias no código
2. Incremente o número da versão em `pubspec.yaml`
3. Gere um novo APK ou App Bundle assinado
4. Faça upload da nova versão na Play Store
