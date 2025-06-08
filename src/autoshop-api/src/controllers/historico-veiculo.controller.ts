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
  Veiculo,
} from '../models';
import {HistoricoRepository} from '../repositories';

export class HistoricoVeiculoController {
  constructor(
    @repository(HistoricoRepository)
    public historicoRepository: HistoricoRepository,
  ) { }

  @get('/historicos/{id}/veiculo', {
    responses: {
      '200': {
        description: 'Veiculo belonging to Historico',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Veiculo),
          },
        },
      },
    },
  })
  async getVeiculo(
    @param.path.number('id') id: typeof Historico.prototype.id,
  ): Promise<Veiculo> {
    return this.historicoRepository.veiculo(id);
  }
}
