# C6 : Construção da API com LoopBack

---

## Escolhas de Implementação

- Adição manual de relações `@hasMany().through()` nos modelos e `createHasManyThroughRepositoryFactoryFor` nos repositórios.
- Separar claramente modelos com interação do utilizador e modelos internos (ex: `Historico`).
- A lista de serviços associados a um agendamento é obtida automaticamente via relação `@hasMany().through()`.

---

## Problemas Enfrentados e Soluções

### Relação N:M entre `Agendamento` e `Servico`

**Problema:** O LoopBack não gera corretamente endpoints para modelos com chave composta e sem campo `id` (ex: `Inclui`).

**Solução:**
- Criar `IncluiRepository` manualmente com `composite key`.
- Criar `IncluiController` com rotas personalizadas:
  - `GET /agendamentos/{id}/servicos`
  - `POST /agendamentos/{id}/servicos/{servicoId}`
  - `PATCH /agendamentos/{id}/servicos/{servicoId}`

### Entidade `Historico`

**Problema:** Esta entidade não deve ser manipulada diretamente pelo utilizador.

**Solução:**
- Apenas implementar `GET` no controller.
- Inserção/delete automática ao criar/apagar um `Agendamento`.
- Relação `hasMany` com `Veiculo` para facilitar consulta.

### Erro comum: `ENOTFOUND locahost`

**Problema:** Erro na ligação ao MySQL devido a erro de digitação.

**Solução:** Corrigir para `localhost` no `datasource.json`.

> **Nota:** A implementação exigiu intervenção manual para ultrapassar limitações do gerador automático, principalmente em relações complexas e modelos sem `id` simples.

---

| [< Previous](RPF05.md) | [^ Main](../../README.md) | [Next >](RPF07.md) |
|:----------------------------------:|:----------------------------------:|:----------------------------------:|
