# Setup e deploy de documentação usando MKDocs

## Instalar e inicializar mkdocs
1. instalar o python e instalar o pip

```bash
sudo apt install python3
python3 --version
```
```bash
sudo apt install python3-pip -y
pip3 --version
```

2. instalar o mkdocs e mkdocs materials usando o pip

```bash
pip3 install mkdocs
pip3 install mkdocs-material
```

3. inicializar o mkdocs dentro do repositório

```bash
mkdocs new
```
## Configurar projeto

A partir daqui, as configurações do projeto devem ser setadas no arquivo `mkdocs.yml`, criado no repositório após a inicialização

Importante conferir a documentação do **Material for MkDocs**: https://squidfunk.github.io/mkdocs-material/getting-started/

### Adicionar tema

`mkdocs.yml`
```yml
site_name: My Docs
theme:
  name: material
```

Comando para iniciar o projeto localmente:

```bash
mkdocs serve
```
- `localhost:8000`

### Adicionando rotas

```yml
site_name: My Docs
theme:
  name: material
  features:
    - navigation.tabs

nav:
  - Home: index.md
  - Teste: teste.md
```

## Deploying

```bash
mkdocs gh-deploy --force
```