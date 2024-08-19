# INK Components

## Table of Contents

- [Funcionamento da engine](#funcionamento-da-engine)
  - [Rake tasks](#rake-tasks)
    - [ink_components:install](#ink_componentsinstall)
  - [Como o majestic monolith incorpora o tailwind da engine?](#como-o-majestic-monolith-incorpora-o-tailwind-da-engine)
- [Instalação da gem no majestic monolith](#instalação-da-gem-no-majestic-monolith)
- [Configurando a gem para desenvolvimento](#configurando-a-gem-para-desenvolvimento)

## Funcionamento da engine

Descreve o funcionamento interno da engine.

### Rake tasks

Descreve quais tasks a engine expõe ao majestic monolith.

#### Task: ink_components:install

**Local:** `ink-components/lib/tasks/ink_components_tasks.rake`.

**Descrição**: Chama o script `lib/install/install.rb` que copia os arquivos necessários para o funcionamento da engine para o majestic monolith.

Os seguintes arquivos são copiados:
- **lib/install/tailwind.rake:** Define a task `ink_components:tailwind_config` que será adicionada ao majestic monolith. Além disso, adiciona um hook para garantir que a task `ink_components:tailwind_config` seja executada antes da task `css:build` durante o comando `assets:precompile`.
- **lib/tailwind_config_generator.rb:** Define um [gerador de templates](https://guides.rubyonrails.org/generators.html) chamado `ink_components:tailwind_config` que, quando executado no majestic monolith através do comando `ink_components:tailwind_config`, gera o arquivo `ink_components.tailwind.config.js` na pasta raiz do majestic monolith.
- **lib/tailwind.config.js:** Arquivo de template que será usado como base para a geração do arquivo `ink_components.tailwind.config.js`.

### Como o majestic monolith incorpora o tailwind da engine?

O majestic monolith incorpora o tailwind da engine através do arquivo `ink_components.tailwind.config.js`. Este arquivo é gerado pela task `ink_components:tailwind_config` e contém os paths dos componentes da engine. Estes paths são usados pelo tailwind do majestic monolith para detectar quais classes estão sendo utilizadas na `ink-components`.

O path dos componentes muda de acordo com o local onde a engine é instalada. Por exemplo, se a engine for instalada em `engines/ink-components`, o path dos componentes será `engines/ink-components/app/components`. 

Exemplo de arquivo `ink_components.tailwind.config.js`:

```javascript
{
  content: [
    "/home/user/Projects/ink-components/app/components/**/*.html.erb",
  ],
}
```

Durante o deploy do majestic monolith, o rails executa a task `assets:precompile`. Durante o `assets:precompile`, a task `css:build` é executada. A engine está configurada para rodar o comando `ink_components:tailwind_config` antes da task `css:build`. Isso garante que o arquivo `ink_components.tailwind.config.js` seja gerado antes do tailwind ser compilado. Dessa forma, o tailwind do majestic monolith consegue detectar as classes utilizadas na engine.

## Instalação da gem no majestic monolith

1. Adicione a gem no Gemfile do majestic monolith:

```ruby
# Se a gem estiver em uma branch específica:
gem "ink_components", git: "https://github.com/rsv-ink/ink-components.git", branch: "first-setup"

# Se a gem estiver associada a uma tag específica:
gem "ink_components", git: "https://github.com/rsv-ink/ink-components.git", tag: "v0.1.0"
```

2. Execute o comando `bundle install`.

3. Execute o comando `bundle exec rails ink_components:install`.

4. Execute o comando `bundle exec rails ink_components:tailwind_config`

O comando `ink_components:tailwind_config` irá gerar um arquivo `ink_components.tailwind.config.js` na pasta raiz do majestic monolith. Este arquivo vai conter os paths para os componentes da engine. Estes paths vão permitir que o tailwind do majestic monolith consiga detectar quais classes estão sendo utilizadas na `ink-components`.

5. Atualize o arquivo `tailwind.config.js` do majestic monolith para incluir os paths dos componentes da engine. Adicione o seguinte trecho de código no arquivo `tailwind.config.js`:

```javascript
// Adicione esta linha
const inkComponentsConfig = require("./ink_components.tailwind.config.js");

module.exports = {
  // ...outras configurações
  content: [
    // ...paths já configurados
    ...inkComponentsConfig.content, // Adicione esta linha
  ],
};
```

6. Adicione o arquivo `ink_components.taiwind.config.js` no `.gitignore` do majestic monolith.

7. Execute o comando `yarn build:css`

8. Verifique se os componentes da engine estão sendo renderizados corretamente no majestic monolith.

> [!NOTE]
> Durante o desenvolvimento do majestic monolith, o ideal é que o comando `./bin/rails ink_components:tailwind_config` seja executado sempre antes do comando `yarn build:css`. Para isso, talvez seja necessário atualizar seu Procfile.dev ou equivalentes.

## Configurando a gem para desenvolvimento

1. Clone o repositório da engine:

```bash
git clone git@github.com:rsv-ink/ink-components.git
```

2. Execute o comando `bundle install`

3. Execute o comando `bin/setup`

Para iniciar o desenvolvimento, execute o comando `bin/dev` e acesse `http://localhost:3000` no navegador.
