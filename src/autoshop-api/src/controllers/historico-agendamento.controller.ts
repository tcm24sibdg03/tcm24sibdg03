import {
  repository,
} from '@loopback/repository';
import {
  param,
  get,
  getModelSchemaRef,
} from '@loopback/rest';
import {
  Historico,
  Agendamento,
} from '../models';
import {HistoricoRepository} from '../repositories';

export class HistoricoAgendamentoController {
  constructor(
    @repository(HistoricoRepository)
    public historicoRepository: HistoricoRepository,
  ) { }

  @get('/historicos/{id}/agendamento', {
    responses: {
      '200': {
        description: 'Agendamento belonging to Historico',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Agendamento),
          },
        },
      },
    },
  })
  async getAgendamento(
    @param.path.number('id') id: typeof Historico.prototype.id,
  ): Promise<Agendamento> {
    return this.historicoRepository.agendamento(id);
  }
}
