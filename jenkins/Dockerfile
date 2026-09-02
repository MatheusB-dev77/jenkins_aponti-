# Imagem oficial LTS do Jenkins (já vem com Java e o próprio Jenkins configurados)
FROM jenkins/jenkins:lts-jdk17

# Troca temporariamente pro usuário root — só ele pode instalar pacotes no SO
USER root

# Instala pré-requisitos, adiciona o repositório oficial do Docker e instala a CLI
RUN apt-get update && \
    apt-get install -y ca-certificates curl gnupg lsb-release && \
    install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    chmod a+r /etc/apt/keyrings/docker.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
      | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && \
    apt-get install -y docker-ce-cli && \
    rm -rf /var/lib/apt/lists/*

# Volta pro usuário padrão do Jenkins por segurança (não roda o serviço como root)
USER jenkins