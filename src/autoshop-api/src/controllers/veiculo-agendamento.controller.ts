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
  Agendamento,
} from '../models';
import {VeiculoRepository} from '../repositories';

export class VeiculoAgendamentoController {
  constructor(
    @repository(VeiculoRepository) protected veiculoRepository: VeiculoRepository,
  ) { }

  @get('/veiculos/{id}/agendamentos', {
    responses: {
      '200': {
        description: 'Array of Veiculo has many Agendamento',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Agendamento)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Agendamento>,
  ): Promise<Agendamento[]> {
    return this.veiculoRepository.agendamentos(id).find(filter);
  }

  @post('/veiculos/{id}/agendamentos', {
    responses: {
      '200': {
        description: 'Veiculo model instance',
        content: {'application/json': {schema: getModelSchemaRef(Agendamento)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof Veiculo.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Agendamento, {
            title: 'NewAgendamentoInVeiculo',
            exclude: ['id'],
            optional: ['veiculoId']
          }),
        },
      },
    }) agendamento: Omit<Agendamento, 'id'>,
  ): Promise<Agendamento> {
    return this.veiculoRepository.agendamentos(id).create(agendamento);
  }

  @patch('/veiculos/{id}/agendamentos', {
    responses: {
      '200': {
        description: 'Veiculo.Agendamento PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Agendamento, {partial: true}),
        },
      },
    })
    agendamento: Partial<Agendamento>,
    @param.query.object('where', getWhereSchemaFor(Agendamento)) where?: Where<Agendamento>,
  ): Promise<Count> {
    return this.veiculoRepository.agendamentos(id).patch(agendamento, where);
  }

  @del('/veiculos/{id}/agendamentos', {
    responses: {
      '200': {
        description: 'Veiculo.Agendamento DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Agendamento)) where?: Where<Agendamento>,
  ): Promise<Count> {
    return this.veiculoRepository.agendamentos(id).delete(where);
  }
}
