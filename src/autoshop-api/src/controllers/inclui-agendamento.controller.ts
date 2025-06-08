import {
  repository,
} from '@loopback/repository';
import {
  param,
  get,
  getModelSchemaRef,
} from '@loopback/rest';
import {
  Inclui,
  Agendamento,
} from '../models';
import {IncluiRepository} from '../repositories';

export class IncluiAgendamentoController {
  constructor(
    @repository(IncluiRepository)
    public incluiRepository: IncluiRepository,
  ) { }

  @get('/incluis/{id}/agendamento', {
    responses: {
      '200': {
        description: 'Agendamento belonging to Inclui',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Agendamento),
          },
        },
      },
    },
  })
  async getAgendamento(
    @param.path.number('id') id: typeof Inclui.prototype.agendamentoId,
  ): Promise<Agendamento> {
    return this.incluiRepository.agendamento(id);
  }
}
