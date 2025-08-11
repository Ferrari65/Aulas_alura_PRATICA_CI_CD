#o arquivo makefile serve para automação de projetos. Utilizado para compilaao de projetos em C

lint:
    docker run --rm -itv $(CURDIR):/app -w /app golangci/golangci-lint golangci-lint run controllers/ database/ models/ routes/
# Função principal: Verificar se seu código Go segue boas práticas e não tem erros de estilo ou potenciais bugs.

test: 
    docker compose exec app go test main_test.go

# Função principal: Rodar seus testes unitários dentro do container já em execução.

ci: start lint test

# Função principal: Rodar uma verificação completa do projeto antes de um commit, push ou deploy.