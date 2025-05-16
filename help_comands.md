# Guia Básico de Comandos, Navegação e Macros no Neovim

## Navegação Básica

| Ação                      | Comando/Atalho         |
| ------------------------- | ---------------------- |
| Abrir arquivo             | `:e nome_do_arquivo`   |
| Salvar arquivo            | `:w`                   |
| Fechar buffer             | `:bd`                  |
| Listar buffers            | `:buffers` ou `:ls`    |
| Dividir janela horizontal | `:split` ou `:sp`      |
| Dividir janela vertical   | `:vsplit` ou `:vsp`    |
| Navegar janelas           | `<C-w> h/j/k/l`        |
| Abrir/fechar Neo-tree     | `<leader>e`            |
| Navegar Neo-tree          | `l` abre arquivo/pasta |
| Fechar Neo-tree           | `q`                    |

---

## Macros

- **Gravar macro**: `qa` (grava macro no registro `a`)
- Faça as ações que deseja repetir
- **Parar gravação**: `q`
- **Executar macro**: `@a`
- **Executar macro N vezes**: `10@a`

### Exemplo

Para adicionar `;` no fim das próximas 5 linhas:

```vim
qa        " começa gravação no registro 'a'
A;<Esc>j  " adiciona ; no fim da linha e desce uma linha
q         " para gravação
5@a       " executa 5 vezes
```

### Telescope (busca poderosa)

| Atalho       | Descrição                |
| ------------ | ------------------------ |
| `<leader>ff` | Buscar arquivos          |
| `<leader>fg` | Buscar texto (live_grep) |
| `<leader>fb` | Buffers abertos          |
| `<leader>fh` | Help tags                |

### Dicas extras

- Para mover entre a árvore Neo-tree e o buffer aberto, use `<C-n>`

- Para fechar Neo-tree, pressione `q` ou `<Esc>`

- Use :Lazy sync para atualizar plugins

- Para macros, pense em automatizar tarefas repetitivas
