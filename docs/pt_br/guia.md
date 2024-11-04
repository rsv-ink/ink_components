# Design System: Guia

- [Design System: Guia](#design-system-guia)
- [Princípios de Design](#princípios-de-design)
- [Bibliotecas Utilizadas na Construção dos Componentes](#bibliotecas-utilizadas-na-construção-dos-componentes)
- [Boas Práticas de Implementação dos Componentes](#boas-práticas-de-implementação-dos-componentes)
  - [Nomenclatura](#nomenclatura)
  - [Estrutura de Pastas](#estrutura-de-pastas)
  - [Parâmetros](#parâmetros)
  - [Slots](#slots)
  - [Variantes](#variantes)
  - [Lookbook](#lookbook)
- [Implementação de Testes](#implementação-de-testes)
- [Form Builder](#form-builder)

O Design System tem como objetivo principal acelerar o processo de entrega de novas funcionalidades e interfaces, proporcionando ao time uma base sólida de componentes prontos e padronizados que podem ser facilmente reutilizados.

Ao oferecer um conjunto de diretrizes e elementos visuais pré-definidos, ele reduz a necessidade de recriar componentes do zero, o que aumenta a eficiência e permite que os desenvolvedores foquem em aspectos mais estratégicos e complexos da aplicação. Além disso, o Design System assegura que haja uma consistência visual e funcional em toda a interface, garantindo que todos os componentes, sigam os mesmos padrões de aparência e comportamento. Isso não só melhora a experiência do usuário, mas também facilita a manutenção e evolução do produto a longo prazo.

# Príncipios de Design

## Rosa como Cor Primária

Para a implementação do nosso Design System, estamos utilizando a biblioteca Flowbite como referência, o que significa que todos os nossos componentes seguem seus padrões e estilos. No entanto, há uma exceção importante: enquanto o Flowbite define a cor azul como a cor primária, adotamos o rosa como nossa cor principal. Por isso, sempre que implementamos um componente, precisamos garantir que o estilo padrão seja ajustado para rosa em vez de azul. Para fazer essa adaptação, simplesmente duplicamos os estilos aplicados ao azul e os substituímos pelo rosa. Por exemplo, a classe "text-blue-600" é convertida para "text-pink-600", garantindo que os componentes estejam alinhados com a identidade visual do nosso design.

```html
<!-- Flowbite -->
<div class="text-blue-600 border border-blue-600">Conteúdo</div>

<!-- InkComponents -->
<div class="text-pink-600 border border-pink-600">Conteúdo</div>
```

Vale ressaltar que essa mudança não exclui a cor azul da nossa lista de cores disponíveis. Embora o rosa seja a cor primária no nosso Design System, a cor azul ainda pode ser utilizada em outros contextos ou componentes, conforme necessário. Isso nos permite manter flexibilidade no uso de cores, sem comprometer a consistência visual e respeitando as diretrizes da biblioteca Flowbite.

# Bibliotecas Utilizadas na Construção dos Componentes

Como mencionado anteriormente, utilizamos as bibliotecas TailwindCSS e [Flowbite](https://flowbite.com/) para o estilo dos componentes. Para a construção dos componentes em si, usamos o ViewComponent em conjunto com a [view_component-contrib](https://github.com/palkan/view_component-contrib), uma biblioteca que oferece ferramentas úteis para a implementação, sendo o principal recurso que utilizamos o [StyleVariants](https://github.com/palkan/view_component-contrib?tab=readme-ov-file#style-variants). Além disso, seguimos a estrutura de pastas recomendada por essa biblioteca, sobre a qual detalharemos na próxima seção.

No caso dos ícones, adotamos os [ícones do Flowbite](https://flowbite.com/icons/), que são renderizados através da biblioteca [inline_svg](https://github.com/jamesmartin/inline_svg), permitindo que o código SVG seja embutido diretamente nas views do Rails.

Por fim, utilizamos o [Lookbook](https://lookbook.build/) como uma ferramenta visual de documentação, que nos permite visualizar os componentes existentes e entender como eles podem ser utilizados.

# Boas Práticas de Implementação dos Componentes

## Nomenclatura

Estamos seguindo um padrão específico para nomear nossos componentes, adotando a estrutura:

```ruby
InkComponents::<name>::Component
```

Quando o componente é relacionado a formulários, adicionamos o namespace Forms:

```ruby
InkComponents::Forms::<name>::Component
```

Geralmente, seguimos a mesma nomenclatura do Flowbite. Isso nos permite, quando tudo é implementado corretamente, disponibilizar helpers para facilitar o uso desses componentes. Abaixo estão algumas opções detalhadas:

```ruby
render InkComponents::Button::Component.new(...) # com ViewComponent
button_components(...) # com helper

# Componente de formulário
render InkComponents::Forms::Select::Component.new(...) # com ViewComponent
select_component(...) # com helper
# Também disponibilizamos um form builder que segue a interface padrão do Rails:
f.select
```

Com esse padrão, simplificamos o consumo dos componentes na aplicação, garantindo organização e consistência.

## Estrutura de pastas

Ao criar um componente, é importante seguir a estrutura abaixo:

- `component.rb`: onde a classe do componente é definida.
- `component.html.erb`: onde a estrutura HTML do componente é implementada.
- `preview.rb`: onde a pré-visualização do componente é configurado, usando o Lookbook.

Para um componente geral:

```shell
.
├── components
│   └── ink_components
│       └── alert
│           ├── component.rb
│           ├── component.html.erb
│           └── preview.rb
```

Para um componente de formulário:

```shell
.
├── components
│   └── ink_components
│       └── forms
│           └── select
│               ├── component.rb
│               ├── component.html.erb
│               └── preview.rb
```

Essa estrutura facilita a organização e o acesso aos componentes.

## Parâmetros

Atualmente, temos dois tipos de parâmetros para nossos componentes: default_attributes e extra_attributes. Os default_attributes são aqueles definidos na classe do componente, enquanto os extra_attributes são utilizados para receber atributos HTML, como classes e data attributes. Ao final, esses parâmetros são combinados ("merged") para formar a configuração final do componente, um processo que ocorre na classe ApplicationComponent, que é a classe pai dos demais componentes.

Os extra_attributes oferecem a flexibilidade de sobrescrever classes do Tailwind. Por exemplo, se um componente possui a classe padrão "mt-2" e você especifica "mt-4" como extra_attributes, o componente será renderizado com a classe "mt-4", substituindo a classe padrão.

```ruby
# default_attributes: href (definido em InkComponents::Button::Component)
# extra_attributes: class
button_component(href: root_path, class: "mt-4") { "Home" }
```

Assim, os parâmetros HTML, como data attributes, não precisam ser obrigatoriamente definidos, pois podem ser facilmente passados através dos extra_attributes. Essa flexibilidade permite uma personalização eficaz dos componentes sem complicações.

Ao definir parâmetros como obrigatórios, é crucial considerar se o componente depende deles para funcionar corretamente. Se um parâmetro obrigatório for esquecido, isso pode causar confusão. Nesse caso, gerar um erro imediatamente pode ajudar o desenvolvedor a lembrar da necessidade desse parâmetro.

Os parâmetros dos componentes são definidos com base na necessidade de modificar o estilo, mas essa abordagem não se limita apenas a isso. Por exemplo, o componente botão possui diversas variantes de cores e tamanhos, e, por isso, definimos os parâmetros color e size. Isso nos permite criar variantes utilizando a abordagem [StyleVariants](https://github.com/palkan/view_component-contrib?tab=readme-ov-file#style-variants), que ajusta as classes de acordo com os valores recebidos.

Exemplo da definição dos tamanhos:

```ruby
size {
  xs { %w[ px-3 py-2 text-xs ] }
  sm { %w[ px-3 py-2 text-sm ] }
  md { %w[ px-5 py-2.5 text-sm ] }
  lg { %w[ px-5 py-3 text-base ] }
  xl { %w[ px-6 py-3.5 text-base ] }
}
```

Se o botão receber o valor `size: :xs`, as classes "px-3 py-2 text-xs" serão automaticamente adicionadas ao componente.

Alguns parâmetros são comuns a vários componentes, e estabelecemos as seguintes nomenclaturas para defini-los:

- `color`: Utilizado para especificar a cor do componente ou de alguma parte dele.
- `state`: Indica o estado do componente, como erro ou sucesso.
- `size`: Define o tamanho do componente.
- `shape`: Especifica o formato do componente.
- `bordered`: Indica se o componente terá borda ou não.
- `dismissable`: Determina se o componente pode ser fechado ou não.
- `disabled`: Indica se o componente está desabilitado.

## Slots

Utilizamos o recurso Slot do ViewComponents nas seguintes situações:

1. Reaproveitamento de Componentes: Quando desejamos aproveitar componentes já existentes em novos componentes. Por exemplo, o componente dropzone é formado por uma label e um helper_text. Para facilitar seu uso, adicionamos dois slots, permitindo que esses elementos do nosso design system sejam utilizados diretamente no dropzone:

```ruby
dropzone_component(id: "input-file") do |dropzone|
  dropzone.with_label { "Click to upload or drag and drop" }
  dropzone.with_helper_text { "SVG, PNG, JPG or GIF (MAX. 800x400px)" }
end
```

2. Extração de Lógica: Quando é necessário simplificar um componente, extraindo partes da lógica para componentes internos. Um exemplo disso é o componente Alert, que possui os slots title, body e actions.

3. Flexibilidade para Conteúdo: Quando queremos reservar um espaço dentro de um componente que seja flexível o suficiente para receber texto ou HTML. Por exemplo, no componente Avatar, adicionamos um slot text que permite a inclusão de qualquer texto ao lado do componente:

```ruby
avatar_component do |avatar|
  avatar.with_text do
    content_tag(:p, "Jese Leos", class: "font-medium dark:text-white").concat(
      content_tag(:p, "Joined in August 2014", class: "text-sm text-gray-500 dark:text-gray-400")
    )
  end
end
```

## Variantes

Nós seguimos rigorosamente as diretrizes fornecidas pelo Flowbite em sua documentação. Cada componente tem uma seção que apresenta diferentes formas de utilizá-lo. Antes de iniciar a implementação, realizamos uma análise para identificar quais sugestões do Flowbite são relevantes para o nosso contexto. Também verificamos se a estrutura HTML do componente padrão é semelhante à recomendada. Caso essas análises indiquem a necessidade de implementar uma variante, prosseguimos com a implementação.

Por exemplo, na documentação do componente botão, a primeira seção apresenta a estrutura padrão:

```html
<button type="button" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">Default</button>
```

Logo abaixo, o Flowbite sugere uma variante chamada "Pill", que possui a seguinte estrutura:

```html
<button type="button" class="text-white bg-blue-700 hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-blue-300 font-medium rounded-full text-sm px-5 py-2.5 text-center me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Default</button>
```

Uma das principais diferenças entre o componente padrão e a variante é a classe "rounded": no padrão, é "rounded-lg", enquanto na variante, é "rounded-full".

Para implementar as diferenças de classe entre a forma padrão e as variantes do componente, utilizamos a abordagem de [StyleVariants](https://github.com/palkan/view_component-contrib?tab=readme-ov-file#style-variants) proposta pela biblioteca [view_component-contrib](https://github.com/palkan/view_component-contrib). A seguir, apresentamos um exemplo simples de como podemos estruturar essa implementação.

```ruby
module InkComponents
  module Button
    class Component < ApplicationComponent
      style do
        base { "..." } # Aqui colocamos as classes base do componente

        variants do
          shape {
            default: { "rounded-lg" },
            pill: { "rounded-full" },
          }
        end

        defaults { { shape: :default } } # Definimos o estilo padrão do componente
      end

      # Definimos um parâmetro shape para permitir que a biblioteca ajuste a
      # classe de acordo com o valor recebido
      attr_reader :shape

      def initialize(shape: nil)
        @shape = shape
      end

      # Por fim, precisamos passar as classes para o componente
      # Para facilitar, criamos um método privado que será chamado
      # na estrutura HTML do componente

      private
      def default_attributes
        { class: style(shape: shape) }
      end
    end
  end
end
```

Neste código, estabelecemos uma estrutura clara que permite alternar entre as variantes do botão. O método `default_attributes` é responsável por aplicar as classes apropriadas com base no parâmetro `shape` fornecido durante a inicialização do componente.

Em algumas situações, uma variante exige uma estrutura HTML diferente do componente padrão. Nesses casos, optamos por criar um novo componente. Um exemplo disso é a variante "Stacked" do componente Avatar, que renderiza uma coleção de avatares. Para isso, decidimos transformar a variante "Stacked" em um novo componente chamado AvatarCollection, utilizando o componente Avatar como base para sua construção.

## Lookbook

O Lookbook serve como um guia para a utilização dos componentes, sendo montado por meio da classe <b>Preview</b> de cada componente. Normalmente, nos inspiramos na documentação do Flowbite para criar nossos previews, mas seguimos alguns padrões estabelecidos entre o time.

### Playground

Começamos pelo playground, onde disponibilizamos todos os parâmetros do componente. O usuário pode alterar esses valores de forma dinâmica na página do Lookbook. Abaixo, um exemplo de como configuramos isso:

```ruby
module InkComponents
  module Forms
    module Select
      class Preview < Lookbook::Preview
        DEFAULT_OPTIONS = { red: "Red", green: "Green", blue: "Blue" }.freeze

        # @param prompt text
        # @param size select { choices: [sm, md, lg] }
        # @param state select { choices: [default, success, error] }
        # @param disabled toggle
        def playground(state: :default, size: :md, prompt: "Selecione", disabled: false)
          select_component(state:, size:, prompt:, disabled:, options: DEFAULT_OPTIONS)
        end
      end
    end
  end
end
```

### Organização das Variantes

Preferimos organizar as opções de variantes em grupos. Por exemplo, no componente select, temos as variantes state e size. Para cada valor disponível, montamos um preview em formato de grupo, facilitando a visualização das opções:

```ruby
module InkComponents
  module Forms
    module Select
      class Preview < Lookbook::Preview
        DEFAULT_OPTIONS = { red: "Red", green: "Green", blue: "Blue" }.freeze

        # ...

        # @!group Sizes
        def small
          select_component(size: :sm, options: DEFAULT_OPTIONS)
        end

        def medium
          select_component(size: :md, options: DEFAULT_OPTIONS)
        end

        def large
          select_component(size: :lg, options: DEFAULT_OPTIONS)
        end
        # @!endgroup
      end
    end
  end
end
```

### Componente Simples

Para componentes mais simples, como o Dropdown, costumamos montar o preview utilizando apenas o estilo padrão:

```ruby
module InkComponents
  module Forms
    module Dropzone
      class Preview < Lookbook::Preview
        def default
          dropzone_component(id: "input-file") do |dropzone|
            dropzone.with_label { "<p class='text-gray-500 dark:text-gray-400'><span class='font-semibold'>Click to upload</span> or drag and drop</p>".html_safe }
            dropzone.with_helper_text { "SVG, PNG, JPG or GIF (MAX. 800x400px)" }
          end
        end
      end
    end
  end
end
```

### Helpers

Por fim, recomendamos utilizar os helpers que implementamos para facilitar o consumo dos componentes. Ao invés de usar o padrão do ViewComponent, opte pelos nossos helpers:

```ruby
# GOOD ✅
select_component(...)

# BAD ❌
render InkComponents::Forms::Select::Component.new(...)
```

# Implementação de Testes

Ao implementar testes para um componente, é fundamental garantir que os principais elementos estejam sendo renderizados corretamente. Aqui estão algumas diretrizes para conduzir esses testes de forma eficaz:

## Foco na Renderização dos Elementos Principais

Utilizando os componentes Avatar e Botão como exemplo:

1. <b>Avatar</b>: Certifique-se de que a imagem do avatar está sendo renderizada. Um teste poderia verificar se a tag <img> existe e se o atributo src está correto.

2. <b>Botão</b>: Para o componente botão, verifique se o texto contido no botão foi renderizado corretamente. Um teste simples poderia garantir que o conteúdo dentro da tag do botão corresponde ao esperado.

### Testar Conteúdo em Slots

Não se esqueça de incluir testes para verificar se o conteúdo renderizado dentro de slots também aparece corretamente.

### Evitar Testar Classes

É recomendável evitar a verificação de classes CSS em seus testes. Isso se deve ao fato de que as classes estão sujeitas a alterações frequentes e, se testadas, podem levar a testes quebrados desnecessariamente. Em vez disso, concentre-se em verificar a presença dos elementos e seu comportamento.

<b>Exemplo</b>

O componente botão só é renderizado se algum conteúdo for fornecido. Portanto, podemos verificar esse comportamento no teste:

```ruby
RSpec.describe InkComponents::Button::Component, type: :component do
  context "when the content is provided" do
    it "renders the component" do
      component = render_inline(described_class.new(href: "#")) { "Some text" }

      expect(component.to_html).to include("Some text")
    end
  end

  context "when no content is provided" do
    it "doesn't render the component" do
      component = render_inline(described_class.new(href: "#"))

      expect(component.to_html).to be_empty
    end
  end
end
```

# Form Builder

O Form Builder atua como um intermediário que simplifica o uso dos métodos do módulo FormHelper. No Rails, é possível criar templates personalizados de FormBuilder ao herdar a classe `ActionView::Helpers::FormBuilder`. Essa abordagem é vantajosa, pois permite desenvolver métodos que utilizam os componentes do nosso Design System.

## Padrão de implementação

Para implementar os métodos do nosso Form Builder, seguimos a mesma interface do Rails, o que facilita a a aplicação do Design System nos formulários. Antes de começar a implementação, analisamos como os parâmetros do helper estão definidos na [documentação](https://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html), garantindo que adotemos a mesma abordagem.

Essa estratégia é vantajosa, pois permite que os desenvolvedores consultem a própria documentação do Rails em caso de dúvidas sobre como utilizar esses métodos. Além de garantir uma integração mais fluida e consistente com os padrões do Rails.

Para assegurar que nossos helpers tenham o mesmo comportamento do Form Builder padrão do Rails, implementamos alguns métodos auxiliares:

### Estado do Campo

O método `field_state` identifica o estado atual de um campo. Ele verifica se o objeto possui erros relacionados ao atributo. Se houver erros, retorna o símbolo `:error`. Se o objeto do formulário não estiver presente ou não tiver erros, retorna o símbolo padrão `:default`, indicando que o campo está em seu estado normal.

```ruby
def field_state(attribute)
  return :default if object.nil?

  object.errors.include?(attribute) ? :error : :default
end
```

### Atributos HTML

Além disso, precisamos garantir que estamos passando os atributos HTML corretamente para nossos componentes. Para isso, implementamos os métodos `format_name`, `format_id` e `html_options`.

- `format_name`: Formata o atributo name. Quando o objeto está presente, o valor será modelo[atributo]. Se não houver um objeto, o name será simplesmente o próprio atributo.
- `format_id`: Formata o atributo id de acordo com o padrão do Rails. Quando o objeto está presente, o valor do id será modelo_atributo. Se o objeto não estiver presente, o id será o próprio atributo. Para checkboxes, adaptamos esse método para adicionar o valor do atributo ao final do id.
- `html_options`: Definimos os valores de id, name e value para o campo do formulário. Esses atributos são essenciais para que a label funcione corretamente e para que o Rails identifique o valor do atributo do modelo durante a criação ou atualização.

```ruby
def html_options(attribute)
  {
    name: format_name(attribute),
    id: format_id(attribute),
    value: object.try(:public_send, attribute)
  }
end
```

## Outros Helpers

Para auxiliar na exibição de erros, implementamos o helper `error_message`, que utiliza o componente Helper Text para mostrar mensagens de erro apropriadas, abaixo do campo principal correspondente. Por exemplo, se o modelo `User` tiver uma validação que exige que o e-mail seja fornecido, e o usuário deixar esse campo em branco, a mensagem "Não pode ficar em branco" será exibida abaixo do campo de e-mail.

Para utilizar esse helper, basta chamá-lo logo abaixo do input, conforme o exemplo abaixo:

```ruby
<%= form_with model: @user, builder: InkComponents::FormBuilder do |f| %>
  <%= f.label :email %>
  <%= f.text_field :email %>
  <%= f.error_message :email >

  <%= f.submit %>
<% end %>
```

Lembre-se de que, para garantir que os componentes e o helper de mensagem de erro sejam renderizados corretamente, é necessário incluir o parâmetro `builder` passando `InkComponents::FormBuilder`. Caso contrário, o componente padrão do Rails será utilizado.
