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
  Servico,
} from '../models';
import {IncluiRepository} from '../repositories';

export class IncluiServicoController {
  constructor(
    @repository(IncluiRepository)
    public incluiRepository: IncluiRepository,
  ) { }

  @get('/incluis/{id}/servico', {
    responses: {
      '200': {
        description: 'Servico belonging to Inclui',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Servico),
          },
        },
      },
    },
  })
  async getServico(
    @param.path.number('id') id: typeof Inclui.prototype.agendamentoId,
  ): Promise<Servico> {
    return this.incluiRepository.servico(id);
  }
}
