# Christianitatis Supabase

Este repositório contém a configuração do Supabase para o projeto Christianitatis.

## Configuração

1. Crie um novo projeto no Supabase
2. Execute o script SQL em `supabase/config.sql` no Editor SQL do Supabase
3. Copie as credenciais do projeto:
   - URL do projeto
   - Chave anônima (anon key)
4. Configure as variáveis de ambiente no projeto principal:
   ```env
   VITE_SUPABASE_URL=sua_url_do_projeto
   VITE_SUPABASE_ANON_KEY=sua_chave_anonima
   ```

## Tabelas

### Events
- Armazena informações sobre eventos
- Possui políticas de segurança para leitura pública
- Campos: id, title, location, address, time, info, image_url, video_url, created_at

### Contacts
- Armazena informações de contato
- Possui políticas de segurança para inserção pública
- Campos: id, email, message, created_at

## Políticas de Segurança

- Eventos são públicos para leitura
- Qualquer um pode enviar contato
- RLS (Row Level Security) habilitado em todas as tabelas