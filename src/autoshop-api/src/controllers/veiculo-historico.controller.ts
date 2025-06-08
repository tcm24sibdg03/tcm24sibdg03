import {
  Count,
  CountSchema,
  Filter,
  repository,
  Where,
} from '@loopback/repository';
import {
  del,
  get,
  getModelSchemaRef,
  getWhereSchemaFor,
  param,
  patch,
  post,
  requestBody,
} from '@loopback/rest';
import {
  Veiculo,
  Historico,
} from '../models';
import {VeiculoRepository} from '../repositories';

export class VeiculoHistoricoController {
  constructor(
    @repository(VeiculoRepository) protected veiculoRepository: VeiculoRepository,
  ) { }

  @get('/veiculos/{id}/historicos', {
    responses: {
      '200': {
        description: 'Array of Veiculo has many Historico',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Historico)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Historico>,
  ): Promise<Historico[]> {
    return this.veiculoRepository.historicos(id).find(filter);
  }

  @post('/veiculos/{id}/historicos', {
    responses: {
      '200': {
        description: 'Veiculo model instance',
        content: {'application/json': {schema: getModelSchemaRef(Historico)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof Veiculo.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Historico, {
            title: 'NewHistoricoInVeiculo',
            exclude: ['id'],
            optional: ['veiculoId']
          }),
        },
      },
    }) historico: Omit<Historico, 'id'>,
  ): Promise<Historico> {
    return this.veiculoRepository.historicos(id).create(historico);
  }

  @patch('/veiculos/{id}/historicos', {
    responses: {
      '200': {
        description: 'Veiculo.Historico PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Historico, {partial: true}),
        },
      },
    })
    historico: Partial<Historico>,
    @param.query.object('where', getWhereSchemaFor(Historico)) where?: Where<Historico>,
  ): Promise<Count> {
    return this.veiculoRepository.historicos(id).patch(historico, where);
  }

  @del('/veiculos/{id}/historicos', {
    responses: {
      '200': {
        description: 'Veiculo.Historico DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Historico)) where?: Where<Historico>,
  ): Promise<Count> {
    return this.veiculoRepository.historicos(id).delete(where);
  }
}
