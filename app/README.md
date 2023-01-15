# Code Challenge DevOps Kanastra

Desafio de código para DevOps

## Provisionamento

Você precisa nos mostrar uma infraestrutura provisionada usando Infra-as-code (terraform, pulumi, ansible, etc),
que deve conter:
* Configure um cluster k8s em núvem (EKS, AKS ou GKE)
* Configure a rede e suas subnets.
* Configure a segurança usando o princípio de privilégio mínimo.
* Use uma IAM role para dar as permissões no cluster.
  Use sempre as melhores práticas para provisionar os recursos da núvem que escolher.

## CI/CD
Os requisitos são os seguintes:
* Escolha uma ferramenta de CI/CD apropriada.
* Configure um pipeline de build de contêiner docker da aplicação node.
* Configure um pipeline de deploy contínuo para o aplicação node em contêiner
    * Deve conter pelo menos uma fase de testes e uma fase de deploy.
    * A fase de deploy só deve ser executada se a fase de testes for bem-sucedida.
    * Ele deve seguir o fluxo do GitHub flow para o deploy.
    * O deploy deve ser feito no cluster k8s provisionado no Code Challenge.


## Aplicação

A aplicação node é super simples, apenas um express que expõe webserver HTTP na port 3000

Os endpoints são os seguintes:
- `/`
- `/health/check`

## Bonus

- Adicionar pipelines para teste lint, e outras coisas a mais na aplicação
- O deploy de kubernetes tiver interligado com ferramenta de infra as code

## Importante

Nós entendemos se você não tiver uma conta em uma dessas núvens, então faça o seu melhor com
código de provisionamento escolhido e disponibilize num repositório git, que nós testaremos.
 
